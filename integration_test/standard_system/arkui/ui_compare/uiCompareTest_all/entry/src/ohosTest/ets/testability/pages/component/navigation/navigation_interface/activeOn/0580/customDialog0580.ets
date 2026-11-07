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
export struct CustomDialog0580 {
  controller?: CustomDialogController;

  build() {
    Column() {
      Text('CustomDialog')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 });

      Button('close CustomDialog')
        .id('closeCustomDialogBtn0580')
        .width(200)
        .height(40)
        .margin({ bottom: 10 })
        .onClick(() => {
          if (this.controller) {
            this.controller.close();
          }
        });
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('#FFFFFF')
    .borderRadius(10)
  }
}

@Builder
export function customDialog0580Builder() {
  CustomDialog0580()
}

