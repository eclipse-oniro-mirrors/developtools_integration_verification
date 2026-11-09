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
struct FullDialogComponent0150 {
  controller: CustomDialogController

  build() {
    Column() {
      Text('Full Screen Dialog')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Text('onWillDismiss without dismiss method')
        .fontSize(18)
        .margin({ bottom: 20 })

      Text('Close by closeCustomDialog button')
        .fontSize(16)
        .margin({ bottom: 20 })

      Text('Dialog will close after 2 seconds')
        .fontSize(14)
        .margin({ bottom: 20 })

      Button('Auto Close (2s)')
        .id('button_auto_close_fulldialog_0150')
        .onClick(() => {
          // 2秒后自动关闭弹窗
          setTimeout(() => {
            this.controller.close()
          }, 2000)
        })
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
struct PopupBoxFullDialog0150 {
  @State logMessages: string[] = []
  @State reasonMessages: string[] = []
  dialogController: CustomDialogController | null = null

  aboutToAppear() {
    this.dialogController = new CustomDialogController({
      builder: FullDialogComponent0150(),
      isModal: false, // isModal设置为false
      autoCancel: true,
      customStyle: true,
      onWillDismiss: (dismissDialogAction: DismissDialogAction) => {
        // 不调用 dismiss() 方法
        let reason = dismissDialogAction.reason
        
        if (reason === 0) {
          this.logMessages.push('onWillDismiss triggered: reason = 0 (PRESS_BACK) - but dismiss() not called')
          this.reasonMessages.push('reason = 0 (PRESS_BACK)')
          console.log('onWillDismiss triggered: reason = 0 (PRESS_BACK) - but dismiss() not called')
        } else if (reason === 1) {
          this.logMessages.push('onWillDismiss triggered: reason = 1 (TOUCH_OUTSIDE) - but dismiss() not called')
          this.reasonMessages.push('reason = 1 (TOUCH_OUTSIDE)')
          console.log('onWillDismiss triggered: reason = 1 (TOUCH_OUTSIDE) - but dismiss() not called')
        }
        
        // 注意：不调用 dismissDialogAction.dismiss()
        // 但通过 controller.close() 关闭时，不会触发 onWillDismiss
      },
      onDidDisappear: () => {
        this.logMessages.push('Dialog closed successfully (onDidDisappear)')
        console.log('Dialog closed successfully (onDidDisappear)')
      }
    })
  }

  build() {
    Column() {
      Text('Test closeCustomDialog')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Text('onWillDismiss without dismiss method')
        .fontSize(18)
        .margin({ bottom: 10 })

      Text('isModal is false')
        .fontSize(16)
        .margin({ bottom: 20 })

      Button('Open')
        .id('button_open_fulldialog_0150')
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
          if (this.reasonMessages.length === 0) {
            Text('No reason returned (expected)')
              .fontSize(16)
              .fontColor(Color.Green)
              .margin({ bottom: 5 })
          } else {
            ForEach(this.reasonMessages, (message: string, index: number) => {
              Text(`${index + 1}. ${message}`)
                .fontSize(16)
                .fontColor(Color.Red)
                .margin({ bottom: 5 })
            }, (message: string, index: number) => index.toString())
          }
        }
      }
      .width('90%')
      .height('15%')
      .padding(10)
      .border({ width: 1, color: Color.Green })
      .margin({ bottom: 20 })
      .id('reason_display_fulldialog_0150')

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
      .id('log_display_fulldialog_0150')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
  }
}
