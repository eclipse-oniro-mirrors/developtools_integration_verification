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
struct PrivacySensitiveProgress0240 {

  build() {
    Scroll() {
      Column({ space: 20 }) {
        Text('PrivacySensitive Progress Scene Test (Hidden)')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20 })

        // 卡片场景测试 (Hidden)
        Column({ space: 15 }) {
          Text('卡片场景 (Card Scene - Hidden)')
            .fontSize(18)
            .fontWeight(FontWeight.Medium)
            .fontColor(Color.Blue)

          Column({ space: 10 }) {
            Text('Linear Progress in Card (Hidden)')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
            Progress({ value: 60, total: 100, type: ProgressType.Linear })
              .width(200)
              .height(20)
              .privacySensitive(true)
              .color(Color.Blue)
              .backgroundColor(Color.Gray)
              .id('progress_card_linear_0240')
          }

          Column({ space: 10 }) {
            Text('Ring Progress in Card (Hidden)')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
            Progress({ value: 75, total: 100, type: ProgressType.Ring })
              .width(100)
              .height(100)
              .privacySensitive(true)
              .color(Color.Green)
              .id('progress_card_ring_0240')
          }

          Column({ space: 10 }) {
            Text('Capsule Progress in Card (Hidden)')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
            Progress({ value: 45, total: 100, type: ProgressType.Capsule })
              .width(200)
              .height(30)
              .privacySensitive(true)
              .color(Color.Orange)
              .id('progress_card_capsule_0240')
          }
        }
        .padding(15)
        .backgroundColor('#F0F0F0')
        .borderRadius(10)

        // 锁屏场景测试 (Hidden)
        Column({ space: 15 }) {
          Text('锁屏场景 (Lock Screen Scene - Hidden)')
            .fontSize(18)
            .fontWeight(FontWeight.Medium)
            .fontColor(Color.Red)

          Column({ space: 10 }) {
            Text('Linear Progress on Lock Screen (Hidden)')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
            Progress({ value: 30, total: 100, type: ProgressType.Linear })
              .width(200)
              .height(20)
              .privacySensitive(true)
              .color(Color.Red)
              .backgroundColor(Color.Gray)
              .id('progress_lockscreen_linear_0240')
          }

          Column({ space: 10 }) {
            Text('Eclipse Progress on Lock Screen (Hidden)')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
            Progress({ value: 80, total: 100, type: ProgressType.Eclipse })
              .width(100)
              .height(100)
              .privacySensitive(true)
              .color(Color.Pink)
              .id('progress_lockscreen_eclipse_0240')
          }

          Column({ space: 10 }) {
            Text('ScaleRing Progress on Lock Screen (Hidden)')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
            Progress({ value: 55, total: 100, type: ProgressType.ScaleRing })
              .width(100)
              .height(100)
              .privacySensitive(true)
              .color(Color.Orange)
              .id('progress_lockscreen_scalering_0240')
          }
        }
        .padding(15)
        .backgroundColor('#E0E0E0')
        .borderRadius(10)

        // 应用内场景测试 (Hidden)
        Column({ space: 15 }) {
          Text('应用内场景 (In-App Scene - Hidden)')
            .fontSize(18)
            .fontWeight(FontWeight.Medium)
            .fontColor(Color.Green)

          Column({ space: 10 }) {
            Text('Linear Progress in App (Hidden)')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
            Progress({ value: 90, total: 100, type: ProgressType.Linear })
              .width(200)
              .height(20)
              .privacySensitive(true)
              .color(Color.Green)
              .backgroundColor(Color.Gray)
              .id('progress_app_linear_0240')
          }

          Column({ space: 10 }) {
            Text('Ring Progress in App (Hidden)')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
            Progress({ value: 40, total: 100, type: ProgressType.Ring })
              .width(100)
              .height(100)
              .privacySensitive(true)
              .color(Color.Blue)
              .id('progress_app_ring_0240')
          }

          Column({ space: 10 }) {
            Text('Eclipse Progress in App (Hidden)')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
            Progress({ value: 70, total: 100, type: ProgressType.Eclipse })
              .width(100)
              .height(100)
              .privacySensitive(true)
              .color(Color.Orange)
              .id('progress_app_eclipse_0240')
          }

          Column({ space: 10 }) {
            Text('ScaleRing Progress in App (Hidden)')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
            Progress({ value: 85, total: 100, type: ProgressType.ScaleRing })
              .width(100)
              .height(100)
              .privacySensitive(true)
              .color(Color.Red)
              .id('progress_app_scalering_0240')
          }

          Column({ space: 10 }) {
            Text('Capsule Progress in App (Hidden)')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
            Progress({ value: 25, total: 100, type: ProgressType.Capsule })
              .width(200)
              .height(30)
              .privacySensitive(true)
              .color(Color.Red)
              .id('progress_app_capsule_0240')
          }
        }
        .padding(15)
        .backgroundColor('#F5F5F5')
        .borderRadius(10)

        // 综合场景测试 (Hidden)
        Column({ space: 15 }) {
          Text('综合场景测试 (Comprehensive Scene Test - Hidden)')
            .fontSize(18)
            .fontWeight(FontWeight.Medium)
            .fontColor(Color.Black)

          Row({ space: 20 }) {
            Progress({ value: 20, total: 100, type: ProgressType.Linear })
              .width(150)
              .height(15)
              .privacySensitive(true)
              .color(Color.Blue)
              .id('progress_comprehensive_linear_0240')

            Progress({ value: 60, total: 100, type: ProgressType.Ring })
              .width(80)
              .height(80)
              .privacySensitive(true)
              .color(Color.Green)
              .id('progress_comprehensive_ring_0240')
          }
          .justifyContent(FlexAlign.Center)

          Row({ space: 20 }) {
            Progress({ value: 95, total: 100, type: ProgressType.Eclipse })
              .width(80)
              .height(80)
              .privacySensitive(true)
              .color(Color.Red)
              .id('progress_comprehensive_eclipse_0240')

            Progress({ value: 50, total: 100, type: ProgressType.ScaleRing })
              .width(80)
              .height(80)
              .privacySensitive(true)
              .color(Color.Orange)
              .id('progress_comprehensive_scalering_0240')
          }
          .justifyContent(FlexAlign.Center)

          Progress({ value: 75, total: 100, type: ProgressType.Capsule })
            .width(250)
            .height(25)
            .privacySensitive(true)
            .color(Color.Yellow)
            .id('progress_comprehensive_capsule_0240')
        }
        .padding(15)
        .backgroundColor('#FAFAFA')
        .borderRadius(10)

        // 特殊场景测试 (Hidden)
        Column({ space: 15 }) {
          Text('特殊场景测试 (Special Scene Test - Hidden)')
            .fontSize(18)
            .fontWeight(FontWeight.Medium)
            .fontColor(Color.Gray)

          Column({ space: 10 }) {
            Text('High Value Progress (Hidden)')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
            Progress({ value: 120, total: 100, type: ProgressType.Linear })
              .width(200)
              .height(20)
              .privacySensitive(true)
              .color(Color.Red)
              .id('progress_special_high_value_0240')
          }

          Column({ space: 10 }) {
            Text('Zero Value Progress (Hidden)')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
            Progress({ value: 0, total: 100, type: ProgressType.Ring })
              .width(100)
              .height(100)
              .privacySensitive(true)
              .color(Color.Blue)
              .id('progress_special_zero_value_0240')
          }

          Column({ space: 10 }) {
            Text('Negative Value Progress (Hidden)')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
            Progress({ value: -10, total: 100, type: ProgressType.Capsule })
              .width(200)
              .height(25)
              .privacySensitive(true)
              .color(Color.Green)
              .id('progress_special_negative_value_0240')
          }
        }
        .padding(15)
        .backgroundColor('#EEEEEE')
        .borderRadius(10)
      }
      .width('100%')
      .padding(20)
      .justifyContent(FlexAlign.Start)
    }
    .width('100%')
    .height('100%')
  }
}
