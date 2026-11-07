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
struct UiComponentTextCommonLineSpace13 {
  controller: TextAreaController = new TextAreaController()
  @State text: string = ''
  build() {
    Column({ space: 8 }) {
      TextInput({ text: this.text, placeholder: 'input your word...', controller: this.controller })
        .placeholderColor(Color.Grey)
        .placeholderFont({ size: 14, weight: 400 })
        .caretColor(Color.Blue)
        .width('95%')
        .minFontSize('20px')
        .maxFontSize('20fp')
        .heightAdaptivePolicy(TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST)
        .height(40)
        .margin(20)
        .type(InputType.Password)
        .showPassword(true)
        .fontSize(14)
        .id('UiComponentTextCommonLineSpace13')
        .fontColor(Color.Black)
        .onChange((value: string) => {
          this.text = value
        })
    }
  }
}
