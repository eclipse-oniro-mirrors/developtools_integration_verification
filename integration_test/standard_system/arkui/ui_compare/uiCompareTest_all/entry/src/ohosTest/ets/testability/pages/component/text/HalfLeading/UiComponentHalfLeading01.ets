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
import { LengthMetrics } from '@kit.ArkUI';

@Entry
@Component
struct UiComponentHalfLeading01 {
  @State text: string = 'hello world hello world hello world hello world';
  @State positionInfo: CaretOffset = { index: 0, x: 0, y: 0 };
  @State linespace:number=10
  controller: TextAreaController = new TextAreaController();

  build() {
    Column() {
      TextArea({
        text: this.text,
        placeholder: '',
        controller: this.controller
      })
        .placeholderFont({ size: 16, weight: 400 })
        .width(336)
        .height(120)
        .margin(20)
        .fontSize(16)
        .lineHeight(50)
        .lineSpacing(LengthMetrics.fp(this.linespace))
        .fontColor('#182431')
        .halfLeading(true)
        .backgroundColor('#FFFFFF')
        .onChange((value: string) => {
          this.text = value;
        })
      TextArea({
        text: this.text,
        placeholder: '',
        controller: this.controller
      })
        .placeholderFont({ size: 16, weight: 400 })
        .width(336)
        .height(120)
        .margin(20)
        .fontSize(16)
        .lineHeight(50)
        .fontColor('#182431')
        .lineSpacing(LengthMetrics.fp(this.linespace))
        .halfLeading(false)
        .backgroundColor('#FFFFFF')
        .onChange((value: string) => {
          this.text = value;
        })
      Button('Set caretPosition 1')
        .backgroundColor('#007DFF')
        .margin(15)
        .onClick(() => {
          this.controller.caretPosition(1);
        })
      Button('change linespacing')
        .backgroundColor('#007DFF')
        .margin(15)
        .onClick(() => {
          this.linespace+=10;
        })
        .id('UiComponentHalfLeading01')
    }.width('100%').height('100%').backgroundColor('#F1F3F5')
  }
}
