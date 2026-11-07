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

interface ScaleOption {
  x: number;
  y: number;
  z?: number;
  centerX?: string;
  centerY?: string;
}

@Entry
@Component
struct CommonAttrCommonModifier0120 {
  @State currentIndex: number = 0
  
  private scaleValues: Array<ScaleOption | null | undefined> = [
    {x: 1, y: 1, z: 1, centerX: '50%', centerY: '50%'},
    {x: 2, y: 0.5},
    undefined,
    null
  ]

  private scaleNames: string[] = [
    'x:1, y:1, z:1 (normal)',
    'x:2, y:0.5 (wide & short)',
    'undefined',
    'null'
  ]

  build() {
    Column() {
      Text('Scale Test')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text(`Current Index: ${this.currentIndex}`)
        .fontSize(16)
        .margin({ bottom: 10 })

      Text(`Scale: ${this.scaleNames[this.currentIndex]}`)
        .fontSize(14)
        .margin({ bottom: 20 })
        .textAlign(TextAlign.Center)

      // 创建测试区域
      Column() {
        Text('Scale Test Area')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 })

        // 参考组件（不缩放）
        Row() {
          Column() {
            Text('Reference')
              .fontSize(14)
              .fontColor(Color.White)
          }
          .width('13.89%')
          .height('8.2%')
          .backgroundColor(Color.Gray)
          .justifyContent(FlexAlign.Center)
          .margin(20)

          // 测试组件（应用scale）
          Column() {
            Text('Test Item')
              .fontSize(14)
              .fontColor(Color.White)
          }
          .width('13.89%')
          .height('8.2%')
          .backgroundColor(Color.Red)
          .justifyContent(FlexAlign.Center)
          .margin(20)
          .scale(this.scaleValues[this.currentIndex])
          .id('scale_component_commonmodifier_0120')
        }
        .justifyContent(FlexAlign.Center)
        .alignItems(VerticalAlign.Center)
        .width('48.61%')
        .height('16.39%')
        .backgroundColor('#F0F0F0')
        .border({ width: 2, color: Color.Gray })
      }
      .margin({ top: 20, bottom: 30 })

      // 添加另一个测试场景：多个组件对比
      Column() {
        Text('Multiple Components Comparison')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Row() {
          Column() {
            Text('Normal')
              .fontSize(12)
              .fontColor(Color.White)
          }
          .width('11.11%')
          .height('6.56%')
          .backgroundColor(Color.Blue)
          .justifyContent(FlexAlign.Center)
          .margin(10)

          Column() {
            Text('Scale')
              .fontSize(12)
              .fontColor(Color.White)
          }
          .width('11.11%')
          .height('6.56%')
          .backgroundColor(Color.Green)
          .justifyContent(FlexAlign.Center)
          .margin(10)
          .scale(this.scaleValues[this.currentIndex])

          Column() {
            Text('Normal')
              .fontSize(12)
              .fontColor(Color.White)
          }
          .width('11.11%')
          .height('6.56%')
          .backgroundColor(Color.Orange)
          .justifyContent(FlexAlign.Center)
          .margin(10)
        }
        .justifyContent(FlexAlign.SpaceAround)
        .width('48.61%')
        .height('12.3%')
        .backgroundColor('#F0F0F0')
        .border({ width: 2, color: Color.Gray })
      }
      .margin({ bottom: 30 })

      // 显示当前缩放参数详情
      if (this.scaleValues[this.currentIndex] !== null && this.scaleValues[this.currentIndex] !== undefined) {
        Text(`Details: x=${this.scaleValues[this.currentIndex]!.x}, y=${this.scaleValues[this.currentIndex]!.y}`)
          .fontSize(12)
          .fontColor(Color.Gray)
          .margin({ bottom: 20 })
          .textAlign(TextAlign.Center)
      } else {
        Text('Details: No scaling applied')
          .fontSize(12)
          .fontColor(Color.Gray)
          .margin({ bottom: 20 })
          .textAlign(TextAlign.Center)
      }

      Row() {
        Button('index--')
          .onClick(() => {
            if (this.currentIndex > 0) {
              this.currentIndex--
            }
          })
          .id('index_decrease_button_commonmodifier_0120')
          .margin({ right: 10 })

        Button('index++')
          .onClick(() => {
            if (this.currentIndex < this.scaleValues.length - 1) {
              this.currentIndex++
            }
          })
          .id('index_increase_button_commonmodifier_0120')
          .margin({ left: 10 })
      }
      .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Center)
  }
}
