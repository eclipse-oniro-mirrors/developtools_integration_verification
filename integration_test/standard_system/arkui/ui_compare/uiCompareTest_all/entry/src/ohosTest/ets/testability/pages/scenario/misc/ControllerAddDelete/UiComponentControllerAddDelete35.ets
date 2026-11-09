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
struct UiComponentControllerAddDelete35 {
  textAreaController: TextAreaController = new TextAreaController();
  textinputController: TextInputController = new TextInputController();
  searchController: TextInputController = new SearchController();
  @State onCopy: string = '';
  @State text: string = '123';
  @State start: number = 0;
  @State end: number = 20;
  @State changeValue: string = ''
  @State submitValue: string = ''
  @State textarearange:TextRange={start:0,end:0}
  @State textinputrange:TextRange={start:0,end:0}
  @State searchrange:TextRange={start:0,end:0}
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.Start }) {
      TextArea({
        text: this.text,
        placeholder: '',
        controller: this.textAreaController
      })
        .placeholderFont({ size: 16, weight: 400 })
        .width(336)
        .height(50)
        .margin(20)
        .border({ width: 1 })
        .fontSize(16)
        .fontColor('#182431')
        .enableKeyboardOnFocus(false)
        .backgroundColor('#FFFFFF')
        .style(TextContentStyle.INLINE)
        .maxLength(9)
        .onChange((value: string) => {
          this.text = value;
        })
        .id('UiComponentControllerAddDelete35_03')
      TextInput({ text: this.text, placeholder: '', controller: this.textinputController })
        .placeholderColor(Color.Grey)
        .placeholderFont({ size: 14, weight: 400 })
        .caretColor(Color.Blue)
        .width('95%')
        .height(40)
        .maxLength(9)
        .enableKeyboardOnFocus(false)
        .margin(20)
        .style(TextContentStyle.INLINE)
        .fontSize(14)
        .fontColor(Color.Black)
        .id('UiComponentControllerAddDelete35_04')
      Search({ value: this.text, placeholder: '', controller: this.searchController })
        .searchButton('SEARCH')
        .width('95%')
        .height(40)
        .backgroundColor('#F5F5F5')
        .maxLength(9)
        .placeholderColor(Color.Grey)
        .enableKeyboardOnFocus(false)
        .placeholderFont({ size: 14, weight: 400 })
        .textFont({ size: 14, weight: 400 })
        .id('UiComponentControllerAddDelete35_05')
        .onSubmit((value: string) => {
          this.submitValue = value
        })
        .onChange((value: string) => {
          this.changeValue = value
        })
        .margin(20)
      Row(){
        Button('get selection')
          .margin({ left: 20 })
          .onClick(() => {
            this.textarearange=this.textAreaController.getSelection();
            this.textinputrange=this.textinputController.getSelection();
            this.searchrange=this.searchController.getSelection();
          })
          .id('UiComponentControllerAddDelete35_01')
        Button('set selection')
          .margin({ left: 20 })
          .onClick(() => {
            this.searchController.setTextSelection(1,2);
            this.textinputController.setTextSelection(1,2);
            this.textAreaController.setTextSelection(1,2);
          })
          .id('UiComponentControllerAddDelete35_02')
      }
      Text('textarearange is'+JSON.stringify(this.textarearange)+'textinputrange is'+JSON.stringify(this.textinputrange)
        +'searchrange is'+JSON.stringify(this.searchrange))
        .fontSize(12).margin(10).key('copy')
    }
    .height('100%')
    .width('100%')
    .padding({ left: 35, right: 35, top: 35 })
  }
}