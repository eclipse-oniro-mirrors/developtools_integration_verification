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

import { ArcList, ArcListItem, LengthMetrics, ArcListAttribute, ArcListItemAttribute } from '@kit.ArkUI';

@Entry
@Component
struct ArcList06 {
  @State arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
  @State scrollStartCount: number = 0;
  @State scrollStopCount: number = 0;
  @State willScrollCount: number = 0;
  @State didScrollCount: number = 0;

  @Builder
  buildArcList() {
    Stack() {
      Column() {
      }
      .justifyContent(FlexAlign.Center)
      .width('414px')
      .height('414px')
      .backgroundColor(Color.White)

      ArcList({ initialIndex: 0 }) {
        ForEach(this.arr, (item: number, index: number) => {
          ArcListItem() {
            Text('Item ' + item)
              .fontSize(16)
              .width('100%')
              .height(80)
              .textAlign(TextAlign.Center)
              .backgroundColor(0xE0E0E0)
              .borderRadius(10)
          }
          .align(Alignment.Center)
        }, (item: number, index: number) => (item + index).toString())
      }
      .id('arcList_06')
      .space(LengthMetrics.px(10))
      .scrollBar(BarState.On)
      .onScrollStart(() => {
        this.scrollStartCount++;
      })
      .onScrollStop(() => {
        this.scrollStopCount++;
      })
      .onWillScroll((offset: number, state: ScrollState) => {
        this.willScrollCount++;
      })
      .onDidScroll((offset: number, state: ScrollState) => {
        this.didScrollCount++;
      })
      .width('414px')
      .layoutWeight(1)
    }
    .align(Alignment.Center)
    .width('414px')
    .height('414px')
  }

  build() {
    Column() {
      Text('ArcList scrollBar抛滑滚动条测试')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Text(`onScrollStart: ${this.scrollStartCount}, onScrollStop: ${this.scrollStopCount}`)
        .fontSize(12)
        .margin({ bottom: 5 })
      Text(`onWillScroll: ${this.willScrollCount}, onDidScroll: ${this.didScrollCount}`)
        .fontSize(12)
        .margin({ bottom: 10 })

      this.buildArcList()
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(0xF5F5F5)
  }
}

