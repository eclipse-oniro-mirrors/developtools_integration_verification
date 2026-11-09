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
struct PrivacySensitiveProgress0010 {

  build() {
    Column({ space: 20 }) {
      Text('PrivacySensitive Progress Type Test')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      // Linear type
      Column({ space: 10 }) {
        Text('Linear Type')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
        Progress({ value: 50, total: 100, type: ProgressType.Linear })
          .width(200)
          .height(20)
          .privacySensitive(true)
          .id('progress_linear_0010')
      }

      // Ring type
      Column({ space: 10 }) {
        Text('Ring Type')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
        Progress({ value: 60, total: 100, type: ProgressType.Ring })
          .width(100)
          .height(100)
          .privacySensitive(true)
          .id('progress_ring_0010')
      }

      // Eclipse type
      Column({ space: 10 }) {
        Text('Eclipse Type')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
        Progress({ value: 70, total: 100, type: ProgressType.Eclipse })
          .width(100)
          .height(100)
          .privacySensitive(true)
          .id('progress_eclipse_0010')
      }

      // ScaleRing type
      Column({ space: 10 }) {
        Text('ScaleRing Type')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
        Progress({ value: 80, total: 100, type: ProgressType.ScaleRing })
          .width(100)
          .height(100)
          .privacySensitive(true)
          .id('progress_scalering_0010')
      }

      // Capsule type
      Column({ space: 10 }) {
        Text('Capsule Type')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
        Progress({ value: 40, total: 100, type: ProgressType.Capsule })
          .width(200)
          .height(30)
          .privacySensitive(true)
          .id('progress_capsule_0010')
      }
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Start)
  }
}


