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

import { WaterFlowDataSource } from './WaterFlowDataSource';
import { LengthMetrics } from '@kit.ArkUI';

@Entry
@Component
struct WaterFlowFad10 {
  @State minSize: number = 80;
  @State maxSize: number = 180;
  @State fontSize: number = 24;
  @State colors: number[] = [0xFFC0CB, 0xDA70D6, 0x6B8E23, 0x6A5ACD, 0x00FFFF, 0x00FF7F];
  @State scrollSource: string = 'Na';
  @State scrollInfo: string = 'Na';
  scroller: Scroller = new Scroller();
  dataSource: WaterFlowDataSource = new WaterFlowDataSource();
  private itemWidthArray: number[] = [];
  private itemHeightArray: number[] = [];

  // 计算FlowItem宽/高
  getSize() {
    let ret = Math.floor(Math.random() * this.maxSize);
    return (ret > this.minSize ? ret : this.minSize);
  }

  // 设置FlowItem的宽/高数组
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
    Column({ space: 2 }) {
      WaterFlow({scroller:this.scroller, layoutMode: WaterFlowLayoutMode.SLIDING_WINDOW}) {
        LazyForEach(this.dataSource, (item: number) => {
          FlowItem() {
            Column() {
              Text('N' + item).fontSize(12).height('16')
              // 存在对应的jpg文件才会显示图片
              Image($r('app.media.icon'))
                .height(60)
                .objectFit(ImageFit.Fill)
                .width('80%')
                .layoutWeight(1)
            }
          }
          .width('100%')
          .height(this.itemHeightArray[item % 100])
          .backgroundColor(this.colors[item % 5])
        }, (item: string) => item)
      }
      .onWillScroll((scrollOffset: number, scrollState: ScrollState, scrollSource: ScrollSource) => {
        console.info('scrollSource: ' + scrollSource)
        console.info(`onWillScroll scrollState = ${scrollState[scrollState]}, offset = ${scrollOffset}`)
      })
      .onDidScroll((scrollOffset: number, scrollState: ScrollState) => {
        console.info(`onScroll scrollState = ScrollState` + scrollState + `, scrollOffset = ` + scrollOffset)
        this.scrollInfo = 'onDidScroll success, ScrollState = ' + scrollState + `, scrollOffset = ` + scrollOffset
      })
      .scrollBarWidth(20)
      .scrollBar(BarState.On) // 滚动条常驻显示
      .scrollBarColor(Color.Gray) // 滚动条颜色
      .rowsTemplate('1fr 1fr 1fr')
      .fadingEdge(true, { fadingEdgeLength: LengthMetrics.vp(32) })
      .direction(Direction.Rtl)
      .cachedCount(4)
      .columnsGap(10)
      .rowsGap(5)
      .backgroundColor(0xFAEEE0)
      .width('80%')
      .height('60%')
      .onReachStart(() => {
        console.info('waterFlow reach start');
      })
      .onScrollStart(() => {
        console.info('waterFlow scroll start');
      })
      .onScrollStop(() => {
        console.info('waterFlow scroll stop');
      })
      .onScrollFrameBegin((offset: number, state: ScrollState) => {
        console.info('waterFlow scrollFrameBegin offset: ' + offset + ' state: ' + state.toString());
        return { offsetRemain: offset };
      })

      Button('scroll 300')
        .id('waterFlowFad_10')
        .height('5%')
        .onClick(() => { // 点击后下滑指定距离300vp
          this.scroller.scrollBy(0, 300)
        })
        .margin({ top: 10, left: 20 })

      Text(this.scrollInfo)
        .height(40)
        .fontSize(15)
        .fontColor(Color.Black)
        .width('60%')
        .border({ width: 1 })
        .lineHeight(20)
        .margin(15)
    }
  }
}
