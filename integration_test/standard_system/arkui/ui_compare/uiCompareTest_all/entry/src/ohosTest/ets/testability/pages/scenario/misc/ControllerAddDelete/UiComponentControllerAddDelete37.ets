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
struct UiComponentControllerAddDelete37 {
  textAreaController: TextAreaController = new TextAreaController();
  textinputController: TextInputController = new TextInputController();
  searchController: SearchController = new SearchController();
  @State onCopy: string = '';
  @State text: string = 'hello world hello world hello world hello world hello world hello world hello world hello world hello world' +
    'hello world hello world hello world hello world hello world hello world hello world hello world hello world';
  @State start: number = 0;
  @State end: number = 20;
  @State changeValue: string = ''
  @State submitValue: string = ''
  @State textarearange:TextRange={start:0,end:0}
  @State textinputrange:TextRange={start:0,end:0}
  @State searchrange:TextRange={start:0,end:0}
  @State maxlength:number=9
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
        .maxLength(this.maxlength)
        .border({ width: 1 })
        .fontSize(16)
        .fontColor('#182431')
        .enableKeyboardOnFocus(false)
        .backgroundColor('#FFFFFF')
        .style(TextContentStyle.INLINE)
        .onChange((value: string) => {
          this.text = value;
        })
        .id('UiComponentControllerAddDelete37_01')
      TextInput({ text: this.text, placeholder: '', controller: this.textinputController })
        .placeholderColor(Color.Grey)
        .placeholderFont({ size: 14, weight: 400 })
        .caretColor(Color.Blue)
        .width('95%')
        .height(40)
        .enableKeyboardOnFocus(false)
        .margin(20)
        .maxLength(this.maxlength)
        .style(TextContentStyle.INLINE)
        .fontSize(14)
        .fontColor(Color.Black)
        .id('UiComponentControllerAddDelete37_02')
      Search({ value: this.text, placeholder: '', controller: this.searchController })
        .searchButton('SEARCH')
        .width('95%')
        .height(40)
        .backgroundColor('#F5F5F5')
        .placeholderColor(Color.Grey)
        .enableKeyboardOnFocus(false)
        .maxLength(this.maxlength)
        .placeholderFont({ size: 14, weight: 400 })
        .textFont({ size: 14, weight: 400 })
        .id('UiComponentControllerAddDelete37_03')
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
          .id('UiComponentControllerAddDelete37_04')
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