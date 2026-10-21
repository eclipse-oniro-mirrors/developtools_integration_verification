# Repos 采集器设计

schema 1.0.0 | 依赖：无

## 输入

`.repo/manifests/default.xml` 通过 `<include>` 递归组合子清单。每个 `<project>` 声明一个仓：

```xml
<project groups="default,ohos:standard" name="ability_ability_base"
         path="foundation/ability/ability_base" remote="gitcode" revision="master"/>
```

`<default>` 的 `remote`/`revision` 跨 include 继承。每仓的 HEAD commit 和 remote URL 通过直接读 `.git/HEAD` 和 `.git/config` 文件获取（跟随 gitdir 指针到 `.repo/projects/`），无子进程。

无 `.repo/` 目录时静默产出零行，不降级。

## 表结构

```sql
CREATE TABLE repos (
    id          INTEGER PRIMARY KEY,
    scan_id     INTEGER NOT NULL REFERENCES scans(id) ON DELETE CASCADE,
    name        TEXT NOT NULL,
    path        TEXT NOT NULL,
    remote      TEXT,
    remote_url  TEXT,
    revision    TEXT,
    groups      TEXT,
    clone_depth INTEGER,
    head_commit TEXT,
    UNIQUE (scan_id, name)
);
```

索引：path、remote、revision。

## 查询接口

```python
# 按仓名、路径、groups 过滤
query.list_repos(filters=RepoFilter(names=('ability_ability_base',),
                                     paths=('foundation/ability/',),
                                     groups=('ohos:mini',)))

# label/path 最长前缀匹配（支持嵌套仓）
index = RepoIndex(repos)
index.match_label('//foundation/ability/ability_base:base')  # → 仓 ability_ability_base
index.match_path('foundation/ability/ability_base/sub/dir')  # → 同上
index.locate(label='//...', path='foundation/...', name='ability_ability_base')
```

匹配规则：所有仓路径按长度降序排列，第一个满足 `directory == repo_path` 或 `directory.startswith(repo_path + '/')` 的即为归属仓。

## issue 规则

| 条件 | issue |
| --- | --- |
| `.repo/` 不存在 | 不发 issue，静默产出零行 |
| manifest 中 path 不在 project.list | `REPO_NOT_IN_LIST` |
| HEAD commit 读取失败 | `GIT_HEAD_UNAVAILABLE` |
| remote URL 读取失败 | `REMOTE_URL_UNAVAILABLE` |
