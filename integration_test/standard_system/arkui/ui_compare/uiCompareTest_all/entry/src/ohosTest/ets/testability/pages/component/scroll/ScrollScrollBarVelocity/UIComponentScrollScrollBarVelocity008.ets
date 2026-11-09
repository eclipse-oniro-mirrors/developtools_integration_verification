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
struct UIComponentScrollScrollBarVelocity008 {
  @State message: string = 'Hello'
  @State arrNum: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
  @State arrStr: string[] = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j'];
  private innerScroller1: Scroller = new Scroller();
  private innerScroller2: Scroller = new Scroller();

  build() {
    Column() {
      Text(this.message)
        .fontSize(20)
        .fontColor(Color.Blue)
        .margin({ top: 20 })
        .key('UIComponentScrollScrollBarVelocity008_001')
        .height('5%')

      Scroll() {
        Column() {
          Text('Scroll Area')
            .width('100%')
            .height('10%')
            .backgroundColor('#0080DC')
            .textAlign(TextAlign.Center)
          Scroll(this.innerScroller1) {
            Column() {
              ForEach(this.arrNum, (item: number) => {
                Text(item.toString())
                  .width('90%')
                  .height(90)
                  .backgroundColor(0xFFFFFF)
                  .borderRadius(15)
                  .fontSize(16)
                  .textAlign(TextAlign.Center)
                  .margin({ top: 10 })
              }, (item: string) => item)
            }
            .width('100%')
          }
          .scrollBar(BarState.On)
          .scrollable(ScrollDirection.Vertical)
          .scrollBarColor(Color.Blue)
          .initialOffset({ yOffset: 500 })
          .height('35%')

          Scroll(this.innerScroller2) {
            Column() {
              ForEach(this.arrStr, (item: number) => {
                Text(item.toString())
                  .width('90%')
                  .height(90)
                  .backgroundColor(0xFFFFFF)
                  .borderRadius(15)
                  .fontSize(16)
                  .textAlign(TextAlign.Center)
                  .margin({ top: 10 })
              }, (item: string) => item)
            }
            .width('100%')
          }
          .scrollBar(BarState.On)
          .scrollable(ScrollDirection.Vertical)
          .scrollBarColor(Color.Blue)
          .initialOffset({ yOffset: 500 })
          .height('35%')

          Button('fling 1000')
            .id('scroll')
            .stateEffect(true)
            .onClick(() => {
              this.innerScroller1.fling(1000)
            })
        }
      }
    }
    .backgroundColor(0xDCDCDC)
    .width('100%')
  }
}