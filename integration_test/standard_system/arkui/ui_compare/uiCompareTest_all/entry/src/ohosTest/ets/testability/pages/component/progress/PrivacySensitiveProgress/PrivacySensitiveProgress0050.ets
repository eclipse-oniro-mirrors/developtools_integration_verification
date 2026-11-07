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
struct PrivacySensitiveProgress0050 {

  build() {
    Scroll() {
      Column({ space: 20 }) {
        Text('PrivacySensitive Progress Color Number Test')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20 })

        // Linear type with color numbers
        Column({ space: 10 }) {
          Text('Linear Type - 0x1010010')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 50, total: 100, type: ProgressType.Linear })
            .width(200)
            .height(20)
            .privacySensitive(false)
            .color(0x1010010)
            .id('progress_linear_1010010_0050')
        }

        Column({ space: 10 }) {
          Text('Linear Type - 0x344556')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 60, total: 100, type: ProgressType.Linear })
            .width(200)
            .height(20)
            .privacySensitive(false)
            .color(0x344556)
            .id('progress_linear_344556_0050')
        }

        // Ring type with color numbers
        Column({ space: 10 }) {
          Text('Ring Type - 0x1010010')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 70, total: 100, type: ProgressType.Ring })
            .width(100)
            .height(100)
            .privacySensitive(false)
            .color(0x1010010)
            .id('progress_ring_1010010_0050')
        }

        Column({ space: 10 }) {
          Text('Ring Type - 0x344556')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 80, total: 100, type: ProgressType.Ring })
            .width(100)
            .height(100)
            .privacySensitive(false)
            .color(0x344556)
            .id('progress_ring_344556_0050')
        }

        // Eclipse type with color numbers
        Column({ space: 10 }) {
          Text('Eclipse Type - 0x1010010')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 45, total: 100, type: ProgressType.Eclipse })
            .width(100)
            .height(100)
            .privacySensitive(false)
            .color(0x1010010)
            .id('progress_eclipse_1010010_0050')
        }

        Column({ space: 10 }) {
          Text('Eclipse Type - 0x344556')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 55, total: 100, type: ProgressType.Eclipse })
            .width(100)
            .height(100)
            .privacySensitive(false)
            .color(0x344556)
            .id('progress_eclipse_344556_0050')
        }

        // ScaleRing type with color numbers
        Column({ space: 10 }) {
          Text('ScaleRing Type - 0x1010010')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 65, total: 100, type: ProgressType.ScaleRing })
            .width(100)
            .height(100)
            .privacySensitive(false)
            .color(0x1010010)
            .id('progress_scalering_1010010_0050')
        }

        Column({ space: 10 }) {
          Text('ScaleRing Type - 0x344556')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 75, total: 100, type: ProgressType.ScaleRing })
            .width(100)
            .height(100)
            .privacySensitive(false)
            .color(0x344556)
            .id('progress_scalering_344556_0050')
        }

        // Capsule type with color numbers
        Column({ space: 10 }) {
          Text('Capsule Type - 0x1010010')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 35, total: 100, type: ProgressType.Capsule })
            .width(200)
            .height(30)
            .privacySensitive(false)
            .color(0x1010010)
            .id('progress_capsule_1010010_0050')
        }

        Column({ space: 10 }) {
          Text('Capsule Type - 0x344556')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 85, total: 100, type: ProgressType.Capsule })
            .width(200)
            .height(30)
            .privacySensitive(false)
            .color(0x344556)
            .id('progress_capsule_344556_0050')
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
