export const ICONS = {
  repo: '📁', component: '🔧', service: '⚙️', sa: '📡', hdi: '🔌',
  module: '📦', subsystem: '📂', target: '📄', tag: '🏷️', issue: '⚠️'
}

export const TYPE_BADGE = {
  components: { class: 'component', label: 'component' },
  services: { class: 'service', label: 'service' },
  sas: { class: 'sa', label: 'SA' },
  hdis: { class: 'hdi', label: 'HDI' },
  repos: { class: 'repo', label: 'repo' },
  install_modules: { class: 'module', label: 'module' }
}

export const TAB_LIMIT = 50

export const ENTITY_LABELS = {
  components: { name: 'name', label: 'name' },
  services: { name: 'cfg', label: 'name' },
  sas: { name: 'sa_id', label: 'process' },
  hdis: { name: 'service_name', label: 'module_name' },
  repos: { name: 'name', label: 'path' },
  install_modules: { name: 'label', label: 'label_name' }
}
