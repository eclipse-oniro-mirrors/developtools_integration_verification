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
struct UiComponentPopupboxMenuLocation0180 {
  @State clickCount: number = 0

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0180')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .id('title_text_0180')

      Text('测试说明：\nisModal=false - 绑定2个弹窗')
        .fontSize(14)
        .margin({ bottom: 20 })
        .padding(10)
        .backgroundColor(Color.Gray)
        .borderRadius(8)

      Text(`点击次数：${this.clickCount}`)
        .fontSize(14)
        .margin({ bottom: 20 })
        .id('click_count_0180')

      Button('弹出警告弹窗')
        .id('button_alert_0180')
        .margin({ bottom: 10 })
        .onClick(() => {
          this.clickCount++
          // 绑定第1个弹窗
          AlertDialog.show({
            title: '警告弹窗1',
            message: `第 ${this.clickCount} 次点击 - 弹窗1`,
            isModal: false,
            confirm: {
              value: '确定',
              action: () => {
                console.info('Alert Dialog 1 confirmed')
              }
            }
          })
          // 绑定第2个弹窗
          AlertDialog.show({
            title: '警告弹窗2',
            message: `第 ${this.clickCount} 次点击 - 弹窗2`,
            isModal: false,
            offset: { dx: 50, dy: 50 },
            confirm: {
              value: '确定',
              action: () => {
                console.info('Alert Dialog 2 confirmed')
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

