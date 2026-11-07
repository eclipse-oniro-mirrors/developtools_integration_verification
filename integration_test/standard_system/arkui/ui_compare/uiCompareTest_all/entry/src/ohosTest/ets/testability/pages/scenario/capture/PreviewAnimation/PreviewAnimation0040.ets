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
struct PreviewAnimation0040 {
  @State isRotated: boolean = false
  @State rotateX: number = 0
  @State rotateY: number = 0
  @State rotateZ: number = 0
  @State rotateAngle: number = 0
  @State rotateCenterX: string = '50%'
  @State rotateCenterY: string = '50%'

  build() {
    Column() {
      Text('组件内转场 - rotate 3D旋转测试')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .id('PreviewAnimation0040_001')

      Text('旋转参数: .rotate({x: -10, y: 20, z: 30, centerX: "50%", angle: -100})')
        .fontSize(14)
        .fontColor('#666666')
        .margin({ bottom: 10 })
        .id('PreviewAnimation0040_002')

      Text('特点: 组件以(-10,20,30)为旋转轴,中心点逆时针旋转100度')
        .fontSize(12)
        .fontColor('#999999')
        .margin({ bottom: 30 })
        .id('PreviewAnimation0040_003')

      // 动画目标元素
      Column() {
        Text('旋转元素')
          .fontSize(16)
          .fontColor(Color.White)
        Text(`当前旋转角度: ${this.rotateAngle}°`)
          .fontSize(12)
          .fontColor(Color.White)
          .margin({ top: 5 })
      }
      .width('20.83%')
      .height('12.3%')
      .backgroundColor('#007DFF')
      .justifyContent(FlexAlign.Center)
      .rotate({
        x: this.rotateX,
        y: this.rotateY,
        z: this.rotateZ,
        centerX: this.rotateCenterX,
        centerY: this.rotateCenterY,
        angle: this.rotateAngle
      })
      .id('PreviewAnimation0040_004')
      .margin({ bottom: 30 })

      // 控制按钮组
      Scroll() {
        Column({ space: 10 }) {
          Button('应用3D旋转 (x:-10, y:20, z:30, angle:-100°)')
            .width('90%')
            .id('PreviewAnimation0040_005')
            .onClick(() => {
              this.rotateX = -10
              this.rotateY = 20
              this.rotateZ = 30
              this.rotateAngle = -100
              this.rotateCenterX = '50%'
              this.rotateCenterY = '50%'
            })

          Button('X轴旋转 (x:1, angle:90°)')
            .width('90%')
            .id('PreviewAnimation0040_006')
            .onClick(() => {
              this.rotateX = 1
              this.rotateY = 0
              this.rotateZ = 0
              this.rotateAngle = 90
              this.rotateCenterX = '50%'
              this.rotateCenterY = '50%'
            })

          Button('Y轴旋转 (y:1, angle:90°)')
            .width('90%')
            .id('PreviewAnimation0040_007')
            .onClick(() => {
              this.rotateX = 0
              this.rotateY = 1
              this.rotateZ = 0
              this.rotateAngle = 90
              this.rotateCenterX = '50%'
              this.rotateCenterY = '50%'
            })

          Button('Z轴旋转 (z:1, angle:90°)')
            .width('90%')
            .id('PreviewAnimation0040_008')
            .onClick(() => {
              this.rotateX = 0
              this.rotateY = 0
              this.rotateZ = 1
              this.rotateAngle = 90
              this.rotateCenterX = '50%'
              this.rotateCenterY = '50%'
            })

          Button('旋转180度')
            .width('90%')
            .id('PreviewAnimation0040_009')
            .onClick(() => {
              this.rotateAngle = this.rotateAngle === 0 ? 180 : 0
            })

          Button('旋转360度')
            .width('90%')
            .id('PreviewAnimation0040_010')
            .onClick(() => {
              this.rotateAngle = this.rotateAngle === 0 ? 360 : 0
            })

          Button('修改旋转中心 (左上角)')
            .width('90%')
            .id('PreviewAnimation0040_011')
            .onClick(() => {
              this.rotateCenterX = '0%'
              this.rotateCenterY = '0%'
              this.rotateZ = 1
              this.rotateAngle = 45
            })

          Button('修改旋转中心 (右下角)')
            .width('90%')
            .id('PreviewAnimation0040_012')
            .onClick(() => {
              this.rotateCenterX = '100%'
              this.rotateCenterY = '100%'
              this.rotateZ = 1
              this.rotateAngle = 45
            })

          Button('组合旋转 (x:1, y:1, z:1, angle:120°)')
            .width('90%')
            .backgroundColor('#FF6B6B')
            .id('PreviewAnimation0040_013')
            .onClick(() => {
              this.rotateX = 1
              this.rotateY = 1
              this.rotateZ = 1
              this.rotateAngle = 120
              this.rotateCenterX = '50%'
              this.rotateCenterY = '50%'
            })

          Button('重置所有')
            .width('90%')
            .backgroundColor('#4CAF50')
            .id('PreviewAnimation0040_014')
            .onClick(() => {
              this.rotateX = 0
              this.rotateY = 0
              this.rotateZ = 0
              this.rotateAngle = 0
              this.rotateCenterX = '50%'
              this.rotateCenterY = '50%'
            })
        }
        .width('100%')
      }
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.Auto)
      .height('40%')

    }
    .width('100%')
    .height('100%')
    .padding(20)
    .alignItems(HorizontalAlign.Center)
  }
}
