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


@Builder
function buildGauge21(config: GaugeConfiguration) {
}

class MyGaugeStyle21 implements ContentModifier<GaugeConfiguration> {

  applyContent(): WrappedBuilder<[GaugeConfiguration]> {
    return wrapBuilder(buildGauge21)
  }
}

@Entry
@Component
struct GaugeContentmodifier0200 {
  @State gaugeValue: number = 0
  @State gaugeMin: number|null = 0
  @State gaugeMax: number|undefined = 100

  build() {
    Column({ space: 20 }) {
      Gauge({
        value: this.gaugeValue,
        min: this.gaugeMin,
        max: this.gaugeMax
      })
        .contentModifier(new MyGaugeStyle21())

      Column({ space: 20 }) {
        Row({ space: 20 }) {
          Button('change')
            .borderRadius(8)
            .backgroundColor(0x317aff)
            .width(100)
            .margin(8)
            .id('GaugeContentmodifier0200_001')
            .onClick(() => {
              this.gaugeValue = 50
              this.gaugeMin = 20
              this.gaugeMax = 70
          })
          Button('减少')
            .borderRadius(8)
            .backgroundColor(0x317aff)
            .width(100)
            .margin(8)
            .id('GaugeContentmodifier0200_002')
            .onClick(() => {
          })
        }
      }.width('100%')
    }.width('100%').margin({ top: 5 })
  }
}
