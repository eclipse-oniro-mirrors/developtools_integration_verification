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
import { Popup, PopupIconOptions, PopupTextOptions, PopupButtonOptions } from '@kit.ArkUI';

@Entry
@Component
struct PopupHeightWidth1200 {
  @State showPopup: boolean = false;

  getIconOptions(): PopupIconOptions {
    return {
      image: $r('app.media.icon1'),
      borderRadius: {
        topRight: '10%'
      }
    };
  }

  getMessageOptions(): PopupTextOptions {
    return {
      text: 'Popup内容 - 测试icon borderRadius的topRight为10%'
    };
  }

  getButtonOptions(): PopupButtonOptions {
    return {
      text: '关闭',
      action: () => { this.showPopup = false; }
    };
  }

  @Builder
  popupBuilder() {
    Popup({
      icon: this.getIconOptions(),
      message: this.getMessageOptions(),
      buttons: [this.getButtonOptions()]
    })
  }

  build() {
    Column() {
      Button('显示Popup')
        .id('showPopupButton1200')
        .onClick(() => {
          this.showPopup = !this.showPopup;
        })
        .margin(50)
        .bindContentCover(this.showPopup, this.popupBuilder)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}

