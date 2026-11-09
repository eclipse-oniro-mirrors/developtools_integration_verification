/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct TextInput05 {
  @State text: string = '11111111111\n                        \n           \n          \n       '
  controller: TextInputController = new TextInputController();
  @State changeValue: string = ''
  @State submitValue: string = ''
  @State positionInfo: CaretOffset = { index: 0, x: 0, y: 0 }
  @State textHeight:Length = 16
  @State selectedColor:ResourceColor = Color.Blue

  build() {
    Column() {
      TextInput({ text: this.text, controller: this.controller })
        .id('TextInput05_01')
        .style(TextContentStyle.INLINE)
        .selectedBackgroundColor(this.selectedColor)
        .placeholderFont({ size: 16, weight: 400 })
        .width('70%')
        .lineHeight(this.textHeight)
        .height(100)
        .margin(20)
        .fontSize(16)
        .fontColor('#182431')
        .backgroundColor('#FFFFFF')
        .onChange((value: string) => {
          this.text = value;
        })

      Button('Change selectedBackgroundColor')
        .margin({top:30})
        .height(40)
        .id('TextInput05_02')
        .onClick( () => {
          this.selectedColor = Color.Red
        })
    }.width('100%').height('100%').backgroundColor('#F1F3F5')
  }
}
