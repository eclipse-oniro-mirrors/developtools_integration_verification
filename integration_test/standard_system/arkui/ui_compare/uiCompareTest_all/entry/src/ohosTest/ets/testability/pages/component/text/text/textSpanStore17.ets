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
struct TextSpanStore17 {
  controller: TextController = new TextController();
  options: TextOptions = { controller: this.controller };
  
  // 使用MutableStyledString，支持replaceStyle操作
  mutableStyledString: MutableStyledString = new MutableStyledString('Hello 😀 World');

  async onPageShow() {
    this.controller.setStyledString(this.mutableStyledString);
  }

  replaceStyle() {
    // replaceStyle替换部分表情样式（从位置6开始，长度1）
    let newStyle: TextStyle = new TextStyle({ fontSize: LengthMetrics.vp(30), fontWeight: FontWeight.Bold });
    this.mutableStyledString.replaceStyle({
      start: 6,
      length: 1,
      styledKey: StyledStringKey.FONT,
      styledValue: newStyle
    });
    this.controller.setStyledString(this.mutableStyledString);
  }

  build() {
    Column() {
      Text('Text组件添加属性字符串，replaceStyle替换部分表情样式')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Text(undefined, this.options)
        .id('text_span_store_17')
        .fontSize(20)
        .width('90%')
        .padding(10)
        .border({ width: 1, color: Color.Black })

      Button('replaceStyle替换部分表情样式')
        .id('replace_style_button_17')
        .margin({ top: 10 })
        .onClick(() => this.replaceStyle())
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(0xF5F5F5)
  }
}

