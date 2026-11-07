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
struct UIComponentScrollScrollbarScrolledge003 {
  scroller: Scroller = new Scroller()
  @State numbers1: String[] = ['0', '1', '2', '3', '4']
  @State numbers2: String[] = ['0', '1','2','3','4','5']
  build() {
    Column({ space: 5 }) {
      Button('test')
        .onClick(()=>{
          this.scroller.scrollEdge(Edge.End, {velocity:100})
        })
        .id('ScrollbarScrollEdge003')
        .borderWidth(1)
      Grid(this.scroller) {
        ForEach(this.numbers1, (day: string) => {
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
        }, (day: string) => day)
      }
      .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .width('90%')
      .backgroundColor(0xFAEEE0)
      .height('24.59%')
    }.width('100%')
  }
}