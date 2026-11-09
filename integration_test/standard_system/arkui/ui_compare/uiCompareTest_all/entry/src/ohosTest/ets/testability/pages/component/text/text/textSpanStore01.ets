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
struct TextSpanStore01 {
  @State selectionStart: number = 0;
  @State selectionEnd: number = 2;
  @State copyText: string = '';
  controller: TextController = new TextController();
  options: TextOptions = { controller: this.controller };

  build() {
    Column() {
      Text('Text组件添加span/属性字符串，selection在表情中间，复制文本')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      // Text组件添加Span，包含表情
      Text() {
        Span('Hello ')
        Span('😀')  // 表情在位置6-7（假设）
        Span(' World')
      }
      .id('text_span_store_01')
      .fontSize(20)
      .copyOption(CopyOptions.InApp)
      .selection(this.selectionStart, this.selectionEnd)
      .onCopy((value: string) => {
        this.copyText = value;
        console.info(`Copied text: ${value}`);
      })
      .width('90%')
      .padding(10)
      .border({ width: 1, color: Color.Black })

      Button('复制')
        .id('copy_button_01')
        .margin({ top: 10 })
        .onClick(() => {
          // 触发复制操作
          this.selectionStart = 5;  // 在表情中间
          this.selectionEnd = 7;
        })

      Text(`复制内容: ${this.copyText}`)
        .fontSize(14)
        .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(0xF5F5F5)
  }
}

