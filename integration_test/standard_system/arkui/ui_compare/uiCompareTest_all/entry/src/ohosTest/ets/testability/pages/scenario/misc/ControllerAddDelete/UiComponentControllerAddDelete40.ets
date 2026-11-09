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
struct UiComponentControllerAddDelete40 {
  textAreaController: TextAreaController = new TextAreaController();
  textinputController: TextInputController = new TextInputController();
  searchController: SearchController = new SearchController();
  @State onCopy: string = '';
  @State text: string = '12';
  @State start: number = 0;
  @State end: number = 20;
  @State changeValue: string = ''
  @State submitValue: string = ''
  @State textarearange:TextRange={start:0,end:0}
  @State textinputrange:TextRange={start:0,end:0}
  @State searchrange:TextRange={start:0,end:0}
  @State TextAreaType:TextAreaType=TextAreaType.NORMAL
  @State InputType:InputType=InputType.Normal
  @State SearchType:SearchType=SearchType.NORMAL

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.Start }) {
      TextArea({
        text: this.text,
        placeholder: '11111111',
        controller: this.textAreaController
      })
        .placeholderFont({ size: 16, weight: 400 })
        .width(336)
        .height(40)
        .margin(20)
        .border({ width: 1 })
        .fontSize(16)
        .fontColor('#182431')
        .maxLength(2)
        .type(this.TextAreaType)
        .backgroundColor('#FFFFFF')
        .style(TextContentStyle.DEFAULT)
        .onTextSelectionChange((selectionStart, selectionEnd) => {
          this.textarearange=this.textAreaController.getSelection();
        })
        .onChange((value: string) => {
          this.text = value;
        })
        .id('UiComponentControllerAddDelete40_01')
      TextInput({ text: this.text, placeholder: 'input your word...', controller: this.textinputController })
        .placeholderColor(Color.Grey)
        .placeholderFont({ size: 14, weight: 400 })
        .caretColor(Color.Blue)
        .width('95%')
        .height(40)
        .margin(20)
        .maxLength(2)
        .style(TextContentStyle.DEFAULT)
        .fontSize(14)
        .type(this.InputType)
        .fontColor(Color.Black)
        .id('UiComponentControllerAddDelete40_02')
        .onTextSelectionChange((selectionStart, selectionEnd) => {
          this.textinputrange=this.textinputController.getSelection();
        })
      Search({ value: this.text, placeholder: 'Type to search...', controller: this.searchController })
        .searchButton('SEARCH')
        .width('95%')
        .height(40)
        .backgroundColor('#F5F5F5')
        .maxLength(2)
        .type(this.SearchType)
        .placeholderColor(Color.Grey)
        .placeholderFont({ size: 14, weight: 400 })
        .textFont({ size: 14, weight: 400 })
        .id('UiComponentControllerAddDelete40_03')
        .onTextSelectionChange((selectionStart, selectionEnd) => {
          this.searchrange=this.searchController.getSelection();
        })
        .onSubmit((value: string) => {
          this.submitValue = value
        })
        .onChange((value: string) => {
          this.changeValue = value
        })
        .margin(20)
      Text('textarearange is'+JSON.stringify(this.textarearange)+'textinputrange is'+JSON.stringify(this.textinputrange)
        +'searchrange is'+JSON.stringify(this.searchrange))
        .fontSize(5)
        .margin(10)
        .key('copy')
      Row(){
        Button('change textarea type')
          .onClick(()=>{
            this.TextAreaType=TextAreaType.NUMBER
          })
          .width(100)
          .id('UiComponentControllerAddDelete40_04')
        Button('change textinput type')
          .width(100)
          .onClick(()=>{
            this.InputType=InputType.Number
          })
          .id('UiComponentControllerAddDelete40_05')
        Button('change search type')
          .width(100)
          .onClick(()=>{
            this.SearchType=SearchType.NUMBER
          })
          .id('UiComponentControllerAddDelete40_06')
      }
    }
    .height('100%')
    .width('100%')
    .padding({ left: 35, right: 35, top: 35 })
  }
}