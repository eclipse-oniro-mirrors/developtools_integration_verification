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
struct PopupBoxAlertdialogInterface1200 {

  showAlertDialog() {
    try {
      let uiContext = this.getUIContext()
      uiContext.showAlertDialog({
        title: 'Alert Dialog',
        message: '这是一个警告弹窗的消息内容',
        autoCancel: true,
        alignment: DialogAlignment.Bottom,
        offset: { dx: 0, dy: -20 },
        gridCount: 3,
        confirm: {
          value: 'Confirm',
          action: () => {
            console.info('Callback when the first button is clicked')
          }
        },
        cancel: () => {
          console.info('Closed callbacks')
        }
      })
    } catch (error) {
      console.error('showAlertDialog error: ' + JSON.stringify(error))
    }
  }

  build() {
    Column() {
      Text('警告弹窗界面')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 50, bottom: 30 })

      Button('two button dialog')
        .id('alert_dialog_button_1200')
        .width(200)
        .height(50)
        .fontSize(16)
        .onClick(() => {
          this.showAlertDialog()
        })
        .margin({ bottom: 20 })

      Text('点击按钮弹出警告弹窗，内容为Resource类型的message')
        .fontSize(14)
        .fontColor(Color.Gray)
        .textAlign(TextAlign.Center)
        .margin({ top: 20 })
        .padding(20)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}


