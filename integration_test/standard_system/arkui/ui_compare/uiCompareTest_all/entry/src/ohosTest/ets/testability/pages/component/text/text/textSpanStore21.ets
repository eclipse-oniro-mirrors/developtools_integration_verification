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

import { LengthMetrics } from '@kit.ArkUI';

@Entry
@Component
struct TextSpanStore21 {
  controller: TextController = new TextController();
  options: TextOptions = { controller: this.controller };
  
  // 使用MutableStyledString，支持clearStyles操作
  mutableStyledString: MutableStyledString = new MutableStyledString('Hello 😀 World');

  async onPageShow() {
    // 先设置样式，并让表情显示为问号
    let fontStyle: TextStyle = new TextStyle({ fontSize: LengthMetrics.vp(30), fontWeight: FontWeight.Bold });
    this.mutableStyledString.setStyle({
      start: 6,
      length: 1,
      styledKey: StyledStringKey.FONT,
      styledValue: fontStyle
    });
    this.controller.setStyledString(this.mutableStyledString);
  }

  clearStyles() {
    // clearStyles清除所有样式
    this.mutableStyledString.clearStyles();
    this.controller.setStyledString(this.mutableStyledString);
  }

  build() {
    Column() {
      Text('Text组件添加属性字符串，clearStyles清除所有样式')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Text(undefined, this.options)
        .id('text_span_store_21')
        .fontSize(20)
        .width('90%')
        .padding(10)
        .border({ width: 1, color: Color.Black })

      Button('clearStyles清除所有样式')
        .id('clear_styles_button_21')
        .margin({ top: 10 })
        .onClick(() => this.clearStyles())
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(0xF5F5F5)
  }
}

