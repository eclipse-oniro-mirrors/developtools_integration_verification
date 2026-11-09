/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { uiAppearance } from '@kit.ArkUI';

@Entry
@Component
struct ButtonMaxAndMin167 {
  @State fontScaleIndex: number = 0;
  private fontScales: number[] = [1.75, 2.0, 3.2];

  changeFontScale() {
    this.fontScaleIndex = (this.fontScaleIndex + 1) % this.fontScales.length;
    uiAppearance.setFontScale(this.fontScales[this.fontScaleIndex]);
  }

  build() {
    Column({ space: 20 }) {
      Text('用例编号：SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1670')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 });

      Text('minFontScale: 1, maxFontScale: 1')
        .fontSize(12)
        .fontColor('#666666')
        .margin({ bottom: 20 });

      Button('change size')
        .id('changeSizeButton_167')
        .onClick(() => {
          this.changeFontScale();
        })
        .margin({ bottom: 20 });

      Button('测试按钮')
        .id('testButton_167')
        .fontSize(16)
        .minFontScale(1)
        .maxFontScale(1)
        .width(200)
        .height(50)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(0xFFFFFF)
  }
}

