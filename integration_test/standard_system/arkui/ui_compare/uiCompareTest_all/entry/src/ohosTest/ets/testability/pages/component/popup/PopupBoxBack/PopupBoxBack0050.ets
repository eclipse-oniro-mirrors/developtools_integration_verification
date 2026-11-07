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
struct PopupBoxBack0050 {
  @State isShowAlertDialog: boolean = false
  @State dismissReason: string = ''
  @State dismissReasonCode: number = -1
  private richEditorController: RichEditorController = new RichEditorController()

  build() {
    Column() {
      Text('AlertDialog配置onWillDismiss不退出测试')
        .fontSize(20)
        .margin(20)

      Button('AlertDialog1')
        .id('show_alertdialog_back_0050')
        .margin(20)
        .onClick(() => {
          this.isShowAlertDialog = true
        })

      Text(`Dismiss Reason Code: ${this.dismissReasonCode}`)
        .fontSize(16)
        .margin(10)

      Text(`Dismiss Reason: ${this.dismissReason}`)
        .fontSize(16)
        .margin(10)

      RichEditor({ controller: this.richEditorController })
        .id('rich_editor_back_0050')
        .width('90%')
        .height(100)
        .margin(20)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .bindContentCover(this.isShowAlertDialog, this.alertDialogBuilder(), {
      modalTransition: ModalTransition.NONE,
      onWillDismiss: (dismissDialog: DismissDialogAction) => {
        if (dismissDialog.reason === DismissReason.PRESS_BACK || 
            dismissDialog.reason === DismissReason.TOUCH_OUTSIDE) {
          // 不触发dismiss，阻止弹窗关闭
          dismissDialog.dismiss()
          this.dismissReasonCode = dismissDialog.reason
          if (dismissDialog.reason === DismissReason.PRESS_BACK) {
            this.dismissReason = 'PRESS_BACK (0)'
          } else if (dismissDialog.reason === DismissReason.TOUCH_OUTSIDE) {
            this.dismissReason = 'TOUCH_OUTSIDE (1)'
          }
        } else {
          this.isShowAlertDialog = false
        }
      }
    })
  }

  @Builder
  alertDialogBuilder() {
    Column() {
      Text('警告')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin(10)
      
      Text('这是一个警告弹窗')
        .fontSize(14)
        .margin(10)

      Row() {
        Button('确认')
          .width('40%')
          .margin(10)
          .onClick(() => {
            this.isShowAlertDialog = false
          })
      }
      .justifyContent(FlexAlign.Center)
    }
    .width('41.67%')
    .padding(20)
    .backgroundColor(Color.White)
    .borderRadius(10)
    .shadow({ radius: 10, color: Color.Gray, offsetX: 0, offsetY: 2 })
  }
}
