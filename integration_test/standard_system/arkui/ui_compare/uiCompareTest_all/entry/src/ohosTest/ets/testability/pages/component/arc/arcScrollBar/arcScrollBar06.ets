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
struct ArcScrollBar06 {
  private scroller: Scroller = new Scroller();
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
  @State currentState: BarState = BarState.Auto;

  build() {
    Column() {
      // 页面标题
      Text('测试用例0060 - ArcScrollBar动态改变state状态')
        .height(50)
        .fontSize(16)
        .textAlign(TextAlign.Center)
        .fontColor(Color.Black)
        .width('100%')
        .border({ width: 1 })
        .lineHeight(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 8, bottom: 8 });

      // 状态显示
      Text(`当前状态: ${this.currentState}`)
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
        Button('切换到On')
          .onClick(() => {
            this.currentState = BarState.On;
          })
        Button('切换到Off')
          .onClick(() => {
            this.currentState = BarState.Off;
          })
        Button('切换到Auto')
          .onClick(() => {
            this.currentState = BarState.Auto;
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .margin({ bottom: 10 });

      // 测试区域 - ArcScrollBar动态改变state
      Stack({ alignContent: Alignment.Center }) {
        List({ scroller: this.scroller }) {
          ForEach(this.arr, (item: number) => {
            ListItem() {
              Row() {
                Text('项目 ' + item.toString())
                  .fontSize(18)
                  .fontWeight(FontWeight.Bold)
                  .fontColor(Color.Blue)
                Text('状态切换测试')
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
        .height('60%')
        .scrollBar(BarState.Off)

        ArcScrollBar({ scroller: this.scroller, state: this.currentState })
      }
      .width('100%')
      .height('60%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5, left: 10, right: 10 })
  }
}
