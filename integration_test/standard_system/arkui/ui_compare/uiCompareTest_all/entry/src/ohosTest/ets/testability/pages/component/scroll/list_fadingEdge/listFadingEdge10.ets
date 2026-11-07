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

import { LengthMetrics } from '@kit.ArkUI';

@Entry
@Component
struct ListFadingEdge10 {
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25];
  scrollerForList: Scroller = new Scroller();
  @State currentIndex: number = 0;

  build() {
    Column() {
      // 页面标题
      Text('测试用例0320 - 滑动到底部时上边缘渐隐、下边缘无渐隐')
        .height(50)
        .fontSize(16)
        .textAlign(TextAlign.Center)
        .fontColor(Color.Black)
        .width('100%')
        .border({ width: 1 })
        .lineHeight(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 8, bottom: 8 });

      // 状态信息显示
      Text(`fadingEdge: true, 当前滚动位置: ${this.currentIndex}`)
        .height(35)
        .fontSize(12)
        .textAlign(TextAlign.Center)
        .fontColor(Color.Black)
        .width('100%')
        .border({ width: 1 })
        .lineHeight(16)
        .fontWeight(300)
        .margin({ bottom: 8 });

      // 操作按钮
      Row({ space: 10 }) {
        Button('滚动到底部')
          .onClick(() => {
            this.scrollerForList.scrollTo({ xOffset: 0, yOffset: 3000 });
          })
        Button('滚动到顶部')
          .onClick(() => {
            this.scrollerForList.scrollTo({ xOffset: 0, yOffset: 0 });
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .margin({ bottom: 10 });

      // List测试区域 - 测试滑动到底部时的渐隐效果
      List({ space: 15, initialIndex: 0, scroller: this.scrollerForList }) {
        ForEach(this.arr, (item: number) => {
          ListItem() {
            Row() {
              Text('项目 ' + item.toString())
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .fontColor(Color.Blue)
              Text('边缘渐隐测试')
                .fontSize(14)
                .fontColor(Color.Gray)
                .margin({ left: 10 })
            }
            .width('100%')
            .height('9.84%')
            .backgroundColor(0xFFFFFF)
            .borderRadius(10)
            .padding(15)
            .justifyContent(FlexAlign.SpaceBetween)
            .alignItems(VerticalAlign.Center)
          }
        }, (item: string) => item)
      }
      .fadingEdge(true, { fadingEdgeLength: LengthMetrics.vp(50) })
      .onScrollIndex((start: number, end: number) => {
        this.currentIndex = start;
      })
      .width('100%')
      .height('60%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5, left: 10, right: 10 })
  }
}
