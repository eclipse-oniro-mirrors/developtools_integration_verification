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
struct PrivacySensitiveProgress0040 {

  build() {
    Scroll() {
      Column({ space: 15 }) {
        Text('PrivacySensitive Progress Color Test')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20 })

        // Linear type with different colors
        Column({ space: 10 }) {
          Text('Linear Type - Color.Red')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 50, total: 100, type: ProgressType.Linear })
            .width(200)
            .height(20)
            .privacySensitive(false)
            .color(Color.Red)
            .id('progress_linear_red_0040')
        }


        // Ring type with different colors

        Column({ space: 10 }) {
          Text('Ring Type - rgb(255, 100, 255)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 60, total: 100, type: ProgressType.Ring })
            .width(80)
            .height(80)
            .privacySensitive(false)
            .color('rgb(255, 100, 255)')
            .id('progress_ring_rgb_0040')
        }

        // Eclipse type with different colors

        Column({ space: 10 }) {
          Text('Eclipse Type - rgba(255, 100, 255, 0.5)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 80, total: 100, type: ProgressType.Eclipse })
            .width(80)
            .height(80)
            .privacySensitive(false)
            .color('rgba(255, 100, 255, 0.5)')
            .id('progress_eclipse_rgba_0040')
        }

        // ScaleRing type with different colors

        Column({ space: 10 }) {
          Text('ScaleRing Type - 0x1010010')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 60, total: 100, type: ProgressType.ScaleRing })
            .width(80)
            .height(80)
            .privacySensitive(false)
            .color(0x1010010)
            .id('progress_scalering_hex_0040')
        }

        // Capsule type with different colors
        Column({ space: 10 }) {
          Text('Capsule Type - Color.Gray')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 70, total: 100, type: ProgressType.Capsule })
            .width(200)
            .height(25)
            .privacySensitive(false)
            .color(Color.Gray)
            .id('progress_capsule_gray_0040')
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
