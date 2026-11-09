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
struct UiComponentWordBreakHyphenation02 {
  @State text: string =
    'hello world hello world hello world hello world hello world hello world';
  textAreaController: TextAreaController = new TextAreaController();
  textinputController: TextInputController = new TextInputController();
  @State wordbreak:WordBreak[]=[WordBreak.NORMAL,WordBreak.BREAK_ALL,WordBreak.BREAK_WORD,WordBreak.HYPHENATION]
  @State num:number=0
  build() {
    Column() {
      TextArea({
        text: this.text,
        placeholder: '',
        controller: this.textAreaController
      })
        .placeholderFont({ size: 16, weight: 400 })
        .height(150)
        .margin(20)
        .width('50%')
        .wordBreak(this.wordbreak[this.num])
        .border({ width: 1 })
        .fontSize(16)
        .fontColor('#182431')
        .backgroundColor('#FFFFFF')
        .style(TextContentStyle.DEFAULT)
      TextInput({ text: this.text, placeholder: 'input your word...', controller: this.textinputController })
        .placeholderColor(Color.Grey)
        .placeholderFont({ size: 14, weight: 400 })
        .caretColor(Color.Blue)
        .height(150)
        .width('60%')
        .wordBreak(this.wordbreak[this.num])
        .margin(20)
        .style(TextContentStyle.INLINE)
        .fontSize(16)
        .fontColor(Color.Black)
      Button('change wordbreak')
        .onClick(()=>{
          this.num=(this.num+1)%4;
        })
        .id('UiComponentWordBreakHyphenation02')
    }
  }
}