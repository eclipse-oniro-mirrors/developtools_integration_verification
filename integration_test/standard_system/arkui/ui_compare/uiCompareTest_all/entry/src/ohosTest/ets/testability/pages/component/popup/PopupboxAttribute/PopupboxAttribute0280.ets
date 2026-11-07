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
struct CustomDialogComponent0280 {
  controller: CustomDialogController

  build() {
    Column() {
      Text('CustomDialog')
        .fontSize(20)
        .margin({ top: 10, bottom: 10 })
      
      Text('SLIDE_SWITCH Transition Effect')
        .fontSize(16)
        .margin({ bottom: 10 })
      
      Button('Close')
        .onClick(() => {
          this.controller.close()
        })
        .margin({ bottom: 10 })
    }
    .width('80%')
    .padding(20)
    .transition(TransitionEffect.SLIDE_SWITCH.animation({ duration: 5000 }))
  }
}

@Entry
@Component
struct PopupboxAttribute0280 {
  @State logMessages: string[] = []
  dialogController: CustomDialogController | null = null

  aboutToAppear() {
    this.dialogController = new CustomDialogController({
      builder: CustomDialogComponent0280()
    })
  }

  build() {
    Column() {
      Button('click me')
        .id('button_popupbox_attribute_0280')
        .onClick(() => {
          if (this.dialogController) {
            this.dialogController.open()
            this.logMessages.push('Dialog opened with SLIDE_SWITCH transition')
          }
        })
        .margin({ top: 20, bottom: 20 })

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
      .id('log_display_popupbox_attribute_0280')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
  }
}



