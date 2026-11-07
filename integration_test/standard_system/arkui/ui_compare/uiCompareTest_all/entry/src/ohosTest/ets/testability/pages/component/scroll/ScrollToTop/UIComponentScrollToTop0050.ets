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
import { LengthMetrics, uiAppearance } from '@kit.ArkUI';

@Entry
@Component
struct UIComponentScrollToTop0050 {
  @State name: string = 'UIComponentScrollToTop0050';
  @State message: string = this.name;
  @State arr: number[] = [];
  @State backToTop: boolean | undefined | null = false;
  scroller: Scroller = new Scroller();

  build() {
    Scroll(this.scroller) {
      Column() {
        Text(this.message)
          .textAlign(TextAlign.Center)
          .margin(10)

        ForEach(this.arr, (item: number) => {
          Text(item.toString())
            .width('90%')
            .height(150)
            .backgroundColor(0xFFFFFF)
            .borderRadius(15)
            .fontSize(16)
            .textAlign(TextAlign.Center)
            .margin({
              top: 10
            })
        }, (item: string) => item)

      }
      .width('100%')
    }
    .id(this.name + '_01')
    .backToTop(this.backToTop)
    .friction(0.6)
    .backgroundColor('#DCDCDC')
    .width('100%')
    .height('100%')
    .scrollable(ScrollDirection.Vertical)
    .scrollBar(BarState.On)
    .scrollBarColor(Color.Gray)
    .scrollBarWidth(10)
    .friction(0.6)
    .edgeEffect(EdgeEffect.None)
    .onWillScroll((xOffset: number, yOffset: number, scrollState: ScrollState) => {
      console.info(xOffset + ' ' + yOffset);
    })
    .onScrollEdge((side: Edge) => {
      console.info('To the edge');
    })
    .onScrollStop(() => {
      console.info('Scroll Stop');
    })
  }

  aboutToAppear() {
    for (let i = 0; i < 10; i++) {
      this.arr.push(i);
    }
  }

}