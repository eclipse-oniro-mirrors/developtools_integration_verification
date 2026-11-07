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
 * GridMirror0520
 * 
 * 切换direction的时候，观察onDidScroll是否有偏移量上报
 */

@Entry
@Component
export struct GridMirror0520 {
  @State numbers: string[] = [];
  @State layoutDirection: GridDirection = GridDirection.Row;
  @State scrollOffset: number = 0;

  aboutToAppear() {
    for (let i = 0; i < 20; i++) {
      this.numbers.push(i.toString());
    }
  }

  build() {
    Column() {
      Text(`当前Direction: ${this.layoutDirection === GridDirection.Row ? 'Row' : 'Column'}`)
        .fontSize(16)
        .margin({ bottom: 10 })
      
      Text(`onDidScroll偏移量: ${this.scrollOffset}`)
        .fontSize(16)
        .margin({ bottom: 10 })

      Button('切换Direction')
        .id('switchDirectionBtn0520')
        .width(200)
        .height(50)
        .margin({ bottom: 10 })
        .onClick(() => {
          this.layoutDirection = this.layoutDirection === GridDirection.Row 
            ? GridDirection.Column 
            : GridDirection.Row;
        })

      Grid() {
        ForEach(this.numbers, (item: string, index: number) => {
          GridItem() {
            Text(item)
              .fontSize(16)
              .backgroundColor(0xF9CF93)
              .width('100%')
              .height(80)
              .textAlign(TextAlign.Center)
          }
        }, (item: string, index: number) => index.toString())
      }
      .columnsTemplate('1fr 1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .layoutDirection(this.layoutDirection)
      .width('90%')
      .height('32.79%')
      .backgroundColor(0xFAEEE0)
      .onDidScroll((scrollOffset: number, scrollState: ScrollState) => {
        this.scrollOffset = scrollOffset;
        console.info('Grid onDidScroll, scrollOffset: ' + scrollOffset + ', scrollState: ' + scrollState);
      })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Center)
  }
}

