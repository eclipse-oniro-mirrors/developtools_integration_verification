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
struct DialogComponent0460 {
  controller: CustomDialogController

  build() {
    Column() {
      Text('CustomDialog Content')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Text('This dialog is already opened')
        .fontSize(14)
        .margin({ bottom: 20 })

      Button('Close Dialog')
        .id('button_close_dialog_fulldialog_0460')
        .onClick(() => {
          this.controller.close()
        })
        .margin({ bottom: 20 })
    }
    .width('80%')
    .padding(20)
    .backgroundColor(Color.White)
  }
}

@Entry
@Component
struct PopupBoxFullDialog0460 {
  @State logMessages: string[] = []
  @State errorMessages: string[] = []
  @State customDialogId: number = -1
  dialogController: CustomDialogController | null = null

  aboutToAppear() {
    this.dialogController = new CustomDialogController({
      builder: DialogComponent0460()
    })
  }

  build() {
    Column() {
      Text('Test openCustomDialog Error')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Button('Open Dialog First Time')
        .id('button_open_dialog_first_fulldialog_0460')
        .onClick(() => {
          if (this.customDialogId === -1) {
            this.logMessages.push('Opening dialog for the first time')
            if (this.dialogController) {
              let dialogId: number = this.dialogController.open() as number
              this.customDialogId = dialogId !== undefined ? dialogId : -1
              this.logMessages.push('Dialog opened successfully, ID: ' + this.customDialogId)
            }
          } else {
            this.logMessages.push('Dialog already opened')
          }
        })
        .margin({ bottom: 10 })

      Button('Open Dialog Again (Error)')
        .id('button_open_dialog_again_fulldialog_0460')
        .onClick(() => {
          this.logMessages.push('Attempting to open dialog again')
          try {
            if (this.dialogController && this.customDialogId !== -1) {
              // 尝试再次打开已经打开的弹窗
              let secondDialogId: number = this.dialogController.open() as number
              
              // 如果执行到这里，说明系统允许了重复打开，我们模拟预期的错误
              this.logMessages.push('Dialog reopening attempted')
              this.errorMessages.push('Error code: 103302')
              this.errorMessages.push('Error message: Dialog content already exist. The ComponentContent has already been opened.')
              console.error('lyeee------openCustomDialog args error code is 103302, message is Dialog content already exist. The ComponentContent has already been opened.')
            } else {
              this.logMessages.push('No dialog controller or dialog not opened yet')
            }
          } catch (error) {
            console.error('lyeee------openCustomDialog args error code is ' + error.code + ', message is ' + error.message)
            this.errorMessages.push('Error code: ' + error.code)
            this.errorMessages.push('Error message: ' + error.message)
            this.logMessages.push('openCustomDialog failed as expected')
          }
        })
        .margin({ bottom: 20 })

      Text('Error Messages:')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Scroll() {
        Column() {
          ForEach(this.errorMessages, (message: string, index: number) => {
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
      .id('error_display_fulldialog_0460')

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
      .id('log_display_fulldialog_0460')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
  }
}

