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
struct CustomDialogComponent0180 {
  controller: CustomDialogController
  openSecondDialog: () => void = () => {}

  build() {
    Column() {
      Text('CustomDialog 1')
        .fontSize(20)
        .margin({ top: 10, bottom: 10 })
      
      Button('打开第二个弹窗')
        .id('button_open_second_dialog_0180')
        .onClick(() => {
          this.openSecondDialog()
        })
        .margin({ bottom: 10 })
      
      Button('Close')
        .id('button_close_first_dialog_0180')
        .onClick(() => {
          this.controller.close()
        })
        .margin({ bottom: 10 })
    }
    .width('80%')
    .padding(20)
  }
}

@CustomDialog
struct CustomDialogComponent2 {
  controller: CustomDialogController

  build() {
    Column() {
      Text('CustomDialog 2')
        .fontSize(20)
        .margin({ top: 10, bottom: 10 })
      
      Button('关闭第二个弹窗')
        .id('button_close_second_dialog_0180')
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
struct PopupboxAttribute0180 {
  @State logMessages: string[] = []
  dialogController1: CustomDialogController | null = null
  dialogController2: CustomDialogController | null = null

  aboutToAppear() {
    this.dialogController2 = new CustomDialogController({
      builder: CustomDialogComponent2(),
      isModal: true,
      autoCancel: false,
      onDidAppear: () => {
        console.log('dialog2 onDidAppear')
        this.logMessages.push('dialog2 onDidAppear')
      },
      onDidDisappear: () => {
        console.log('dialog2 onDidDisappear')
        this.logMessages.push('dialog2 onDidDisappear')
      },
      onWillAppear: () => {
        console.log('dialog2 onWillAppear')
        this.logMessages.push('dialog2 onWillAppear')
      },
      onWillDisappear: () => {
        console.log('dialog2 onWillDisappear')
        this.logMessages.push('dialog2 onWillDisappear')
      }
    })

    this.dialogController1 = new CustomDialogController({
      builder: CustomDialogComponent0180({
        openSecondDialog: () => {
          if (this.dialogController2) {
            this.dialogController2.open()
          }
        }
      }),
      isModal: true,
      autoCancel: false,
      onDidAppear: () => {
        console.log('dialog onDidAppear')
        this.logMessages.push('dialog onDidAppear')
      },
      onDidDisappear: () => {
        console.log('dialog onDidDisappear')
        this.logMessages.push('dialog onDidDisappear')
      },
      onWillAppear: () => {
        console.log('dialog onWillAppear')
        this.logMessages.push('dialog onWillAppear')
      },
      onWillDisappear: () => {
        console.log('dialog onWillDisappear')
        this.logMessages.push('dialog onWillDisappear')
      }
    })
  }

  build() {
    Column() {
      Button('click me')
        .id('button_popupbox_attribute_0180')
        .onClick(() => {
          if (this.dialogController1) {
            this.dialogController1.open()
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
          })
        }
      }
      .width('90%')
      .height('60%')
      .padding(10)
      .border({ width: 1, color: Color.Gray })
      .id('log_display_popupbox_attribute_0180')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
  }
}



