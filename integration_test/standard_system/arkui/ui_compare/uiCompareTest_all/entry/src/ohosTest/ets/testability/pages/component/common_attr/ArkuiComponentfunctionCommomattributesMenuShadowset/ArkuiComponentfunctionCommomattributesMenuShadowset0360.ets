/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { webview } from '@kit.ArkWeb'

@Entry
@Component
struct ArkuiComponentfunctionCommomattributesMenuShadowset0360 {
  @State isDarkMode: boolean = false
  controller: webview.WebviewController = new webview.WebviewController()

  build() {
    Column() {
      Text('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0360')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .id('title_text_0360')

      Text('测试说明：\n验证直板机在深色模式下，鼠标右键点击打开web菜单的阴影显示正常')
        .fontSize(14)
        .margin({ bottom: 30 })
        .padding(10)
        .backgroundColor(Color.Gray)
        .borderRadius(8)

      Button('切换到深色模式')
        .id('button_dark_mode_0360')
        .margin({ bottom: 10 })
        .onClick(() => {
          this.isDarkMode = true
        })

      Web({ src: ('https://' + 'www.openharmony.cn' + ''), controller: this.controller })
        .id('web_component_0360')
        .width('100%')
        .height(500)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(this.isDarkMode ? '#1E1E1E' : '#F5F5F5')
  }
}

