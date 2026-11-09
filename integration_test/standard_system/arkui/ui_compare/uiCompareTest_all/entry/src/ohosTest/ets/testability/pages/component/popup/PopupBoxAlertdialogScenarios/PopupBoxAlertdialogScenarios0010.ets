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
struct PopupBoxAlertdialogScenarios0010 {
  @State showDialog: boolean = false

  aboutToAppear() {
    if (this.showDialog) {
      this.showAlertDialog()
    }
  }

  showAlertDialog() {
    AlertDialog.show({
      title: '警告弹窗',
      message: '这是一个无按钮的警告弹窗，无蒙层',
      autoCancel: false,
      showInSubWindow: true,
      isModal: false,
      maskRect: { x: 0, y: 0, width: 0, height: 0 },
      alignment: DialogAlignment.Center,
      offset: { dx: 0, dy: 0 },
      gridCount: 4,
      buttons: []
    })
  }

  build() {
    Column() {
      Button('显示无按钮弹窗')
        .id('show_dialog_button_0010')
        .onClick(() => {
          this.showDialog = true
          this.showAlertDialog()
        })
        .margin(20)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}


