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
struct PrivacySensitiveProgress0080 {

  build() {
    Scroll() {
      Column({ space: 15 }) {
        Text('PrivacySensitive Progress Color String Test (Hidden)')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20 })

        // Linear type with different color strings (privacySensitive true)
        Column({ space: 10 }) {
          Text('Linear Type - 0x1010010 (Hidden)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 50, total: 100, type: ProgressType.Linear })
            .width(200)
            .height(20)
            .privacySensitive(true)
            .color(0x1010010)
            .id('progress_linear_hex_0080')
        }

        Column({ space: 10 }) {
          Text('Linear Type - #ff000000 (Hidden)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 60, total: 100, type: ProgressType.Linear })
            .width(200)
            .height(20)
            .privacySensitive(true)
            .color('#ff000000')
            .id('progress_linear_black_0080')
        }

        Column({ space: 10 }) {
          Text('Linear Type - rgb(255, 100, 255) (Hidden)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 70, total: 100, type: ProgressType.Linear })
            .width(200)
            .height(20)
            .privacySensitive(true)
            .color('rgb(255, 100, 255)')
            .id('progress_linear_rgb_0080')
        }

        Column({ space: 10 }) {
          Text('Linear Type - rgba(255, 100, 255, 0.5) (Hidden)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 80, total: 100, type: ProgressType.Linear })
            .width(200)
            .height(20)
            .privacySensitive(true)
            .color('rgba(255, 100, 255, 0.5)')
            .id('progress_linear_rgba_0080')
        }

        // Ring type with different color strings (privacySensitive true)
        Column({ space: 10 }) {
          Text('Ring Type - 0x1010010 (Hidden)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 45, total: 100, type: ProgressType.Ring })
            .width(80)
            .height(80)
            .privacySensitive(true)
            .color(0x1010010)
            .id('progress_ring_hex_0080')
        }

        Column({ space: 10 }) {
          Text('Ring Type - #ff000000 (Hidden)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 55, total: 100, type: ProgressType.Ring })
            .width(80)
            .height(80)
            .privacySensitive(true)
            .color('#ff000000')
            .id('progress_ring_black_0080')
        }

        Column({ space: 10 }) {
          Text('Ring Type - rgb(255, 100, 255) (Hidden)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 65, total: 100, type: ProgressType.Ring })
            .width(80)
            .height(80)
            .privacySensitive(true)
            .color('rgb(255, 100, 255)')
            .id('progress_ring_rgb_0080')
        }

        Column({ space: 10 }) {
          Text('Ring Type - rgba(255, 100, 255, 0.5) (Hidden)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 75, total: 100, type: ProgressType.Ring })
            .width(80)
            .height(80)
            .privacySensitive(true)
            .color('rgba(255, 100, 255, 0.5)')
            .id('progress_ring_rgba_0080')
        }

        // Eclipse type with different color strings (privacySensitive true)
        Column({ space: 10 }) {
          Text('Eclipse Type - 0x1010010 (Hidden)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 40, total: 100, type: ProgressType.Eclipse })
            .width(80)
            .height(80)
            .privacySensitive(true)
            .color(0x1010010)
            .id('progress_eclipse_hex_0080')
        }

        Column({ space: 10 }) {
          Text('Eclipse Type - #ff000000 (Hidden)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 50, total: 100, type: ProgressType.Eclipse })
            .width(80)
            .height(80)
            .privacySensitive(true)
            .color('#ff000000')
            .id('progress_eclipse_black_0080')
        }

        Column({ space: 10 }) {
          Text('Eclipse Type - rgb(255, 100, 255) (Hidden)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 60, total: 100, type: ProgressType.Eclipse })
            .width(80)
            .height(80)
            .privacySensitive(true)
            .color('rgb(255, 100, 255)')
            .id('progress_eclipse_rgb_0080')
        }

        Column({ space: 10 }) {
          Text('Eclipse Type - rgba(255, 100, 255, 0.5) (Hidden)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 70, total: 100, type: ProgressType.Eclipse })
            .width(80)
            .height(80)
            .privacySensitive(true)
            .color('rgba(255, 100, 255, 0.5)')
            .id('progress_eclipse_rgba_0080')
        }

        // ScaleRing type with different color strings (privacySensitive true)
        Column({ space: 10 }) {
          Text('ScaleRing Type - 0x1010010 (Hidden)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 35, total: 100, type: ProgressType.ScaleRing })
            .width(80)
            .height(80)
            .privacySensitive(true)
            .color(0x1010010)
            .id('progress_scalering_hex_0080')
        }

        Column({ space: 10 }) {
          Text('ScaleRing Type - #ff000000 (Hidden)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 45, total: 100, type: ProgressType.ScaleRing })
            .width(80)
            .height(80)
            .privacySensitive(true)
            .color('#ff000000')
            .id('progress_scalering_black_0080')
        }

        Column({ space: 10 }) {
          Text('ScaleRing Type - rgb(255, 100, 255) (Hidden)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 55, total: 100, type: ProgressType.ScaleRing })
            .width(80)
            .height(80)
            .privacySensitive(true)
            .color('rgb(255, 100, 255)')
            .id('progress_scalering_rgb_0080')
        }

        Column({ space: 10 }) {
          Text('ScaleRing Type - rgba(255, 100, 255, 0.5) (Hidden)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 65, total: 100, type: ProgressType.ScaleRing })
            .width(80)
            .height(80)
            .privacySensitive(true)
            .color('rgba(255, 100, 255, 0.5)')
            .id('progress_scalering_rgba_0080')
        }

        // Capsule type with different color strings (privacySensitive true)
        Column({ space: 10 }) {
          Text('Capsule Type - 0x1010010 (Hidden)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 30, total: 100, type: ProgressType.Capsule })
            .width(200)
            .height(25)
            .privacySensitive(true)
            .color(0x1010010)
            .id('progress_capsule_hex_0080')
        }

        Column({ space: 10 }) {
          Text('Capsule Type - #ff000000 (Hidden)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 40, total: 100, type: ProgressType.Capsule })
            .width(200)
            .height(25)
            .privacySensitive(true)
            .color('#ff000000')
            .id('progress_capsule_black_0080')
        }

        Column({ space: 10 }) {
          Text('Capsule Type - rgb(255, 100, 255) (Hidden)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 50, total: 100, type: ProgressType.Capsule })
            .width(200)
            .height(25)
            .privacySensitive(true)
            .color('rgb(255, 100, 255)')
            .id('progress_capsule_rgb_0080')
        }

        Column({ space: 10 }) {
          Text('Capsule Type - rgba(255, 100, 255, 0.5) (Hidden)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 60, total: 100, type: ProgressType.Capsule })
            .width(200)
            .height(25)
            .privacySensitive(true)
            .color('rgba(255, 100, 255, 0.5)')
            .id('progress_capsule_rgba_0080')
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
