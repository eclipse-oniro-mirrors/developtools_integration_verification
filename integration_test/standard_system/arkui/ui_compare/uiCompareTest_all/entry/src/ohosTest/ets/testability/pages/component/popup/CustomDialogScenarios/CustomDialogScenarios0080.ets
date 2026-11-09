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
struct CustomDialogExampleScenarios0080 {
  controller: CustomDialogController
  @State confirmStatus: string = ''

  build() {
    Column() {
      Text('这是自定义对话框')
        .fontSize(20)
        .margin({ top: 20, bottom: 20 })
      
      Text(this.confirmStatus)
        .id('text_confirm_status_scenarios_0080')
        .fontSize(16)
        .fontColor(Color.Green)
        .margin({ bottom: 10 })
      
      Button('确认')
        .id('button_confirm_dialog_scenarios_0080')
        .onClick(() => {
          this.confirmStatus = '确认成功'
          this.controller.close()
        })
        .margin({ bottom: 10 })
      
      Button('取消')
        .id('button_cancel_dialog_scenarios_0080')
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

@Entry
@Component
struct CustomDialogScenarios0080 {
  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialogExampleScenarios0080()
  })

  build() {
    Column() {
      Button('打开对话框')
        .id('button_open_dialog_scenarios_0080')
        .fontSize(20)
        .onClick(() => {
          this.dialogController.open()
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}

