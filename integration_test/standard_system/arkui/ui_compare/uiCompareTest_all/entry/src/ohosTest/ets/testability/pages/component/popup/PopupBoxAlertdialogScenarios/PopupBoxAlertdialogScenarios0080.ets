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
struct PopupBoxAlertdialogScenarios0080 {
  @State showDialog: boolean = false

  showAlertDialog() {
    AlertDialog.show({
      title: '警告弹窗',
      message: '这是一个子窗口警告弹窗，点击button按钮退出',
      autoCancel: false,
      showInSubWindow: true,
      alignment: DialogAlignment.Center,
      offset: { dx: 0, dy: 0 },
      gridCount: 4,
      confirm: {
        value: 'button',
        action: () => {
          this.showDialog = false
        }
      },
      cancel: () => {
        this.showDialog = false
      }
    })
  }

  build() {
    Column({ space: 20 }) {
      Text('警告弹窗界面')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Button('two button dialog')
        .id('two_button_dialog_0080')
        .onClick(() => {
          this.showDialog = true
          this.showAlertDialog()
        })
        .width(200)
        .height(40)

      Text('点击按钮弹出警告弹窗，然后点击弹窗内的button按钮退出')
        .fontSize(14)
        .textAlign(TextAlign.Center)
        .margin({ top: 20 })
        .padding(10)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Center)
  }
}
