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
struct CommonAttrCommonModifier0450 {
  @State currentIndex: number = 0
  
  private grayscaleValues: number[] = [0.05]
  private grayscaleNames: string[] = ['grayscale: 0.05']

  build() {
    Column() {
      Text('Grayscale Test (0.05)')
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
            Text('🌸')
              .fontSize(32)
            Text('Colorful')
              .fontSize(12)
          }
          .width('13.89%')
          .height('8.2%')
          .backgroundColor('#FF69B4')
          .justifyContent(FlexAlign.Center)
          .border({ width: 1, color: Color.Gray })
        }
        .margin(20)

        // 测试组件
        Column() {
          Text('Grayscale 0.05')
            .fontSize(14)
            .margin({ bottom: 10 })

          Column() {
            Text('🌸')
              .fontSize(32)
            Text('Subtle')
              .fontSize(12)
          }
          .width('13.89%')
          .height('8.2%')
          .backgroundColor('#FF69B4')
          .grayscale(this.grayscaleValues[this.currentIndex])
          .justifyContent(FlexAlign.Center)
          .border({ width: 2, color: Color.Pink })
          .id('grayscale_component_commonmodifier_0450')
        }
        .margin(20)
      }
      .justifyContent(FlexAlign.SpaceAround)
      .margin({ top: 30, bottom: 40 })

      // 简洁的颜色测试
      Column() {
        Text('Minimal Grayscale Effect Test')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 15 })

        Row() {
          Column().width('5.56%').height('3.28%').backgroundColor('#FF1493').margin(5) // 深粉色
          Column().width('5.56%').height('3.28%').backgroundColor('#00CED1').margin(5) // 深青色
          Column().width('5.56%').height('3.28%').backgroundColor('#FF8C00').margin(5) // 深橙色
          Column().width('5.56%').height('3.28%').backgroundColor('#9370DB').margin(5) // 中紫色
          Column().width('5.56%').height('3.28%').backgroundColor('#32CD32').margin(5) // 酸橙绿
        }
        .grayscale(this.grayscaleValues[this.currentIndex])
        .margin({ bottom: 20 })

        Text(`5% grayscale - subtle desaturation`)
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
          .id('index_decrease_button_commonmodifier_0450')
          .margin({ right: 10 })

        Button('index++')
          .onClick(() => {
            if (this.currentIndex < this.grayscaleValues.length - 1) {
              this.currentIndex++
            }
          })
          .id('index_increase_button_commonmodifier_0450')
          .margin({ left: 10 })
      }
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Center)
  }
}
