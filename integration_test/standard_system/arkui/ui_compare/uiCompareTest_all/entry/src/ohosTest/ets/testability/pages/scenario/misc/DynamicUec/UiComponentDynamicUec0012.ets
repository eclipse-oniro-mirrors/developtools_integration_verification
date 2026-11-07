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

import Want from '@ohos.app.ability.Want'
import { BusinessError } from '@kit.BasicServicesKit'

@Entry
@Component
struct UiComponentDynamicUec0012 {
  @State statusText: string = 'idle'
  private want: Want = { bundleName: 'com.example.uea.not.installed', abilityName: 'UIExtAbility' } as Want

  build() {
    Column({ space: 12 }) {
      Text('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_DYNAMICCOMPONENT_UEC_ARKUI_0012')
        .fontSize(12)
      UIExtensionComponent(this.want)
        .width(240)
        .height(160)
        .id('uec_host')
        .onError((err: BusinessError) => {
          this.statusText = `uec_error:${err.code}`
        })
        .onRemoteReady(() => {
          this.statusText = 'uec_remote_ready'
        })
      Text(this.statusText)
        .id('uec_status')
        .fontSize(14)
      Text('missing_uea')
        .id('uec_expect_hint')
        .fontSize(12)
    }
    .width('100%')
    .height('100%')
    .padding(16)
  }
}
