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
struct CustomDialog1720 {
  controller: CustomDialogController

  build() {
    Column() {
      Text('自定义弹窗内容')
        .fontSize(20)
        .margin({ top: 20, bottom: 20 })
      
      Button('关闭')
        .id('CustomDialogInterface1720_002')
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
struct CustomDialogInterface1720 {
  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialog1720(),
    alignment: DialogAlignment.Default,
    openAnimation: {
      onFinish: () => {
        console.info('openAnimation onFinish callback')
      }
    }
  })

  build() {
    Column() {
      Button('one button dialog')
        .id('CustomDialogInterface1720_001')
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



