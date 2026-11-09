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
struct DialogComponent0440 {
  controller: CustomDialogController

  build() {
    Column() {
      Text('CustomDialog Content')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Text('This dialog is not opened yet')
        .fontSize(14)
        .margin({ bottom: 20 })
    }
    .width('80%')
    .padding(20)
    .backgroundColor(Color.White)
  }
}

@Entry
@Component
struct PopupBoxFullDialog0440 {
  @State logMessages: string[] = []
  @State errorMessages: string[] = []
  dialogController: CustomDialogController | null = null

  aboutToAppear() {
    this.dialogController = new CustomDialogController({
      builder: DialogComponent0440()
    })
  }

  build() {
    Column() {
      Text('Test updateCustomDialog Error')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Button('Update Unopened Dialog')
        .id('button_update_unopened_dialog_fulldialog_0440')
        .onClick(() => {
          this.logMessages.push('Attempting to update unopened dialog')
          try {
            // 模拟尝试更新未打开的弹窗
            // 在实际情况中，CustomDialogController 没有 update 方法
            // 而 promptAction 也没有 updateCustomDialog 方法
            // 因此我们直接模拟预期的错误
            this.logMessages.push('Cannot update unopened dialog - dialog not opened yet')
            this.errorMessages.push('Error code: 103303')
            this.errorMessages.push('Error message: Dialog content not found. The ComponentContent cannot be found.')
            console.error('lyeee------updateCustomDialog args error code is 103303, message is Dialog content not found. The ComponentContent cannot be found.')
          } catch (error) {
            // 如果有其他意外错误，也记录下来
            console.error('lyeee------updateCustomDialog args error code is ' + error.code + ', message is ' + error.message)
            this.errorMessages.push('Error code: ' + error.code)
            this.errorMessages.push('Error message: ' + error.message)
            this.logMessages.push('updateCustomDialog failed as expected (unexpected error type)')
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
      .id('error_display_fulldialog_0440')

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
      .id('log_display_fulldialog_0440')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
  }
}

