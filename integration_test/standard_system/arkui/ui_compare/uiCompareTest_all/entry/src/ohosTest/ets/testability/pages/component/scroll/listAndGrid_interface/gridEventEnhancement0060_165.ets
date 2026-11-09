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
 * GridEventEnhancement0060165
 * 
 * 验证边缘设置回弹效果触发onReachStart事件
 */

@Entry
@Component
export struct GridEventEnhancement0060165 {
  @State numbers: string[] = [];
  @State reachStartCount: number = 0;

  aboutToAppear() {
    for (let i = 0; i < 30; i++) {
      this.numbers.push(i.toString());
    }
  }

  build() {
    Column() {
      Text(`onReachStart触发次数: ${this.reachStartCount}`)
        .fontSize(16)
        .margin({ bottom: 10 })

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
      .edgeEffect(EdgeEffect.Spring)
      .width('90%')
      .height('32.79%')
      .backgroundColor(0xFAEEE0)
      .onReachStart(() => {
        this.reachStartCount++;
        console.info('Grid onReachStart triggered, count: ' + this.reachStartCount);
      })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Center)
  }
}

