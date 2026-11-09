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
struct UiComponentTextCommonLineSpace01 {
  @State text: string = ''
  controller: TextInputController = new TextInputController()

  build() {
    Column() {
      Text('UITwice001')
        .width(380)
        .height(60)
      TextInput({ placeholder: 'input ...', controller: this.controller })
        .width(380)
        .height(60)
        .minFontSize('20px')
        .maxFontSize('20fp')
        .heightAdaptivePolicy(TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST)
        .type(InputType.Password)
        .showPassword(true)
        .caretColor(Color.Blue)
        .fontFeature('"subs" 1')
        .id('TextInput001')
        .cancelButton({
          style: CancelButtonStyle.CONSTANT,
          icon: {
            size: 45,
            src: $r('app.media.icon'),
            color: Color.Blue
          }
        })
        .onChange((value: string) => {
          this.text = value
        })
    }
  }
}