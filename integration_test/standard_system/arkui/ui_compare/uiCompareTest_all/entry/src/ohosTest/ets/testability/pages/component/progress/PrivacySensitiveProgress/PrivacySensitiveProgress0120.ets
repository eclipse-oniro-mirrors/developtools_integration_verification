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
struct PrivacySensitiveProgress0120 {

  build() {
    Scroll() {
      Column({ space: 20 }) {
        Text('PrivacySensitive Progress LinearGradient Test (Hidden)')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20 })

        // Linear type with LinearGradient (privacySensitive true)
        Column({ space: 10 }) {
          Text('Linear Type - Red to Blue Gradient (Hidden)')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 50, total: 100, type: ProgressType.Linear })
            .width(200)
            .height(20)
            .privacySensitive(true)
            .color(new LinearGradient([
              { color: Color.Red, offset: 0.0 },
              { color: Color.Blue, offset: 1.0 }
            ]))
            .id('progress_linear_gradient1_0120')
        }

        Column({ space: 10 }) {
          Text('Linear Type - Green to Yellow Gradient (Hidden)')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 60, total: 100, type: ProgressType.Linear })
            .width(200)
            .height(20)
            .privacySensitive(true)
            .color(new LinearGradient([
              { color: Color.Green, offset: 0.0 },
              { color: Color.Yellow, offset: 1.0 }
            ]))
            .id('progress_linear_gradient2_0120')
        }

        // Ring type with LinearGradient (privacySensitive true)
        Column({ space: 10 }) {
          Text('Ring Type - Purple to Orange Gradient (Hidden)')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 70, total: 100, type: ProgressType.Ring })
            .width(100)
            .height(100)
            .privacySensitive(true)
            .color(new LinearGradient([
              { color: '#800080', offset: 0.0 },
              { color: '#FFA500', offset: 1.0 }
            ]))
            .id('progress_ring_gradient1_0120')
        }

        Column({ space: 10 }) {
          Text('Ring Type - Pink to Cyan Gradient (Hidden)')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 80, total: 100, type: ProgressType.Ring })
            .width(100)
            .height(100)
            .privacySensitive(true)
            .color(new LinearGradient([
              { color: '#FF69B4', offset: 0.0 },
              { color: '#00FFFF', offset: 1.0 }
            ]))
            .id('progress_ring_gradient2_0120')
        }

        // Eclipse type with LinearGradient (privacySensitive true)
        Column({ space: 10 }) {
          Text('Eclipse Type - Multi-color Gradient (Hidden)')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 45, total: 100, type: ProgressType.Eclipse })
            .width(100)
            .height(100)
            .privacySensitive(true)
            .color(new LinearGradient([
              { color: Color.Red, offset: 0.0 },
              { color: Color.Green, offset: 0.5 },
              { color: Color.Blue, offset: 1.0 }
            ]))
            .id('progress_eclipse_gradient1_0120')
        }

        Column({ space: 10 }) {
          Text('Eclipse Type - Black to White Gradient (Hidden)')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 55, total: 100, type: ProgressType.Eclipse })
            .width(100)
            .height(100)
            .privacySensitive(true)
            .color(new LinearGradient([
              { color: Color.Black, offset: 0.0 },
              { color: Color.White, offset: 1.0 }
            ]))
            .id('progress_eclipse_gradient2_0120')
        }

        // ScaleRing type with LinearGradient (privacySensitive true)
        Column({ space: 10 }) {
          Text('ScaleRing Type - Rainbow Gradient (Hidden)')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 65, total: 100, type: ProgressType.ScaleRing })
            .width(100)
            .height(100)
            .privacySensitive(true)
            .color(new LinearGradient([
              { color: '#FF0000', offset: 0.0 },
              { color: '#FF7F00', offset: 0.2 },
              { color: '#FFFF00', offset: 0.4 },
              { color: '#00FF00', offset: 0.6 },
              { color: '#0000FF', offset: 0.8 },
              { color: '#8B00FF', offset: 1.0 }
            ]))
            .id('progress_scalering_gradient1_0120')
        }

        Column({ space: 10 }) {
          Text('ScaleRing Type - Warm Colors Gradient (Hidden)')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 75, total: 100, type: ProgressType.ScaleRing })
            .width(100)
            .height(100)
            .privacySensitive(true)
            .color(new LinearGradient([
              { color: '#FF4500', offset: 0.0 },
              { color: '#FFD700', offset: 1.0 }
            ]))
            .id('progress_scalering_gradient2_0120')
        }

        // Capsule type with LinearGradient (privacySensitive true)
        Column({ space: 10 }) {
          Text('Capsule Type - Cool Colors Gradient (Hidden)')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 35, total: 100, type: ProgressType.Capsule })
            .width(200)
            .height(30)
            .privacySensitive(true)
            .color(new LinearGradient([
              { color: '#4169E1', offset: 0.0 },
              { color: '#00CED1', offset: 1.0 }
            ]))
            .id('progress_capsule_gradient1_0120')
        }

        Column({ space: 10 }) {
          Text('Capsule Type - Sunset Gradient (Hidden)')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 85, total: 100, type: ProgressType.Capsule })
            .width(200)
            .height(30)
            .privacySensitive(true)
            .color(new LinearGradient([
              { color: '#FF6347', offset: 0.0 },
              { color: '#FF1493', offset: 0.5 },
              { color: '#8A2BE2', offset: 1.0 }
            ]))
            .id('progress_capsule_gradient2_0120')
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
