/* GN label → 定义它的源码地址。

   label 形如 `//foundation/ability/ability_runtime/services/abilitymgr:abilityms`：
   `//` 之后是源码树里的目录，`:` 之后是目标名。目标定义在该目录的 BUILD.gn 里。

   拼法：按**最长路径前缀**匹配到仓（repos.path），剩下的部分就是仓内相对路径，
   再和 repos.remote_url 拼出来。实测 rk3568 的 5395 个 label 全部能定位到仓。

   两处诚实边界，UI 上要让人知道：

   1. **目标不一定写在那个 BUILD.gn 里。** 它可能来自 .gni 或被 import 进来的
      模板。链到目录的 BUILD.gn 是最佳猜测，不是确证。
   2. **URL 形态是按惯例拼的**，没有联网验证过。托管站改了路径规则就会失效——
      所以各站的拼法集中在下面这张表里，改一处即可。 */
import { useDatabase } from '../composables/useDatabase.js'

/* host → 怎么拼 tree 链接。gitcode / gitee / github 都是 /tree/<ref>/<path>，
   GitLab 系要多一段 /-/。 */
const HOSTS = [
  [/gitlab/i, (base, ref, path) => `${base}/-/tree/${ref}${path ? '/' + path : ''}`],
  [/.*/, (base, ref, path) => `${base}/tree/${ref}${path ? '/' + path : ''}`],
]

const cache = new Map()   // scanId -> { repos, memo }

function indexOf(scanId) {
  if (cache.has(scanId)) return cache.get(scanId)
  const repos = useDatabase()
    .rawQuery(`SELECT name, path, remote_url, revision, head_commit FROM repos
                WHERE scan_id = ? AND path IS NOT NULL AND path != ''`, [scanId])
    .map(r => ({ ...r, path: String(r.path).replace(/^\/+|\/+$/g, '') }))
    /* 长路径在前：`foundation/ability/ability_runtime` 必须先于 `foundation` 命中 */
    .sort((a, b) => b.path.length - a.path.length)
  const entry = { repos, memo: new Map() }
  cache.set(scanId, entry)
  return entry
}
export function resetGitLinks() { cache.clear() }

/** label 的目录部分落在哪个仓里 */
function repoFor(scanId, dir) {
  const { repos, memo } = indexOf(scanId)
  if (memo.has(dir)) return memo.get(dir)
  const hit = repos.find(r => dir === r.path || dir.startsWith(r.path + '/')) || null
  memo.set(dir, hit)
  return hit
}

/**
 * @returns {{url, repo, rel, ref, file}|null}
 *   url  源码地址（指向该目录的 BUILD.gn）
 *   ref  用的是哪个引用——优先 head_commit（扫描当时的确切状态），
 *        没有才退回 revision（分支名会随时间漂移）
 */
export function labelSource(scanId, label) {
  if (!scanId || typeof label !== 'string' || !label.startsWith('//')) return null
  const dir = label.slice(2).split(':')[0].replace(/\/+$/, '')
  const repo = repoFor(scanId, dir)
  if (!repo?.remote_url) return null
  const rel = dir.slice(repo.path.length).replace(/^\/+/, '')
  const ref = repo.head_commit || repo.revision
  if (!ref) return null
  const base = repo.remote_url.replace(/\.git$/, '').replace(/\/+$/, '')
  const build = HOSTS.find(([re]) => re.test(base))[1]
  return {
    url: build(base, ref, rel ? `${rel}/BUILD.gn` : 'BUILD.gn'),
    repo: repo.name,
    rel: rel || '(仓根)',
    ref,
    exact: !!repo.head_commit,
  }
}
