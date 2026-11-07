/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
struct DocComponentSlayOut04 {
  @State numbers: String[] = ['0', '1', '2', '3', '4']
  scroller: Scroller = new Scroller()
  @State gridPosition: number = 0
  @State barwidth: number = 5
  @State text : string ='Set the height and position of the scrollBar'

  build() {
    Column({ space: 5 }) {
      Text('scroll')
        .fontColor(0xCCCCCC)
        .fontSize(9)
        .width('90%')
      Grid(this.scroller) {
        ForEach(this.numbers, (day: string) => {
          ForEach(this.numbers, (day: string) => {
            GridItem() {
              Text(day)
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('100%')
                .height(80)
                .textAlign(TextAlign.Center)
            }
          }, (day: string) => day)
        }, (day: string) => day)
      }
      .id('DocComponentSlayOut04')
      .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .friction(0.6)
      .enableScrollInteraction(true)
      .supportAnimation(false)
      .multiSelectable(false)
      .edgeEffect(EdgeEffect.Spring)
      .scrollBar(BarState.On)
      .scrollBarWidth(this.barwidth)
      .scrollBarColor(Color.Grey)
      .width('90%')
      .backgroundColor(0xFAEEE0)
      .height('24.59%')
      .onScrollIndex((first: number, last: number) => {
        console.info(first.toString())
        console.info(last.toString())
      })
      .onScrollBarUpdate((index: number, offset: number) => {
        console.info('XXX' + 'Grid onScrollBarUpdate,index : ' + index.toString() + ',offset' + offset.toString())
        return { totalOffset: (index / 5) * (80 + 10) - offset, totalLength: 80 * 5 + 10 * 4 }
      })
      .onScroll((scrollOffset: number, scrollState: ScrollState) => {
        console.info(scrollOffset.toString())
        console.info(scrollState.toString())
      })
      .onScrollStart(() => {
        console.info('XXX' + 'Grid onScrollStart')
      })
      .onScrollStop(() => {
        console.info('XXX' + 'Grid onScrollStop')
      })
      .onReachStart(() => {
        this.gridPosition = 0
        console.info('XXX' + 'Grid onReachStart')
      })
      .onReachEnd(() => {
        this.gridPosition = 2
        console.info('XXX' + 'Grid onReachEnd')
      })

      Button('change barwidth')
        .onClick(() => {
          this.barwidth+=10
        })
        .id('DocComponentSlayOut04_02')
      Text(this.text)
        .fontSize(16)
        .width('100%')
        .margin(10)
        .fontColor(Color.Gray)
        .height(80)
        .textAlign(TextAlign.Center)
    }
    .width('100%')
    .margin({ top: 5 })
  }
}