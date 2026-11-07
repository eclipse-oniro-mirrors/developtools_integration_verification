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
struct UiComponentControllerAddDelete42 {
  textAreaController: TextAreaController = new TextAreaController();
  textinputController: TextInputController = new TextInputController();
  searchController: SearchController = new SearchController();
  @State onCopy: string = '';
  @State text: string = '12';
  @State text2: string = '12';
  @State start: number = 0;
  @State end: number = 20;
  @State changeValue: string = ''
  @State submitValue: string = ''
  @State textarearange:TextRange={start:0,end:0}
  @State textinputrange:TextRange={start:0,end:0}
  @State searchrange:TextRange={start:0,end:0}
  @State TextAreaStyle:TextContentStyle=TextContentStyle.DEFAULT
  @State InputStyle:TextContentStyle=TextContentStyle.DEFAULT
  @State SearchStyle:TextContentStyle=TextContentStyle.DEFAULT

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
        .maxLength(12)
        .backgroundColor('#FFFFFF')
        .style(this.TextAreaStyle)
        .onTextSelectionChange((selectionStart, selectionEnd) => {
          this.textarearange=this.textAreaController.getSelection();
        })
        .onChange((value: string) => {
          this.text = value;
        })
        .id('UiComponentControllerAddDelete42_01')
      TextInput({ text: this.text2, placeholder: 'input your word...', controller: this.textinputController })
        .placeholderColor(Color.Grey)
        .placeholderFont({ size: 14, weight: 400 })
        .caretColor(Color.Blue)
        .width('95%')
        .height(40)
        .margin(20)
        .maxLength(20)
        .style(this.InputStyle)
        .fontSize(14)
        .fontColor(Color.Black)
        .id('UiComponentControllerAddDelete42_02')
        .onTextSelectionChange((selectionStart, selectionEnd) => {
          this.textinputrange=this.textinputController.getSelection();
        })
      Text('textarearange is'+JSON.stringify(this.textarearange)+'textinputrange is'+JSON.stringify(this.textinputrange))
        .fontSize(5)
        .margin(10)
        .key('copy')
      Row(){
        Button('change textarea type')
          .onClick(()=>{
            this.TextAreaStyle=TextContentStyle.INLINE
          })
          .width(100)
          .id('UiComponentControllerAddDelete42_03')
        Button('change textinput type')
          .width(100)
          .onClick(()=>{
            this.InputStyle=TextContentStyle.INLINE
          })
          .id('UiComponentControllerAddDelete42_04')
        Button('添加文本')
          .margin({ left: 20 })
          .onClick(() => {
            this.textAreaController.addText('添加'+'\n'+'文本');
            this.textinputController.addText('添加'+'\n'+'文本');
            this.searchController.addText('添加'+'\n'+'文本');
          })
          .id('UiComponentControllerAddDelete42_05')
      }
    }
    .height('100%')
    .width('100%')
    .padding({ left: 35, right: 35, top: 35 })
  }
}