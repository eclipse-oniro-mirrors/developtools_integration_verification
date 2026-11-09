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
struct PrivacySensitiveProgress0070 {

  build() {
    Scroll() {
      Column({ space: 15 }) {
        Text('PrivacySensitive Progress Color String Test')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20 })

        // Linear type with different color strings
        Column({ space: 10 }) {
          Text('Linear Type - 0x1010010')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 50, total: 100, type: ProgressType.Linear })
            .width(200)
            .height(20)
            .privacySensitive(false)
            .color(0x1010010)
            .id('progress_linear_hex_0070')
        }

        Column({ space: 10 }) {
          Text('Linear Type - rgba(255, 100, 255, 0.5)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 80, total: 100, type: ProgressType.Linear })
            .width(200)
            .height(20)
            .privacySensitive(false)
            .color('rgba(255, 100, 255, 0.5)')
            .id('progress_linear_rgba_0070')
        }

        // Ring type with different color strings

        Column({ space: 10 }) {
          Text('Ring Type - #ff000000')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 55, total: 100, type: ProgressType.Ring })
            .width(80)
            .height(80)
            .privacySensitive(false)
            .color('#ff000000')
            .id('progress_ring_black_0070')
        }

        Column({ space: 10 }) {
          Text('Ring Type - rgba(255, 100, 255, 0.5)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 75, total: 100, type: ProgressType.Ring })
            .width(80)
            .height(80)
            .privacySensitive(false)
            .color('rgba(255, 100, 255, 0.5)')
            .id('progress_ring_rgba_0070')
        }

        // Eclipse type with different color strings
        Column({ space: 10 }) {
          Text('Eclipse Type - 0x1010010')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 40, total: 100, type: ProgressType.Eclipse })
            .width(80)
            .height(80)
            .privacySensitive(false)
            .color(0x1010010)
            .id('progress_eclipse_hex_0070')
        }

        Column({ space: 10 }) {
          Text('Eclipse Type - rgba(255, 100, 255, 0.5)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 70, total: 100, type: ProgressType.Eclipse })
            .width(80)
            .height(80)
            .privacySensitive(false)
            .color('rgba(255, 100, 255, 0.5)')
            .id('progress_eclipse_rgba_0070')
        }

        // ScaleRing type with different color strings

        Column({ space: 10 }) {
          Text('ScaleRing Type - #ff000000')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 45, total: 100, type: ProgressType.ScaleRing })
            .width(80)
            .height(80)
            .privacySensitive(false)
            .color('#ff000000')
            .id('progress_scalering_black_0070')
        }

        Column({ space: 10 }) {
          Text('ScaleRing Type - rgb(255, 100, 255)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 55, total: 100, type: ProgressType.ScaleRing })
            .width(80)
            .height(80)
            .privacySensitive(false)
            .color('rgb(255, 100, 255)')
            .id('progress_scalering_rgb_0070')
        }

        // Capsule type with different color strings
        Column({ space: 10 }) {
          Text('Capsule Type - 0x1010010')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 30, total: 100, type: ProgressType.Capsule })
            .width(200)
            .height(25)
            .privacySensitive(false)
            .color(0x1010010)
            .id('progress_capsule_hex_0070')
        }

        Column({ space: 10 }) {
          Text('Capsule Type - rgba(255, 100, 255, 0.5)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 60, total: 100, type: ProgressType.Capsule })
            .width(200)
            .height(25)
            .privacySensitive(false)
            .color('rgba(255, 100, 255, 0.5)')
            .id('progress_capsule_rgba_0070')
        }
      }
      .width('100%')
      .padding(20)
      .justifyContent(FlexAlign.Start)
    }
    .width('100%')
    .height('100%')
  }
}
