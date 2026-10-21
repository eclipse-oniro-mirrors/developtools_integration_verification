<script setup>
import { computed, ref } from 'vue'
import { useRouter } from 'vue-router'
import { useViewerStore } from '../stores/viewer.js'
import { overview, health } from '../model/overview.js'
import Icon from '../ui/Icon.vue'

const store = useViewerStore()
const router = useRouter()

const o = computed(() => (store.dbLoaded ? overview(store.scanId) : null))
const h = computed(() => (store.dbLoaded ? health(store.scanId) : null))
const scan = computed(() => store.scans.find(s => s.id === store.scanId))
const num = v => (v == null ? '—' : v.toLocaleString('en-US'))

/* 分层卡片：每段有主实体（可点击）和附属子表（缩进展示） */
const segments = computed(() => {
  const d = o.value
  const unowned = d
    ? [d.servicesUnowned && `${d.servicesUnowned} 个进程`, d.hdisUnowned && `${d.hdisUnowned} 个驱动`]
        .filter(Boolean).join(' / ')
    : ''
  return [
    {
      key: 'parts', label: '部件信息', icon: 'build', arrow: '构建安装',
      entities: [
        { name: '代码仓', n: d?.repos, to: '/parts/repos', desc: 'git 仓 + HEAD commit' },
          { name: '部件', n: d?.components, to: '/parts/components', desc: '架构基本单元', children: [
            { name: 'InnerAPI', n: d?.innerapis, to: '/parts/innerapis', desc: 'inner_kits / inner_api' },
            { name: '特性', n: d?.features, to: '/parts/features', desc: '可配置开关名' },
            { name: 'SysCap', n: d?.syscaps, to: '/parts/syscaps', desc: 'SystemCapability' },
          ]},
          { name: '编译参数', n: d?.gnArgs, to: '/parts/args', desc: `${d?.gnArgsOverride ?? 0} 个被覆盖`, children: [] },
      ],
      note: d ? `${num(d.reposUsed)} / ${num(d.repos)} 个仓有部件参与构建` : '',
    },
    {
      key: 'files', label: '系统文件', icon: 'image', arrow: 'init 拉起',
      entities: [
        { name: '安装产物', n: d?.targets, to: '/files/targets', desc: `含 ${num(d?.symlinks)} 个软链接`, children: [
          { name: '安装模块', n: d?.modules, to: '/files/targets', desc: 'SMI 安装清单' },
          { name: 'ELF 模块', n: d?.elfModules, to: '/files/elf', desc: `${num(d?.elfEdges)} 条依赖` },
        ]},
        { name: '镜像视图', n: null, to: '/files/image', desc: '按路径浏览', children: [] },
      ],
      note: d?.modulesUnowned ? `${num(d.modulesUnowned)} 个模块归属未知` : '',
      warn: !!d?.modulesUnowned,
    },
    {
      key: 'runtime', label: '运行时进程', icon: 'runtime', arrow: null,
      entities: [
        { name: '系统服务', n: d?.services, to: '/runtime/services', desc: 'init cfg 声明', children: [] },
        { name: 'SA 服务', n: d?.sas, to: '/runtime/sa', desc: 'SystemAbility', children: [] },
        { name: 'HDI 设备', n: d?.hdis, to: '/runtime/hdi', desc: 'HDF 设备驱动', children: [] },
      ],
      leaves: d?.mixed ? [`其中 ${num(d.mixed)} 个进程混装多个部件`] : [],
      note: unowned ? `${unowned} 归属未知` : '',
      warn: !!unowned,
    },
  ]
})

const examples = computed(() => {
  if (!store.dbLoaded) return []
  return [
    { icon: 'search', title: '反查一个文件属于谁',
      desc: '输入 so 名、路径或 GN label，找到归属部件、代码仓和安装模块',
      to: '/lookup', eg: 'libbase.z.so' },
    { icon: 'build', title: '部件依赖关系',
      desc: '看哪个部件被依赖最多、哪个部件依赖了不存在的部件',
      to: '/parts/components', eg: '按"被依赖"排序' },
    { icon: 'chip', title: '编译参数全览',
      desc: '哪些 GN 参数被产品覆盖、哪些用了默认值、按类型筛选',
      to: '/parts/args', eg: '104 个被覆盖' },
    { icon: 'image', title: '镜像里装了什么',
      desc: '按分区浏览安装产物，查看软链接指向、文件大小',
      to: '/files/targets', eg: '776 个软链接' },
    { icon: 'runtime', title: '一个进程跑什么',
      desc: '从系统服务出发，看它拉起了哪些 SA、HDI 设备',
      to: '/runtime/services', eg: '164 个 init 服务' },
    { icon: 'shield', title: '扫描质量与治理',
      desc: '哪些采集器降级了、有哪些未解析的依赖和冲突',
      to: '/findings', eg: '378 条 issue' },
  ]
})

const q = ref('')
function lookup() {
  const v = q.value.trim()
  if (v) router.push({ path: '/lookup', query: { q: v } })
}
const EXAMPLES = ['libbase.z.so', 'sa_main', 'bundle_framework', 'system/bin/toybox']
</script>

<template>
<div class="home">
  <section class="hero">
    <div class="hero-left">
      <p class="kicker">OpenHarmony 产品架构事实库</p>
      <h1>看懂一个产品<span>由什么构成、装了什么、跑起来是什么样</span></h1>
      <p class="lede">
        对一个<strong>已构建的产品</strong>做静态扫描，把散落在构建产物、镜像清单、init 配置、
        SA profile、HDF 配置里的事实，归并成一张可查询的全景图。
        只陈述事实，不做推断——每条记录都保留来源文件里的原始声明。
      </p>
    </div>
    <div class="hero-right">
      <form class="ask" role="search" @submit.prevent="lookup">
        <Icon name="search" :size="16" />
        <input v-model="q" :disabled="!store.dbLoaded"
               placeholder="输入一条线索反查归属：路径 / so 名 / 进程名 / GN label"
               aria-label="反查">
        <button type="submit" :disabled="!store.dbLoaded || !q.trim()">反查</button>
      </form>
      <p class="eg">
        例如
        <button v-for="ex in EXAMPLES" :key="ex" class="egv" :disabled="!store.dbLoaded"
                @click="q = ex; lookup()">{{ ex }}</button>
      </p>
    </div>
  </section>

  <section v-if="h" class="health" :class="{ warn: h.degraded }">
    <span class="who">
      <b>{{ scan?.product }}</b> · 扫描 #{{ scan?.id }}
      <span class="dim">{{ (scan?.started_at || '').slice(0, 16).replace('T', ' ') }}</span>
    </span>
    <span class="runs">
      <span v-for="r in h.runs" :key="r.collector" class="run" :class="r.status"
            :title="r.status">{{ r.collector }}</span>
    </span>
    <router-link to="/findings" class="go">
      <template v-if="h.degraded">{{ h.degraded }} / {{ h.total }} 个采集器未读全<template
        v-if="h.blocking">，{{ h.blocking }} 条扫描层问题</template> →</template>
      <template v-else>全部采集器读取完整 →</template>
    </router-link>
  </section>

  <section class="flow">
    <h2>从源码到运行<span class="sub">点任意一行进入对应视图</span></h2>
    <div class="segs">
      <template v-for="s in segments" :key="s.key">
        <div class="seg">
          <p class="sh"><Icon :name="s.icon" :size="15" />{{ s.label }}</p>
          <template v-for="ent in s.entities" :key="ent.name">
            <button class="entity" :class="s.key"
                    :disabled="!store.dbLoaded" @click="router.push(ent.to)">
              <span class="en-name">{{ ent.name }}</span>
              <span v-if="ent.n != null" class="en-num">{{ num(ent.n) }}</span>
              <span v-else class="en-hint">{{ ent.desc }}</span>
            </button>
            <p v-if="ent.n != null" class="en-desc">{{ ent.desc }}</p>
            <button v-for="child in ent.children" :key="child.name"
                    class="entity child" :class="s.key"
                    :disabled="!store.dbLoaded" @click="router.push(child.to)">
              <span class="en-indent">└</span>
              <span class="en-name">{{ child.name }}</span>
              <span class="en-num">{{ num(child.n) }}</span>
            </button>
          </template>
          <p v-if="s.note" class="note" :class="{ warn: s.warn }">{{ s.note }}</p>
        </div>
        <div v-if="s.arrow" class="arrow" aria-hidden="true">
          <span class="line" />
          <span class="al">{{ s.arrow }}</span>
        </div>
      </template>
    </div>
  </section>

  <section v-if="store.dbLoaded" class="examples">
    <h2>典型用例<span class="sub">点击进入对应场景</span></h2>
    <div class="ex-grid">
      <button v-for="ex in examples" :key="ex.title" class="ex-card"
              @click="router.push(ex.to)">
        <span class="ex-icon"><Icon :name="ex.icon" :size="20" /></span>
        <span class="ex-body">
          <span class="ex-title">{{ ex.title }}</span>
          <span class="ex-desc">{{ ex.desc }}</span>
          <span class="ex-eg">{{ ex.eg }}</span>
        </span>
        <span class="ex-action">→</span>
      </button>
    </div>
  </section>
</div>
</template>

<style scoped>
.home { height: 100%; overflow: auto; padding: var(--space-6) var(--space-5) var(--space-7) }
.hero { display: flex; gap: var(--space-6); align-items: flex-end; flex-wrap: wrap; margin-bottom: var(--space-5) }
.hero-left { flex: 1 1 55%; min-width: 300px }
.hero-right { flex: 1 1 40%; min-width: 280px }
.kicker { margin: 0 0 var(--space-2); font-size: var(--text-sm); font-weight: 600;
          letter-spacing: .08em; color: var(--entity-component) }
h1 { margin: 0 0 var(--space-3); font-size: 30px; line-height: 1.25; font-weight: 700 }
h1 span { display: block; color: var(--text-secondary); font-weight: 600 }
.lede { margin: 0; color: var(--text-secondary) }
.lede strong { color: var(--text-primary) }
.ask { display: flex; align-items: center; gap: var(--space-2); width: 100%;
       height: 40px; padding: 0 var(--space-2) 0 var(--space-3);
       background: var(--surface-raised); border: 1px solid var(--border-default);
       border-radius: var(--radius-md) }
.ask:focus-within { border-color: var(--entity-component) }
.ask input { flex: 1; background: none; border: 0; outline: none; color: var(--text-primary); font: inherit }
.ask button { flex: none; height: 28px; padding: 0 var(--space-4); font: inherit; font-weight: 600;
              color: var(--text-inverse); background: var(--entity-component); border: 0;
              border-radius: var(--radius-sm); cursor: pointer }
.ask button:disabled { background: var(--surface-overlay); color: var(--text-secondary) }
.eg { margin: var(--space-2) 0 0; font-size: var(--text-sm); color: var(--text-secondary) }
.egv { font: inherit; font-family: var(--font-mono); color: var(--entity-component);
       background: none; border: 0; padding: 0; cursor: pointer }
.egv:hover:not(:disabled) { text-decoration: underline }
.egv:not(:last-child)::after { content: ' · '; color: var(--text-secondary) }

.health { display: flex; align-items: center; gap: var(--space-3); flex-wrap: wrap;
          margin-bottom: var(--space-6); padding: var(--space-2) var(--space-3);
          font-size: var(--text-sm); color: var(--text-secondary);
          background: var(--surface-raised); border: 1px solid var(--border-subtle);
          border-left: 2px solid var(--entity-sa); border-radius: var(--radius-sm) }
.health.warn { border-left-color: var(--severity-warning) }
.health .who b { color: var(--text-primary) }
.health .dim { font-family: var(--font-mono) }
.runs { display: flex; gap: var(--space-1); flex-wrap: wrap }
.run { font-family: var(--font-mono); font-size: var(--text-xs); padding: 1px var(--space-2);
       border-radius: var(--radius-full); border: 1px solid var(--border-default) }
.run.complete { color: var(--entity-sa) }
.run.degraded { color: var(--severity-warning) }
.run.failed { color: var(--severity-error) }
.health .go { margin-left: auto; white-space: nowrap }

h2 { margin: 0 0 var(--space-4); font-size: var(--text-lg); font-weight: 600 }
h2 .sub { margin-left: var(--space-3); font-size: var(--text-sm); font-weight: 400; color: var(--text-secondary) }

.segs { display: grid; grid-template-columns: 1fr auto 1fr auto 1fr; gap: var(--space-2) }
.seg { display: flex; flex-direction: column; gap: var(--space-1);
       padding: var(--space-3); background: var(--surface-raised);
       border: 1px solid var(--border-subtle); border-radius: var(--radius-md) }
.sh { display: flex; align-items: center; gap: var(--space-2); margin: 0 0 var(--space-1);
      font-size: var(--text-sm); font-weight: 600; color: var(--text-secondary) }

.entity { display: flex; align-items: baseline; gap: var(--space-3); width: 100%;
          padding: var(--space-2) var(--space-3); font: inherit; text-align: left;
          background: var(--surface-default); border: 1px solid var(--border-subtle);
          border-left: 2px solid var(--border-strong); border-radius: var(--radius-sm);
          cursor: pointer; transition: background var(--motion-fast) }
.entity:hover:not(:disabled) { background: var(--surface-overlay) }
.entity:disabled { opacity: .5 }
.entity.parts { border-left-color: var(--entity-component) }
.entity.files { border-left-color: var(--entity-module) }
.entity.runtime { border-left-color: var(--entity-service) }
.entity.child { border-left: 2px solid transparent; padding-left: var(--space-5); background: transparent;
                border-color: transparent }
.entity.child:hover:not(:disabled) { background: var(--surface-overlay) }
.en-name { color: var(--text-primary); font-size: var(--text-base) }
.en-num { margin-left: auto; font-family: var(--font-mono); font-weight: 600; color: var(--text-primary) }
.en-hint { margin-left: auto; font-size: var(--text-sm); color: var(--text-secondary) }
.en-desc { margin: 0 0 var(--space-1); padding: 0 var(--space-3); font-size: var(--text-xs);
           color: var(--text-secondary) }
.en-indent { color: var(--text-secondary); flex: none }
.note { margin: auto 0 0; font-size: var(--text-sm); color: var(--text-secondary) }
.note.warn { color: var(--severity-warning) }

.arrow { align-self: center; display: flex; flex-direction: column; align-items: center;
         gap: 2px; padding: 0 var(--space-1); min-width: 76px }
.arrow .line { width: 100%; height: 1px; background: var(--border-strong); position: relative }
.arrow .line::after { content: '▶'; position: absolute; right: -2px; top: -7px;
                      font-size: 9px; color: var(--border-strong) }
.al { font-size: var(--text-xs); color: var(--text-secondary) }

.examples { margin-top: var(--space-6) }
.ex-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: var(--space-3) }
.ex-card { display: flex; align-items: flex-start; gap: var(--space-3); text-align: left;
           padding: var(--space-3) var(--space-4); cursor: pointer;
           background: var(--surface-raised); border: 1px solid var(--border-subtle);
           border-radius: var(--radius-md); transition: all var(--motion-fast) }
.ex-card:hover { border-color: var(--border-strong); background: var(--surface-overlay); transform: translateY(-1px) }
.ex-icon { flex: none; color: var(--entity-component) }
.ex-body { flex: 1; display: flex; flex-direction: column; gap: 2px }
.ex-title { font-size: var(--text-base); font-weight: 600; color: var(--text-primary) }
.ex-desc { font-size: var(--text-sm); color: var(--text-secondary); line-height: 1.4 }
.ex-eg { font-size: var(--text-xs); font-family: var(--font-mono); color: var(--text-secondary) }
.ex-action { flex: none; font-weight: 600; color: var(--entity-component) }

@media (max-width: 1080px) {
  .segs { grid-template-columns: 1fr }
  .arrow { min-width: 0; padding: var(--space-1) 0; flex-direction: row }
  .arrow .line { width: 1px; height: 18px }
  .arrow .line::after { content: '▼'; right: -4px; top: auto; bottom: -3px }
}
@media (max-width: 820px) { .ex-grid { grid-template-columns: repeat(2, 1fr) } }
@media (max-width: 760px) { .home { padding: var(--space-4) var(--space-3) var(--space-7) } .ex-grid { grid-template-columns: 1fr } }
</style>
