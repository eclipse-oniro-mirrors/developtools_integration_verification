"""Multi-session manager: holds read-only sessions with ATTACH support."""
from __future__ import annotations

from .readonly_session import ReadOnlyScanSession
from . import catalog
from .tools import ToolError


class SessionManager:
    def __init__(self):
        self._sessions: dict[int, _SessionEntry] = {}
        self._next_id = 1
        self._active: int | None = None

    @property
    def active_id(self) -> int | None:
        return self._active

    def open(self, db_path: str, *, scan_id: int | None = None,
             product: str | None = None) -> dict:
        import os
        if not os.path.isfile(db_path):
            raise ToolError('DB_NOT_FOUND', f'database not found: {db_path}')
        try:
            # 不加载采集器框架。实体记录由轻量只读 session 按表结构重建；
            # 表名和归属元数据仍从库里的 collector_tables 读取（见 catalog.py）。
            session = ReadOnlyScanSession.open(
                db_path, scan_id=scan_id, product=product)
        except Exception as e:
            code = 'NO_COMPLETED_SCAN' if 'NO_COMPLETED_SCAN' in str(e) else 'DB_CORRUPT'
            raise ToolError(code, str(e)) from e
        sid = self._next_id
        self._next_id += 1
        entry = _SessionEntry(sid=sid, session=session, db_path=db_path)
        self._sessions[sid] = entry
        self._active = sid
        return self._info(entry)

    def close(self, *, session_id: int | None = None) -> dict:
        sid = session_id or self._active
        if sid is None or sid not in self._sessions:
            raise ToolError('NO_SESSION', 'no active session')
        entry = self._sessions.pop(sid)
        for alias in list(entry.aliases):
            self._safe_detach(entry, alias)
        entry.session.close()
        if self._active == sid:
            self._active = max(self._sessions) if self._sessions else None
        return {'closed': True, 'session_id': sid}

    def switch(self, session_id: int) -> dict:
        if session_id not in self._sessions:
            raise ToolError('INVALID_SESSION_ID', f'session {session_id} not found')
        self._active = session_id
        return self._info(self._sessions[session_id])

    def list_sessions(self) -> dict:
        sessions = []
        for sid, entry in sorted(self._sessions.items()):
            info = self._info(entry)
            info['active'] = sid == self._active
            sessions.append(info)
        aliases = list(self._sessions[self._active].aliases) if self._active else []
        return {'sessions': sessions, 'attached_aliases': aliases}

    def get_active(self) -> ReadOnlyScanSession:
        if self._active is None or self._active not in self._sessions:
            raise ToolError('NO_SESSION', 'no active session; call open_session first')
        return self._sessions[self._active].session

    def get_entry(self) -> _SessionEntry:
        if self._active is None or self._active not in self._sessions:
            raise ToolError('NO_SESSION', 'no active session; call open_session first')
        return self._sessions[self._active]

    def attach_secondary(self, db_path: str, alias: str = 'secondary') -> dict:
        import os
        entry = self.get_entry()
        if alias in entry.aliases:
            raise ToolError('ALIAS_EXISTS', f'alias "{alias}" already attached')
        if not os.path.isfile(db_path):
            raise ToolError('DB_NOT_FOUND', f'database not found: {db_path}')
        conn = entry.session.connection
        try:
            conn.execute(f"ATTACH DATABASE ? AS {alias}", (db_path,))
        except Exception as e:
            raise ToolError('DB_CORRUPT', f'attach failed: {e}') from e
        entry.aliases[alias] = db_path
        tbl_names = list(catalog.table_names(entry.session))
        return {'alias': alias, 'db_path': db_path, 'tables': tbl_names}

    def detach_secondary(self, alias: str) -> dict:
        entry = self.get_entry()
        if alias not in entry.aliases:
            raise ToolError('ALIAS_NOT_FOUND', f'alias "{alias}" not attached')
        self._safe_detach(entry, alias)
        return {'detached': True, 'alias': alias}

    @staticmethod
    def _safe_detach(entry: _SessionEntry, alias: str):
        try:
            entry.session.connection.execute(f"DETACH DATABASE {alias}")
        except Exception:
            pass
        entry.aliases.pop(alias, None)

    @staticmethod
    def _info(entry: _SessionEntry) -> dict:
        s = entry.session
        scan = s.connection.execute(
            'SELECT product, zone, cpu_arch FROM scans WHERE id = ?',
            (s.scan_id,)).fetchone()
        return {
            'session_id': entry.sid,
            'scan_id': s.scan_id,
            'product': scan['product'],
            'zone': scan['zone'],
            'cpu_arch': scan['cpu_arch'],
            'db_path': entry.db_path,
        }


class _SessionEntry:
    __slots__ = ('sid', 'session', 'db_path', 'aliases')

    def __init__(self, sid: int, session: ReadOnlyScanSession, db_path: str):
        self.sid = sid
        self.session = session
        self.db_path = db_path
        self.aliases: dict[str, str] = {}
