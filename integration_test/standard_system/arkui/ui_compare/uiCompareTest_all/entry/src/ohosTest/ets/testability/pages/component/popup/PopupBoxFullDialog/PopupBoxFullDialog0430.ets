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
struct DialogComponent0430 {
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
struct PopupBoxFullDialog0430 {
  @State logMessages: string[] = []
  @State errorMessages: string[] = []
  dialogController: CustomDialogController | null = null

  aboutToAppear() {
    this.dialogController = new CustomDialogController({
      builder: DialogComponent0430()
    })
  }

  build() {
    Column() {
      Text('Test closeCustomDialog Error')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Button('Close Unopened Dialog')
        .id('button_close_unopened_dialog_fulldialog_0430')
        .onClick(async () => {
          this.logMessages.push('Attempting to close unopened dialog with invalid ID')
          try {
            // 使用无效的 dialog ID (例如 -1 或 99999) 来模拟关闭未打开的弹窗
            await promptAction.closeCustomDialog(99999)
            this.logMessages.push('closeCustomDialog succeeded (unexpected)')
          } catch (error) {
            console.error('lyeee------closeCustomDialog args error code is ' + error.code + ', message is ' + error.message)
            this.errorMessages.push('Error code: ' + error.code)
            this.errorMessages.push('Error message: ' + error.message)
            this.logMessages.push('closeCustomDialog failed as expected')
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
      .id('error_display_fulldialog_0430')

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
      .id('log_display_fulldialog_0430')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
  }
}

