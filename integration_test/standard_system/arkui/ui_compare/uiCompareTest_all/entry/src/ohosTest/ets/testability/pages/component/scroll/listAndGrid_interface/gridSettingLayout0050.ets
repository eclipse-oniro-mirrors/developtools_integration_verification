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
 * GridSettingLayout0050
 * 
 * Grid设置自定义布局信息，组件选中态样式测试
 */

@Entry
@Component
export struct GridSettingLayout0050 {
  @State numbers: string[] = ['0', '1', '2', '3', '4', '5'];

  layoutOptions: GridLayoutOptions = {
    regularSize: [1, 1],
    onGetRectByIndex: (index: number) => {
      if (index === 0) {
        return [0, 0, 1, 1];
      } else if (index === 1) {
        return [0, 1, 2, 2];
      } else if (index === 2) {
        return [0, 3, 3, 3];
      } else if (index === 3) {
        return [3, 0, 3, 3];
      } else if (index === 4) {
        return [4, 3, 2, 2];
      } else {
        return [5, 5, 1, 1];
      }
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
          .id(`gridItem0050_${index}`)
          .selectable(true)
          .selected(false)
        }, (item: string, index: number) => index.toString())
      }
      .columnsTemplate('1fr 1fr 1fr 1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr 1fr 1fr 1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .multiSelectable(true)
      .width('90%')
      .height('24.59%')
      .backgroundColor(0xFAEEE0)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}

