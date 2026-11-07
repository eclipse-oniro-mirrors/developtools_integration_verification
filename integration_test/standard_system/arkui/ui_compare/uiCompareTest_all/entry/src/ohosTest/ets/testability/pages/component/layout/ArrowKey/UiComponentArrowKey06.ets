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
struct UiComponentArrowKey06 {
  textAreaController: TextAreaController = new TextAreaController();
  textinputController: TextInputController = new TextInputController();
  searchController: SearchController = new SearchController();
  @State startIndex: number = 0
  @State endIndex: number = 0
  @State startIndex1: number = 0
  @State endIndex1: number = 0
  @State startIndex2: number = 0
  @State endIndex2: number = 0
  @State text: string = '';
  @State changeValue: string = ''
  @State submitValue: string = ''

  build() {
    Column({ space: 3 }) {
      Text('Selection start:' + this.startIndex + ' end:' + this.endIndex)
      TextInput({ text: this.text, controller: this.textinputController })
        .width('95%')
        .height(100)
        .defaultFocus(true)
        .enableKeyboardOnFocus(true)
        .style(TextInputStyle.Inline)
        .onTextSelectionChange((selectionStart: number, selectionEnd: number) => {
          this.startIndex = selectionStart
          this.endIndex = selectionEnd
        })
        .id('UiComponentArrowKey06_01')
      Text('TextArea Selection start:' + this.startIndex1 + ' end:' + this.endIndex1)
      TextArea({
        text: this.text,
        placeholder: '',
        controller: this.textAreaController
      })
        .placeholderFont({ size: 16, weight: 400 })
        .width(336)
        .height(100)
        .margin(20)
        .border({ width: 1 })
        .fontSize(16)
        .fontColor('#182431')
        .backgroundColor('#FFFFFF')
        .style(TextContentStyle.INLINE)
        .maxLength(20)
        .onChange((value: string) => {
          this.text = value;
        })
        .onTextSelectionChange((selectionStart: number, selectionEnd: number) => {
          this.startIndex1 = selectionStart
          this.endIndex1 = selectionEnd
        })
        .id('UiComponentArrowKey06_02')
      Text('Search Selection start:' + this.startIndex2 + ' end:' + this.endIndex2)
      Search({ value: this.text, placeholder: 'Type to search...', controller: this.searchController })
        .searchButton('SEARCH')
        .width('95%')
        .height(40)
        .backgroundColor('#F5F5F5')
        .placeholderColor(Color.Grey)
        .placeholderFont({ size: 14, weight: 400 })
        .textFont({ size: 14, weight: 400 })
        .onSubmit((value: string) => {
          this.submitValue = value
        })
        .onChange((value: string) => {
          this.changeValue = value
        })
        .onTextSelectionChange((selectionStart: number, selectionEnd: number) => {
          this.startIndex2 = selectionStart
          this.endIndex2 = selectionEnd
        })
        .margin(20)
        .id('UiComponentArrowKey06_03')
    }
    .width('100%')
    .height('100%')
  }
}
