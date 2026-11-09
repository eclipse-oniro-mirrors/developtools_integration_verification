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

import { WaterFlowDataSource } from './WaterFlowDataSource'

@ObservedV2
class ArrayVehicle {
  @Trace public arr: number[] = [];

  constructor(count: number) {
    for (let i = 1; i <= count; ++i) {
      this.arr.push(i);
    }
  }
}


@ComponentV2
struct RepeatChildItem {
  @Param item: number = 0;

  aboutToAppear(): void {
    console.info('item:' + this.item)
  }

  build() {
    Column(){
      Text('N' + this.item).fontSize(12).height('16')
    }

  }
}

@Entry
@Component
struct RepeatWaterFlow01 {
  arrayVehicle: ArrayVehicle = new ArrayVehicle(100)
  @State totalCount: number = this.arrayVehicle.arr.length
  @State minSize: number = 50
  @State maxSize: number = 100
  scroller: Scroller = new Scroller()
  @State colors: number[] = [0xFFC0CB, 0xDA70D6, 0x6B8E23, 0x6A5ACD, 0x00FFFF, 0x00FF7F]
  dataSource: WaterFlowDataSource = new WaterFlowDataSource()
  private itemWidthArray: number[] = []
  private itemHeightArray: number[] = []
  @State index: number = 0;
  @State onReachText:string = ''
  @State onText1:string = ''
  @State onText2:string = ''
  @State onScrollFrameBeginText:string = ''
  @State onScrollIndex:string = '';
  @State sections: WaterFlowSections = new WaterFlowSections();
  sectionMargin: Margin = { top: 10, left: 5, bottom: 10, right: 5 };
  dataCount: number = this.dataSource.totalCount();

  lastSection: SectionOptions = {
    itemsCount: 20,
    crossCount: 2,
    onGetItemMainSizeByIndex: (index: number) => {
      return this.itemHeightArray[index % 100];
    }
  };
  oneColumnSection: SectionOptions = {
    itemsCount: 4,
    crossCount: 1,
    columnsGap: '5vp',
    rowsGap: 10,
    margin: this.sectionMargin,
    onGetItemMainSizeByIndex: (index: number) => {
      return this.itemHeightArray[index % 100];
    }
  };
  twoColumnSection: SectionOptions = {
    itemsCount: 2,
    crossCount: 2,
    onGetItemMainSizeByIndex: (index: number) => {
      return 100;
    }
  };

  // 计算FlowItem宽/高
  getSize() {
    let ret = Math.floor(Math.random() * this.maxSize)
    return 50
  }

  // 设置FlowItem宽/高数组
  setItemSizeArray() {
    for (let i = 0; i < 100; i++) {
      this.itemWidthArray.push(this.getSize())
      this.itemHeightArray.push(this.getSize())
    }
  }

  aboutToAppear() {
    this.setItemSizeArray()
    // 初始化瀑布流分组信息
    let sectionOptions: SectionOptions[] = [];
    let count = 0;
    let oneOrTwo = 0;
    while (count < this.dataCount) {
      if (this.dataCount - count < 20) {
        this.lastSection.itemsCount = this.dataCount - count;
        sectionOptions.push(this.lastSection);
        break;
      }
      if (oneOrTwo++ % 2 == 0) {
        sectionOptions.push(this.oneColumnSection);
        count += this.oneColumnSection.itemsCount;
      } else {
        sectionOptions.push(this.twoColumnSection);
        count += this.twoColumnSection.itemsCount;
      }
    }
    this.sections.splice(0, 0, sectionOptions);
  }

  build() {
    Column({ space: 2 }) {
      Row(){
        Button('scroll bottom')
          .id('repeatWaterFlow01_01')
          .onClick((event: ClickEvent) => {
            this.scroller.scrollEdge(Edge.Bottom)
          })
        Button('scroll 300')
          .id('repeatWaterFlow01_02')
          .height('5%')
          .onClick(() => {
            // 点击后下滑指定距离300vp
            this.scroller.scrollBy(0, 300)
          })
          .margin({ left: 20 })
      }.margin(5)

      WaterFlow({ scroller: this.scroller }) {
        Repeat(this.arrayVehicle.arr)
          .virtualScroll({ totalCount: this.totalCount })
          .key((item, index) => `${index}:${item}`)
          .each((ri) => {
            FlowItem() {
              RepeatChildItem({ item: ri.item })
            }
            .width('100%')
            .height(this.itemHeightArray[ri.item % 100])
            .backgroundColor(this.colors[ri.item % 5])
          })
      }
      .id('flowRepeat_event')
      .columnsTemplate('1fr 1fr 1fr')
      .columnsGap(10)
      .rowsGap(5)
      .width('100%')
      .height('60%')
      .backgroundColor(0xFAEEE0)
      .layoutWeight(FlexDirection.Column)
      .enableScrollInteraction(true)
      .onScrollIndex((first: number, last: number) => {
        this.onScrollIndex = 'success'
        console.info('onScrollIndex first:' + first.toString() + ' last:' + last.toString())
      })
      .onReachStart(() => {
        this.index++
        console.info('waterFlow reach start')
      })
      .onReachEnd(() => {
        this.onReachText = 'success'
        console.info('waterFlow reach end')
      })
      .onWillScroll((scrollOffset: number, scrollState: ScrollState) => {
        this.onText1 = 'success'
        console.info(`onWillScroll scrollState = ${scrollState[scrollState]}, offset = ${scrollOffset}`)
      })
      .onDidScroll((scrollOffset: number, scrollState: ScrollState) => {
        this.onText2 = 'success'
        console.info(`onWillScroll scrollState = ${scrollState[scrollState]}, offset = ${scrollOffset}`)
      })
      .onScrollFrameBegin((offset: number, state: ScrollState) => {
        this.onScrollFrameBeginText = 'success'
        console.info('waterFlow scrollFrameBegin offset: ' + offset + ' state: ' + state.toString())
        return { offsetRemain: offset }
      })
    }
  }
}