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
struct KeyboardAvoidanceDialog0420 {
  controller: CustomDialogController
  @State inputText: string = ''
  @State dialogHeight: number = 250

  aboutToAppear() {
    // 等待两秒后弹窗高度变为500
    setTimeout(() => {
      this.dialogHeight = 500
    }, 2000)
  }

  build() {
    Column() {
      Text('Keyboard Avoidance Test')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 10 })

      Text('Dialog avoids keyboard and safe area')
        .fontSize(14)
        .margin({ bottom: 10 })

      TextArea({ placeholder: 'Click to input text', text: this.inputText })
        .id('text_area_fulldialog_0420')
        .width('90%')
        .height(100)
        .margin({ bottom: 10 })
        .onChange((value: string) => {
          this.inputText = value
        })

      Text(`Input: ${this.inputText}`)
        .id('text_display_fulldialog_0420')
        .fontSize(14)
        .margin({ bottom: 10 })

      Text(`Dialog Height: ${this.dialogHeight}`)
        .fontSize(14)
        .margin({ bottom: 10 })

      Button('Close Dialog')
        .id('button_close_dialog_in_component_fulldialog_0420')
        .onClick(() => {
          this.controller.close()
        })
        .margin({ bottom: 10 })
    }
    .width('90%')
    .height(this.dialogHeight)
    .padding(20)
    .backgroundColor(Color.White)
  }
}

@Entry
@Component
struct PopupBoxFullDialog0420 {
  @State logMessages: string[] = []
  dialogController: CustomDialogController | null = null

  aboutToAppear() {
    // 创建不依赖UI组件的自定义弹窗，不设置offset
    this.dialogController = new CustomDialogController({
      builder: KeyboardAvoidanceDialog0420(),
      isModal: true,
      autoCancel: false,
      customStyle: true,
      onDidAppear: () => {
        this.logMessages.push('Dialog opened')
        console.log('Dialog opened')
      },
      onDidDisappear: () => {
        this.logMessages.push('Dialog closed')
        console.log('Dialog closed')
      }
    })
  }

  build() {
    Column() {
      Text('Test Keyboard Avoidance')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Text('Custom dialog avoids keyboard and safe area')
        .fontSize(16)
        .margin({ bottom: 20 })

      Row() {
        Button('Open')
          .id('button_open_fulldialog_0420')
          .onClick(() => {
            if (this.dialogController) {
              this.dialogController.open()
              this.logMessages.push('Open button clicked, dialog requested')
            }
          })
          .margin({ right: 10 })

        Button('Close')
          .id('button_close_fulldialog_0420')
          .onClick(() => {
            if (this.dialogController) {
              this.dialogController.close()
              this.logMessages.push('Close button clicked')
            }
          })
      }
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
      .id('log_display_fulldialog_0420')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
  }
}

