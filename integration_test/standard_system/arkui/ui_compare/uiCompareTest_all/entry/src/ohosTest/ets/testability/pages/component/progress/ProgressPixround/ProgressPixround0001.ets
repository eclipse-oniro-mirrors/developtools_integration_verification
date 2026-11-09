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
struct ProgressPixround0001 {

  build() {
    Scroll() {
      Column({ space: 15 }) {
        Text('Progress pixelRound测试')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20 })

        Text('设置pixelRound: start和top为FORCE_CEIL')
          .fontSize(14)
          .fontColor(Color.Gray)
          .margin({ bottom: 10 })

        // Linear线性样式Progress
        Column({ space: 10 }) {
          Text('Linear 线性样式')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 50, total: 100, type: ProgressType.Linear })
            .width(200)
            .height(20)
            .color(Color.Blue)
            .id('progress_pixround_linear_0001')
            .pixelRound({
              start: PixelRoundCalcPolicy.FORCE_CEIL,
              top: PixelRoundCalcPolicy.FORCE_CEIL
            })
        }

        // Ring环形无刻度样式Progress
        Column({ space: 10 }) {
          Text('Ring 环形无刻度样式')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 50, total: 100, type: ProgressType.Ring })
            .width(80)
            .height(80)
            .color(Color.Green)
            .id('progress_pixround_ring_0001')
            .pixelRound({
              start: PixelRoundCalcPolicy.FORCE_CEIL,
              top: PixelRoundCalcPolicy.FORCE_CEIL
            })
        }

        // Eclipse圆形样式Progress
        Column({ space: 10 }) {
          Text('Eclipse 圆形样式')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 50, total: 100, type: ProgressType.Eclipse })
            .width(80)
            .height(80)
            .color(Color.Orange)
            .id('progress_pixround_eclipse_0001')
            .pixelRound({
              start: PixelRoundCalcPolicy.FORCE_CEIL,
              top: PixelRoundCalcPolicy.FORCE_CEIL
            })
        }

        // ScaleRing环形有刻度样式Progress
        Column({ space: 10 }) {
          Text('ScaleRing 环形有刻度样式')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 50, total: 100, type: ProgressType.ScaleRing })
            .width(80)
            .height(80)
            .color(Color.Red)
            .id('progress_pixround_scalering_0001')
            .pixelRound({
              start: PixelRoundCalcPolicy.FORCE_CEIL,
              top: PixelRoundCalcPolicy.FORCE_CEIL
            })
        }

        // Capsule胶囊样式Progress
        Column({ space: 10 }) {
          Text('Capsule 胶囊样式')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Progress({ value: 50, total: 100, type: ProgressType.Capsule })
            .width(200)
            .height(30)
            .color(Color.Pink)
            .id('progress_pixround_capsule_0001')
            .pixelRound({
              start: PixelRoundCalcPolicy.FORCE_CEIL,
              top: PixelRoundCalcPolicy.FORCE_CEIL
            })
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


