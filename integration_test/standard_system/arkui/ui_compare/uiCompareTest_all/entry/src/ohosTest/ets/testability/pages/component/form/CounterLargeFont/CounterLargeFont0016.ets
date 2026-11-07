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

import { CounterType, CounterComponent, CounterOptions, DateData } from '@kit.ArkUI';

@Entry
@Component
struct CounterLargeFont0016 {
  @State fz: number = 10
  @State baseFontSize: number = 16
  // 系统字体倍数数组：1，1.15，1.3，1.45，1.75，2
  private fontScales: number[] = [1, 1.15, 1.3, 1.45, 1.75, 2]
  @State currentScaleIndex: number = 0
  @State counterOptions: CounterOptions = {
    type: CounterType.LIST,
    numberOptions: {
      label: '价格',
      min: 0,
      value: 5,
      max: 10,
    }
  }

  build() {
    Column() {
      // 显示当前字体倍数
      Text(`当前系统字体倍数: ${this.fontScales[this.currentScaleIndex]}`)
        .fontSize(this.fz)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })
        .id('counter_largefont_0016_text')

      // 列表型Counter
      CounterComponent({ options: this.counterOptions })
        .id('counter_largefont_0016')
        .margin({ bottom: 30 })

      // 字体倍数切换按钮
      Row() {
        Button('1倍')
          .id('counter_largefont_0016_btn_1')
          .onClick(() => {
            this.currentScaleIndex = 0
            this.fz = this.fz * 1
          })
          .margin(5)
          .backgroundColor(this.currentScaleIndex === 0 ? Color.Blue : Color.Gray)

        Button('1.15倍')
          .id('counter_largefont_0016_btn_1_15')
          .onClick(() => {
            this.currentScaleIndex = 1
            this.fz = this.fz * 1.15
          })
          .margin(5)
          .backgroundColor(this.currentScaleIndex === 1 ? Color.Blue : Color.Gray)

        Button('1.3倍')
          .id('counter_largefont_0016_btn_1_3')
          .onClick(() => {
            this.currentScaleIndex = 2
            this.fz = this.fz * 1.3
          })
          .margin(5)
          .backgroundColor(this.currentScaleIndex === 2 ? Color.Blue : Color.Gray)
      }
      .margin({ bottom: 10 })

      Row() {
        Button('1.45倍')
          .id('counter_largefont_0016_btn_1_45')
          .onClick(() => {
            this.currentScaleIndex = 3
            this.fz = this.fz * 1.45
          })
          .margin(5)
          .backgroundColor(this.currentScaleIndex === 3 ? Color.Blue : Color.Gray)

        Button('1.75倍')
          .id('counter_largefont_0016_btn_1_75')
          .onClick(() => {
            this.currentScaleIndex = 4
            this.fz = this.fz * 1.75
          })
          .margin(5)
          .backgroundColor(this.currentScaleIndex === 4 ? Color.Blue : Color.Gray)

        Button('2倍')
          .id('counter_largefont_0016_btn_2')
          .onClick(() => {
            this.currentScaleIndex = 5
            this.fz = this.fz * 2
          })
          .margin(5)
          .backgroundColor(this.currentScaleIndex === 5 ? Color.Blue : Color.Gray)
      }

      // 提示信息
      Text('请在系统设置中调整字体大小为对应倍数后观察Counter组件显示效果')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ top: 20 })
        .textAlign(TextAlign.Center)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .padding(20)
  }
}
