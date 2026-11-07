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
struct ArcScrollBar02 {
  private listScroller: Scroller = new Scroller();
  private arcScroller: Scroller = new Scroller();
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];

  build() {
    Column() {
      // 页面标题
      Text('测试用例0020 - ArcScrollBar不与List绑定相同scroller')
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
        Button('滑动List')
          .onClick(() => {
            this.listScroller.scrollBy(0, 300);
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .margin({ bottom: 10 });

      // 测试区域 - ArcScrollBar不与List绑定相同scroller
      Stack({ alignContent: Alignment.Center }) {
        List({ scroller: this.listScroller }) {
          ForEach(this.arr, (item: number) => {
            ListItem() {
              Row() {
                Text('项目 ' + item.toString())
                  .fontSize(18)
                  .fontWeight(FontWeight.Bold)
                  .fontColor(Color.Green)
                Text('无联动测试')
                  .fontSize(14)
                  .fontColor(Color.Gray)
                  .margin({ left: 10 })
              }
              .width('100%')
              .height('8.2%')
              .backgroundColor(0xFFFFFF)
              .borderRadius(10)
              .padding(15)
              .justifyContent(FlexAlign.SpaceBetween)
              .alignItems(VerticalAlign.Center)
            }
          }, (item: string) => item)
        }
        .width('90%')
        .height('70%')
        .scrollBar(BarState.Off)

        ArcScrollBar({ scroller: this.arcScroller, state: BarState.Auto })
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
