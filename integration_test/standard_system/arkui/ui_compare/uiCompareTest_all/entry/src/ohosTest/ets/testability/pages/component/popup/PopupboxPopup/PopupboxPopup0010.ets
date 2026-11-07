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

import { Popup, PopupTextOptions, PopupButtonOptions, PopupIconOptions } from '@kit.ArkUI';
import { ConfigurationConstant } from '@kit.AbilityKit';

@Entry
@Component
struct PopupboxPopup0010 {
  @State handlePopup: boolean = false;

  build() {
    Column({ space: 100 }) {
      Button('PopupOptions')
        .margin(20)
        .id('PopupboxPopup0010_001')
        .onClick(() => {
          this.handlePopup = !this.handlePopup;
        })
        .bindPopup(this.handlePopup, {
          // PopupOptions类型气泡的内容
          message: 'This is a popup with PopupOptions',
          messageOptions: {
            // 气泡的文本样式
            textColor: Color.Red,
            font: {
              size: '14vp',
              style: FontStyle.Italic,
              weight: FontWeight.Bolder
            }
          },
          placement: Placement.Bottom,
          enableArrow: false, // 气泡弹出时不显示箭头
          targetSpace: '15vp',
          onStateChange: (e) => {
            console.info(JSON.stringify(e.isVisible));
            if (!e.isVisible) {
              this.handlePopup = false;
            }
          }
        })
      Button('themedark')
        .margin(20)
        .id('PopupboxPopup0010_002')
        .onClick(() => {
          globalThis.getContext().getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_DARK)
        })
      Button('themelight')
        .margin(20)
        .id('PopupboxPopup0010_003')
        .onClick(() => {
          globalThis.getContext().getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT)
        })
    }.margin(20)
  }
}


