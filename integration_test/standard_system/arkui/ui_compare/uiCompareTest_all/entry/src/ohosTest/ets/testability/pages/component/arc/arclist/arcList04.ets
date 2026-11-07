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

import { ArcList, ArcListItem, LengthMetrics, ArcListAttribute, ArcListItemAttribute } from '@kit.ArkUI';

@Entry
@Component
struct ArcList04 {
  @State arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  @State listDirection: Direction = Direction.Ltr;

  switchDirection() {
    this.listDirection = this.listDirection === Direction.Ltr ? Direction.Rtl : Direction.Ltr;
  }

  @Builder
  buildArcList() {
    Stack() {
      Column() {
      }
      .justifyContent(FlexAlign.Center)
      .width('414px')
      .height('414px')
      .backgroundColor(Color.White)

      ArcList({ initialIndex: 0 }) {
        ForEach(this.arr, (item: number, index: number) => {
          ArcListItem() {
            Text('Item ' + item)
              .fontSize(16)
              .width('100%')
              .height(80)
              .textAlign(TextAlign.Center)
              .backgroundColor(0xE0E0E0)
              .borderRadius(10)
          }
          .align(Alignment.Center)
        }, (item: number, index: number) => (item + index).toString())
      }
      .id('arcList_04')
      .space(LengthMetrics.px(10))
      .direction(this.listDirection)
      .width('414px')
      .layoutWeight(1)
    }
    .align(Alignment.Center)
    .width('414px')
    .height('414px')
  }

  build() {
    Column() {
      Text('ArcList设置direction测试')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Button('切换Direction')
        .id('switchDirectionButton')
        .onClick(() => this.switchDirection())
        .margin({ bottom: 20 })

      Text(`当前Direction: ${this.listDirection === Direction.Ltr ? 'Ltr' : 'Rtl'}`)
        .fontSize(14)
        .margin({ bottom: 10 })

      this.buildArcList()
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(0xF5F5F5)
  }
}

