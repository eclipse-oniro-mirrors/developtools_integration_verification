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

@CustomDialog
struct FullDialogComponent0170 {
  controller: CustomDialogController

  build() {
    Column() {
      Text('Full Screen Dialog')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Text('onWillDismiss with dismiss method')
        .fontSize(18)
        .margin({ bottom: 20 })

      Text('All close methods are allowed')
        .fontSize(16)
        .margin({ bottom: 20 })

      Text('Try to close by:')
        .fontSize(14)
        .margin({ bottom: 10 })

      Text('1. Click overlay')
        .fontSize(14)
        .margin({ bottom: 5 })

      Text('2. Press back/ESC key')
        .fontSize(14)
        .margin({ bottom: 5 })

      Text('3. Swipe left/right')
        .fontSize(14)
        .margin({ bottom: 20 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
    .justifyContent(FlexAlign.Center)
  }
}

@Entry
@Component
struct PopupBoxFullDialog0170 {
  @State logMessages: string[] = []
  @State reasonMessages: string[] = []
  dialogController: CustomDialogController | null = null

  aboutToAppear() {
    this.dialogController = new CustomDialogController({
      builder: FullDialogComponent0170(),
      isModal: true,
      autoCancel: true, // 允许点击遮障层关闭
      customStyle: true,
      onWillDismiss: (dismissDialogAction: DismissDialogAction) => {
        let reason = dismissDialogAction.reason
        let reasonText = ''
        
        if (reason === 0) {
          reasonText = 'PRESS_BACK (0)'
          this.logMessages.push('Dialog closing: reason = 0 (PRESS_BACK)')
          this.reasonMessages.push('reason = 0 (PRESS_BACK)')
          console.log('Dialog closing: reason = 0 (PRESS_BACK)')
        } else if (reason === 1) {
          reasonText = 'TOUCH_OUTSIDE (1)'
          this.logMessages.push('Dialog closing: reason = 1 (TOUCH_OUTSIDE)')
          this.reasonMessages.push('reason = 1 (TOUCH_OUTSIDE)')
          console.log('Dialog closing: reason = 1 (TOUCH_OUTSIDE)')
        }
        
        // 调用 dismiss() 方法，允许弹窗关闭
        dismissDialogAction.dismiss()
        this.logMessages.push('dismiss() method called, dialog will close')
        console.log('dismiss() method called, dialog will close')
      }
    })
  }

  build() {
    Column() {
      Text('Test onWillDismiss with dismiss')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Text('All close methods allowed')
        .fontSize(18)
        .margin({ bottom: 20 })

      Button('Open')
        .id('button_open_fulldialog_0170')
        .onClick(() => {
          if (this.dialogController) {
            this.dialogController.open()
            this.logMessages.push('Dialog opened')
          }
        })
        .margin({ bottom: 20 })

      Text('Reason Messages:')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Scroll() {
        Column() {
          ForEach(this.reasonMessages, (message: string, index: number) => {
            Text(`${index + 1}. ${message}`)
              .fontSize(16)
              .fontColor(Color.Red)
              .margin({ bottom: 5 })
          }, (message: string, index: number) => index.toString())
        }
      }
      .width('90%')
      .height('20%')
      .padding(10)
      .border({ width: 1, color: Color.Red })
      .margin({ bottom: 20 })
      .id('reason_display_fulldialog_0170')

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
      .height('30%')
      .padding(10)
      .border({ width: 1, color: Color.Gray })
      .id('log_display_fulldialog_0170')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
  }
}
