import { createRouter, createWebHashHistory } from 'vue-router'

const routes = [
  // 产品面：三组视图，顺序与首页一致（部件信息 → 系统文件 → 运行时进程）
  { path: '/', name: 'home', component: () => import('./views/Home.vue') },

  { path: '/parts', redirect: '/parts/repos' },
  { path: '/parts/repos', component: () => import('./views/list/Repos.vue') },
  { path: '/parts/components', component: () => import('./views/list/Components.vue') },
  { path: '/parts/innerapis', component: () => import('./views/list/InnerApis.vue') },
  { path: '/parts/features', component: () => import('./views/list/Features.vue') },
  { path: '/parts/syscaps', component: () => import('./views/list/Syscaps.vue') },
  { path: '/parts/args', component: () => import('./views/list/GnArgs.vue') },

  { path: '/files', redirect: '/files/targets' },
  { path: '/files/targets', component: () => import('./views/list/Targets.vue') },
  { path: '/files/elf', component: () => import('./views/list/Elfs.vue') },
  { path: '/files/image', component: () => import('./views/Image.vue') },

  { path: '/runtime', redirect: '/runtime/services' },
  { path: '/runtime/services', component: () => import('./views/Runtime.vue') },
  { path: '/runtime/sa',  component: () => import('./views/list/Sas.vue') },
  { path: '/runtime/hdi', component: () => import('./views/list/Hdis.vue') },
  /* 档案页挪到 /unit/ 之下：原来的 /runtime/:id 会把 /runtime/sa 当成 id 吃掉 */
  { path: '/runtime/unit/:id', name: 'runtime-unit',
    component: () => import('./views/RuntimeUnit.vue') },
  { path: '/lookup', name: 'lookup', component: () => import('./views/Lookup.vue') },
  { path: '/findings', name: 'findings', component: () => import('./views/Findings.vue') },
  /* 自定义详情页放在通用 /e/:table/:id 之前，优先匹配 */
  { path: '/e/components/:id', name: 'component-detail',
    component: () => import('./views/ComponentDetail.vue') },
  { path: '/e/repos/:id', name: 'repo-detail',
    component: () => import('./views/RepoDetail.vue') },
  { path: '/e/innerapis/:id', name: 'innerapi-detail',
    component: () => import('./views/InnerApiDetail.vue') },
  { path: '/e/features/:id', name: 'feature-detail',
    component: () => import('./views/FeatureDetail.vue') },
  { path: '/e/syscaps/:id', name: 'syscap-detail',
    component: () => import('./views/SyscapDetail.vue') },
  { path: '/e/gn_args/:id', name: 'gnarg-detail',
    component: () => import('./views/GnArgDetail.vue') },
  { path: '/e/install_targets/:id', name: 'target-detail',
    component: () => import('./views/TargetDetail.vue') },
  { path: '/e/services/:id', name: 'service-detail',
    component: () => import('./views/ServiceDetail.vue') },
  { path: '/e/sas/:id', name: 'sa-detail',
    component: () => import('./views/SaDetail.vue') },
  { path: '/e/hdis/:id', name: 'hdi-detail',
    component: () => import('./views/HdiDetail.vue') },
  { path: '/e/:table/:id', name: 'entity', component: () => import('./views/Entity.vue') },

  // 旧地址重定向，书签不失效
  { path: '/parts/repos/:id', redirect: to => `/e/repos/${to.params.id}` },
  { path: '/parts/components/:id', redirect: to => `/e/components/${to.params.id}` },
  { path: '/build', redirect: '/parts/repos' },
  { path: '/image', redirect: '/files/image' },
  { path: '/install-modules', redirect: '/files/targets' },
  { path: '/search', redirect: to => ({ path: '/lookup', query: to.query }) },
  // /data/* 已删除，重定向到产品面对应视图
  { path: '/data', redirect: '/parts/repos' },
  { path: '/data/repos', redirect: '/parts/repos' },
  { path: '/data/components', redirect: '/parts/components' },
  { path: '/data/services', redirect: '/runtime/services' },
  { path: '/data/sas', redirect: '/runtime/sa' },
  { path: '/data/hdis', redirect: '/runtime/hdi' },
  { path: '/data/install_modules', redirect: '/files/targets' },
  { path: '/data/elf_modules', redirect: '/files/elf' },
  { path: '/data/elf_module_dependencies', redirect: '/files/elf' },
  { path: '/data/issues', redirect: '/findings' },

  { path: '/:pathMatch(.*)*', name: 'not-found', component: () => import('./views/NotFound.vue') },
]

export const router = createRouter({
  history: createWebHashHistory(),
  routes,
  scrollBehavior: (to, from) => (to.path === from.path ? false : { top: 0 }),
})

router.beforeEach((to, from) => {
  if (to.query.scan == null && from.query.scan != null) {
    return { ...to, query: { ...to.query, scan: from.query.scan }, replace: true }
  }
})
