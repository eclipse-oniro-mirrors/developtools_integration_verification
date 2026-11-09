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
struct CustomDialogComponent0420 {
  controller: CustomDialogController
  @State inputText: string = ''

  build() {
    Column() {
      Text('CustomDialog')
        .fontSize(20)
        .margin({ top: 10, bottom: 10 })

      Text('Test Keyboard Avoidance')
        .fontSize(16)
        .margin({ bottom: 10 })

      TextInput({ placeholder: 'Click to input text' })
        .id('text_input_0420')
        .width('100%')
        .margin({ bottom: 10 })
        .onChange((value: string) => {
          this.inputText = value
        })

      Text(`Input: ${this.inputText}`)
        .fontSize(14)
        .margin({ bottom: 10 })
        .id('text_display_0420')

      Button('Close')
        .onClick(() => {
          this.controller.close()
        })
        .margin({ bottom: 10 })
    }
    .width('80%')
    .padding(20)
  }
}

@Entry
@Component
struct PopupboxAttribute0420 {
  @State logMessages: string[] = []
  dialogController: CustomDialogController | null = null

  aboutToAppear() {
    this.dialogController = new CustomDialogController({
      builder: CustomDialogComponent0420(),
      onDidAppear: () => {
        console.log('Dialog opened')
        this.logMessages.push('Dialog opened')
      },
      onDidDisappear: () => {
        console.log('Dialog closed')
        this.logMessages.push('Dialog closed')
      }
    })
  }

  build() {
    Column() {
      Text('Test Keyboard Avoidance')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Button('click me')
        .id('button_popupbox_attribute_0420')
        .onClick(() => {
          if (this.dialogController) {
            this.dialogController.open()
            this.logMessages.push('Opening dialog')
          }
        })
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
      .height('60%')
      .padding(10)
      .border({ width: 1, color: Color.Gray })
      .id('log_display_popupbox_attribute_0420')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
  }
}

