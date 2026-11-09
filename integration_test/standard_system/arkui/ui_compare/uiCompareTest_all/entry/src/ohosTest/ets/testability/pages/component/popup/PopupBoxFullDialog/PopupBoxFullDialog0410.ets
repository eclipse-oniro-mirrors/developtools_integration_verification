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
struct GlobalCustomDialog0410 {
  controller: CustomDialogController
  @State focusMessages: string[] = []

  build() {
    Column() {
      Text('Global Custom Dialog')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Text('This is a global custom dialog not dependent on UI components')
        .fontSize(14)
        .margin({ bottom: 20 })

      Button('Close Dialog')
        .id('button_close_dialog_fulldialog_0410')
        .focusable(true)
        .onFocus(() => {
          this.focusMessages.push('Dialog close button gained focus')
          console.log('Dialog close button gained focus')
        })
        .onBlur(() => {
          this.focusMessages.push('Dialog close button lost focus')
          console.log('Dialog close button lost focus')
        })
        .onClick(() => {
          this.controller.close()
        })
        .margin({ bottom: 20 })

      Text('Focus Messages (Dialog):')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Scroll() {
        Column() {
          ForEach(this.focusMessages, (message: string, index: number) => {
            Text(`${index + 1}. ${message}`)
              .fontSize(14)
              .margin({ bottom: 5 })
          }, (message: string, index: number) => index.toString())
        }
      }
      .width('90%')
      .height('20%')
      .padding(10)
      .border({ width: 1, color: Color.Gray })
      .id('focus_display_dialog_fulldialog_0410')
    }
    .width('80%')
    .padding(20)
    .backgroundColor(Color.White)
  }
}

@Entry
@Component
struct PopupBoxFullDialog0410 {
  @State logMessages: string[] = []
  @State focusMessages: string[] = []
  dialogController: CustomDialogController | null = null

  aboutToAppear() {
    // 创建不依赖UI组件的全局自定义弹窗
    this.dialogController = new CustomDialogController({
      builder: GlobalCustomDialog0410(),
      isModal: true,
      autoCancel: true,
      onDidAppear: () => {
        this.logMessages.push('Dialog opened and gained focus immediately')
        this.focusMessages.push('Dialog opened and gained focus immediately')
        console.log('Dialog opened and gained focus immediately')
      },
      onDidDisappear: () => {
        this.logMessages.push('Dialog closed, focus should return to open button')
        this.focusMessages.push('Dialog closed, focus should return to open button')
        console.log('Dialog closed, focus should return to open button')
      }
    })
  }

  build() {
    Column() {
      Text('Test Global Custom Dialog Focus')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Text('Global custom dialog not dependent on UI components')
        .fontSize(16)
        .margin({ bottom: 20 })

      Button('Open Global Custom Dialog')
        .id('button_open_dialog_fulldialog_0410')
        .focusable(true)
        .onFocus(() => {
          this.focusMessages.push('Open button gained focus')
          console.log('Open button gained focus')
        })
        .onBlur(() => {
          this.focusMessages.push('Open button lost focus')
          console.log('Open button lost focus')
        })
        .onClick(() => {
          if (this.dialogController) {
            this.dialogController.open()
            this.logMessages.push('Open button clicked, dialog requested')
          }
        })
        .margin({ bottom: 20 })

      Text('Focus Messages (Page):')
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
      .id('focus_display_fulldialog_0410')

      Text('Log Messages:')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

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
      .height('20%')
      .padding(10)
      .border({ width: 1, color: Color.Gray })
      .id('log_display_fulldialog_0410')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
  }
}

