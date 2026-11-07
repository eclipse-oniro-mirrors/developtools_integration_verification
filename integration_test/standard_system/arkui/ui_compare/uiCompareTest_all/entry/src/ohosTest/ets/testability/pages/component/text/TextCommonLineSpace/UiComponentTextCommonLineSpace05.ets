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

@Extend(Text)
function linespace05style1(TextAlign: TextAlign) {
  .textAlign(TextAlign)
  .fontSize(12)
  .border({ width: 1 })
  .padding(10)
  .width('100%')
}

@Entry
@Component
struct UiComponentTextCommonLineSpace05 {
  @State text: string = ''
  controller: TextInputController = new TextInputController()

  build() {
    Column() {
      Text('UITwice026')
        .width(380)
        .height(60)
      Text('This is the text with the line height set. This is the text with the line height set.' +
        'This is the text with the line height set. This is the text with the line height set.')
        .linespace05style1(TextAlign.Start)
        .lineHeight(20)
    }
  }
}