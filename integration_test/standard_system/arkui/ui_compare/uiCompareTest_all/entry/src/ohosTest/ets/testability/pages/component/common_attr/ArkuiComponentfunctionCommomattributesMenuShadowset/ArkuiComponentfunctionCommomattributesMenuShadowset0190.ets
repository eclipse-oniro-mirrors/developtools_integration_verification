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

@Entry
@Component
struct ArkuiComponentfunctionCommomattributesMenuShadowset0190 {
  build() {
    Column() {
      Text('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0190')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .id('title_text_0190')

      Text('测试说明：\n验证直板机在浅色模式下，bindMenu设置showInSubWindow为true的情况下，阴影显示正常')
        .fontSize(14)
        .margin({ bottom: 30 })
        .padding(10)
        .backgroundColor(Color.Gray)
        .borderRadius(8)

      Button('bindMenu设置showinSub为true')
        .id('button_menu_0190')
        .margin({ bottom: 10 })
        .bindMenu([
          {
            value: '菜单项1',
            action: () => {
              console.info('Menu item 1 clicked')
            }
          },
          {
            value: '菜单项2',
            action: () => {
              console.info('Menu item 2 clicked')
            }
          },
          {
            value: '菜单项3',
            action: () => {
              console.info('Menu item 3 clicked')
            }
          }
        ], {
          showInSubWindow: true
        })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('#F5F5F5')
  }
}

