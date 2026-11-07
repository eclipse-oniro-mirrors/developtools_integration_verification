/*
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

@Entry
@Component
struct UiComponentWordBreakHyphenation01 {
  @State onCopy: string = '';
  @State text: string =
    '你好你好你好你好';
  @State start: number = 0;
  @State end: number = 20;
  textAreaController: TextAreaController = new TextAreaController();
  textinputController: TextInputController = new TextInputController();
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.Start }) {
      Text(this.text)
        .fontSize(12)
        .border({ width: 1 })
        .lineHeight(20)
        .margin(30)
        .width('10px')
        .wordBreak(WordBreak.HYPHENATION)
        .copyOption(CopyOptions.InApp)
        .onCopy((value: string) => {
          this.onCopy = value;
        })
        .draggable(true)
        .caretColor(Color.Red)
        .selectedBackgroundColor(Color.Grey)
        .enableHapticFeedback(true)
      TextInput({ text: this.text, placeholder: 'input your word...', controller: this.textinputController })
        .placeholderColor(Color.Grey)
        .placeholderFont({ size: 14, weight: 400 })
        .caretColor(Color.Blue)
        .height(100)
        .width('30px')
        .wordBreak(WordBreak.HYPHENATION)
        .margin(20)
        .style(TextContentStyle.INLINE)
        .fontSize(16)
        .fontColor(Color.Black)
      TextArea({
        text: this.text,
        placeholder: '',
        controller: this.textAreaController
      })
        .placeholderFont({ size: 16, weight: 400 })
        .height(50)
        .margin(20)
        .width('10px')
        .wordBreak(WordBreak.HYPHENATION)
        .border({ width: 1 })
        .fontSize(16)
        .fontColor('#182431')
        .backgroundColor('#FFFFFF')
        .style(TextContentStyle.INLINE)
      Button('Set text selection')
        .margin({ left: 20 })
        .onClick(() => {
          this.start = 10;
          this.end = 30;
        })
      Text(this.onCopy).fontSize(12).margin(10).key('copy')
    }.height('100%').width('100%').padding({ left: 35, right: 35, top: 35 })
  }
}
