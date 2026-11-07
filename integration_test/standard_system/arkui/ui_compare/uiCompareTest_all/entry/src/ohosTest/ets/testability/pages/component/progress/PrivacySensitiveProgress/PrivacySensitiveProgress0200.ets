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
struct PrivacySensitiveProgress0200 {

  build() {
    Scroll() {
      Column({ space: 15 }) {
        Text('PrivacySensitive Progress Value and Total Test')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20 })

        // Test with total = -1
        Column({ space: 10 }) {
          Text('Total = -1, Value = -1')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: -1, total: -1, type: ProgressType.Linear })
            .width(200)
            .height(20)
            .privacySensitive(false)
            .id('progress_total_neg1_value_neg1_0200')
        }

        Column({ space: 10 }) {
          Text('Total = -1, Value = 0')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 0, total: -1, type: ProgressType.Linear })
            .width(200)
            .height(20)
            .privacySensitive(false)
            .id('progress_total_neg1_value_0_0200')
        }

        Column({ space: 10 }) {
          Text('Total = -1, Value = 10')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 10, total: -1, type: ProgressType.Linear })
            .width(200)
            .height(20)
            .privacySensitive(false)
            .id('progress_total_neg1_value_10_0200')
        }

        Column({ space: 10 }) {
          Text('Total = -1, Value = 50')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 50, total: -1, type: ProgressType.Linear })
            .width(200)
            .height(20)
            .privacySensitive(false)
            .id('progress_total_neg1_value_50_0200')
        }

        // Test with total = 0
        Column({ space: 10 }) {
          Text('Total = 0, Value = -1')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: -1, total: 0, type: ProgressType.Ring })
            .width(80)
            .height(80)
            .privacySensitive(false)
            .id('progress_total_0_value_neg1_0200')
        }

        Column({ space: 10 }) {
          Text('Total = 0, Value = 50')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 50, total: 0, type: ProgressType.Ring })
            .width(80)
            .height(80)
            .privacySensitive(false)
            .id('progress_total_0_value_50_0200')
        }

        Column({ space: 10 }) {
          Text('Total = 0, Value = 100')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 100, total: 0, type: ProgressType.Ring })
            .width(80)
            .height(80)
            .privacySensitive(false)
            .id('progress_total_0_value_100_0200')
        }

        Column({ space: 10 }) {
          Text('Total = 0, Value = 120')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 120, total: 0, type: ProgressType.Ring })
            .width(80)
            .height(80)
            .privacySensitive(false)
            .id('progress_total_0_value_120_0200')
        }

        // Test with normal total = 100 (different types)
        Column({ space: 10 }) {
          Text('Eclipse: Total = 100, Value = -1')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: -1, total: 100, type: ProgressType.Eclipse })
            .width(80)
            .height(80)
            .privacySensitive(false)
            .id('progress_eclipse_value_neg1_0200')
        }

        Column({ space: 10 }) {
          Text('Eclipse: Total = 100, Value = 0')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 0, total: 100, type: ProgressType.Eclipse })
            .width(80)
            .height(80)
            .privacySensitive(false)
            .id('progress_eclipse_value_0_0200')
        }

        Column({ space: 10 }) {
          Text('Eclipse: Total = 100, Value = 120')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 120, total: 100, type: ProgressType.Eclipse })
            .width(80)
            .height(80)
            .privacySensitive(false)
            .id('progress_eclipse_value_120_0200')
        }

        // Test with ScaleRing type
        Column({ space: 10 }) {
          Text('ScaleRing: Total = 100, Value = -1')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: -1, total: 100, type: ProgressType.ScaleRing })
            .width(80)
            .height(80)
            .privacySensitive(false)
            .id('progress_scalering_value_neg1_0200')
        }

        Column({ space: 10 }) {
          Text('ScaleRing: Total = 100, Value = 50')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 50, total: 100, type: ProgressType.ScaleRing })
            .width(80)
            .height(80)
            .privacySensitive(false)
            .id('progress_scalering_value_50_0200')
        }

        Column({ space: 10 }) {
          Text('ScaleRing: Total = 100, Value = 120')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 120, total: 100, type: ProgressType.ScaleRing })
            .width(80)
            .height(80)
            .privacySensitive(false)
            .id('progress_scalering_value_120_0200')
        }

        // Test with Capsule type
        Column({ space: 10 }) {
          Text('Capsule: Total = 100, Value = -1')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: -1, total: 100, type: ProgressType.Capsule })
            .width(200)
            .height(25)
            .privacySensitive(false)
            .id('progress_capsule_value_neg1_0200')
        }

        Column({ space: 10 }) {
          Text('Capsule: Total = 100, Value = 50')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 50, total: 100, type: ProgressType.Capsule })
            .width(200)
            .height(25)
            .privacySensitive(false)
            .id('progress_capsule_value_50_0200')
        }

        Column({ space: 10 }) {
          Text('Capsule: Total = 100, Value = 120')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 120, total: 100, type: ProgressType.Capsule })
            .width(200)
            .height(25)
            .privacySensitive(false)
            .id('progress_capsule_value_120_0200')
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
