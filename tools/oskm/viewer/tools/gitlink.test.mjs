import test from 'node:test'
import assert from 'node:assert/strict'
import { readFile } from 'node:fs/promises'

/* gitlink.js 的单元测试。它直接 import ../composables/useDatabase.js，而那是
   vue + sql.js 的运行时绑定——这里把那一行 import 替换成内存 mock，其余代码
   原样加载，测的是生产代码本身。 */
const source = await readFile(new URL('../src/model/gitlink.js', import.meta.url), 'utf8')

const mockSource = (repos) => `const __REPOS__ = ${JSON.stringify(repos)}
` +
  `export function useDatabase() {
     return {
       rawQuery(sql, params) {
         if (sql.includes('FROM repos')) return __REPOS__.filter(r => r.scan_id === params[0])
         return []
       },
     }
   }
`

const load = async (repos) => {
  const patched = source.replace(
    "import { useDatabase } from '../composables/useDatabase.js'",
    mockSource(repos))
  return import('data:text/javascript;base64,' + Buffer.from(patched).toString('base64'))
}

/* ---- yellow 区：内部镜像仓，走 files 格式（保留域名只验证 URL 形态） ---- */
const yellowRepos = [{
  scan_id: 2, name: 'openharmony/interface_sdk_c',
  path: 'interface/sdk_c',
  remote_url: 'https://szv-open.codehub.example.invalid/mirror/openharmony/interface_sdk_c',
  revision: 'huawei/EMUI/HarmonyOS/hmos_trunk/OpenHarmony-Trunk',
  head_commit: 'dbedc2e4121c5bc056ab76bfbde8032cf2850f3d',
}]

test('yellow 内部镜像仓：NDK 头文件拼 files 链接，ref 用分支名', async () => {
  const { ndkHeaderSource } = await load(yellowRepos)
  const got = ndkHeaderSource(2, 'interface/sdk_c/AbilityKit/ability_base/ability_base_common.h')
  assert.equal(
    got.url,
    'https://open.codehub.example.invalid/mirror/openharmony/interface_sdk_c/files' +
      '?ref=huawei%2FEMUI%2FHarmonyOS%2Fhmos_trunk%2FOpenHarmony-Trunk' +
      '&filePath=AbilityKit%2Fability_base%2Fability_base_common.h&isFile=true')
  assert.equal(got.ref, 'huawei/EMUI/HarmonyOS/hmos_trunk/OpenHarmony-Trunk')
  assert.equal(got.rel, 'AbilityKit/ability_base/ability_base_common.h')
  assert.equal(got.exact, true)   // 有 head_commit，但链接用分支名，exact 语义保留
})

test('yellow 内部镜像仓：深目录头文件相对路径正确', async () => {
  const { ndkHeaderSource } = await load(yellowRepos)
  const got = ndkHeaderSource(2, 'interface/sdk_c/third_party/icu4c/ndk_headers/unicode/utypes.h')
  assert.equal(
    got.url,
    'https://open.codehub.example.invalid/mirror/openharmony/interface_sdk_c/files' +
      '?ref=huawei%2FEMUI%2FHarmonyOS%2Fhmos_trunk%2FOpenHarmony-Trunk' +
      '&filePath=third_party%2Ficu4c%2Fndk_headers%2Funicode%2Futypes.h&isFile=true')
})

test('yellow 内部镜像仓：声明文件也拼 files 链接，ref 用分支名', async () => {
  const repos = [{
    scan_id: 2, name: 'openharmony/interface_sdk_js',
    path: 'interface/sdk-js',
    remote_url: 'https://szv-open.codehub.example.invalid/mirror/openharmony/interface_sdk_js',
    revision: 'huawei/EMUI/HarmonyOS/hmos_trunk/OpenHarmony-Trunk',
    head_commit: 'dbedc2e4121c5bc056ab76bfbde8032cf2850f3d',
  }]
  const mod = await load(repos)
  const path = 'interface/sdk-js/api/@ohos.app.ability.UIAbility.d.ts'
  const got = mod.fileSource(2, path)
  assert.equal(
    got.url,
    'https://open.codehub.example.invalid/mirror/openharmony/interface_sdk_js/files' +
      '?ref=huawei%2FEMUI%2FHarmonyOS%2Fhmos_trunk%2FOpenHarmony-Trunk' +
      '&filePath=api%2F%40ohos.app.ability.UIAbility.d.ts&isFile=true')
  assert.equal(got.ref, 'huawei/EMUI/HarmonyOS/hmos_trunk/OpenHarmony-Trunk')
  assert.equal(got.rel, 'api/@ohos.app.ability.UIAbility.d.ts')
  assert.equal(got.exact, true)
  assert.deepEqual(mod.ndkHeaderSource(2, path), got)
})

/* ---- blue 区：gitcode 等公开仓，必须保持原 blob 拼法，一字不改 ---- */
const blueRepos = [{
  scan_id: 1, name: 'interface_sdk_c',
  path: 'interface/sdk_c',
  remote_url: 'https://gitcode.com/openharmony/interface_sdk_c',
  revision: 'master',
  head_commit: 'abc123def456',
}]

test('blue 区：NDK 头文件仍走 fileSource 原逻辑（blob + 提交号）', async () => {
  const mod = await load(blueRepos)
  const got = mod.ndkHeaderSource(1, 'interface/sdk_c/AbilityKit/ability_base/ability_base_common.h')
  assert.equal(
    got.url,
    'https://gitcode.com/openharmony/interface_sdk_c/blob/abc123def456/AbilityKit/ability_base/ability_base_common.h')
  assert.equal(got.ref, 'abc123def456')
  assert.equal(got.exact, true)
  /* ndkHeaderSource 在 blue 下必须与 fileSource 完全一致 */
  const viaFile = mod.fileSource(1, 'interface/sdk_c/AbilityKit/ability_base/ability_base_common.h')
  assert.deepEqual(got, viaFile)
})

test('blue 区：无 head_commit 时 fileSource 退 revision，ndk 链接跟随', async () => {
  const repos = [{ ...blueRepos[0], head_commit: null }]
  const mod = await load(repos)
  const got = mod.ndkHeaderSource(1, 'interface/sdk_c/AbilityKit/ability_base/ability_base_common.h')
  assert.equal(got.ref, 'master')
  assert.equal(got.exact, false)
  assert.equal(
    got.url,
    'https://gitcode.com/openharmony/interface_sdk_c/blob/master/AbilityKit/ability_base/ability_base_common.h')
})

/* ---- gitlab 系（/-/blob/）也不受影响 ---- */
test('gitlab 系 blue 区：保持 /-/blob/ 拼法', async () => {
  const repos = [{
    scan_id: 1, name: 'sdk', path: 'interface/sdk_c',
    remote_url: 'https://gitlab.example.com/oh/sdk',
    revision: 'master', head_commit: 'abc123',
  }]
  const mod = await load(repos)
  const got = mod.ndkHeaderSource(1, 'interface/sdk_c/AbilityKit/ability_base/ability_base_common.h')
  assert.equal(
    got.url,
    'https://gitlab.example.com/oh/sdk/-/blob/abc123/AbilityKit/ability_base/ability_base_common.h')
})

test('空参/未匹配仓返回 null', async () => {
  const mod = await load(yellowRepos)
  assert.equal(mod.ndkHeaderSource(null, 'x.h'), null)
  assert.equal(mod.ndkHeaderSource(2, ''), null)
  const { ndkHeaderSource: empty } = await load([{ scan_id: 2, name: 'a', path: 'b', remote_url: null }])
  assert.equal(empty(2, 'x/y.h'), null)
})
