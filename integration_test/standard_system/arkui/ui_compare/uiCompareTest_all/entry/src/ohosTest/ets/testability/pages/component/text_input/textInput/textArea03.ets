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
struct TextArea03 {
  @State text: string = '11111111111\n                        \n           \n          \n       '
  controller1: TextInputController = new TextInputController();
  controller2: TextAreaController = new TextAreaController();
  @State changeValue: string = ''
  @State submitValue: string = ''
  @State positionInfo: CaretOffset = { index: 0, x: 0, y: 0 }
  @State textHeight:Length = 16
  @State selectedColor:ResourceColor = Color.Blue

  build() {
    Column() {
      TextArea({
        text: this.text,
        placeholder: 'The text area can hold an unlimited amount of text. input your word...',
        controller: this.controller2
      })
        .id('TextArea03_01')
        .selectedBackgroundColor(this.selectedColor)
        .style(TextContentStyle.INLINE)
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

      TextInput({ text: this.text, controller: this.controller1 })
        .id('TextArea03_02')
        .style(TextInputStyle.Inline)
        .placeholderFont({ size: 16, weight: 400 })
        .width('70%')
        .height(100)
        .maxLength(200)
        .showUnderline(true)
        .showCounter(true,
          { thresholdPercentage: 50, highlightBorder: true })//计数器显示效果为用户当前输入字符数/最大字符限制数。最大字符限制数通过maxLength()接口设置。
        //如果用户当前输入字符数达到最大字符限制乘50%（thresholdPercentage）。字符计数器显示。
        //用户设置highlightBorder为false时，配置取消红色边框。不设置此参数时，默认为true。
        .onChange((value: string) => {
          this.text = value;
        })
    }.width('100%').height('100%').backgroundColor('#F1F3F5')
  }
}
