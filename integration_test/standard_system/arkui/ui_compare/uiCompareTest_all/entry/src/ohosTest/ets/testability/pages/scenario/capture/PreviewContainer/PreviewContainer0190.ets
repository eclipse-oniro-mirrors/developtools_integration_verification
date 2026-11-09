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

@Entry
@Component
struct PreviewContainer0190 {
  @State minSize: number = 80;
  @State maxSize: number = 180;
  @State colors: number[] = [0xFFC0CB, 0xDA70D6, 0x6B8E23, 0x6A5ACD, 0x00FFFF, 0x00FF7F];
  dataSource: WaterFlowDataSource = new WaterFlowDataSource();
  private itemWidthArray: number[] = [];
  private itemHeightArray: number[] = [];

  // Calculate the width and height of a water flow item.
  getSize() {
    let ret = Math.floor(Math.random() * this.maxSize);
    return (ret > this.minSize ? ret : this.minSize);
  }

  // Set the width and height array of the water flow item.
  setItemSizeArray() {
    for (let i = 0; i < 100; i++) {
      this.itemWidthArray.push(this.getSize());
      this.itemHeightArray.push(this.getSize());
    }
  }

  // Component lifecycle: Initialize the size array when the component is about to appear.
  aboutToAppear() {
    this.setItemSizeArray();
  }

  build() {
    Column({ space: 2 }) {
      WaterFlow() {
        LazyForEach(this.dataSource, (item: number) => {
          FlowItem() {
            Column() {
              Text('N' + item).fontSize(12).height('16')
              // The image is displayed only when there is a corresponding JPG file.
              Image('res/waterFlowTest(' + item % 5 + ').jpg')
            }
          }
          .width('100%')
          .height(this.itemHeightArray[item % 100])
          .backgroundColor(this.colors[item % this.colors.length])
        }, (item: string) => item)
      }
      // auto-fill automatically calculates the number of columns.
      // repeat (auto-fill, 90) indicates that the number of columns that can be placed is automatically calculated based on the container width.
      // For example, if the container width is 450 px, the number of columns is automatically calculated as 5 (450/90 = 5).
      .columnsTemplate('repeat(auto-fill, 90)')
      .rowsTemplate('repeat(auto-fill, 1fr)')
      .columnsGap(12)
      .rowsGap(8)
      .layoutDirection(FlexDirection.Column)
      .itemConstraintSize({
        minWidth: 80,
        maxWidth: 200,
        minHeight: 80,
        maxHeight: 300
      })
      .nestedScroll({
        scrollForward: NestedScrollMode.SELF_ONLY,
        scrollBackward: NestedScrollMode.SELF_ONLY
      })
      .enableScrollInteraction(true)
      .friction(0.6)
      .cachedCount(2)
      .onReachStart(() => {
        console.info('WaterFlow reached start');
      })
      .onReachEnd(() => {
        console.info('WaterFlow reached end');
      })
      .onScrollFrameBegin((offset: number, state: ScrollState) => {
        console.info('WaterFlow scroll frame begin: ' + offset);
        return { offsetRemain: offset };
      })
      .padding({ left: 8, right: 8, top: 5, bottom: 5 })
      .backgroundColor(0xFAEEE0)
      .width('100%')
      .height('100%')
    }
  }
}
