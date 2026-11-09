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
struct FullDialogComponent0290 {
  controller: CustomDialogController
  getUpdateFlag: () => number = () => 0

  build() {
    Column() {
      Text('Full Screen Dialog')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Text('Translate Transition Effect')
        .fontSize(18)
        .margin({ bottom: 20 })

      Text('translate({ x: 10, y: 10 })')
        .fontSize(16)
        .margin({ bottom: 20 })

      Text(`Update Count: ${this.getUpdateFlag()}`)
        .fontSize(16)
        .margin({ bottom: 20 })
        .id('text_update_count_fulldialog_0290')

      Button('Close Dialog')
        .id('button_close_dialog_in_component_fulldialog_0290')
        .onClick(() => {
          this.controller.close()
        })
        .margin({ bottom: 20 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
    .justifyContent(FlexAlign.Center)
    .transition(TransitionEffect.translate({ x: 10, y: 10 }).animation({ duration: 5000 }))
  }
}

@Entry
@Component
struct PopupBoxFullDialog0290 {
  @State logMessages: string[] = []
  @State updateFlag: number = 0
  dialogController: CustomDialogController | null = null

  aboutToAppear() {
    this.dialogController = new CustomDialogController({
      builder: FullDialogComponent0290({
        getUpdateFlag: () => {
          return this.updateFlag
        }
      }),
      isModal: true,
      autoCancel: true,
      customStyle: true
    })
  }

  build() {
    Column() {
      Text('Full Dialog Translate Test')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Row() {
        Button('Open')
          .id('button_open_fulldialog_0290')
          .onClick(() => {
            if (this.dialogController) {
              this.dialogController.open()
              this.logMessages.push('Full dialog opened with translate({ x: 10, y: 10 }) transition')
            }
          })
          .margin({ right: 10 })

        Button('Close')
          .id('button_close_fulldialog_0290')
          .onClick(() => {
            if (this.dialogController) {
              this.dialogController.close()
              this.logMessages.push('Full dialog closed')
            }
          })
          .margin({ right: 10 })

        Button('Update')
          .id('button_update_fulldialog_0290')
          .onClick(() => {
            this.updateFlag++
            this.logMessages.push(`Full dialog updated: ${this.updateFlag}`)
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
      .id('log_display_fulldialog_0290')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
  }
}

