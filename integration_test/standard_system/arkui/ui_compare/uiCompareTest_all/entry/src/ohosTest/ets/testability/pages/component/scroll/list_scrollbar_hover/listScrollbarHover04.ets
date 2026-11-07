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

import { promptAction, LengthMetrics, PromptAction } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct ListScrollbarHover04 {
  @State scrollBarWidth: number = 8;
  @State currentIndex: number = 0;
  private scroller: Scroller = new Scroller();
  private dataArray: string[] = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5', 'Item 6', 'Item 7', 'Item 8', 'Item 9', 'Item 10'];

  build() {
    Column() {
      Text('List滚动条悬浮测试0040')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 10 })

      Text('滚动条状态: Auto, 动态改变滚动条宽度')
        .fontSize(16)
        .margin({ bottom: 10 })

      Text(`当前滚动条宽度: ${this.scrollBarWidth}px`)
        .fontSize(14)
        .margin({ bottom: 10 })

      Button('改变滚动条宽度')
        .id('change_width_button_04')
        .type(ButtonType.Capsule)
        .height(50)
        .onClick(() => {
          if (this.scrollBarWidth === 8) {
            this.scrollBarWidth = 12;
          } else if (this.scrollBarWidth === 12) {
            this.scrollBarWidth = 16;
          } else {
            this.scrollBarWidth = 8;
          }
        })

      List({ scroller: this.scroller }) {
        ForEach(this.dataArray, (item: string, index: number) => {
          ListItem() {
            Row() {
              Text(item)
                .fontSize(16)
                .fontColor(Color.Black)
              Blank()
              Text(`Index: ${index}`)
                .fontSize(14)
                .fontColor(Color.Gray)
            }
            .width('100%')
            .height('4.92%')
            .padding({ left: 20, right: 20 })
            .backgroundColor(index % 2 === 0 ? Color.White : Color.Gray)
            .borderRadius(8)
            .margin({ bottom: 5 })
          }
        }, (item: string) => item)
      }
      .width('100%')
      .height('32.79%')
      .scrollBar(BarState.Auto)
      .scrollBarWidth(this.scrollBarWidth)
      .onScrollIndex((firstIndex: number) => {
        this.currentIndex = firstIndex;
      })

      Text(`当前滚动位置: ${this.currentIndex}`)
        .fontSize(14)
        .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xF5F5F5)
    .padding(20)
  }
}
