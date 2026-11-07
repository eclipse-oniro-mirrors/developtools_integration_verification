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
import { LengthMetrics } from '@kit.ArkUI'

@Entry
@Component
struct ProgressBorderradius0025 {
  @State br : LengthMetrics = LengthMetrics.vp(1)

  build() {
    Column({ space: 15 }) {
      Row({ space: 40 }) {
        Progress({ value: 100, total: 100, type: ProgressType.Capsule }).width(100).height(50)
          .style({
            borderColor: Color.Blue,
            borderWidth: 1,
            content: 'Installing...',
            font: { size: 13, style: FontStyle.Normal },
            fontColor: Color.Gray,
            enableScanEffect: false,
            showDefaultPercentage: false,
            borderRadius:this.br
          })
      }
      Button('radiuschange', { type: ButtonType.Normal, stateEffect: true })
        .borderRadius(8)
        .id('ProgressBorderradius0025_001')
        .backgroundColor(Color.Pink)
        .width(90)
        .onClick(() => {
          this.br = LengthMetrics.vp(2)
        })
      Button('radiuschange', { type: ButtonType.Normal, stateEffect: true })
        .borderRadius(8)
        .id('ProgressBorderradius0025_002')
        .backgroundColor(Color.Pink)
        .width(90)
        .onClick(() => {
          this.br = LengthMetrics.vp(4)
        })
      Button('radiuschange', { type: ButtonType.Normal, stateEffect: true })
        .borderRadius(8)
        .id('ProgressBorderradius0025_003')
        .backgroundColor(Color.Pink)
        .width(90)
        .onClick(() => {
          this.br = LengthMetrics.vp(8)
        })
      Button('radiuschange', { type: ButtonType.Normal, stateEffect: true })
        .borderRadius(8)
        .id('ProgressBorderradius0025_004')
        .backgroundColor(Color.Pink)
        .width(90)
        .onClick(() => {
          this.br = LengthMetrics.vp(15)
        })
      Button('radiuschange', { type: ButtonType.Normal, stateEffect: true })
        .borderRadius(8)
        .id('ProgressBorderradius0025_005')
        .backgroundColor(Color.Pink)
        .width(90)
        .onClick(() => {
          this.br = LengthMetrics.vp(20)
        })
    }
    .width('100%')
    .padding({ top: 5 })
  }
}


