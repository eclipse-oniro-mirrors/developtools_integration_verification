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
import { LengthMetrics } from '@kit.ArkUI'

@Entry
@Component
struct UiComponentTextCommonLineSpace14 {
  private inputTypes: TextAreaType[] = [TextAreaType.EMAIL,TextAreaType.NUMBER,TextAreaType.PHONE_NUMBER];
  private currentIndex: number = 0;
  @State text: string = ''
  @State positionInfo: CaretOffset = { index: 0, x: 0, y: 0 }
  controller: TextAreaController = new TextAreaController()

  build() {
    Column() {
      Text('UiComponentTextCommonLineSpace14')
        .width(380)
        .height(60)
      TextArea({
        text: this.text,
        placeholder: 'The text area can hold an unlimited amount of text. input your word...',
        controller: this.controller
      })
        .placeholderFont({ size: 16, weight: 400 })
        .width(336)
        .height(56)
        .margin(20)
        .fontSize(16)
        .fontColor('#182431')
        .backgroundColor('#FFFFFF')
        .lineSpacing(LengthMetrics.vp(20))
        .style(TextContentStyle.DEFAULT)
        .type(this.inputTypes[this.currentIndex])
        .onChange((value: string) => {
          this.text = value
        })
      Text(this.text)
      Button('Set caretPosition 1')
        .backgroundColor('#007DFF')
        .margin(15)
        .onClick(() => {
          // 设置光标位置到第一个字符后
          this.controller.caretPosition(1)
        })
      Button('Get CaretOffset')
        .backgroundColor('#007DFF')
        .margin(15)
        .onClick(() => {
          this.positionInfo = this.controller.getCaretOffset()
        })

      Button('change type')
        .backgroundColor('#007DFF')
        .id('UiComponentTextCommonLineSpace14')
        .margin(15)
        .onClick(() => {
          this.currentIndex = (this.currentIndex + 1) % this.inputTypes.length;
        })
    }.width('100%').height('100%').backgroundColor('#F1F3F5')
  }
}