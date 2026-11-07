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
struct ComponentProgressLinear0015 {
  @State strokeWidth: number = 6
  @State strokeRadius: number = 3
  @State enableSmoothEffect: boolean = false
  @State enableScanEffect: boolean = false
  @State progressValue: number = 50

  build() {
    Column({ space: 20 }) {
      Text('ProgressLinear组件测试')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      // ProgressLinear组件
      Progress({ value: this.progressValue, total: 100, type: ProgressType.Linear })
        .id('progress_linear_0015')
        .style({strokeWidth:this.strokeWidth,strokeRadius:this.strokeRadius,enableSmoothEffect:this.enableSmoothEffect,enableScanEffect:this.enableScanEffect})
        .width('80%')
        .margin({ top: 20 })

      // 显示当前属性值
      Column({ space: 10 }) {
        Text(`strokeWidth: ${this.strokeWidth}`)
        Text(`strokeRadius: ${this.strokeRadius}`)
        Text(`enableSmoothEffect: ${this.enableSmoothEffect}`)
        Text(`enableScanEffect: ${this.enableScanEffect}`)
      }
      .alignItems(HorizontalAlign.Start)
      .margin({ top: 20 })

      // 修改属性的按钮
      Column({ space: 15 }) {
        Row({ space: 10 }) {
          Button('strokeWidth +')
            .id('ComponentProgressLinear0015_001')
            .onClick(() => {
              this.strokeWidth += 2
            })
          Button('strokeWidth -')
            .id('ComponentProgressLinear0015_002')
            .onClick(() => {
              if (this.strokeWidth > 2) {
                this.strokeWidth -= 2
              }
            })
        }

        Row({ space: 10 }) {
          Button('strokeRadius +')
            .id('ComponentProgressLinear0015_003')
            .onClick(() => {
              this.strokeRadius += 1
            })
          Button('strokeRadius -')
            .id('ComponentProgressLinear0015_004')
            .onClick(() => {
              if (this.strokeRadius > 0) {
                this.strokeRadius -= 1
              }
            })
        }

        Row({ space: 10 }) {
          Button('切换SmoothEffect')
            .id('ComponentProgressLinear0015_005')
            .onClick(() => {
              this.enableSmoothEffect = !this.enableSmoothEffect
            })
        }

        Row({ space: 10 }) {
          Button('切换ScanEffect')
            .id('ComponentProgressLinear0015_006')
            .onClick(() => {
              this.enableScanEffect = !this.enableScanEffect
            })
        }

        Row({ space: 10 }) {
          Button('进度 +10')
            .id('ComponentProgressLinear0015_007')
            .onClick(() => {
              if (this.progressValue < 100) {
                this.progressValue += 10
              }
            })
          Button('进度 -10')
            .id('ComponentProgressLinear0015_008')
            .onClick(() => {
              if (this.progressValue > 0) {
                this.progressValue -= 10
              }
            })
        }
      }
      .margin({ top: 30 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .alignItems(HorizontalAlign.Center)
  }
}


