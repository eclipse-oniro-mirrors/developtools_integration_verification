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
struct UiComponentTextInputEllipsisMode13 {
  @State text: string = 'hello world hello world hello world' +
    'hello world hello world hello world';
  controller: TextInputController = new TextInputController();
  controller2: TextAreaController = new TextAreaController();
  @State ell :EllipsisMode[]=[EllipsisMode.START,EllipsisMode.CENTER,EllipsisMode.END]
  @State index :number = 0
  @State mywidth :number = 100

  build() {
    Column() {
      TextInput({
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
        .type(InputType.Normal)
        .selectedBackgroundColor(Color.Orange)
        .textOverflow(TextOverflow.Ellipsis)
        .textIndent(2)
        .halfLeading(true)
        .minFontScale(1)
        .maxFontScale(2)
        .maxLines(1)
        .ellipsisMode(EllipsisMode.END)
        .enablePreviewText(true)
        .enableHapticFeedback(true)
        .style(TextContentStyle.INLINE)
        .stopBackPress(false)
        .width(this.mywidth)
        .height(56)
        .margin(20)
        .fontSize(16)
      TextArea({
        text: this.text,
        placeholder: 'placeholder',
        controller: this.controller2
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
        .textOverflow(TextOverflow.Ellipsis)
        .textIndent(2)
        .halfLeading(true)
        .minFontScale(1)
        .maxFontScale(2)
        .maxLines(1)
        .ellipsisMode(EllipsisMode.END)
        .enablePreviewText(true)
        .enableHapticFeedback(true)
        .style(TextContentStyle.INLINE)
        .stopBackPress(false)
        .width(this.mywidth)
        .height(56)
        .margin(20)
        .fontSize(16)
      Button('change size')
        .onClick(()=>{
          this.mywidth=200;
        })
        .id('UiComponentTextInputEllipsisMode13_01')
    }.width('100%').height('100%').backgroundColor('#F1F3F5')
  }
}
