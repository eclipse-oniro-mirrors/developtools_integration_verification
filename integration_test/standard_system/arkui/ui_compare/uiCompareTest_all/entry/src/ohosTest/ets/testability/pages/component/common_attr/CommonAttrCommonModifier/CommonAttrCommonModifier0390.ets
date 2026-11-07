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
struct CommonAttrCommonModifier0390 {
  @State currentIndex: number = 0
  
  private colorBlendValues: Color[] = [Color.Blue]
  private colorBlendNames: string[] = ['colorBlend: Color.Blue']

  build() {
    Column() {
      Text('ColorBlend Test (Blue)')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text(`Current Index: ${this.currentIndex}`)
        .fontSize(16)
        .margin({ bottom: 10 })

      Text(`Config: ${this.colorBlendNames[this.currentIndex]}`)
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
            Text('🎨')
              .fontSize(32)
            Text('Original')
              .fontSize(12)
          }
          .width('13.89%')
          .height('8.2%')
          .backgroundColor('#FFE4B5')
          .justifyContent(FlexAlign.Center)
          .border({ width: 1, color: Color.Gray })
        }
        .margin(20)

        // 测试组件
        Column() {
          Text('Blue Blend')
            .fontSize(14)
            .margin({ bottom: 10 })

          Column() {
            Text('🎨')
              .fontSize(32)
            Text('Blended')
              .fontSize(12)
          }
          .width('13.89%')
          .height('8.2%')
          .backgroundColor('#FFE4B5')
          .colorBlend(this.colorBlendValues[this.currentIndex])
          .justifyContent(FlexAlign.Center)
          .border({ width: 2, color: Color.Blue })
          .id('colorblend_component_commonmodifier_0390')
        }
        .margin(20)
      }
      .justifyContent(FlexAlign.SpaceAround)
      .margin({ top: 30, bottom: 40 })

      // 简洁的颜色测试
      Column() {
        Text('Color Effect Test')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 15 })

        Row() {
          Column().width('5.56%').height('3.28%').backgroundColor('#FF0000').margin(5) // 红色
          Column().width('5.56%').height('3.28%').backgroundColor('#00FF00').margin(5) // 绿色
          Column().width('5.56%').height('3.28%').backgroundColor('#FFFF00').margin(5) // 黄色
          Column().width('5.56%').height('3.28%').backgroundColor('#FF00FF').margin(5) // 紫色
          Column().width('5.56%').height('3.28%').backgroundColor('#FFFFFF').margin(5) // 白色
        }
        .colorBlend(this.colorBlendValues[this.currentIndex])
        .margin({ bottom: 20 })

        Text(`Blue blend effect on various colors`)
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
          .id('index_decrease_button_commonmodifier_0390')
          .margin({ right: 10 })

        Button('index++')
          .onClick(() => {
            if (this.currentIndex < this.colorBlendValues.length - 1) {
              this.currentIndex++
            }
          })
          .id('index_increase_button_commonmodifier_0390')
          .margin({ left: 10 })
      }
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Center)
  }
}
