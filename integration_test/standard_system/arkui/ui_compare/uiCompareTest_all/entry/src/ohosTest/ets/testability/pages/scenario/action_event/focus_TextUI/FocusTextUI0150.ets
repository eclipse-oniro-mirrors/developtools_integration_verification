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
struct FocusTextUI0150 {
  build() {
    Column() {
      Text('第一段测试文本')
        .minFontSize(5)
        .maxFontSize(20)
        .maxLines(1)
        .padding(10)

      Text('第二段测试文本')
        .minFontSize(5)
        .maxFontSize(20)
        .maxLines(3)
        .padding(10)

      Text('第s三段测试文本')
        .minFontSize(5)
        .maxFontSize(20)
        .maxLines(2)
        .padding(10)

      Text('第四段测试文本')
        .minFontSize('5')
        .maxFontSize('20')
        .maxLines(1)
        .padding(10)

      Text('第五段测试文本')
        .minFontSize($r('app.string.string_value_5'))
        .maxFontSize($r('app.string.string_value_20'))
        .maxLines(1)
        .padding(10)

      Text('第六段测试文本')
        .minFontSize($r('app.float.float_value_5'))
        .maxFontSize($r('app.float.float_value_20'))
        .maxLines(1)
        .padding(10)

      Text('第七段测试文本')
        .minFontSize($r('app.integer.integer_value_5'))
        .maxFontSize($r('app.integer.integer_value_20'))
        .maxLines(1)
        .padding(10)

      Text('第八段测试文本')
        .minFontSize(5)
        .maxFontSize('20')
        .maxLines(1)
        .padding(10)

      Text('第九段测试文本')
        .minFontSize('5')
        .maxFontSize($r('app.string.string_value_20'))
        .maxLines(1)
        .padding(10)
    }
    .width('100%')
    .height('100%')
  }
}
