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
struct DialogComponentB0330 {
  controller: CustomDialogController
  @State focusMessages: string[] = []

  build() {
    Column() {
      Text('Dialog from Page B UIContext')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Text('This dialog is opened from Page A with UIContext of Page B')
        .fontSize(14)
        .margin({ bottom: 20 })

      Button('Close Dialog')
        .id('button_close_dialog_fulldialog_0330')
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
      .height('30%')
      .padding(10)
      .border({ width: 1, color: Color.Gray })
      .id('focus_display_dialog_fulldialog_0330')
    }
    .width('80%')
    .padding(20)
    .backgroundColor(Color.White)
  }
}

@Entry
@Component
struct PopupBoxFullDialog0330 {
  @State logMessages: string[] = []
  @State focusMessages: string[] = []
  dialogController: CustomDialogController | null = null

  aboutToAppear() {
    // A页面创建使用B页面UIContext的弹窗
    this.dialogController = new CustomDialogController({
      builder: DialogComponentB0330(),
      alignment: DialogAlignment.Center,
      isModal: true,
      autoCancel: true,
      onDidAppear: () => {
        this.logMessages.push('Dialog opened and gained focus instantly')
        this.focusMessages.push('Dialog opened and gained focus instantly')
        console.log('Dialog opened and gained focus instantly')
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
      Text('Page A - UIContext Dialog Focus Test')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Text('Test: Page A opens dialog with Page B UIContext')
        .fontSize(16)
        .margin({ bottom: 20 })

      Button('Open Dialog (Page B UIContext)')
        .id('button_open_dialog_fulldialog_0330')
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

      Text('Focus Messages (Page A):')
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
      .id('focus_display_fulldialog_0330')

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
      .id('log_display_fulldialog_0330')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
  }
}

