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
struct PrivacySensitiveProgress0140 {

  build() {
    Scroll() {
      Column({ space: 20 }) {
        Text('PrivacySensitive Progress BackgroundColor Test (Hidden)')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20 })

        // Linear type with different background colors (privacySensitive true)
        Column({ space: 10 }) {
          Text('Linear Type - Color.Red Background (Hidden)')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 50, total: 100, type: ProgressType.Linear })
            .width(200)
            .height(20)
            .privacySensitive(true)
            .backgroundColor(Color.Red)
            .id('progress_linear_red_bg_0140')
        }

        // Ring type with different background colors (privacySensitive true)
        Column({ space: 10 }) {
          Text('Ring Type - Color.Green Background (Hidden)')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 45, total: 100, type: ProgressType.Ring })
            .width(100)
            .height(100)
            .privacySensitive(true)
            .backgroundColor(Color.Green)
            .id('progress_ring_green_bg_0140')
        }

        // Eclipse type with different background colors (privacySensitive true)
        Column({ space: 10 }) {
          Text('Eclipse Type - Color.Pink Background (Hidden)')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 40, total: 100, type: ProgressType.Eclipse })
            .width(100)
            .height(100)
            .privacySensitive(true)
            .backgroundColor(Color.Pink)
            .id('progress_eclipse_pink_bg_0140')
        }

        // ScaleRing type with different background colors (privacySensitive true)

        Column({ space: 10 }) {
          Text('ScaleRing Type - Color.Gray Background (Hidden)')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 75, total: 100, type: ProgressType.ScaleRing })
            .width(100)
            .height(100)
            .privacySensitive(true)
            .backgroundColor(Color.Gray)
            .id('progress_scalering_gray_bg_0140')
        }

        // Capsule type with different background colors (privacySensitive true)
        Column({ space: 10 }) {
          Text('Capsule Type - Color.Blue Background (Hidden)')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 30, total: 100, type: ProgressType.Capsule })
            .width(200)
            .height(30)
            .privacySensitive(true)
            .backgroundColor(Color.Blue)
            .id('progress_capsule_blue_bg_0140')
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
