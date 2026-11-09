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
struct ComponentProgressLinear0016 {
  @State strokeWidth: number = 6
  @State strokeRadius: number = 3
  @State enableSmoothEffect: boolean = false
  @State enableScanEffect: boolean = false
  @State progressValue: number = 50
  @State currentProgressType: ProgressType = ProgressType.Linear
  @State progressTypeName: string = 'Linear'

  build() {
    Column({space: 5}) {
      Text(`Progress组件测试 - ${this.progressTypeName}`)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      // Progress组件
      Progress({ value: this.progressValue, total: 100, type: this.currentProgressType })
        .id('progress_linear_0016')
        .style({strokeWidth:this.strokeWidth,strokeRadius:this.strokeRadius,enableSmoothEffect:this.enableSmoothEffect,enableScanEffect:this.enableScanEffect})
        .width('80%')
        .height(this.currentProgressType === ProgressType.Linear ? 20 : 80)
        .margin({ top: 5 })

      // Progress类型切换按钮
      Column({space: 5}) {
        Text('Progress类型切换')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
        Row({space: 5}){
          Button('Linear')
            .id('ComponentProgressLinear0016_type_001')
            .backgroundColor(this.currentProgressType === ProgressType.Linear ? Color.Blue : Color.Gray)
            .onClick(() => {
              this.currentProgressType = ProgressType.Linear
              this.progressTypeName = 'Linear'
            })
          Button('Ring')
            .id('ComponentProgressLinear0016_type_002')
            .backgroundColor(this.currentProgressType === ProgressType.Ring ? Color.Blue : Color.Gray)
            .onClick(() => {
              this.currentProgressType = ProgressType.Ring
              this.progressTypeName = 'Ring'
            })
        }
        Row({space: 5}){
          Button('Eclipse')
            .id('ComponentProgressLinear0016_type_003')
            .backgroundColor(this.currentProgressType === ProgressType.Eclipse ? Color.Blue : Color.Gray)
            .onClick(() => {
              this.currentProgressType = ProgressType.Eclipse
              this.progressTypeName = 'Eclipse'
            })
          Button('ScaleRing')
            .id('ComponentProgressLinear0016_type_004')
            .backgroundColor(this.currentProgressType === ProgressType.ScaleRing ? Color.Blue : Color.Gray)
            .onClick(() => {
              this.currentProgressType = ProgressType.ScaleRing
              this.progressTypeName = 'ScaleRing'
            })
          Button('Capsule')
            .id('ComponentProgressLinear0016_type_005')
            .backgroundColor(this.currentProgressType === ProgressType.Capsule ? Color.Blue : Color.Gray)
            .onClick(() => {
              this.currentProgressType = ProgressType.Capsule
              this.progressTypeName = 'Capsule'
            })
        }
      }

      // 显示当前属性值
      Column({space: 5}) {
        Text('当前属性值')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
        Text(`类型: ${this.progressTypeName}`)
        Text(`strokeWidth: ${this.strokeWidth}`)
        Text(`strokeRadius: ${this.strokeRadius}`)
        Text(`enableSmoothEffect: ${this.enableSmoothEffect}`)
        Text(`enableScanEffect: ${this.enableScanEffect}`)
        Text(`进度值: ${this.progressValue}`)
      }
      .alignItems(HorizontalAlign.Start)
      .margin({ top: 10 })

      // 修改属性的按钮
      Column({space: 5}) {
        Text('属性修改')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          
        Row({space: 5}) {
          Button('strokeWidth切换')
            .id('ComponentProgressLinear0016_001')
            .onClick(() => {
              // 在几个常用值之间切换
              const values = [2, 4, 6, 8, 10, 12]
              const currentIndex = values.indexOf(this.strokeWidth)
              this.strokeWidth = values[(currentIndex + 1) % values.length]
            })
          Button('strokeRadius切换')
            .id('ComponentProgressLinear0016_002')
            .onClick(() => {
              // 在几个常用值之间切换
              const values = [0, 2, 4, 6, 8, 10]
              const currentIndex = values.indexOf(this.strokeRadius)
              this.strokeRadius = values[(currentIndex + 1) % values.length]
            })
        }

        Row({space: 5}) {
          Button('切换SmoothEffect')
            .id('ComponentProgressLinear0016_003')
            .onClick(() => {
              this.enableSmoothEffect = !this.enableSmoothEffect
            })
          Button('切换ScanEffect')
            .id('ComponentProgressLinear0016_004')
            .onClick(() => {
              this.enableScanEffect = !this.enableScanEffect
            })
          Button('进度切换')
            .id('ComponentProgressLinear0016_005')
            .onClick(() => {
              // 在几个进度值之间切换
              const values = [0, 25, 50, 75, 100]
              const currentIndex = values.indexOf(this.progressValue)
              this.progressValue = values[(currentIndex + 1) % values.length]
            })
        }
      }
      .margin({ top: 10 })

      // Get和Reset按钮
      Column({space: 5}) {
        Text('获取和重置')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          
        Row({space: 5}) {
          Button('Get属性')
            .id('ComponentProgressLinear0016_get')
            .onClick(() => {
              // 这里可以添加获取属性的逻辑
              console.log(`当前属性: 类型=${this.progressTypeName}, strokeWidth=${this.strokeWidth}, strokeRadius=${this.strokeRadius}, smoothEffect=${this.enableSmoothEffect}, scanEffect=${this.enableScanEffect}, 进度=${this.progressValue}`)
            })
          Button('Reset属性')
            .id('ComponentProgressLinear0016_reset')
            .onClick(() => {
              // 重置所有属性到初始值
              this.strokeWidth = 6
              this.strokeRadius = 3
              this.enableSmoothEffect = false
              this.enableScanEffect = false
              this.progressValue = 50
              this.currentProgressType = ProgressType.Linear
              this.progressTypeName = 'Linear'
            })
        }
      }
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .alignItems(HorizontalAlign.Center)
  }
}


