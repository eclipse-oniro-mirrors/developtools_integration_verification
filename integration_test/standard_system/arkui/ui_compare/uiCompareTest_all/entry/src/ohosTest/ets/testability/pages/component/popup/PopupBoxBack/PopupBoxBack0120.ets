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

import { promptAction } from '@kit.ArkUI'

@Entry
@Component
struct PopupBoxBack0120 {
  @State dismissReason: string = ''
  @State dismissReasonCode: number = -1
  @State dismissCallbackTriggered: boolean = false
  @State customDialogId: number = -1
  private richEditorController: RichEditorController = new RichEditorController()

  build() {
    Column() {
      Text('promptAction.closeCustomDialog测试')
        .fontSize(20)
        .margin(20)

      Button('openCustomDialog2')
        .id('show_opencustomdialog_back_0120')
        .margin(20)
        .onClick(() => {
          this.openCustomDialog()
        })

      Text(`Dismiss Callback Triggered: ${this.dismissCallbackTriggered}`)
        .fontSize(16)
        .margin(10)

      Text(`Dismiss Reason Code: ${this.dismissReasonCode}`)
        .fontSize(16)
        .margin(10)

      Text(`Dismiss Reason: ${this.dismissReason}`)
        .fontSize(16)
        .margin(10)

      RichEditor({ controller: this.richEditorController })
        .id('rich_editor_back_0120')
        .width('90%')
        .height(100)
        .margin(20)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
  }

  openCustomDialog() {
    // 重置状态
    this.dismissCallbackTriggered = false
    this.dismissReason = ''
    this.dismissReasonCode = -1

    promptAction.openCustomDialog({
      builder: () => {
        this.customDialogBuilder()
      },
      showInSubWindow: true,
      isModal: true,
      onWillDismiss: (dismissDialog: DismissDialogAction) => {
        if (dismissDialog.reason === DismissReason.PRESS_BACK || 
            dismissDialog.reason === DismissReason.TOUCH_OUTSIDE) {
          // PRESS_BACK和TOUCH_OUTSIDE不触发dismiss回调
          this.dismissCallbackTriggered = false
          this.dismissReasonCode = dismissDialog.reason
          if (dismissDialog.reason === DismissReason.PRESS_BACK) {
            this.dismissReason = 'PRESS_BACK (0)'
          } else if (dismissDialog.reason === DismissReason.TOUCH_OUTSIDE) {
            this.dismissReason = 'TOUCH_OUTSIDE (1)'
          }
        } else {
          // 其他情况（如点击取消按钮）不触发dismiss回调，正常关闭
          this.dismissCallbackTriggered = false
          this.dismissReason = 'CANCEL_BUTTON'
        }
      }
    }).then((dialogId: number) => {
      this.customDialogId = dialogId
    })
  }

  @Builder
  customDialogBuilder() {
    Column() {
      Text('自定义弹窗')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin(10)
      
      Text('这是一个通过promptAction.openCustomDialog创建的弹窗')
        .fontSize(14)
        .margin(10)

      Row() {
        Button('取消')
          .width('40%')
          .margin(10)
          .onClick(() => {
            promptAction.closeCustomDialog(this.customDialogId)
          })

        Button('确认')
          .width('40%')
          .margin(10)
          .onClick(() => {
            promptAction.closeCustomDialog(this.customDialogId)
          })
      }
      .justifyContent(FlexAlign.SpaceEvenly)
    }
    .width('41.67%')
    .padding(20)
    .backgroundColor(Color.White)
    .borderRadius(10)
    .shadow({ radius: 10, color: Color.Gray, offsetX: 0, offsetY: 2 })
  }
}
