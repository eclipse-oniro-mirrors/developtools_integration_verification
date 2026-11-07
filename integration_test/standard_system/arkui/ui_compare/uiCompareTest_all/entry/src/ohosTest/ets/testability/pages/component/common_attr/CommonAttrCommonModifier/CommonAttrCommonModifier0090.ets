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

interface RotateOption {
  x: number;
  y: number;
  z: number;
  centerX: string;
  centerY: string;
  centerZ: number;
  perspective: number;
  angle: number;
}

@Entry
@Component
struct CommonAttrCommonModifier0090 {
  @State currentIndex: number = 0
  
  private rotateValues: Array<RotateOption | null | undefined> = [
    {x: 0, y: 0, z: 0, centerX: '50%', centerY: '50%', centerZ: 0, perspective: 0, angle: 0},
    {x: 0, y: 0, z: 1, centerX: '50%', centerY: '50%', centerZ: 0, perspective: 0, angle: 300},
    undefined,
    null
  ]

  private rotateNames: string[] = [
    'angle: 0° (no rotation)',
    'z-axis: 300° rotation',
    'undefined',
    'null'
  ]

  build() {
    Column() {
      Text('Rotate Test')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text(`Current Index: ${this.currentIndex}`)
        .fontSize(16)
        .margin({ bottom: 10 })

      Text(`Rotate: ${this.rotateNames[this.currentIndex]}`)
        .fontSize(14)
        .margin({ bottom: 20 })
        .textAlign(TextAlign.Center)

      // 创建测试区域
      Column() {
        Text('Rotate Test Area')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 })

        // 参考组件（不旋转）
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

          // 测试组件（应用rotate）
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
          .rotate(this.rotateValues[this.currentIndex])
          .id('rotate_component_commonmodifier_0090')
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
            Text('Rotate')
              .fontSize(12)
              .fontColor(Color.White)
          }
          .width('11.11%')
          .height('6.56%')
          .backgroundColor(Color.Green)
          .justifyContent(FlexAlign.Center)
          .margin(10)
          .rotate(this.rotateValues[this.currentIndex])

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

      // 显示当前旋转参数详情
      if (this.rotateValues[this.currentIndex] !== null && this.rotateValues[this.currentIndex] !== undefined) {
        Text(`Details: angle=${this.rotateValues[this.currentIndex]!.angle}°, z=${this.rotateValues[this.currentIndex]!.z}`)
          .fontSize(12)
          .fontColor(Color.Gray)
          .margin({ bottom: 20 })
          .textAlign(TextAlign.Center)
      } else {
        Text('Details: No rotation applied')
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
          .id('index_decrease_button_commonmodifier_0090')
          .margin({ right: 10 })

        Button('index++')
          .onClick(() => {
            if (this.currentIndex < this.rotateValues.length - 1) {
              this.currentIndex++
            }
          })
          .id('index_increase_button_commonmodifier_0090')
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
