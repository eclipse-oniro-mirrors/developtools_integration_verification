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
struct FullDialogComponent0320 {
  controller: CustomDialogController

  build() {
    Column() {
      Text('Full Screen Dialog')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Text('PlayMode Reverse Transition')
        .fontSize(18)
        .margin({ bottom: 20 })

      Text('Animation plays in reverse')
        .fontSize(16)
        .margin({ bottom: 20 })

      Button('Close Dialog')
        .id('button_close_dialog_in_component_fulldialog_0320')
        .onClick(() => {
          this.controller.close()
        })
        .margin({ bottom: 20 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
    .justifyContent(FlexAlign.Center)
    .transition(TransitionEffect.OPACITY.animation({ duration: 5000, playMode: PlayMode.Reverse }))
  }
}

@Entry
@Component
struct PopupBoxFullDialog0320 {
  @State logMessages: string[] = []
  dialogController: CustomDialogController | null = null

  aboutToAppear() {
    this.dialogController = new CustomDialogController({
      builder: FullDialogComponent0320(),
      isModal: true,
      autoCancel: true,
      customStyle: true
    })
  }

  build() {
    Column() {
      Text('Full Dialog PlayMode Reverse Test')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Button('Open')
        .id('button_open_fulldialog_0320')
        .onClick(() => {
          if (this.dialogController) {
            this.dialogController.open()
            this.logMessages.push('Full dialog opened with playMode: Reverse')
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
      .id('log_display_fulldialog_0320')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
  }
}

