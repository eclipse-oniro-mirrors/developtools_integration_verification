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

@Component
@Entry
struct UiComponentWordBreakHyphenation04 {
  build() {
    Column() {
      Text() {
        ContainerSpan() {
          Span('春の風が吹く頃、韓屋村の瓦屋根には新緑が差し込み、중국어で「春眠不覺曉」と詠むように、鳥のさえずり')
            .fontSize('16fp')
            .fontColor(Color.White)
        }
        .textBackgroundStyle({color: '#7F007DFF', radius: '12vp'})
      }
      .width(200)
      .wordBreak(WordBreak.HYPHENATION)
    }.width('100%').alignItems(HorizontalAlign.Center)
  }
}
