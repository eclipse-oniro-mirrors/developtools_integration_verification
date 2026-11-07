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
import { TextClockModifier } from '@kit.ArkUI'

@Entry
@Component
struct TextClockPrefixed0090 {
  @State textClockModifier: TextClockModifier = new TextClockModifier()
    .format('HH')
    .dateTimeOptions({
      hour: 'numeric'
    })

  build() {
    Column() {
      TextClock({
        timeZoneOffset: -8,
        controller: new TextClockController()
      })
        .attributeModifier(this.textClockModifier)
        .id('text_clock_prefixed_0090')
        .fontSize(20)
        .fontColor(Color.Black)
        .margin(20)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}


