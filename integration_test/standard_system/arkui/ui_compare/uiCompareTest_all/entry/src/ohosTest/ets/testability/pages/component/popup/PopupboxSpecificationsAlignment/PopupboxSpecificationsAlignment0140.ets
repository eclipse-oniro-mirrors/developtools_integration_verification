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
struct PopupboxSpecificationsAlignment0140 {
  @State showInSubWindow: boolean = true
  dialogController: CustomDialogController | undefined

  aboutToAppear(): void {
    this.dialogController = new CustomDialogController({
      builder: ShowDialogExample(),
      showInSubWindow: this.showInSubWindow
    })
  }

  build() {
    Column({ space: 20 }) {
      Text('UIExtension中，点击subWindow:T，点击click for dialog弹出弹窗，enter/space关闭子窗弹窗')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })
        .textAlign(TextAlign.Center)

      Row({ space: 20 }) {
        Text('showDialog:')
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
            this.updateDialogController()
          })
      }

      Button('click for dialog')
        .id('click_for_dialog_button')
        .focusable(true)
        .onClick(() => {
          if (this.dialogController) {
            this.dialogController.open()
          }
        })

      Text('使用Enter/Space键关闭弹窗，Tab键切换焦点')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ top: 20 })

      Text('测试焦点位置落向subWindow：F')
        .fontSize(12)
        .fontColor(Color.Blue)
        .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }

  updateDialogController() {
    if (this.dialogController) {
      this.dialogController = new CustomDialogController({
        builder: ShowDialogExample(),
        showInSubWindow: this.showInSubWindow
      })
    }
  }
}

@CustomDialog
struct ShowDialogExample {
  controller?: CustomDialogController

  build() {
    Column({ space: 20 }) {
      Text('ShowDialog弹窗')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)

      Text('这是一个showDialog弹窗')
        .fontSize(14)

      Text('按Enter或Space键关闭弹窗')
        .fontSize(12)
        .fontColor(Color.Gray)

      Row({ space: 20 }) {
        Button('确认')
          .id('confirm_button')
          .focusable(true)
          .onClick(() => {
            if (this.controller) {
              this.controller.close()
            }
          })
          .onKeyEvent((event: KeyEvent) => {
            if (event.type === KeyType.Down && 
                (event.keyCode === 2054 || event.keyCode === 2055)) { // Enter或Space键
              if (this.controller) {
                this.controller.close()
              }
            }
          })

        Button('取消')
          .id('cancel_button')
          .focusable(true)
          .onClick(() => {
            if (this.controller) {
              this.controller.close()
            }
          })
          .onKeyEvent((event: KeyEvent) => {
            if (event.type === KeyType.Down && 
                (event.keyCode === 2054 || event.keyCode === 2055)) { // Enter或Space键
              if (this.controller) {
                this.controller.close()
              }
            }
          })
      }
    }
    .padding(20)
    .backgroundColor(Color.White)
    .borderRadius(10)
  }
}
