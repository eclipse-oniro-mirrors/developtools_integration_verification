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
struct UiComponentXComponentMarker0310 {
  @State statusText: string = 'idle'
  private xController: XComponentController = new XComponentController()

  build() {
    Column({ space: 12 }) {
      Text('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_XCOMPONENT_SUPPORT_FUNCTION_KEY_STATUS_AND_MOUSE_EVENT_0310')
        .fontSize(12)
      XComponent({
        id: 'xcomp_host',
        type: XComponentType.TEXTURE,
        controller: this.xController
      })
        .width(200)
        .height(160)
        .onLoad(() => {
          this.statusText = 'xcomp_onload'
        })
        .onDestroy(() => {
          this.statusText = 'xcomp_ondestroy'
        })
      Text(this.statusText)
        .id('xcomp_status')
        .fontSize(14)
    }
    .width('100%')
    .height('100%')
    .padding(16)
  }
}
