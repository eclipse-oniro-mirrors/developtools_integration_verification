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
struct DialogComponentB0490 {
  controller: CustomDialogController
  onCloseDialogA: () => void = () => {}
  @State focusMessages: string[] = []

  build() {
    Column() {
      Text('Dialog B')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Text('This is Dialog B')
        .fontSize(14)
        .margin({ bottom: 20 })

      Button('CloseA')
        .id('button_close_dialog_a_fulldialog_0490')
        .focusable(true)
        .onFocus(() => {
          this.focusMessages.push('CloseA button gained focus')
          console.log('CloseA button gained focus')
        })
        .onBlur(() => {
          this.focusMessages.push('CloseA button lost focus')
          console.log('CloseA button lost focus')
        })
        .onClick(() => {
          this.onCloseDialogA()
        })
        .margin({ bottom: 10 })

      Button('CloseB')
        .id('button_close_dialog_b_fulldialog_0490')
        .focusable(true)
        .onFocus(() => {
          this.focusMessages.push('CloseB button gained focus')
          console.log('CloseB button gained focus')
        })
        .onBlur(() => {
          this.focusMessages.push('CloseB button lost focus')
          console.log('CloseB button lost focus')
        })
        .onClick(() => {
          this.controller.close()
        })
        .margin({ bottom: 20 })

      Text('Focus Messages (Dialog B):')
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
      .id('focus_display_dialog_b_fulldialog_0490')
    }
    .width('80%')
    .padding(20)
    .backgroundColor(Color.White)
  }
}

@CustomDialog
struct DialogComponentA0490 {
  controller: CustomDialogController
  onOpenDialogB: () => void = () => {}
  @State focusMessages: string[] = []

  build() {
    Column() {
      Text('Dialog A')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Text('This is Dialog A')
        .fontSize(14)
        .margin({ bottom: 20 })

      Button('OpenB')
        .id('button_open_dialog_b_fulldialog_0490')
        .focusable(true)
        .onFocus(() => {
          this.focusMessages.push('OpenB button gained focus')
          console.log('OpenB button gained focus')
        })
        .onBlur(() => {
          this.focusMessages.push('OpenB button lost focus')
          console.log('OpenB button lost focus')
        })
        .onClick(() => {
          this.onOpenDialogB()
        })
        .margin({ bottom: 20 })

      Text('Focus Messages (Dialog A):')
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
      .id('focus_display_dialog_a_fulldialog_0490')
    }
    .width('80%')
    .padding(20)
    .backgroundColor(Color.White)
  }
}

@Entry
@Component
struct PopupBoxFullDialog0490 {
  @State logMessages: string[] = []
  @State focusMessages: string[] = []
  dialogControllerA: CustomDialogController | null = null
  dialogControllerB: CustomDialogController | null = null

  aboutToAppear() {
    // 创建弹窗B
    this.dialogControllerB = new CustomDialogController({
      builder: DialogComponentB0490({
        onCloseDialogA: () => {
          if (this.dialogControllerA) {
            this.dialogControllerA.close()
            this.logMessages.push('Dialog A closed from Dialog B')
            this.focusMessages.push('Dialog A closed, focus should stay on CloseA button in Dialog B')
          }
        }
      }),
      isModal: true,
      autoCancel: false,
      onDidAppear: () => {
        this.logMessages.push('Dialog B opened and gained focus immediately')
        this.focusMessages.push('Dialog B opened and gained focus immediately')
        console.log('Dialog B opened and gained focus immediately')
      },
      onDidDisappear: () => {
        this.logMessages.push('Dialog B closed, focus should return to OpenA button')
        this.focusMessages.push('Dialog B closed, focus should return to OpenA button')
        console.log('Dialog B closed, focus should return to OpenA button')
      }
    })

    // 创建弹窗A
    this.dialogControllerA = new CustomDialogController({
      builder: DialogComponentA0490({
        onOpenDialogB: () => {
          if (this.dialogControllerB) {
            this.dialogControllerB.open()
            this.logMessages.push('Dialog B opened from Dialog A')
          }
        }
      }),
      isModal: true,
      autoCancel: false,
      onDidAppear: () => {
        this.logMessages.push('Dialog A opened and gained focus immediately')
        this.focusMessages.push('Dialog A opened and gained focus immediately')
        console.log('Dialog A opened and gained focus immediately')
      },
      onDidDisappear: () => {
        this.logMessages.push('Dialog A closed')
        this.focusMessages.push('Dialog A closed')
        console.log('Dialog A closed')
      }
    })
  }

  build() {
    Column() {
      Text('Test Dialog A & B Focus')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Text('Open two dialogs and test focus management')
        .fontSize(16)
        .margin({ bottom: 20 })

      Button('OpenA')
        .id('button_open_dialog_a_fulldialog_0490')
        .focusable(true)
        .onFocus(() => {
          this.focusMessages.push('OpenA button gained focus')
          console.log('OpenA button gained focus')
        })
        .onBlur(() => {
          this.focusMessages.push('OpenA button lost focus')
          console.log('OpenA button lost focus')
        })
        .onClick(() => {
          if (this.dialogControllerA) {
            this.dialogControllerA.open()
            this.logMessages.push('OpenA button clicked, Dialog A requested')
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
      .id('focus_display_fulldialog_0490')

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
      .id('log_display_fulldialog_0490')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
  }
}

