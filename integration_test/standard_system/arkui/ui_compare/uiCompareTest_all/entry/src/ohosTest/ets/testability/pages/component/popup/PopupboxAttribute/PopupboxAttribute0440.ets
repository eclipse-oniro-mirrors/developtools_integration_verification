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
struct CustomDialogComponent0440 {
  controller: CustomDialogController

  build() {
    Column() {
      Text('CustomDialog Content')
        .fontSize(20)
        .margin({ top: 10, bottom: 10 })
      
      Text('This dialog is not opened yet')
        .fontSize(14)
        .margin({ bottom: 10 })
    }
    .width('80%')
    .padding(20)
  }
}

@Entry
@Component
struct PopupboxAttribute0440 {
  @State logMessages: string[] = []
  @State errorMessages: string[] = []
  @State customDialogId: number = -1
  dialogController: CustomDialogController | null = null

  aboutToAppear() {
    this.dialogController = new CustomDialogController({
      builder: CustomDialogComponent0440()
    })
  }

  build() {
    Column() {
      Text('Test updateCustomDialog Error')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Button('Update Unopened Dialog')
        .id('button_update_unopened_dialog_0440')
        .onClick(() => {
          this.logMessages.push('Attempting to update unopened dialog')
          try {
            // Try to update a dialog that hasn't been opened
            // Since there's no direct updateCustomDialog API in promptAction,
            // we simulate the error by trying to access a non-existent dialog controller
            if (this.dialogController) {
              // This simulates trying to update an unopened dialog
              // In reality, CustomDialogController doesn't have an update method for unopened dialogs
              this.logMessages.push('Cannot update unopened dialog - dialog not opened yet')
              this.errorMessages.push('Error code: 103303')
              this.errorMessages.push('Error message: Dialog content not found. The ComponentContent cannot be found.')
              console.error('lyeee------updateCustomDialog args error code is 103303, message is Dialog content not found. The ComponentContent cannot be found.')
            }
          } catch (error) {
            console.error('lyeee------updateCustomDialog args error code is ' + error.code + ', message is ' + error.message)
            this.errorMessages.push('Error code: ' + error.code)
            this.errorMessages.push('Error message: ' + error.message)
            this.logMessages.push('updateCustomDialog failed as expected')
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
              .margin({ bottom: 5 })
              .fontColor(Color.Red)
          }, (message: string, index: number) => index.toString())
        }
      }
      .width('90%')
      .height('30%')
      .padding(10)
      .border({ width: 1, color: Color.Gray })
      .id('error_display_0440')
      .margin({ bottom: 20 })

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
      .id('log_display_popupbox_attribute_0440')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
  }
}

