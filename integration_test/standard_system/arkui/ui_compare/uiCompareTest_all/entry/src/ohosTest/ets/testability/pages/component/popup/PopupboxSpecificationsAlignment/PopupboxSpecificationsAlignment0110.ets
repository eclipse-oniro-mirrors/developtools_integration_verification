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
struct PopupboxSpecificationsAlignment0110 {
  @State showInSubWindow: boolean = true
  alertDialogController: AlertDialogParamWithConfirm | undefined

  aboutToAppear(): void {
    this.alertDialogController = {
      title: 'AlertDialog弹窗',
      message: '这是一个alertDialog弹窗',
      showInSubWindow: this.showInSubWindow,
      confirm: {
        value: '确认',
        action: () => {
          console.info('Callback when the first button is clicked')
        }
      },
      cancel: () => {
        console.info('Callback when the second button is clicked')
      }
    }
  }

  build() {
    Column({ space: 20 }) {
      Text('UIExtension中，点击subWindow:T，切换焦点位到click for dialog，点击click for dialog弹出弹窗，点击button关闭子弹窗')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })
        .textAlign(TextAlign.Center)

      Row({ space: 20 }) {
        Text('alertDialog:')
        Text('已创建')
          .fontSize(14)
          .fontColor(Color.Green)
      }

      Row({ space: 20 }) {
        Text('showInSubWindow:')
        Button(this.showInSubWindow ? 'T' : 'F')
          .id('subWindow_button')
          .focusable(true)
          .onClick(() => {
            this.showInSubWindow = !this.showInSubWindow
            this.updateAlertDialogController()
          })
      }

      Button('click for dialog')
        .id('click_for_dialog_button')
        .focusable(true)
        .onClick(() => {
          if (this.alertDialogController) {
            AlertDialog.show(this.alertDialogController)
          }
        })

      Text('使用Tab键切换焦点，点击按钮触发操作')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ top: 20 })

      Text('测试弹窗无焦点位置和关闭后焦点落向')
        .fontSize(12)
        .fontColor(Color.Blue)
        .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }

  updateAlertDialogController() {
    this.alertDialogController = {
      title: 'AlertDialog弹窗',
      message: '这是一个alertDialog弹窗',
      showInSubWindow: this.showInSubWindow,
      confirm: {
        value: '确认',
        action: () => {
          console.info('Callback when the first button is clicked')
        }
      },
      cancel: () => {
        console.info('Callback when the second button is clicked')
      }
    }
  }
}
