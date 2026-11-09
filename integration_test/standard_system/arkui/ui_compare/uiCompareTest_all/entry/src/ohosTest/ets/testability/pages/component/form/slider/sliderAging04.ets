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
struct SliderAging04 {
  @State sliderValue: number = 50;
  @State sliderDirection: Axis = Axis.Horizontal;

  build() {
    Column({ space: 20 }) {
      Text('Slider适老化测试 - direction属性测试')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Row({ space: 10 }) {
        Button('Horizontal')
          .id('direction_horizontal_04')
          .onClick(() => {
            this.sliderDirection = Axis.Horizontal;
          })

        Button('Vertical')
          .id('direction_vertical_04')
          .onClick(() => {
            this.sliderDirection = Axis.Vertical;
          })
      }
      .margin({ bottom: 20 })

      Slider({
        value: this.sliderValue,
        min: 0,
        max: 100,
        step: 1,
        direction: this.sliderDirection
      })
        .id('slider_aging_04')
        .width(this.sliderDirection === Axis.Horizontal ? '80%' : 40)
        .height(this.sliderDirection === Axis.Vertical ? '60%' : 40)
        .blockColor(0x007DFF)
        .trackColor(0xE5E5E5)
        .selectedColor(0x007DFF)
        .showTips(true)
        .onChange((value: number) => {
          this.sliderValue = value;
        })

      Text(`当前值: ${this.sliderValue}`)
        .fontSize(14)
        .fontColor(0x333333)

    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(0xF5F5F5)
  }
}

