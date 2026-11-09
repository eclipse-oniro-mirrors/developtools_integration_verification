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
struct ArcList02 {
  @State arr: number[] = [0, 1, 2, 3, 4, 5];

  addItemToBottom() {
    this.arr.push(this.arr.length);
  }

  removeItemFromBottom() {
    if (this.arr.length > 0) {
      this.arr.pop();
    }
  }

  addItemToTop() {
    this.arr.unshift(-1);
    // 更新后续元素
    for (let i = 1; i < this.arr.length; i++) {
      this.arr[i] = i - 1;
    }
  }

  removeItemFromTop() {
    if (this.arr.length > 0) {
      this.arr.shift();
      // 更新后续元素
      for (let i = 0; i < this.arr.length; i++) {
        this.arr[i] = i;
      }
    }
  }

  addItemAbove() {
    // 在显示区域上方添加item（假设中间位置为index 2）
    this.arr.splice(2, 0, 99);
  }

  removeItemAbove() {
    if (this.arr.length > 2) {
      this.arr.splice(2, 1);
    }
  }

  addItemBelow() {
    // 在显示区域下方添加item（假设中间位置为index 3）
    this.arr.splice(4, 0, 88);
  }

  removeItemBelow() {
    if (this.arr.length > 4) {
      this.arr.splice(4, 1);
    }
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
      .id('arcList_02')
      .space(LengthMetrics.px(10))
      .width('414px')
      .layoutWeight(1)
    }
    .align(Alignment.Center)
    .width('414px')
    .height('414px')
  }

  build() {
    Column() {
      Text('ArcList增删item测试')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Row({ space: 10 }) {
        Button('底部增加')
          .id('addBottomButton')
          .onClick(() => this.addItemToBottom())
        Button('底部删除')
          .onClick(() => this.removeItemFromBottom())
      }
      .margin({ bottom: 10 })

      Row({ space: 10 }) {
        Button('顶部增加')
          .id('addTopButton')
          .onClick(() => this.addItemToTop())
        Button('顶部删除')
          .onClick(() => this.removeItemFromTop())
      }
      .margin({ bottom: 10 })

      Row({ space: 10 }) {
        Button('上方增加')
          .id('addAboveButton')
          .onClick(() => this.addItemAbove())
        Button('上方删除')
          .onClick(() => this.removeItemAbove())
      }
      .margin({ bottom: 10 })

      Row({ space: 10 }) {
        Button('下方增加')
          .id('addBelowButton')
          .onClick(() => this.addItemBelow())
        Button('下方删除')
          .onClick(() => this.removeItemBelow())
      }
      .margin({ bottom: 10 })

      this.buildArcList()
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(0xF5F5F5)
  }
}

