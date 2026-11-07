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
import { WaterFlowDataSource } from '../ScrollScrollAccessible/WaterFlowDataSource';

@Entry
@Component
struct UIComponentScrollBarVelocity001 {
  private caseName: string = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_VELOCITY_0190';
  private textMessage: string = 'WaterFlow滑动动画被打断';
  @State minSize: number = 80;
  @State maxSize: number = 180;
  @State fontSize: number = 24;
  @State colors: number[] = [0xFFC0CB, 0xDA70D6, 0x6B8E23, 0x6A5ACD, 0x00FFFF, 0x00FF7F];
  scroller1: Scroller = new Scroller();
  scroller2: Scroller = new Scroller();
  dataSource: WaterFlowDataSource = new WaterFlowDataSource();
  private itemWidthArray: number[] = [];
  private itemHeightArray: number[] = [];

  getSize() {
    let ret = Math.floor(Math.random() * this.maxSize);
    return (ret > this.minSize ? ret : this.minSize);
  }

  setItemSizeArray() {
    for (let i = 0; i < 100; i++) {
      this.itemWidthArray.push(this.getSize());
      this.itemHeightArray.push(this.getSize());
    }
  }

  aboutToAppear() {
    this.setItemSizeArray();
  }

  @Builder
  itemFoot() {
    Column() {
      Text(`Footer`)
        .fontSize(10)
        .backgroundColor(Color.Red)
        .width(50)
        .height(50)
        .align(Alignment.Center)
        .margin({ top: 2 })
    }
  }

  build() {
    Column() {
      Column() {
        Text(this.textMessage)
          .fontSize(20)
          .textAlign(TextAlign.Center)
          .fontStyle(FontStyle.Normal)
          .margin(10)
          .key('UIComponentScrollBarVelocity001')
      }.width('100%').height('10%').justifyContent(FlexAlign.Center)
      Column() {
        Column() {
          Text('不被打断')
            .fontSize(20)
            .textAlign(TextAlign.Center)
            .fontStyle(FontStyle.Normal)
            .margin(10)
            .key('UIComponentScrollBarVelocity001')
        }.width('100%').height('10%').justifyContent(FlexAlign.Center).backgroundColor(0xfdfaCC)
        Column() {
          WaterFlow({ scroller: this.scroller1 }) {
            LazyForEach(this.dataSource, (item: number) => {
              FlowItem() {
                Column() {
                  Text('N' + item)
                    .textAlign(TextAlign.Center)
                    .fontStyle(FontStyle.Normal)
                }
              }
              .onAppear(() => {
                if (item + 20 == this.dataSource.totalCount()) {
                  for (let i = 0; i < 10; i++) {
                    this.dataSource.addLastItem();
                  }
                }
              })
              .width('30%')
              .height('70%')
              .backgroundColor(this.colors[item % 5])
            }, (item: string) => item)
          }
          .id('WaterFlow1')
          .layoutDirection(FlexDirection.RowReverse)
          .scrollBar(BarState.On)
          .columnsTemplate('1fr 1fr')
          .columnsGap(10)
          .rowsGap(5)
          .backgroundColor(0xFAEEE0)
          .width('100%')
          .height('100%')
          .onDidScroll((scrollOffset: number, scrollState: ScrollState) => {
            console.info(`onScroll scrollState = ScrollState` + scrollState + `, scrollOffset = ` + scrollOffset);
          })
          .backgroundColor(0xDCDCDC)
        }.width('100%').height('40%')
        Column() {
          Text('被打断')
            .fontSize(20)
            .textAlign(TextAlign.Center)
            .fontStyle(FontStyle.Normal)
            .margin(10)
            .key('UIComponentScrollBarVelocity001')
        }.width('100%').height('10%').justifyContent(FlexAlign.Center).backgroundColor(0xfdfaCC)
        Column() {
          WaterFlow({ scroller: this.scroller2 }) {
            LazyForEach(this.dataSource, (item: number) => {
              FlowItem() {
                Column() {
                  Text('N' + item)
                    .textAlign(TextAlign.Center)
                    .fontStyle(FontStyle.Normal)
                }
              }
              .onAppear(() => {
                if (item + 20 == this.dataSource.totalCount()) {
                  for (let i = 0; i < 10; i++) {
                    this.dataSource.addLastItem();
                  }
                }
              })
              .width('30%')
              .height('70%')
              .backgroundColor(this.colors[item % 5])
            }, (item: string) => item)
          }
          .id('WaterFlow2')
          .layoutDirection(FlexDirection.RowReverse)
          .scrollBar(BarState.On)
          .columnsTemplate('1fr 1fr')
          .columnsGap(10)
          .rowsGap(5)
          .backgroundColor(0xFAEEE0)
          .width('100%')
          .height('100%')
          .onDidScroll((scrollOffset: number, scrollState: ScrollState) => {
            console.info(`onScroll scrollState = ScrollState` + scrollState + `, scrollOffset = ` + scrollOffset);
          })
          .backgroundColor(0xDCDCDC)
        }.width('100%').height('40%')
      }
      .width('100%')
      .height('70%')
      Column() {
        Button('scrollEdge(Edge.Bottom)')
          .id('Bottom')
          .stateEffect(true)
          .buttonStyle(ButtonStyleMode.NORMAL)
          .type(ButtonType.Capsule)
          .onClick(() => {
            this.scroller1.scrollEdge(Edge.Bottom);
            this.scroller2.scrollEdge(Edge.Bottom);
          })
        Button('fling(1000)')
          .id('fling')
          .stateEffect(true)
          .buttonStyle(ButtonStyleMode.NORMAL)
          .type(ButtonType.Capsule)
          .onClick(() => {
            this.scroller1.fling(1000);
            this.scroller2.fling(1000);
          })
      }
      .margin(20)
      .backgroundColor(0xDCDCDC)
    }
  }
}