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
struct UiComponentHalfLeading12 {
  textAreaController: TextAreaController = new TextAreaController();
  textinputController: TextInputController = new TextInputController();
  searchController: TextInputController = new SearchController();
  @State onCopy: string = '';
  @State text: string = 'hello world12345';
  @State fontSize:number=16
  @State textareatype:TextAreaType=TextAreaType.NORMAL
  @State inputtype:InputType=InputType.Normal
  @State searchtype:SearchType=SearchType.NORMAL
  build() {
    Column() {
      TextArea({
        text: this.text,
        placeholder: '',
        controller: this.textAreaController
      })
        .placeholderFont({ size: 16, weight: 400 })
        .width(336)
        .height(120)
        .margin(20)
        .border({ width: 1 })
        .fontSize(this.fontSize)
        .lineHeight(40)
        .halfLeading(true)
        .type(this.textareatype)
        .fontColor('#182431')
        .backgroundColor('#FFFFFF')
        .onChange((value: string) => {
          this.text = value;
        })
        .id('UiComponentHalfLeading12_01')
      TextInput({ text: this.text, placeholder: '', controller: this.textinputController })
        .placeholderColor(Color.Grey)
        .placeholderFont({ size: 14, weight: 400 })
        .caretColor(Color.Blue)
        .width('95%')
        .height(120)
        .lineHeight(120)
        .margin(20)
        .fontSize(this.fontSize)
        .type(this.inputtype)
        .halfLeading(true)
        .fontColor(Color.Black)
        .id('UiComponentHalfLeading12_02')
      Search({ value: this.text, placeholder: '', controller: this.searchController })
        .searchButton('SEARCH')
        .width('95%')
        .height(120)
        .backgroundColor('#F5F5F5')
        .lineHeight(120)
        .halfLeading(true)
        .enableKeyboardOnFocus(false)
        .type(this.searchtype)
        .placeholderColor(Color.Grey)
        .placeholderFont({ size: 14, weight: 400 })
        .textFont({ size: this.fontSize, weight: 400 })
        .margin(20)
        .id('UiComponentHalfLeading12_03')
      Button('change type')
        .backgroundColor('#007DFF')
        .margin(15)
        .onClick(() => {
          this.textareatype=TextAreaType.NUMBER;
          this.inputtype=InputType.Number;
          this.searchtype=SearchType.NUMBER
        })
        .id('UiComponentHalfLeading12_04')
    }
    .height('100%')
    .width('100%')
    .padding({ left: 35, right: 35, top: 35 })
  }
}