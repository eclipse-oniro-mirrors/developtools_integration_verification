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

import { Popup, PopupTextOptions, PopupOptions } from '@kit.ArkUI';

interface ExtendedPopupOptions extends PopupOptions {
  backgroundBlurStyle?: BlurStyle;
}

@Entry
@Component
struct BlurMaterialSeparatedLayer0680 {
  @State showPopup: boolean = false;

  private messageOptions: PopupTextOptions = {
    text: '这是自定义Popup',
    fontSize: 16,
    fontColor: Color.Black
  };

  popupOptions: ExtendedPopupOptions = {
    message: this.messageOptions,
    showClose: true,
    backgroundBlurStyle: undefined,
    onClose: () => {
      this.showPopup = false;
    }
  };

  @Builder
  MyPopup() {
    Popup(this.popupOptions)
  }

  build() {
    Column() {
      Text('Popup控制')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Button('CustomPopupOptions')
        .id('customPopupOptionsBtn0680')
        .width(300)
        .height(50)
        .margin({ bottom: 10 })
        .onClick(() => {
          this.showPopup = true;
        })

      Button('拉起弹窗')
        .id('showPopupBtn0680')
        .width(300)
        .height(50)
        .margin({ bottom: 10 })
        .onClick(() => {
          this.showPopup = true;
        })

      if (this.showPopup) {
        this.MyPopup()
      }
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Center)
    .backgroundColor('#F5F5F5')
  }
}

