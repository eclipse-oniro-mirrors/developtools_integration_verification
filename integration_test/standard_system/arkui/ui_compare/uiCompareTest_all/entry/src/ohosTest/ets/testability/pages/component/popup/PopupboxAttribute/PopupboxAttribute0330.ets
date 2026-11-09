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
struct CustomDialogComponentB0330 {
  controller: CustomDialogController

  build() {
    Column() {
      Text('CustomDialog from Page B')
        .fontSize(20)
        .margin({ top: 10, bottom: 10 })

      Text('This dialog is opened from Page A with UIContext of Page B')
        .fontSize(14)
        .margin({ bottom: 10 })
        .textAlign(TextAlign.Center)

      Button('Close Dialog')
        .id('button_close_dialog_0330')
        .onClick(() => {
          this.controller.close()
        })
        .margin({ bottom: 10 })
        .focusable(true)
    }
    .width('80%')
    .padding(20)
  }
}

@Entry
@Component
struct PopupboxAttribute0330 {
  @State logMessages: string[] = []
  @State focusMessages: string[] = []
  @State customDialogId: number = 0
  dialogController: CustomDialogController | null = null

  aboutToAppear() {
    this.dialogController = new CustomDialogController({
      builder: CustomDialogComponentB0330(),
      onDidAppear: () => {
        console.log('Dialog onDidAppear - dialog gets focus')
        this.logMessages.push('Dialog onDidAppear - dialog gets focus')
        this.focusMessages.push('Dialog opened and gained focus')
      },
      onDidDisappear: () => {
        console.log('Dialog onDidDisappear')
        this.logMessages.push('Dialog onDidDisappear')
        this.focusMessages.push('Dialog closed, focus returns to open button')
      }
    })
  }

  build() {
    Column() {
      Text('Page A - Test UIContext Dialog')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Button('Open Dialog (Page B UIContext)')
        .id('button_open_dialog_0330')
        .onClick(() => {
          if (this.dialogController) {
            let dialogId: number = this.dialogController.open() as number
            this.customDialogId = dialogId !== undefined ? dialogId : 0
            this.logMessages.push('Dialog opened from Page A')
          }
        })
        .margin({ bottom: 20 })
        .focusable(true)
        .onFocus(() => {
          console.log('Open button gained focus')
          this.focusMessages.push('Open button gained focus')
        })
        .onBlur(() => {
          console.log('Open button lost focus')
          this.focusMessages.push('Open button lost focus')
        })

      Text('Focus Messages:')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Scroll() {
        Column() {
          ForEach(this.focusMessages, (message: string, index: number) => {
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
      .id('focus_display_0330')
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
      .id('log_display_popupbox_attribute_0330')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
  }
}

