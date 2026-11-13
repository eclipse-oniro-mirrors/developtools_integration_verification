"""Multi-session manager: holds read-only sessions with ATTACH support."""
from __future__ import annotations

import re

from .errors import QueryError
from .readonly_session import ReadOnlyScanSession
from . import catalog
from .tools import ToolError

_ALIAS = re.compile(r'^[A-Za-z_][A-Za-z0-9_]*$')
_QUERY_ERROR_CODES = {
    'SCAN_NOT_FOUND', 'SCAN_INCOMPLETE', 'NO_COMPLETED_SCAN', 'DB_CORRUPT',
}


def _quote_identifier(value: str) -> str:
    return '"' + value.replace('"', '""') + '"'


class SessionManager:

    def __init__(self):
        self._sessions: dict[int, _SessionEntry] = {}
        self._next_id = 1
        self._active: int | None = None


    @property
    def active_id(self) -> int | None:
        return self._active


    @staticmethod
    def _safe_detach(entry: _SessionEntry, alias: str):
        try:
            entry.session.connection.execute(
                f'DETACH DATABASE {_quote_identifier(alias)}')
        except Exception:
            pass
        entry.aliases.pop(alias, None)
        alias_session = entry.alias_sessions.pop(alias, None)
        if alias_session is not None:
            alias_session.close()


    @staticmethod
    def _info(entry: _SessionEntry) -> dict:
        s = entry.session
        try:
            scan = s.scan_row()
        except QueryError as e:
            raise ToolError(e.code, f'{e.code}: {e.message}') from e
        return {
            'session_id': entry.sid,
            'scan_id': s.scan_id,
            'product': scan['product'],
            'cpu_arch': scan['cpu_arch'],
            'db_path': entry.db_path,
        }


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
        except QueryError as e:
            code = e.code if e.code in _QUERY_ERROR_CODES else 'DB_CORRUPT'
            raise ToolError(code, f'{e.code}: {e.message}') from e
        except Exception as e:
            raise ToolError('DB_CORRUPT', str(e)) from e
        sid = self._next_id
        self._next_id += 1
        entry = _SessionEntry(sid=sid, session=session, db_path=str(session.db_path))
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
        if not isinstance(alias, str) or not _ALIAS.fullmatch(alias):
            raise ToolError(
                'INVALID_ALIAS',
                'alias must match ^[A-Za-z_][A-Za-z0-9_]*$')
        if alias in entry.aliases:
            raise ToolError('ALIAS_EXISTS', f'alias "{alias}" already attached')
        if not os.path.isfile(db_path):
            raise ToolError('DB_NOT_FOUND', f'database not found: {db_path}')
        conn = entry.session.connection
        try:
            conn.execute(
                f'ATTACH DATABASE ? AS {_quote_identifier(alias)}', (db_path,))
        except Exception as e:
            raise ToolError('DB_CORRUPT', f'attach failed: {e}') from e
        try:
            alias_session = ReadOnlyScanSession.open(db_path)
            entry.aliases[alias] = db_path
            entry.alias_sessions[alias] = alias_session
        except Exception as e:
            self._safe_detach(entry, alias)
            code = getattr(e, 'code', None)
            if code in _QUERY_ERROR_CODES:
                raise ToolError(code, str(e)) from e
            raise ToolError('DB_CORRUPT', f'open attached database failed: {e}') from e
        tbl_names = list(catalog.table_names(entry.session))
        return {'alias': alias, 'db_path': str(alias_session.db_path),
                'tables': tbl_names, 'scan_id': alias_session.scan_id}


    def detach_secondary(self, alias: str) -> dict:
        entry = self.get_entry()
        if alias not in entry.aliases:
            raise ToolError('ALIAS_NOT_FOUND', f'alias "{alias}" not attached')
        self._safe_detach(entry, alias)
        return {'detached': True, 'alias': alias}



class _SessionEntry:
    __slots__ = ('sid', 'session', 'db_path', 'aliases', 'alias_sessions')

    def __init__(self, sid: int, session: ReadOnlyScanSession, db_path: str):
        self.sid = sid
        self.session = session
        self.db_path = db_path
        self.aliases: dict[str, str] = {}
        self.alias_sessions: dict[str, ReadOnlyScanSession] = {}
