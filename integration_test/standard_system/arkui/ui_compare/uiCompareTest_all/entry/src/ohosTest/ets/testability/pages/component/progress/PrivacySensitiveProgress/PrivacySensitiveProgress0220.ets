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
struct PrivacySensitiveProgress0220 {

  build() {
    Scroll() {
      Column({ space: 15 }) {
        Text('PrivacySensitive Progress Value Total Test (Hidden)')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20 })

        // Test with total = 200
        Column({ space: 10 }) {
          Text('Linear: Total = 200, Value = -1 (Hidden)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: -1, total: 200, type: ProgressType.Linear })
            .width(200)
            .height(20)
            .privacySensitive(true)
            .id('progress_total_200_value_neg1_0220')
        }

        Column({ space: 10 }) {
          Text('Linear: Total = 200, Value = 0 (Hidden)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 0, total: 200, type: ProgressType.Linear })
            .width(200)
            .height(20)
            .privacySensitive(true)
            .id('progress_total_200_value_0_0220')
        }

        Column({ space: 10 }) {
          Text('Linear: Total = 200, Value = 10 (Hidden)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 10, total: 200, type: ProgressType.Linear })
            .width(200)
            .height(20)
            .privacySensitive(true)
            .id('progress_total_200_value_10_0220')
        }

        // Test with total = 100
        Column({ space: 10 }) {
          Text('Ring: Total = 100, Value = -1 (Hidden)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: -1, total: 100, type: ProgressType.Ring })
            .width(80)
            .height(80)
            .privacySensitive(true)
            .id('progress_total_100_value_neg1_0220')
        }

        Column({ space: 10 }) {
          Text('Ring: Total = 100, Value = 0 (Hidden)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 0, total: 100, type: ProgressType.Ring })
            .width(80)
            .height(80)
            .privacySensitive(true)
            .id('progress_total_100_value_0_0220')
        }

        Column({ space: 10 }) {
          Text('Ring: Total = 100, Value = 120 (Hidden)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 120, total: 100, type: ProgressType.Ring })
            .width(80)
            .height(80)
            .privacySensitive(true)
            .id('progress_total_100_value_120_0220')
        }

        // Test with total = 50
        Column({ space: 10 }) {
          Text('Eclipse: Total = 50, Value = -1 (Hidden)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: -1, total: 50, type: ProgressType.Eclipse })
            .width(80)
            .height(80)
            .privacySensitive(true)
            .id('progress_total_50_value_neg1_0220')
        }

        Column({ space: 10 }) {
          Text('Eclipse: Total = 50, Value = 0 (Hidden)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 0, total: 50, type: ProgressType.Eclipse })
            .width(80)
            .height(80)
            .privacySensitive(true)
            .id('progress_total_50_value_0_0220')
        }

        Column({ space: 10 }) {
          Text('Eclipse: Total = 50, Value = 10 (Hidden)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 10, total: 50, type: ProgressType.Eclipse })
            .width(80)
            .height(80)
            .privacySensitive(true)
            .id('progress_total_50_value_10_0220')
        }

        Column({ space: 10 }) {
          Text('Eclipse: Total = 50, Value = 50 (Hidden)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 50, total: 50, type: ProgressType.Eclipse })
            .width(80)
            .height(80)
            .privacySensitive(true)
            .id('progress_total_50_value_50_0220')
        }

        // Test with total = -1
        Column({ space: 10 }) {
          Text('ScaleRing: Total = -1, Value = -1 (Hidden)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: -1, total: -1, type: ProgressType.ScaleRing })
            .width(80)
            .height(80)
            .privacySensitive(true)
            .id('progress_total_neg1_value_neg1_0220')
        }


        Column({ space: 10 }) {
          Text('ScaleRing: Total = -1, Value = 50 (Hidden)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 50, total: -1, type: ProgressType.ScaleRing })
            .width(80)
            .height(80)
            .privacySensitive(true)
            .id('progress_total_neg1_value_50_0220')
        }

        Column({ space: 10 }) {
          Text('ScaleRing: Total = -1, Value = 100 (Hidden)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 100, total: -1, type: ProgressType.ScaleRing })
            .width(80)
            .height(80)
            .privacySensitive(true)
            .id('progress_total_neg1_value_100_0220')
        }

        Column({ space: 10 }) {
          Text('ScaleRing: Total = -1, Value = 120 (Hidden)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 120, total: -1, type: ProgressType.ScaleRing })
            .width(80)
            .height(80)
            .privacySensitive(true)
            .id('progress_total_neg1_value_120_0220')
        }

        // Test with total = 0
        Column({ space: 10 }) {
          Text('Capsule: Total = 0, Value = -1 (Hidden)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: -1, total: 0, type: ProgressType.Capsule })
            .width(200)
            .height(25)
            .privacySensitive(true)
            .id('progress_total_0_value_neg1_0220')
        }

        Column({ space: 10 }) {
          Text('Capsule: Total = 0, Value = 0 (Hidden)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 0, total: 0, type: ProgressType.Capsule })
            .width(200)
            .height(25)
            .privacySensitive(true)
            .id('progress_total_0_value_0_0220')
        }

        Column({ space: 10 }) {
          Text('Capsule: Total = 0, Value = 10 (Hidden)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 10, total: 0, type: ProgressType.Capsule })
            .width(200)
            .height(25)
            .privacySensitive(true)
            .id('progress_total_0_value_10_0220')
        }

        Column({ space: 10 }) {
          Text('Capsule: Total = 0, Value = 120 (Hidden)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 120, total: 0, type: ProgressType.Capsule })
            .width(200)
            .height(25)
            .privacySensitive(true)
            .id('progress_total_0_value_120_0220')
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
