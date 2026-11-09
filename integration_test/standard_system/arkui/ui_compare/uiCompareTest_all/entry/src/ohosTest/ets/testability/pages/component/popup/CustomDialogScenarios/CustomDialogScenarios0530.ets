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
struct CustomDialogExampleScenarios30530 {
  controller: CustomDialogController

  build() {
    Column() {
      Text('第三层弹窗')
        .fontSize(20)
        .margin({ top: 20, bottom: 20 })
      Button('关闭')
        .id('button_close_dialog3_scenarios_0530')
        .onClick(() => {
          this.controller.close()
        })
        .margin({ bottom: 20 })
    }
    .width('100%')
    .padding(20)
    .backgroundColor(Color.Pink)
    .borderRadius(10)
  }
}

@CustomDialog
struct CustomDialogExampleScenarios20530 {
  controller: CustomDialogController
  dialogController3: CustomDialogController = new CustomDialogController({
    builder: CustomDialogExampleScenarios30530(),
    autoCancel: true
  })

  build() {
    Column() {
      Text('第二层弹窗')
        .fontSize(20)
        .margin({ top: 20, bottom: 20 })
      Button('打开第三层弹窗')
        .id('button_open_dialog3_scenarios_0530')
        .onClick(() => {
          this.dialogController3.open()
        })
        .margin({ bottom: 10 })
      Button('关闭')
        .id('button_close_dialog2_scenarios_0530')
        .onClick(() => {
          this.controller.close()
        })
        .margin({ bottom: 20 })
    }
    .width('41.67%')
    .padding(20)
    .backgroundColor(Color.Orange)
    .borderRadius(10)
  }
}

@CustomDialog
struct CustomDialogExampleScenarios10530 {
  controller: CustomDialogController
  dialogController2: CustomDialogController = new CustomDialogController({
    builder: CustomDialogExampleScenarios20530(),
    autoCancel: true
  })

  build() {
    Column() {
      Text('第一层弹窗')
        .fontSize(20)
        .margin({ top: 20, bottom: 20 })
      Button('打开第二层弹窗')
        .id('button_open_dialog2_scenarios_0530')
        .onClick(() => {
          this.dialogController2.open()
        })
        .margin({ bottom: 10 })
      Button('关闭')
        .id('button_close_dialog1_scenarios_0530')
        .onClick(() => {
          this.controller.close()
        })
        .margin({ bottom: 20 })
    }
    .width('44.44%')
    .padding(20)
    .backgroundColor(Color.Gray)
    .borderRadius(10)
  }
}

@Entry
@Component
struct CustomDialogScenarios0530 {
  dialogController1: CustomDialogController = new CustomDialogController({
    builder: CustomDialogExampleScenarios10530(),
    autoCancel: true
  })

  build() {
    Column() {
      Button('打开第一层弹窗')
        .id('button_open_dialog1_scenarios_0530')
        .fontSize(20)
        .onClick(() => {
          this.dialogController1.open()
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}

