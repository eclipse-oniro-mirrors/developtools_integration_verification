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
struct TextSpanStore19 {
  controller: TextController = new TextController();
  options: TextOptions = { controller: this.controller };
  
  // 使用MutableStyledString，支持removeStyle操作
  mutableStyledString: MutableStyledString = new MutableStyledString('Hello 😀 World');

  async onPageShow() {
    // 先设置一个样式
    let style: TextStyle = new TextStyle({ fontSize: LengthMetrics.vp(30), fontWeight: FontWeight.Bold });
    this.mutableStyledString.setStyle({
      start: 6,
      length: 1,
      styledKey: StyledStringKey.FONT,
      styledValue: style
    });
    this.controller.setStyledString(this.mutableStyledString);
  }

  removeStyle() {
    // removeStyle清除部分表情的属性样式（从位置6开始，长度1，清除FONT样式）
    this.mutableStyledString.removeStyle(6, 1, StyledStringKey.FONT);
    this.controller.setStyledString(this.mutableStyledString);
  }

  build() {
    Column() {
      Text('Text组件添加属性字符串，removeStyle清除部分表情的属性样式')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Text(undefined, this.options)
        .id('text_span_store_19')
        .fontSize(20)
        .width('90%')
        .padding(10)
        .border({ width: 1, color: Color.Black })

      Button('removeStyle清除部分表情的属性样式')
        .id('remove_style_button_19')
        .margin({ top: 10 })
        .onClick(() => this.removeStyle())
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(0xF5F5F5)
  }
}

