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

import { LengthUnit, LengthMetrics } from '@kit.ArkUI';

@Entry
@Component
struct UiComponentBlankLineSelected06 {
  @State start: number = 8;
  @State end: number = 10;
  build() {
    Row() {
      Column() {
        Text('         ') {
          Span('SpanOne')
            .fontSize(10)
            .baselineOffset(new LengthMetrics(20, LengthUnit.VP))
          Span('                                        ')
          Span('SpanTwo')
            .fontSize(10)
            .baselineOffset(new LengthMetrics(0, LengthUnit.VP))
        }
        .fontSize(12)
        .border({ width: 1 })
        .lineHeight(20)
        .margin(30)
        .copyOption(CopyOptions.InApp)
        .selection(this.start, this.end)
        .draggable(true)
        .caretColor(Color.Red)
        .selectedBackgroundColor(Color.Blue)
        .enableHapticFeedback(true)
        .backgroundColor(Color.Blue)
      }
      .width('100%')
    }
    .height('100%')
  }
}



