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

import { Popup, PopupIconOptions, PopupTextOptions, PopupButtonOptions, uiAppearance } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct PopupHeightWidth2600 {
  @State showPopup: boolean = false;

  // 切换到深色模式
  setDarkMode() {
    try {
      uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_DARK, (error) => {
        if (error) {
          console.error('Set dark-mode failed, ' + error.message);
        } else {
          console.info('Set dark-mode successfully.');
        }
      });
    } catch (error) {
      let message = (error as BusinessError).message;
      console.error('Set dark-mode failed, ' + message);
    }
  }

  getIconOptions(): PopupIconOptions {
    return {
      image: $r('app.media.icon')
    };
  }

  getMessageOptions(): PopupTextOptions {
    return {
      text: 'Popup深色模式测试内容'
    };
  }

  getButtonOptions(): PopupButtonOptions {
    return {
      text: '确定',
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
      Button('切换到深色模式')
        .id('setDarkModeButton2600')
        .onClick(() => {
          this.setDarkMode();
        })
        .margin(20)

      Button('显示Popup')
        .id('showPopupButton2600')
        .onClick(() => {
          this.showPopup = true;
        })
        .margin(20)
        .bindContentCover(this.showPopup, this.popupBuilder)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}

