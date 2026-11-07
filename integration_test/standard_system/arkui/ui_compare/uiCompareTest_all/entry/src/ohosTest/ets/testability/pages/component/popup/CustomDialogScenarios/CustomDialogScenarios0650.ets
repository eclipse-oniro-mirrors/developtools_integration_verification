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
struct CustomDialogExampleScenarios10650 {
  controller: CustomDialogController

  build() {
    Column() {
      Text('自定义弹窗1')
        .fontSize(20)
        .margin({ top: 20, bottom: 20 })
      Button('关闭')
        .id('button_close_dialog1_scenarios_0650')
        .onClick(() => {
          this.controller.close()
        })
        .margin({ bottom: 20 })
    }
    .width('100%')
    .padding(20)
    .backgroundColor(Color.White)
    .borderRadius(10)
  }
}

@CustomDialog
struct CustomDialogExampleScenarios20650 {
  controller: CustomDialogController

  build() {
    Column() {
      Text('自定义弹窗2')
        .fontSize(20)
        .margin({ top: 20, bottom: 20 })
      Button('关闭')
        .id('button_close_dialog2_scenarios_0650')
        .onClick(() => {
          this.controller.close()
        })
        .margin({ bottom: 20 })
    }
    .width('41.67%')
    .padding(20)
    .backgroundColor(Color.White)
    .borderRadius(10)
  }
}

@Entry
@Component
struct CustomDialogScenarios0650 {
  @State logMessage: string = ''
  private richEditorController: RichEditorController = new RichEditorController()

  dialogController1: CustomDialogController = new CustomDialogController({
    builder: CustomDialogExampleScenarios10650(),
    autoCancel: true,
    cancel: () => {
      this.logMessage = 'CustomDialog1 Close'
      this.richEditorController.addTextSpan(this.logMessage, {
        style: {
          fontColor: Color.Black,
          fontSize: 16
        }
      })
    }
  })

  dialogController2: CustomDialogController = new CustomDialogController({
    builder: CustomDialogExampleScenarios20650(),
    autoCancel: true,
    cancel: () => {
      this.logMessage = 'CustomDialog2 Close'
      this.richEditorController.addTextSpan(this.logMessage, {
        style: {
          fontColor: Color.Black,
          fontSize: 16
        }
      })
    }
  })

  build() {
    Column() {
      Button('打开弹窗1')
        .id('button_open_dialog1_scenarios_0650')
        .fontSize(20)
        .onClick(() => {
          this.dialogController1.open()
        })
        .margin({ bottom: 20 })

      Button('打开弹窗2')
        .id('button_open_dialog2_scenarios_0650')
        .fontSize(20)
        .onClick(() => {
          this.dialogController2.open()
        })
        .margin({ bottom: 20 })

      RichEditor({ controller: this.richEditorController })
        .id('rich_editor_scenarios_0650')
        .width('90%')
        .height(200)
        .borderWidth(1)
        .borderColor(Color.Gray)
        .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}

