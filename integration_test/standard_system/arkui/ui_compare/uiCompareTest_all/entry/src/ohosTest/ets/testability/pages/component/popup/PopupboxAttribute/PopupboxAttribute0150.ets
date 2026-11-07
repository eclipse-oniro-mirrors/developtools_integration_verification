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

import { promptAction } from '@kit.ArkUI';

@CustomDialog
struct CustomDialogComponent0150 {
  controller: CustomDialogController
  getDialogId: () => number = () => 0

  build() {
    Column() {
      Text('CustomDialog')
        .fontSize(20)
        .margin({ top: 10, bottom: 10 })
      
      Button('关闭')
        .id('button_close_custom_dialog_0150')
        .onClick(() => {
          let dialogId = this.getDialogId()
          promptAction.closeCustomDialog(dialogId)
        })
        .margin({ bottom: 10 })
    }
    .width('80%')
    .padding(20)
  }
}

@Entry
@Component
struct PopupboxAttribute0150 {
  @State logMessages: string[] = []
  @State dismissReason: string = ''
  @State customDialogId: number = 0
  dialogController: CustomDialogController | null = null

  aboutToAppear() {
    this.dialogController = new CustomDialogController({
      builder: CustomDialogComponent0150({ 
        getDialogId: () => {
          return this.customDialogId
        }
      }),
      isModal: false,
      onWillDismiss: (dismissDialogAction: DismissDialogAction) => {
        console.log('onWillDismiss triggered')
        this.logMessages.push('onWillDismiss triggered')
        
        if (dismissDialogAction.reason !== undefined) {
          console.log('reason=' + dismissDialogAction.reason)
          this.logMessages.push('reason=' + dismissDialogAction.reason)
          this.dismissReason = 'reason=' + dismissDialogAction.reason
        }
        
        // 不调用 dismissDialogAction.dismiss()，拦截弹窗关闭
      }
    })
  }

  build() {
    Column() {
      Button('click me')
        .id('button_popupbox_attribute_0150')
        .onClick(() => {
          if (this.dialogController) {
            let dialogId: number = this.dialogController.open() as number
            this.customDialogId = dialogId !== undefined ? dialogId : 0
            this.logMessages.push('Dialog opened, ID: ' + this.customDialogId)
          }
        })
        .margin({ top: 20, bottom: 20 })

      Text('Custom Dialog ID:')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text(this.customDialogId === 0 ? 'Not opened' : String(this.customDialogId))
        .fontSize(16)
        .margin({ bottom: 20 })
        .id('custom_dialog_id_display_0150')

      Text('Dismiss Reason:')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text(this.dismissReason)
        .fontSize(16)
        .margin({ bottom: 20 })
        .id('dismiss_reason_display_0150')

      Text('Log Messages:')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Scroll() {
        Column() {
          ForEach(this.logMessages, (message: string, index: number) => {
            Text(`${index + 1}. ${message}`)
              .fontSize(16)
              .margin({ bottom: 5 })
          }, (message: string, index: number) => index.toString())
        }
      }
      .width('90%')
      .height('40%')
      .padding(10)
      .border({ width: 1, color: Color.Gray })
      .id('log_display_popupbox_attribute_0150')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
  }
}



