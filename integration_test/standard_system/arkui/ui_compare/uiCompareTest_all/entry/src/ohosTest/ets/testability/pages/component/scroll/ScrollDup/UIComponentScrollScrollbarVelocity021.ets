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
import { LengthMetrics, LengthUnit } from '@kit.ArkUI';

@Entry
@Component
struct UIComponentScrollScrollbarVelocity021 {
  scroller: Scroller = new Scroller()
  @State numbers1: String[] = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j']
  build() {
    Column({ space: 5 }) {
      Button('test')
        .onClick(()=>{
          this.scroller.scrollEdge(Edge.End)
          this.scroller.fling(1000)
        })
        .id('ScrollbarVelocity021')
        .borderWidth(1)
      Grid() {
        GridItem() {
          Grid(this.scroller) {
            ForEach(this.numbers1, (day2: string) => {
              ForEach(this.numbers1, (day: string) => {
                GridItem() {
                  Text(day)
                    .fontSize(16)
                    .backgroundColor(0xF9CF93)
                    .width('100%')
                    .height('100%')
                    .textAlign(TextAlign.Center)
                }
              }, (day: string) => day)
            }, (day2: string) => day2)
          }
          .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
          .columnsGap(10)
          .rowsGap(10)
          .width('90%')
          .backgroundColor(0xFAEEE0)
          .height('24.59%')
        }
      }
    }.width('100%')
  }
}