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

/**
 * GridScrollBar0020015730
 * 
 * 设置onScrollBarUpdate接口设置滚动条
 */

@Entry
@Component
export struct GridScrollBar0020015730 {
  @State numbers: string[] = [];

  aboutToAppear() {
    for (let i = 0; i < 10; i++) {
      this.numbers.push(`Item ${i}`);
    }
  }

  build() {
    Column() {
      Grid() {
        ForEach(this.numbers, (item: string, index: number) => {
          GridItem() {
            Text(item)
              .fontSize(16)
              .width('100%')
              .height('100%')
              .textAlign(TextAlign.Center)
              .backgroundColor(0xF9CF93)
          }
        }, (item: string, index: number) => index.toString())
      }
      .columnsTemplate('1fr 1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .scrollBar(BarState.On)
      .width('90%')
      .height('24.59%')
      .backgroundColor(0xFAEEE0)
      .onScrollBarUpdate((index: number, offset: number) => {
        // 计算滚动条位置和长度
        const itemHeight = 80;
        const gap = 10;
        const totalOffset = (index / 3) * (itemHeight + gap) - offset;
        const totalLength = itemHeight * Math.ceil(this.numbers.length / 3) + gap * (Math.ceil(this.numbers.length / 3) - 1);
        return { totalOffset: totalOffset, totalLength: totalLength };
      })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}

