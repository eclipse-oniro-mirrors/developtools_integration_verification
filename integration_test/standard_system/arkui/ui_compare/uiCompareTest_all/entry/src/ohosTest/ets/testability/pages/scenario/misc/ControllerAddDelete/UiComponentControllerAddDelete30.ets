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
struct UiComponentControllerAddDelete30 {
  textAreaController: TextAreaController = new TextAreaController();
  textinputController: TextInputController = new TextInputController();
  searchController: TextInputController = new SearchController();
  @State onCopy: string = '';
  @State text: string = 'abcabcabc';
  @State start: number = 0;
  @State end: number = 20;
  @State changeValue: string = ''
  @State submitValue: string = ''
  @State textareachange:string='';
  @State textinputchange:string='';
  @State searchchange:string='';
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
        .backgroundColor('#FFFFFF')
        .style(TextContentStyle.INLINE)
        .onWillChange((newValue: EditableTextChangeValue) => {
          this.textareachange = newValue.content;
          return true;
        })
      TextInput({ text: this.text, placeholder: '', controller: this.textinputController })
        .placeholderColor(Color.Grey)
        .placeholderFont({ size: 14, weight: 400 })
        .caretColor(Color.Blue)
        .width('95%')
        .height(40)
        .margin(20)
        .style(TextContentStyle.INLINE)
        .fontSize(14)
        .fontColor(Color.Black)
        .onWillChange((newValue: EditableTextChangeValue) => {
          this.textinputchange = newValue.content;
          return true;
        })
      Search({ value: this.text, placeholder: '', controller: this.searchController })
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
        .onWillChange((newValue: EditableTextChangeValue) => {
          this.searchchange = newValue.content;
          return true;
        })
        .margin(20)
      Row(){
        Button('add text')
          .margin({ left: 20 })
          .onClick(() => {
            this.textAreaController.addText('123');
            this.textinputController.addText('123');
            this.searchController.addText('123');
          })
          .id('UiComponentControllerAddDelete30_01')
        Button('delete text')
          .margin({ left: 20 })
          .onClick(() => {
            this.textAreaController.deleteText({start:0,end:3});
            this.textinputController.deleteText({start:0,end:3});
            this.searchController.deleteText({start:0,end:3});
          })
          .id('UiComponentControllerAddDelete30_02')
      }
      Text('textarea onWillChange is:'+this.textareachange+' textinputselect onWillChange is:'
        +this.textinputchange+'searchselect onWillChange is:'+this.searchchange).fontSize(12).margin(10).key('copy')
    }
    .height('100%')
    .width('100%')
    .padding({ left: 35, right: 35, top: 35 })
  }
}