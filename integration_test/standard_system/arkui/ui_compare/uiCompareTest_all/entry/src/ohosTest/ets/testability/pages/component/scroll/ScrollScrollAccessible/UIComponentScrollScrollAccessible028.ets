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
struct UIComponentScrollScrollAccessible028 {
  @State message: string = 'Hello'
  @State scrollOffSet: number = 0;
  @State numbers: String[] = ['0', '1', '2', '3', '4', '5']
  private scroller: Scroller = new Scroller()
  private layoutOptions: GridLayoutOptions = {
    regularSize: [1, 1],
    irregularIndexes: [0, 6],
  }

  build() {
    Column() {
      Text(this.message)
        .fontSize(20)
        .fontColor(Color.Blue)
        .margin({ top: 20 })
        .key('UIComponentScrollScrollAccessible028_001')
      Grid(this.scroller, this.layoutOptions) {
        ForEach(this.numbers, (day: string) => {
          ForEach(this.numbers, (day: string) => {
            GridItem() {
              Text(day)
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('100%')
                .height(80)
                .textAlign(TextAlign.Center)
            }.selectable(false)
          }, (day: string) => day)
        }, (day: string) => day)
      }
      .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .multiSelectable(true)
      .scrollBar(BarState.Off)
      .width('90%')
      .backgroundColor(0xFAEEE0)
      .height('75%')
      .scrollBar(BarState.On)
      .scrollBarColor(Color.Blue)
      .scrollBarWidth(10)
      .onDidScroll((scrollOffset: number, scrollState: ScrollState) => {
        console.info(`onScroll scrollState = ScrollState` + scrollState + `, scrollOffset = ` + scrollOffset);
        this.scrollOffSet += scrollOffset;
      })
      .backgroundColor(0xDCDCDC)
      .width('100%')
      .height('75%')

      Column() {
        Text('scrollOffSet: ' + this.scrollOffSet)
          .fontColor(Color.Black)
          .fontSize(20)
      }
      .height('10%')
      .width('100%')
      .backgroundColor(0xDCDCDC)
    }
  }
}