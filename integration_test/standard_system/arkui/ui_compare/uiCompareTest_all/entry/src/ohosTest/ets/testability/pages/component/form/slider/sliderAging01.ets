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
struct SliderAging01 {
  @State sliderValue: number = 50;

  build() {
    Column({ space: 20 }) {
      Text('Slider适老化测试 - 接口设置字体大小')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Slider({
        value: this.sliderValue,
        min: 0,
        max: 100,
        step: 1,
        direction: Axis.Horizontal
      })
        .id('slider_aging_01')
        .width('80%')
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

