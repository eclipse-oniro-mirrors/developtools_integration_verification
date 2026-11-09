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
struct ProgressBorder0032 {
  build() {
    Column({ space: 15 }) {
      Text('Linear Progress - left border width 10, borderWidth 3').fontSize(9).fontColor(0xCCCCCC).width('90%')
      Progress({ value: 10, type: ProgressType.Linear })
        .width(200)
        .border({
          width: { left: 10 }
        })
        .borderWidth(3)

      Progress({ value: 20, total: 150, type: ProgressType.Linear })
        .color(Color.Grey).value(50).width(200)
        .border({
          width: { left: 10 }
        })
        .borderWidth(3)

      Text('Eclipse Progress - left border width 10, borderWidth 3').fontSize(9).fontColor(0xCCCCCC).width('90%')
      Row({ space: 40 }) {
        Progress({ value: 10, type: ProgressType.Eclipse })
          .width(100)
          .border({
            width: { left: 10 }
          })
          .borderWidth(3)
        Progress({ value: 20, total: 150, type: ProgressType.Eclipse })
          .color(Color.Grey).value(50).width(100)
          .border({
            width: { left: 10 }
          })
          .borderWidth(3)
      }

      Text('ScaleRing Progress - left border width 10, borderWidth 3').fontSize(9).fontColor(0xCCCCCC).width('90%')
      Row({ space: 40 }) {
        Progress({ value: 10, type: ProgressType.ScaleRing })
          .width(100)
          .border({
            width: { left: 10 }
          })
          .borderWidth(3)
        Progress({ value: 20, total: 150, type: ProgressType.ScaleRing })
          .color(Color.Grey).value(50).width(100)
          .style({ strokeWidth: 15, scaleCount: 15, scaleWidth: 5 })
          .border({
            width: { left: 10 }
          })
          .borderWidth(3)
      }

      // scaleCount和scaleWidth效果对比
      Row({ space: 40 }) {
        Progress({ value: 20, total: 150, type: ProgressType.ScaleRing })
          .color(Color.Grey).value(50).width(100)
          .style({ strokeWidth: 20, scaleCount: 20, scaleWidth: 5 })
          .border({
            width: { left: 10 }
          })
          .borderWidth(3)
        Progress({ value: 20, total: 150, type: ProgressType.ScaleRing })
          .color(Color.Grey).value(50).width(100)
          .style({ strokeWidth: 20, scaleCount: 30, scaleWidth: 3 })
          .border({
            width: { left: 10 }
          })
          .borderWidth(3)
      }

      Text('Ring Progress - left border width 10, borderWidth 3').fontSize(9).fontColor(0xCCCCCC).width('90%')
      Row({ space: 40 }) {
        Progress({ value: 10, type: ProgressType.Ring })
          .width(100)
          .border({
            width: { left: 10 }
          })
          .borderWidth(3)
        Progress({ value: 20, total: 150, type: ProgressType.Ring })
          .color(Color.Grey).value(50).width(100)
          .style({ strokeWidth: 20 })
          .border({
            width: { left: 10 }
          })
          .borderWidth(3)
      }

      Text('Capsule Progress - left border width 10, borderWidth 3').fontSize(9).fontColor(0xCCCCCC).width('90%')
      Row({ space: 40 }) {
        Progress({ value: 10, type: ProgressType.Capsule })
          .width(100).height(50)
          .border({
            width: { left: 10 }
          })
          .borderWidth(3)
        Progress({ value: 20, total: 150, type: ProgressType.Capsule })
          .color(Color.Grey).value(50).width(100).height(50)
          .border({
            width: { left: 10 }
          })
          .borderWidth(3)
      }
    }.width('100%').margin({ top: 30 })
  }
}
