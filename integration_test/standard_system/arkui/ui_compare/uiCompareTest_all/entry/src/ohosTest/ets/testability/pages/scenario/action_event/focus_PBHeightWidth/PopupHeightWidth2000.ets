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

import { Popup, PopupIconOptions, PopupTextOptions, PopupButtonOptions, promptAction } from '@kit.ArkUI';


@Entry
@Component
struct PopupHeightWidth2000 {
  @State showPopup: boolean = false;

  getIconOptions(): PopupIconOptions {
    return {
      image: $r('app.media.icon1')
    };
  }

  getMessageOptions(): PopupTextOptions {
    return {
      text: 'Popup内容文本 - 测试onClose回调'
    };
  }

  getButtonOptions(): PopupButtonOptions {
    return {
      text: '关闭',
      action: () => { 
        this.showPopup = false;
        promptAction.showToast({
          message: '按钮action触发，onClose不应触发',
          duration: 2000
        });
      }
    };
  }

  handleClose() {
    this.showPopup = false;
    promptAction.showToast({
      message: 'onClose触发了',
      duration: 2000
    });
  }

  @Builder
  popupBuilder() {
    Popup({
      icon: this.getIconOptions(),
      message: this.getMessageOptions(),
      buttons: [this.getButtonOptions()],
      showClose: true,
      onClose: () => { this.handleClose(); }
    })
  }

  build() {
    Column() {
      Button('显示Popup')
        .id('showPopupButton2000')
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

