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
 * GridAlignItems0120
 * 
 * Gridlayoutoption场景测试alignItems
 */

@Entry
@Component
export struct GridAlignItems0120 {
  @State numbers: string[] = ['0', '1', '2', '3', '4', '5'];

  layoutOptions: GridLayoutOptions = {
    regularSize: [1, 1],
    irregularIndexes: [0, 1],
    onGetIrregularSizeByIndex: (index: number) => {
      if (index === 0) {
        return [1, 2]; // 跨2列
      } else if (index === 1) {
        return [2, 1]; // 跨2行
      }
      return [1, 1];
    }
  };

  build() {
    Column() {
      Grid(undefined, this.layoutOptions) {
        ForEach(this.numbers, (item: string, index: number) => {
          GridItem() {
            Text(item)
              .fontSize(16)
              .backgroundColor(0xF9CF93)
              .width('100%')
              .height('100%')
              .textAlign(TextAlign.Center)
          }
        }, (item: string, index: number) => index.toString())
      }
      .columnsTemplate('1fr 1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .alignItems(GridItemAlignment.STRETCH)
      .width('90%')
      .height('24.59%')
      .backgroundColor(0xFAEEE0)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}

