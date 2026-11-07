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
struct UiComponentTextInputEllipsisMode11 {
  @State text: string = 'hello world hello world hello world' +
    'hello world hello world hello world';
  controller: TextAreaController = new TextAreaController();
  @State ell :EllipsisMode[]=[EllipsisMode.START,EllipsisMode.CENTER,EllipsisMode.END]
  @State index :number = 0

  build() {
    Column() {
      TextArea({
        text: this.text,
        placeholder: 'placeholder',
        controller: this.controller
      })
        .placeholderColor(Color.Red)
        .textAlign(TextAlign.Center)
        .caretColor(Color.Green)
        .caretStyle({ width: '2vp' })
        .fontStyle(FontStyle.Italic)
        .fontWeight(FontWeight.Bold)
        .copyOption(CopyOptions.LocalDevice)
        .enableKeyboardOnFocus(false)
        .selectionMenuHidden(false)
        .barState(BarState.On)
        .type(TextAreaType.NORMAL)
        .selectedBackgroundColor(Color.Orange)
        .textOverflow(TextOverflow.MARQUEE)
        .textIndent(2)
        .halfLeading(true)
        .minFontScale(1)
        .maxFontScale(2)
        .maxLines(1)
        .ellipsisMode(this.ell[this.index])
        .enablePreviewText(true)
        .enableHapticFeedback(true)
        .style(TextContentStyle.DEFAULT)
        .stopBackPress(false)
        .width(336)
        .height(56)
        .margin(20)
        .fontSize(16)
        .onEditChange((isEditing: boolean) => {
          console.log(`isEditing ${isEditing}`);
        })
        .onCopy((value) => {
          console.log(`copy ${value}`);
        })
        .onCut((value) => {
          console.log(`cut ${value}`);
        })
        .onPaste((value, event) => {
          if (event.preventDefault) {
            event.preventDefault();
          }
          console.log(`paste:${value}`);
          this.text = value;
        })
        .onTextSelectionChange((start: number, end: number) => {
          console.log(`onTextSelectionChange start ${start}, end ${end}`);
        })
        .onContentScroll((totalOffsetX: number, totalOffsetY: number) => {
          console.log(`onContentScroll offsetX ${totalOffsetX}, offsetY ${totalOffsetY}`);
        })
        .id('UiComponentTextInputEllipsisMode11_01')
      Button('change ellipsisMode')
        .onClick(()=>{
          this.index = this.index %3;
          this.index++;
        })
        .id('UiComponentTextInputEllipsisMode11_02')
    }.width('100%').height('100%').backgroundColor('#F1F3F5')
  }
}

