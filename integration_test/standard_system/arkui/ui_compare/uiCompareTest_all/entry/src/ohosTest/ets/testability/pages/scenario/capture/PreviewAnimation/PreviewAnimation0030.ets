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
struct PreviewAnimation0030 {
  @State boxWidth: number = 100
  @State boxHeight: number = 100
  @State boxOpacity: number = 1
  @State boxTranslateX: number = 0
  @State boxTranslateY: number = 0
  @State boxRotate: number = 0
  @State boxScale: number = 1

  build() {
    Column() {
      Text('属性动画 - delay: -1 测试')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .id('PreviewAnimation0030_001')

      Text('动画参数: .animation({ delay: -1 })')
        .fontSize(14)
        .fontColor('#666666')
        .margin({ bottom: 10 })
        .id('PreviewAnimation0030_002')

      Text('特点: 无延迟，动画立即开始')
        .fontSize(12)
        .fontColor('#999999')
        .margin({ bottom: 30 })
        .id('PreviewAnimation0030_003')

      // 动画目标元素
      Column() {
        Text('动画元素')
          .fontSize(16)
          .fontColor(Color.White)
      }
      .width(this.boxWidth)
      .height(this.boxHeight)
      .backgroundColor('#007DFF')
      .justifyContent(FlexAlign.Center)
      .opacity(this.boxOpacity)
      .translate({ x: this.boxTranslateX, y: this.boxTranslateY })
      .rotate({ angle: this.boxRotate })
      .scale({ x: this.boxScale, y: this.boxScale })
      .animation({ delay: -1 })
      .id('PreviewAnimation0030_004')
      .margin({ bottom: 30 })

      // 控制按钮组
      Scroll() {
        Column({ space: 10 }) {
          Button('宽度动画 (100 ↔ 200)')
            .width('90%')
            .id('PreviewAnimation0030_005')
            .onClick(() => {
              this.boxWidth = this.boxWidth === 100 ? 200 : 100
            })

          Button('高度动画 (100 ↔ 200)')
            .width('90%')
            .id('PreviewAnimation0030_006')
            .onClick(() => {
              this.boxHeight = this.boxHeight === 100 ? 200 : 100
            })

          Button('透明度动画 (1 ↔ 0.3)')
            .width('90%')
            .id('PreviewAnimation0030_007')
            .onClick(() => {
              this.boxOpacity = this.boxOpacity === 1 ? 0.3 : 1
            })

          Button('平移动画 (0 ↔ 100)')
            .width('90%')
            .id('PreviewAnimation0030_008')
            .onClick(() => {
              this.boxTranslateX = this.boxTranslateX === 0 ? 100 : 0
              this.boxTranslateY = this.boxTranslateY === 0 ? 50 : 0
            })

          Button('旋转动画 (0° ↔ 180°)')
            .width('90%')
            .id('PreviewAnimation0030_009')
            .onClick(() => {
              this.boxRotate = this.boxRotate === 0 ? 180 : 0
            })

          Button('缩放动画 (1 ↔ 1.5)')
            .width('90%')
            .id('PreviewAnimation0030_010')
            .onClick(() => {
              this.boxScale = this.boxScale === 1 ? 1.5 : 1
            })

          Button('组合动画')
            .width('90%')
            .backgroundColor('#FF6B6B')
            .id('PreviewAnimation0030_011')
            .onClick(() => {
              this.boxWidth = this.boxWidth === 100 ? 200 : 100
              this.boxHeight = this.boxHeight === 100 ? 200 : 100
              this.boxOpacity = this.boxOpacity === 1 ? 0.5 : 1
              this.boxTranslateX = this.boxTranslateX === 0 ? 50 : 0
              this.boxRotate = this.boxRotate === 0 ? 360 : 0
              this.boxScale = this.boxScale === 1 ? 1.2 : 1
            })

          Button('重置所有')
            .width('90%')
            .backgroundColor('#4CAF50')
            .id('PreviewAnimation0030_012')
            .onClick(() => {
              this.boxWidth = 100
              this.boxHeight = 100
              this.boxOpacity = 1
              this.boxTranslateX = 0
              this.boxTranslateY = 0
              this.boxRotate = 0
              this.boxScale = 1
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
