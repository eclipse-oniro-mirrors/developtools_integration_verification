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
struct CustomDialogExample0250 {
  controller?: CustomDialogController;

  build() {
    Column() {
      Text('这是自定义弹窗')
        .fontSize(30)
        .height(100)
        .margin(20)
    }
  }
}

@Entry
@Component
struct BlurMaterialSeparatedLayer0250 {
  @State showCustomDialog: boolean = false;
  dialogController: CustomDialogController | null = new CustomDialogController({
    builder: CustomDialogExample0250(),
    alignment: DialogAlignment.Center,
    autoCancel: true,
    backgroundBlurStyle: BlurStyle.COMPONENT_REGULAR
  });

  aboutToDisappear() {
    this.dialogController = null;
  }

  build() {
    Column() {
      Text('自定义弹窗')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Button('CustomDialog')
        .id('customDialogBtn0250')
        .width(300)
        .height(50)
        .margin({ bottom: 10 })
        .onClick(() => {
          if (this.dialogController != null) {
            this.dialogController.open();
          }
        })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Center)
    .backgroundColor('#F5F5F5')
  }
}

export {}
