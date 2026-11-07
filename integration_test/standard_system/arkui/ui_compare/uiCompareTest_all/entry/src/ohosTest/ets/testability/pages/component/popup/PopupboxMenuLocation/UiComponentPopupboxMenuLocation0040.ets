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
struct UiComponentPopupboxMenuLocation0040 {
  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0040')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .id('title_text_0040')

      Text('测试说明：\n警告弹窗 - offset-dx=-500')
        .fontSize(14)
        .margin({ bottom: 30 })
        .padding(10)
        .backgroundColor(Color.Gray)
        .borderRadius(8)

      Button('弹出警告弹窗')
        .id('button_alert_0040')
        .margin({ bottom: 10 })
        .onClick(() => {
          AlertDialog.show({
            title: '警告弹窗',
            message: '测试 offset dx=-500',
            showInSubWindow: true,
            offset: { dx: -500, dy: 0 },
            confirm: {
              value: '确定',
              action: () => {
                console.info('Alert Dialog confirmed')
              }
            }
          })
        })
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}

