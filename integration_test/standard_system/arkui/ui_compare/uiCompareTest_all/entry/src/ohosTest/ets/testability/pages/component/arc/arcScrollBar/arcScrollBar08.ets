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

import { ArcScrollBar } from '@kit.ArkUI';

@Entry
@Component
struct ArcScrollBar08 {
  private listScroller: Scroller = new Scroller();
  private gridScroller: Scroller = new Scroller();
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];

  build() {
    Column() {
      // 页面标题
      Text('测试用例0080 - List和Grid调用滚动控制器跳转')
        .height(50)
        .fontSize(16)
        .textAlign(TextAlign.Center)
        .fontColor(Color.Black)
        .width('100%')
        .border({ width: 1 })
        .lineHeight(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 8, bottom: 8 });

      // 操作按钮
      Row({ space: 10 }) {
        Button('List跳转')
          .onClick(() => {
            this.listScroller.scrollTo({ xOffset: 0, yOffset: 500 });
          })
        Button('Grid跳转')
          .onClick(() => {
            this.gridScroller.scrollToIndex(10);
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .margin({ bottom: 10 });

      // 测试区域 - List和Grid的滚动控制器跳转
      Column({ space: 10 }) {
        // List测试区域
        Stack({ alignContent: Alignment.Center }) {
          List({ scroller: this.listScroller }) {
            ForEach(this.arr, (item: number) => {
              ListItem() {
                Row() {
                  Text('List项目 ' + item.toString())
                    .fontSize(16)
                    .fontWeight(FontWeight.Bold)
                    .fontColor(Color.Blue)
                }
                .width('100%')
                .height('6.56%')
                .backgroundColor(0xFFFFFF)
                .borderRadius(8)
                .padding(10)
                .justifyContent(FlexAlign.Center)
                .alignItems(VerticalAlign.Center)
              }
            }, (item: string) => item)
          }
          .width('90%')
          .height('16.39%')
          .scrollBar(BarState.Off)

          ArcScrollBar({ scroller: this.listScroller, state: BarState.Auto })
        }
        .width('100%')
        .height('16.39%')

        // Grid测试区域
        Stack({ alignContent: Alignment.Center }) {
          Grid(this.gridScroller) {
            ForEach(this.arr, (item: number) => {
              GridItem() {
                Text('Grid' + item.toString())
                  .fontSize(16)
                  .fontWeight(FontWeight.Bold)
                  .fontColor(Color.Green)
                  .width('100%')
                  .height('100%')
                  .backgroundColor(0xFFFFFF)
                  .borderRadius(8)
                  .textAlign(TextAlign.Center)
              }
              .width('100%')
              .height('4.92%')
            }, (item: string) => item)
          }
          .columnsTemplate('1fr 1fr 1fr')
          .rowsGap(10)
          .columnsGap(10)
          .width('90%')
          .height('16.39%')
          .scrollBar(BarState.Off)

          ArcScrollBar({ scroller: this.gridScroller, state: BarState.Auto })
        }
        .width('100%')
        .height('16.39%')
      }
      .width('100%')
      .height('70%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5, left: 10, right: 10 })
  }
}
