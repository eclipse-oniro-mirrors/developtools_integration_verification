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
struct UiComponentBlankLineSelected08 {
  textAreaController: TextAreaController = new TextAreaController();
  textinputController: TextInputController = new TextInputController();
  @State onCopy: string = '';
  @State text: string =
    '                       ';
  @State start: number = 0;
  @State end: number = 20;
  @State ownalign:TextAlign=TextAlign.Start
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.Start }) {
      Text(this.text)
        .fontSize(12)
        .border({ width: 1 })
        .lineHeight(20)
        .margin(30)
        .height(50)
        .copyOption(CopyOptions.InApp)
        .selection(this.start, this.end)
        .onCopy((value: string) => {
          this.onCopy = value;
        })
        .textAlign(this.ownalign)
        .draggable(true)
        .width(300)
        .caretColor(Color.Red)
        .selectedBackgroundColor(Color.Blue)
        .enableHapticFeedback(true)
      TextArea({
        text: this.text,
        placeholder: '11111111',
        controller: this.textAreaController
      })
        .placeholderFont({ size: 16, weight: 400 })
        .textAlign(this.ownalign)
        .width(336)
        .height(50)
        .margin(20)
        .border({ width: 1 })
        .fontSize(16)
        .fontColor('#182431')
        .backgroundColor('#FFFFFF')
        .style(TextContentStyle.INLINE)
        .onChange((value: string) => {
          this.text = value;
        })
        .id('UiComponentBlankLineSelected08_area')
      TextInput({ text: this.text, placeholder: 'input your word...', controller: this.textinputController })
        .placeholderColor(Color.Grey)
        .placeholderFont({ size: 14, weight: 400 })
        .caretColor(Color.Blue)
        .width(300)
        .height(40)
        .margin(20)
        .textAlign(this.ownalign)
        .style(TextContentStyle.INLINE)
        .fontSize(14)
        .fontColor(Color.Black)
        .id('UiComponentBlankLineSelected08_input')
      Button('Set text selection')
        .margin({ left: 20 })
        .onClick(() => {
          this.textAreaController.setTextSelection(this.start, this.end);
          this.textinputController.setTextSelection(this.start, this.end);
        })
        .id('UiComponentBlankLineSelected08')
      Button('Set text align')
        .margin({ left: 20 })
        .onClick(() => {
          this.ownalign=TextAlign.End
        })
        .id('UiComponentBlankLineSelected08_2')
      Text(this.onCopy).fontSize(12).margin(10).key('copy')
    }.height('100%').width('100%').padding({ left: 35, right: 35, top: 35 })
  }
}