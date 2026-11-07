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
struct UiComponentTextCommonLineSpace12 {
  controller: TextAreaController = new TextAreaController()
  @State text: string = ''
  build() {
    Column({ space: 8 }) {
      TextArea({
        text: this.text,
        placeholder: 'The text area can hold an unlimited amount of text. input your word...',
        controller: this.controller
      })
        .placeholderFont({ size: 16, weight: 400 })
        .width(200)
        .height(100)
        .margin(20)
        .maxLines(2)
        .fontSize(16)
        .fontColor('#182431')
        .lineSpacing(LengthMetrics.vp(20))
        .id('UiComponentTextCommonLineSpace12')
        .backgroundColor('#FFFFFF')
        .onChange((value: string) => {
          this.text = value
        })
    }
  }
}
