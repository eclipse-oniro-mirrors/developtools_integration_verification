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

@Entry
@Component
struct TextSpanStore23 {
  controller: TextController = new TextController();
  options: TextOptions = { controller: this.controller };
  
  // 使用MutableStyledString，支持insertStyledString操作
  mutableStyledString: MutableStyledString = new MutableStyledString('Hello 😀 World');

  async onPageShow() {
    this.controller.setStyledString(this.mutableStyledString);
  }

  insertStyledString() {
    // insertStyledString在表情中间插入新的属性字符串（在位置6插入）
    let newStyledString: StyledString = new StyledString('X', []);
    this.mutableStyledString.insertStyledString(6, newStyledString);
    this.controller.setStyledString(this.mutableStyledString);
  }

  build() {
    Column() {
      Text('Text组件添加属性字符串，insertStyledString在表情中间插入新的属性字符串')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Text(undefined, this.options)
        .id('text_span_store_23')
        .fontSize(20)
        .width('90%')
        .padding(10)
        .border({ width: 1, color: Color.Black })

      Button('insertStyledString在表情中间插入')
        .id('insert_styled_string_button_23')
        .margin({ top: 10 })
        .onClick(() => this.insertStyledString())
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(0xF5F5F5)
  }
}
