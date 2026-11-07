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
struct PrivacySensitiveProgress0190 {

  build() {
    Scroll() {
      Column({ space: 15 }) {
        Text('PrivacySensitive Progress BackgroundColor Resource Test (Hidden)')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20 })

        // Linear type with resource references (privacySensitive true)
        Column({ space: 10 }) {
          Text('Linear Type - $r("sys.color.ohos_id_color_primary") Background (Hidden)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 50, total: 100, type: ProgressType.Linear })
            .width(200)
            .height(20)
            .privacySensitive(true)
            .backgroundColor($r('sys.color.ohos_id_color_primary'))
            .id('progress_linear_resource_bg_0190')
        }

        Column({ space: 10 }) {
          Text('Linear Type - Invalid Resource Background (Hidden)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 70, total: 100, type: ProgressType.Linear })
            .width(200)
            .height(20)
            .privacySensitive(true)
            .backgroundColor(Color.Gray)
            .id('progress_linear_invalid_bg_0190')
        }

        // Ring type with resource references (privacySensitive true)

        Column({ space: 10 }) {
          Text('Ring Type - $r("sys.color.ohos_id_color_secondary") Background (Hidden)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 55, total: 100, type: ProgressType.Ring })
            .width(80)
            .height(80)
            .privacySensitive(true)
            .backgroundColor($r('sys.color.ohos_id_color_secondary'))
            .id('progress_ring_resource2_bg_0190')
        }

        Column({ space: 10 }) {
          Text('Ring Type - Invalid Resource Background (Hidden)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 65, total: 100, type: ProgressType.Ring })
            .width(80)
            .height(80)
            .privacySensitive(true)
            .backgroundColor(Color.Gray)
            .id('progress_ring_invalid_bg_0190')
        }

        // Eclipse type with resource references (privacySensitive true)
        Column({ space: 10 }) {
          Text('Eclipse Type - $r("sys.color.ohos_id_color_primary") Background (Hidden)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 40, total: 100, type: ProgressType.Eclipse })
            .width(80)
            .height(80)
            .privacySensitive(true)
            .backgroundColor($r('sys.color.ohos_id_color_primary'))
            .id('progress_eclipse_resource_bg_0190')
        }

        Column({ space: 10 }) {
          Text('Eclipse Type - Invalid Resource Background (Hidden)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 60, total: 100, type: ProgressType.Eclipse })
            .width(80)
            .height(80)
            .privacySensitive(true)
            .backgroundColor(Color.Gray)
            .id('progress_eclipse_invalid_bg_0190')
        }

        // ScaleRing type with resource references (privacySensitive true)

        Column({ space: 10 }) {
          Text('ScaleRing Type - $r("sys.color.ohos_id_color_secondary") Background (Hidden)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 45, total: 100, type: ProgressType.ScaleRing })
            .width(80)
            .height(80)
            .privacySensitive(true)
            .backgroundColor($r('sys.color.ohos_id_color_secondary'))
            .id('progress_scalering_resource2_bg_0190')
        }

        Column({ space: 10 }) {
          Text('ScaleRing Type - Invalid Resource Background (Hidden)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 55, total: 100, type: ProgressType.ScaleRing })
            .width(80)
            .height(80)
            .privacySensitive(true)
            .backgroundColor(Color.Gray)
            .id('progress_scalering_invalid_bg_0190')
        }

        // Capsule type with resource references (privacySensitive true)
        Column({ space: 10 }) {
          Text('Capsule Type - $r("sys.color.ohos_id_color_primary") Background (Hidden)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 30, total: 100, type: ProgressType.Capsule })
            .width(200)
            .height(25)
            .privacySensitive(true)
            .backgroundColor($r('sys.color.ohos_id_color_primary'))
            .id('progress_capsule_resource_bg_0190')
        }

        Column({ space: 10 }) {
          Text('Capsule Type - Invalid Resource Background (Hidden)')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 50, total: 100, type: ProgressType.Capsule })
            .width(200)
            .height(25)
            .privacySensitive(true)
            .backgroundColor(Color.Gray)
            .id('progress_capsule_invalid_bg_0190')
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
