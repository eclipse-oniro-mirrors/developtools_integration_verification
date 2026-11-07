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
struct CommonAttrCommonModifier0480 {
  @State currentIndex: number = 0
  
  private grayscaleValues: number[] = [10000]
  private grayscaleNames: string[] = ['grayscale: 10000']

  build() {
    Column() {
      Text('Grayscale Test (10000)')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text(`Current Index: ${this.currentIndex}`)
        .fontSize(16)
        .margin({ bottom: 10 })

      Text(`Config: ${this.grayscaleNames[this.currentIndex]}`)
        .fontSize(12)
        .margin({ bottom: 20 })

      // 简洁的对比测试区域
      Row() {
        // 参考组件
        Column() {
          Text('Reference')
            .fontSize(14)
            .margin({ bottom: 10 })

          Column() {
            Text('🚀')
              .fontSize(32)
            Text('Normal')
              .fontSize(12)
          }
          .width('13.89%')
          .height('8.2%')
          .backgroundColor('#FFB6C1')
          .justifyContent(FlexAlign.Center)
          .border({ width: 1, color: Color.Gray })
        }
        .margin(20)

        // 测试组件
        Column() {
          Text('Grayscale 10000')
            .fontSize(14)
            .margin({ bottom: 10 })

          Column() {
            Text('🚀')
              .fontSize(32)
            Text('Extreme')
              .fontSize(12)
          }
          .width('13.89%')
          .height('8.2%')
          .backgroundColor('#FFB6C1')
          .grayscale(this.grayscaleValues[this.currentIndex])
          .justifyContent(FlexAlign.Center)
          .border({ width: 2, color: Color.Orange })
          .id('grayscale_component_commonmodifier_0480')
        }
        .margin(20)
      }
      .justifyContent(FlexAlign.SpaceAround)
      .margin({ top: 30, bottom: 40 })

      // 简洁的颜色测试
      Column() {
        Text('Extreme Positive Grayscale Test')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 15 })

        Row() {
          Column().width('5.56%').height('3.28%').backgroundColor('#FF69B4').margin(5) // 热粉色
          Column().width('5.56%').height('3.28%').backgroundColor('#00FFFF').margin(5) // 青色
          Column().width('5.56%').height('3.28%').backgroundColor('#FFD700').margin(5) // 金色
          Column().width('5.56%').height('3.28%').backgroundColor('#FF4500').margin(5) // 橙红色
          Column().width('5.56%').height('3.28%').backgroundColor('#9370DB').margin(5) // 中紫色
        }
        .grayscale(this.grayscaleValues[this.currentIndex])
        .margin({ bottom: 20 })

        Text(`Extreme positive value - 10000x grayscale`)
          .fontSize(12)
          .fontColor(Color.Gray)
      }
      .margin({ bottom: 40 })

      Row() {
        Button('index--')
          .onClick(() => {
            if (this.currentIndex > 0) {
              this.currentIndex--
            }
          })
          .id('index_decrease_button_commonmodifier_0480')
          .margin({ right: 10 })

        Button('index++')
          .onClick(() => {
            if (this.currentIndex < this.grayscaleValues.length - 1) {
              this.currentIndex++
            }
          })
          .id('index_increase_button_commonmodifier_0480')
          .margin({ left: 10 })
      }
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Center)
  }
}
