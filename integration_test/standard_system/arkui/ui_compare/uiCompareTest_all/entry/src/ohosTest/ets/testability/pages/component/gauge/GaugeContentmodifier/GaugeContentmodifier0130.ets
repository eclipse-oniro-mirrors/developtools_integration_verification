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
function buildGauge6(config: GaugeConfiguration) {
  Column({ space: 30 }) {
    Row() {
      Text('【ContentModifier】 value：' + JSON.stringify((config.contentModifier as MyGaugeStyle6).value) +
        '  min：' + JSON.stringify((config.contentModifier as MyGaugeStyle6).min) +
        '  max：' + JSON.stringify((config.contentModifier as MyGaugeStyle6).max))
        .fontSize(12)
    }

    Text('【Config】value：' + config.value + '  min：' + config.min + '  max：' + config.max).fontSize(12)
    Gauge({
      value: config.value,
      min: config.min,
      max: config.max
    }).width('50%')
  }
  .width('100%')
  .padding(20)
  .margin({ top: 5 })
  .alignItems(HorizontalAlign.Center)
}

class MyGaugeStyle6 implements ContentModifier<GaugeConfiguration> {
  public value: number = 0
  min: number|null = 0
  max: number|undefined = 100

  constructor(value: number, min: number|null, max: number|undefined) {
    this.value = value
    this.min = min
    this.max = max
  }

  applyContent(): WrappedBuilder<[GaugeConfiguration]> {
    return wrapBuilder(buildGauge6)
  }
}

@Entry
@Component
struct GaugeContentmodifier0130 {
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
        .contentModifier(new MyGaugeStyle6(this.gaugeValue, this.gaugeMin, this.gaugeMax))

      Column({ space: 20 }) {
        Row({ space: 20 }) {
          Button('change')
            .borderRadius(8)
            .backgroundColor(0x317aff)
            .width(100)
            .margin(8)
            .id('GaugeContentmodifier0130_001')
            .onClick(() => {
              this.gaugeValue = -10
              this.gaugeMin = -10
              this.gaugeMax = 200
          })
          Button('减少')
            .borderRadius(8)
            .backgroundColor(0x317aff)
            .width(100)
            .margin(8)
            .id('GaugeContentmodifier0130_002')
            .onClick(() => {
          })
        }
      }.width('100%')
    }.width('100%').margin({ top: 5 })
  }
}
