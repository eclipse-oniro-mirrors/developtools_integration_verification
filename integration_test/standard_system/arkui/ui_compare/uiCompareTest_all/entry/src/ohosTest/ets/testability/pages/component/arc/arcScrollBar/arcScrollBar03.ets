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
struct ArcScrollBar03 {
  private scroller: Scroller = new Scroller();
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];

  build() {
    Column() {
      // 页面标题
      Text('测试用例0030 - ArcScrollBar设置state为On常驻显示')
        .height(50)
        .fontSize(16)
        .textAlign(TextAlign.Center)
        .fontColor(Color.Black)
        .width('100%')
        .border({ width: 1 })
        .lineHeight(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 8, bottom: 8 });

      // 状态说明
      Text('ArcScrollBar state: On - 应该常驻显示，等待2秒后观察')
        .height(35)
        .fontSize(12)
        .textAlign(TextAlign.Center)
        .fontColor(Color.Black)
        .width('100%')
        .border({ width: 1 })
        .lineHeight(16)
        .fontWeight(300)
        .margin({ bottom: 8 });

      // 测试区域 - ArcScrollBar state为On
      Stack({ alignContent: Alignment.Center }) {
        List({ scroller: this.scroller }) {
          ForEach(this.arr, (item: number) => {
            ListItem() {
              Row() {
                Text('项目 ' + item.toString())
                  .fontSize(18)
                  .fontWeight(FontWeight.Bold)
                  .fontColor(Color.Orange)
                Text('常驻显示测试')
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

        ArcScrollBar({ scroller: this.scroller, state: BarState.On })
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
