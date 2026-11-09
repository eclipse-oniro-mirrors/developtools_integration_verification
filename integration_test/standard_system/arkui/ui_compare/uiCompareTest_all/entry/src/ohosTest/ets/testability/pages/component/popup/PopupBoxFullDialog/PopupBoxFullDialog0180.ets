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
struct FullDialogComponent10180 {
  controller: CustomDialogController
  getUpdateFlag: () => number = () => 0

  build() {
    Column() {
      Text('Full Screen Dialog 1')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Text('First Dialog')
        .fontSize(18)
        .margin({ bottom: 20 })

      Text(`Update Count: ${this.getUpdateFlag()}`)
        .fontSize(16)
        .margin({ bottom: 20 })
        .id('text_update_count_dialog1_fulldialog_0180')

      Button('Close Dialog 1')
        .id('button_close_dialog1_in_component_fulldialog_0180')
        .onClick(() => {
          this.controller.close()
        })
        .margin({ bottom: 20 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
    .justifyContent(FlexAlign.Center)
  }
}

@CustomDialog
struct FullDialogComponent20180 {
  controller: CustomDialogController
  getUpdateFlag: () => number = () => 0

  build() {
    Column() {
      Text('Full Screen Dialog 2')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Text('Second Dialog')
        .fontSize(18)
        .margin({ bottom: 20 })

      Text(`Update Count: ${this.getUpdateFlag()}`)
        .fontSize(16)
        .margin({ bottom: 20 })
        .id('text_update_count_dialog2_fulldialog_0180')

      Button('Close Dialog 2')
        .id('button_close_dialog2_in_component_fulldialog_0180')
        .onClick(() => {
          this.controller.close()
        })
        .margin({ bottom: 20 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Blue)
    .justifyContent(FlexAlign.Center)
  }
}

@Entry
@Component
struct PopupBoxFullDialog0180 {
  @State logMessages: string[] = []
  @State updateFlag1: number = 0
  @State updateFlag2: number = 0
  dialogController1: CustomDialogController | null = null
  dialogController2: CustomDialogController | null = null

  aboutToAppear() {
    // 第一个弹窗
    this.dialogController1 = new CustomDialogController({
      builder: FullDialogComponent10180({
        getUpdateFlag: () => {
          return this.updateFlag1
        }
      }),
      isModal: true,
      autoCancel: false,
      customStyle: true,
      onWillAppear: () => {
        this.logMessages.push('onWillAppear1')
        console.log('onWillAppear1')
      },
      onDidAppear: () => {
        this.logMessages.push('onDidAppear1')
        console.log('onDidAppear1')
      },
      onWillDisappear: () => {
        this.logMessages.push('onWillDisappear1')
        console.log('onWillDisappear1')
      },
      onDidDisappear: () => {
        this.logMessages.push('onDidDisappear1')
        console.log('onDidDisappear1')
      }
    })

    // 第二个弹窗
    this.dialogController2 = new CustomDialogController({
      builder: FullDialogComponent20180({
        getUpdateFlag: () => {
          return this.updateFlag2
        }
      }),
      isModal: true,
      autoCancel: false,
      customStyle: true,
      onWillAppear: () => {
        this.logMessages.push('onWillAppear2')
        console.log('onWillAppear2')
      },
      onDidAppear: () => {
        this.logMessages.push('onDidAppear2')
        console.log('onDidAppear2')
      },
      onWillDisappear: () => {
        this.logMessages.push('onWillDisappear2')
        console.log('onWillDisappear2')
      },
      onDidDisappear: () => {
        this.logMessages.push('onDidDisappear2')
        console.log('onDidDisappear2')
      }
    })
  }

  build() {
    Column() {
      Text('Two Dialogs Lifecycle Test')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Text('Dialog 1 Controls:')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Row() {
        Button('Open1')
          .id('button_open1_fulldialog_0180')
          .onClick(() => {
            if (this.dialogController1) {
              this.dialogController1.open()
              this.logMessages.push('Open1 button clicked')
            }
          })
          .margin({ right: 10 })

        Button('Close1')
          .id('button_close1_fulldialog_0180')
          .onClick(() => {
            if (this.dialogController1) {
              this.dialogController1.close()
              this.logMessages.push('Close1 button clicked')
            }
          })
          .margin({ right: 10 })

        Button('Update1')
          .id('button_update1_fulldialog_0180')
          .onClick(() => {
            this.updateFlag1++
            this.logMessages.push(`Update1 button clicked: ${this.updateFlag1}`)
          })
      }
      .margin({ bottom: 20 })

      Text('Dialog 2 Controls:')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Row() {
        Button('Open2')
          .id('button_open2_fulldialog_0180')
          .onClick(() => {
            if (this.dialogController2) {
              this.dialogController2.open()
              this.logMessages.push('Open2 button clicked')
            }
          })
          .margin({ right: 10 })

        Button('Close2')
          .id('button_close2_fulldialog_0180')
          .onClick(() => {
            if (this.dialogController2) {
              this.dialogController2.close()
              this.logMessages.push('Close2 button clicked')
            }
          })
          .margin({ right: 10 })

        Button('Update2')
          .id('button_update2_fulldialog_0180')
          .onClick(() => {
            this.updateFlag2++
            this.logMessages.push(`Update2 button clicked: ${this.updateFlag2}`)
          })
      }
      .margin({ bottom: 20 })

      Text('Log Messages (Lifecycle Callbacks):')
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
      .height('40%')
      .padding(10)
      .border({ width: 1, color: Color.Gray })
      .id('log_display_fulldialog_0180')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
  }
}

