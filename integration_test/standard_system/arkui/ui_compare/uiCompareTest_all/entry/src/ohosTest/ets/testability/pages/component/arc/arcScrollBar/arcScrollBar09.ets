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
struct ArcScrollBar09 {
  private listScroller: Scroller = new Scroller();
  private gridScroller: Scroller = new Scroller();
  private scrollScroller: Scroller = new Scroller();
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];

  build() {
    Column() {
      // 页面标题
      Text('测试用例0100 - 使用表冠旋转滚动List、Grid、Scroll')
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
        Button('表冠滚动List')
          .onClick(() => {
            // 模拟表冠旋转，使用fling方法
            this.listScroller.fling(1000);
          })
        Button('表冠滚动Grid')
          .onClick(() => {
            this.gridScroller.fling(1000);
          })
        Button('表冠滚动Scroll')
          .onClick(() => {
            this.scrollScroller.fling(1000);
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .margin({ bottom: 10 });

      // 测试区域 - 表冠旋转滚动
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
                .height('4.92%')
                .backgroundColor(0xFFFFFF)
                .borderRadius(8)
                .padding(10)
                .justifyContent(FlexAlign.Center)
                .alignItems(VerticalAlign.Center)
              }
            }, (item: string) => item)
          }
          .width('90%')
          .height('12.3%')
          .scrollBar(BarState.Off)

          ArcScrollBar({ scroller: this.listScroller, state: BarState.Auto })
        }
        .width('100%')
        .height('12.3%')

        // Grid测试区域
        Stack({ alignContent: Alignment.Center }) {
          Grid(this.gridScroller) {
            ForEach(this.arr, (item: number) => {
              GridItem() {
                Text('Grid' + item.toString())
                  .fontSize(14)
                  .fontWeight(FontWeight.Bold)
                  .fontColor(Color.Green)
                  .width('100%')
                  .height('100%')
                  .backgroundColor(0xFFFFFF)
                  .borderRadius(6)
                  .textAlign(TextAlign.Center)
              }
              .width('100%')
              .height('3.28%')
            }, (item: string) => item)
          }
          .columnsTemplate('1fr 1fr 1fr 1fr')
          .rowsGap(8)
          .columnsGap(8)
          .width('90%')
          .height('12.3%')
          .scrollBar(BarState.Off)

          ArcScrollBar({ scroller: this.gridScroller, state: BarState.Auto })
        }
        .width('100%')
        .height('12.3%')

        // Scroll测试区域
        Stack({ alignContent: Alignment.Center }) {
          Scroll(this.scrollScroller) {
            Column() {
              ForEach(this.arr, (item: number) => {
                Text('Scroll项目 ' + item.toString())
                  .fontSize(16)
                  .fontWeight(FontWeight.Bold)
                  .fontColor(Color.Orange)
                  .width('90%')
                  .height(50)
                  .backgroundColor(0xFFFFFF)
                  .borderRadius(8)
                  .textAlign(TextAlign.Center)
                  .margin({ top: 5 })
              }, (item: string) => item)
            }
            .width('100%')
          }
          .width('90%')
          .height('12.3%')
          .scrollBar(BarState.Off)

          ArcScrollBar({ scroller: this.scrollScroller, state: BarState.Auto })
        }
        .width('100%')
        .height('12.3%')
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
