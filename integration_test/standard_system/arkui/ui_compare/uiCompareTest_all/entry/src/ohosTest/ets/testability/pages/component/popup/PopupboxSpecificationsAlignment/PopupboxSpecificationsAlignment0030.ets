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
struct PopupboxSpecificationsAlignment0030 {
  @State showInSubWindow: boolean = true
  @State isModal: boolean = false
  @State alignment: DialogAlignment = DialogAlignment.Center
  dialogController: CustomDialogController | undefined

  aboutToAppear(): void {
    this.dialogController = new CustomDialogController({
      builder: CustomDialogExample(),
      showInSubWindow: this.showInSubWindow,
      isModal: this.isModal,
      alignment: this.alignment
    })
  }

  build() {
    Column({ space: 20 }) {
      Text('UIExtension中，多次点击showInSubWindow为true的弹窗')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Row({ space: 20 }) {
        Text('showInSubWindow:')
        Button(this.showInSubWindow ? 'T' : 'F')
          .id('subWindow_button')
          .onClick(() => {
            this.showInSubWindow = !this.showInSubWindow
            this.updateDialogController()
          })
      }

      Row({ space: 20 }) {
        Text('isModal:')
        Button(this.isModal ? 'T' : 'F')
          .id('isModal_button')
          .onClick(() => {
            this.isModal = !this.isModal
            this.updateDialogController()
          })
      }

      Button('Center')
        .id('center_button')
        .onClick(() => {
          this.alignment = DialogAlignment.Center
          this.updateDialogController()
        })

      Button('click for dialog')
        .id('click_for_dialog_button')
        .onClick(() => {
          if (this.dialogController) {
            this.dialogController.open()
          }
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }

  updateDialogController() {
    if (this.dialogController) {
      this.dialogController = new CustomDialogController({
        builder: CustomDialogExample(),
        showInSubWindow: this.showInSubWindow,
        isModal: this.isModal,
        alignment: this.alignment
      })
    }
  }
}

@CustomDialog
struct CustomDialogExample {
  controller?: CustomDialogController

  build() {
    Column({ space: 20 }) {
      Text('自定义弹窗')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)

      Text('这是一个openCustomDialog弹窗')
        .fontSize(14)

      Row({ space: 20 }) {
        Button('确认')
          .id('confirm_button')
          .onClick(() => {
            if (this.controller) {
              this.controller.close()
            }
          })

        Button('取消')
          .id('cancel_button')
          .onClick(() => {
            if (this.controller) {
              this.controller.close()
            }
          })
      }
    }
    .padding(20)
    .backgroundColor(Color.White)
    .borderRadius(10)
  }
}

export {}
