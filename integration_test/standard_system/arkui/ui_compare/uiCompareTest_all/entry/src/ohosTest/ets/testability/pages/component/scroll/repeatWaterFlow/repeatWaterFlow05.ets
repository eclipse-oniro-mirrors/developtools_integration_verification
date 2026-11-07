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
    Column() {
      Text('N' + this.item).fontSize(12).height('16')
    }

  }
}

@Entry
@Component
struct RepeatWaterFlow05 {
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
  @State onReachText: string = ''
  @State onText1: string = ''
  @State onText2: string = ''
  @State onScrollFrameBeginText: string = '';
  @State onScrollIndex: string = '';
  @State scrollInfo: string = 'Na';
  @State columnsTemplate:string = '1fr 1fr'

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
  }

  build() {
    Column({ space: 2 }) {
      Row() {
        Button('scroll bottom')
          .id('repeatWaterFlow05_01')
          .onClick((event: ClickEvent) => {
            this.scroller.scrollEdge(Edge.Bottom)
          })
        Button('scroll 300')
          .id('repeatWaterFlow05_02')
          .height('5%')
          .onClick(() => {
            // 点击后下滑指定距离300vp
            this.scroller.scrollBy(0, 300)
          })
          .margin({ left: 20 })
      }.margin(5)

      Text(this.scrollInfo)
        .height(40)
        .fontSize(15)
        .fontColor(Color.Black)
        .width('60%')
        .border({ width: 1 })
        .lineHeight(20)
        .margin(15)

      Button('change columnsTemplate')
        .id('repeatWaterFlow05_03')
        .height('5%')
        .margin({ top: 10 })
        .onClick(() => {
          this.columnsTemplate = '1fr 1fr 1fr'
        })

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
      .cachedCount(20)
      .id('flowRepeat_event')
      .columnsTemplate(this.columnsTemplate)
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