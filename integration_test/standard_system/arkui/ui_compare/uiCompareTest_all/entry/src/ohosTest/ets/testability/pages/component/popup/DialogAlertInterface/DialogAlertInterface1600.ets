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
struct DialogAlertInterface1600 {

  build() {
    Column() {
      Button('显示AlertDialog')
        .id('show_dialog_button_1600')
        .onClick(() => {
          AlertDialog.show({
            title: '删除联系人',
            message: '是否删除所选联系人？',
            autoCancel: true,
            alignment: DialogAlignment.Bottom,
            offset: { dx: 0, dy: -20 },
            gridCount: 3,
            primaryButton: {
              value: '取消',
              action: () => {
                console.info('Callback when the first button is clicked')
              }
            },
            secondaryButton: {
              value: '删除',
              fontColor: '#FF6B6B',
              action: () => {
                console.info('Callback when the second button is clicked')
              }
            },
            cancel: () => {
              console.info('Closed callbacks')
            }
          })
        })
        .margin(20)
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .backgroundColor('#0A59F7')
        .fontColor(Color.White)
        .borderRadius(8)
        .padding({ top: 12, bottom: 12, left: 24, right: 24 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .backgroundColor('#1A1A1A')
  }
}
