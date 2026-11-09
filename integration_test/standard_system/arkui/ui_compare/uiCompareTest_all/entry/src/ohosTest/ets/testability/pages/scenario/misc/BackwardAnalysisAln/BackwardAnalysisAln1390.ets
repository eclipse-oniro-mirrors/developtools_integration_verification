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

@Entry
@Component
struct BackwardAnalysisAln1390 {
  @State sliderValue: number = 50
  @State listData: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

  build() {
    Column() {
      Text('List容器中Slider组件测试')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      // 同步按钮
      Button('同步所有Slider进度')
        .id('sync_slider_btn_1390')
        .onClick(() => {
          // 点击按钮同步所有slider进度
          this.sliderValue = 75
        })
        .margin({ bottom: 10 })

      Text(`当前进度: ${this.sliderValue}`)
        .fontSize(16)
        .margin({ bottom: 10 })

      // List容器包含多个slider
      List({ space: 10 }) {
        ForEach(this.listData, (item: number) => {
          ListItem() {
            Column() {
              Text(`Slider ${item}`)
                .fontSize(14)
              Slider({
                value: this.sliderValue,
                min: 0,
                max: 100,
                step: 1
              })
                .id(`slider_backwardanalysis_aln_1390_${item}`)
                .width('90%')
                .onChange((value: number) => {
                  this.sliderValue = value
                })
            }
            .width('100%')
            .padding(10)
            .backgroundColor('#F5F5F5')
            .borderRadius(8)
          }
        })
      }
      .id('list_backwardanalysis_aln_1390')
      .width('100%')
      .height('70%')
      .scrollBar(BarState.Auto)
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}

