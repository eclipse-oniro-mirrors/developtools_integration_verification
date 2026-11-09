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
struct UIComponentScrollToTop0310 {
  @State name: string = 'UIComponentScrollToTop0310';
  @State message: string = this.name;
  @State arr: number[] = [];
  @State backToTop: boolean | undefined | null = undefined;
  scroller: Scroller = new Scroller();

  build() {
    Column() {
      Text(this.message)
        .textAlign(TextAlign.Center)
        .margin(10)

      Grid(this.scroller) {
        ForEach(this.arr, (item: number) => {
          GridItem() {
            Text('item' + item)
              .width('100%')
              .height(150)
              .backgroundColor(Color.White)
              .borderRadius(15)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .margin({
                top: 10
              })
          }
        }, (item: string) => item)
      }
      .id(this.name + '_01')
      .backToTop(this.backToTop)
      .columnsTemplate('1fr 1fr 1fr')
      .direction(Direction.Auto)
      .columnsGap(10)
      .rowsGap(10)
      .friction(0.6)
      .backgroundColor('#DCDCDC')
      .enableScrollInteraction(true)
      .scrollBar(BarState.On)
      .scrollBarColor(Color.Gray)
      .width('90%')
      .height('80%')
      .margin(10)
      .margin({
        top: 10,
        bottom: 10,
        left: 5,
        right: 5
      })

    }
    .width('100%')

  }

  aboutToAppear() {
    for (let i = 0; i < 20; i++) {
      this.arr.push(i);
    }
  }

}