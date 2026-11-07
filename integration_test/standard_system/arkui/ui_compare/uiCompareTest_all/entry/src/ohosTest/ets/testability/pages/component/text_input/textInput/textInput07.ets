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
struct TextInput07 {
  @State text: string = '11111111111\n                        \n           \n          \n       ';
  controller: TextInputController = new TextInputController();
  @State changeValue: string = '';
  @State submitValue: string = '';
  @State positionInfo: CaretOffset = { index: 0, x: 0, y: 0 };
  @State textHeight:Length = 16;
  @State startIndex: number = 0;
  @State endIndex: number = 0;

  build() {
    Column() {
      TextInput({ text: this.text, controller: this.controller })
        .id('TextInput07')
        .style(TextContentStyle.INLINE)
        .placeholderFont({ size: 16, weight: 400 })
        .width('70%')
        .lineHeight(this.textHeight)
        .height(100)
        .margin(20)
        .fontSize(16)
        .fontColor('#182431')
        .backgroundColor('#FFFFFF')
        .onChange((value: string) => {
          this.text = value;
        })
        .onTextSelectionChange((selectionStart: number, selectionEnd: number) => {
          this.startIndex = selectionStart;
          this.endIndex = selectionEnd;
        })

      Button('setTextSelection')
        .margin({top:30})
        .height(40)
        .id('TextInput07_01')
        .onClick( () => {
          this.controller.setTextSelection(0, 52);
        })
    }.width('100%').height('100%').backgroundColor('#F1F3F5')
  }
}
