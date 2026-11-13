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
struct UiComponent0803Batch0001 {
  @State resultText: string = 'idle'
  build() {
    Column({ space: 16 }) {
      Text('SUB_ACE_TOOLCHAIN_ARKUI_BARRIERFREE_PLUGINCOMPONENT_ONCOMPLETE_0001')
        .fontSize(12)
      Button('mark_complete')
        .id('plugin_complete_btn')
        .onClick(() => {
          this.resultText = 'plugin_onComplete_pending'
        })
      Text(this.resultText)
        .id('assert_result_plugin_0001')
        .fontSize(16)
    }
    .width('100%')
    .height('100%')
    .padding(24)
    .justifyContent(FlexAlign.Center)
  }
}
