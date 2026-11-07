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
struct UiComponentControllerAddDelete10 {
  textAreaController: TextAreaController = new TextAreaController();
  textinputController: TextInputController = new TextInputController();
  searchController: TextInputController = new SearchController();
  @State onCopy: string = '';
  @State text: string = 'abc';
  @State start: number = 0;
  @State end: number = 20;
  @State changeValue: string = ''
  @State submitValue: string = ''

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.Start }) {
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
        .maxLength(9)
        .onChange((value: string) => {
          this.text = value;
        })
      TextInput({ text: this.text, placeholder: '', controller: this.textinputController })
        .placeholderColor(Color.Grey)
        .placeholderFont({ size: 14, weight: 400 })
        .caretColor(Color.Blue)
        .width('95%')
        .height(40)
        .maxLength(9)
        .margin(20)
        .style(TextContentStyle.INLINE)
        .fontSize(14)
        .fontColor(Color.Black)
      Search({ value: this.text, placeholder: '', controller: this.searchController })
        .searchButton('SEARCH')
        .width('95%')
        .height(40)
        .backgroundColor('#F5F5F5')
        .maxLength(9)
        .placeholderColor(Color.Grey)
        .placeholderFont({ size: 14, weight: 400 })
        .textFont({ size: 14, weight: 400 })
        .onSubmit((value: string) => {
          this.submitValue = value
        })
        .onChange((value: string) => {
          this.changeValue = value
        })
        .margin(20)
      Button('删除文本')
        .margin({ left: 20 })
        .onClick(() => {
          this.textAreaController.deleteText({});
          this.textinputController.deleteText({});
          this.searchController.deleteText({});
        })
        .id('UiComponentControllerAddDelete10')
      Text(this.onCopy).fontSize(12).margin(10).key('copy')
    }
    .height('100%')
    .width('100%')
    .padding({ left: 35, right: 35, top: 35 })
  }
}