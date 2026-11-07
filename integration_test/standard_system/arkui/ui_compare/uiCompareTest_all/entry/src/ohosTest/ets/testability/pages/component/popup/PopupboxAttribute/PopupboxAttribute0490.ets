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
struct CustomDialogComponent0490 {
  controller: CustomDialogController
  openDialogB: () => void = () => {}

  build() {
    Column() {
      Text('CustomDialog A')
        .fontSize(20)
        .margin({ top: 10, bottom: 10 })
      
      Button('打开第二个弹窗')
        .id('button_open_dialog_b_0490')
        .onClick(() => {
          this.openDialogB()
        })
        .margin({ bottom: 10 })
      
      Button('Close A')
        .id('button_close_dialog_a_0490')
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
struct CustomDialogComponentB {
  controller: CustomDialogController
  closeDialogA: () => void = () => {}

  build() {
    Column() {
      Text('CustomDialog B')
        .fontSize(20)
        .margin({ top: 10, bottom: 10 })
      
      Button('关闭第一个弹窗')
        .id('button_close_dialog_a_from_b_0490')
        .onClick(() => {
          this.closeDialogA()
        })
        .margin({ bottom: 10 })
      
      Button('Close B')
        .id('button_close_dialog_b_0490')
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
struct PopupboxAttribute0490 {
  @State logMessages: string[] = []
  dialogControllerA: CustomDialogController | null = null
  dialogControllerB: CustomDialogController | null = null

  aboutToAppear() {
    this.dialogControllerB = new CustomDialogController({
      builder: CustomDialogComponentB({
        closeDialogA: () => {
          if (this.dialogControllerA) {
            this.dialogControllerA.close()
            this.logMessages.push('Dialog A closed from Dialog B')
          }
        }
      })
    })

    this.dialogControllerA = new CustomDialogController({
      builder: CustomDialogComponent0490({
        openDialogB: () => {
          if (this.dialogControllerB) {
            this.dialogControllerB.open()
            this.logMessages.push('Dialog B opened from Dialog A')
          }
        }
      })
    })
  }

  build() {
    Column() {
      Button('click me')
        .id('button_popupbox_attribute_0490')
        .onClick(() => {
          if (this.dialogControllerA) {
            this.dialogControllerA.open()
            this.logMessages.push('Dialog A opened')
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
      .id('log_display_popupbox_attribute_0490')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
  }
}



