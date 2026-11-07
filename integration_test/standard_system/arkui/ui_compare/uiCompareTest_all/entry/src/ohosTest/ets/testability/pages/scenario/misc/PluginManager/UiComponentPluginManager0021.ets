/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct UiComponentPluginManager0021 {
  @State statusText: string = 'idle'

  build() {
    Column({ space: 12 }) {
      Text('SUB_ACE_TOOLCHAIN_ARKUI_BARRIERFREE_PLUGINCOMPONENTMANAGER_PUSH_QIANGJI_0021')
        .fontSize(12)
      PluginComponent({
        template: { source: 'invalid://plugin/source', bundleName: 'com.example.plugin.not.exist' },
        data: {}
      })
        .width(200)
        .height(120)
        .id('plugin_host')
        .onComplete(() => {
          this.statusText = 'plugin_complete'
        })
        .onError(() => {
          this.statusText = 'plugin_error'
        })
      Text(this.statusText)
        .id('plugin_status')
        .fontSize(14)
    }
    .width('100%')
    .height('100%')
    .padding(16)
  }
}
