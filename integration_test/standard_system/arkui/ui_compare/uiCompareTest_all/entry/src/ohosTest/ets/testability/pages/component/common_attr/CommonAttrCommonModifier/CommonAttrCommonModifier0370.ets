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
struct CommonAttrCommonModifier0370 {
  @State currentIndex: number = 0
  private colorBlendValues: string[] = ['']
  private colorBlendNames: string[] = ['colorBlend: "" (空字符串边界值测试)']

  build() {
    Column() {

      // 创建测试区域 - 空字符串边界值测试
      Column() {
        Text('Empty String Boundary Value Test')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 })

        Row() {
          // 参考组件（无colorBlend效果）
          Column() {
            Text('Reference')
              .fontSize(14)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 10 })

            Column() {
              Text('🎨 Original Colors')
                .fontSize(12)
                .margin({ bottom: 5 })

              Row() {
                Text('R').fontColor(Color.Red).fontSize(16).margin(2)
                Text('G').fontColor(Color.Green).fontSize(16).margin(2)
                Text('B').fontColor(Color.Blue).fontSize(16).margin(2)
              }
              .margin({ bottom: 5 })

              Text('No Color Blend')
                .fontSize(10)
                .fontColor(Color.Gray)
            }
            .width('13.89%')
            .height('6.56%')
            .backgroundColor('#F0F8FF')
            .border({ width: 1, color: Color.Gray })
            .justifyContent(FlexAlign.Center)
          }
          .width('16.67%')
          .margin(10)
          .padding(10)
          .backgroundColor('#F5F5F5')
          .borderRadius(8)

          // 测试组件（应用colorBlend("")）
          Column() {
            Text('Test Component')
              .fontSize(14)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 10 })

            Column() {
              Text('🎨 Empty String')
                .fontSize(12)
                .margin({ bottom: 5 })

              Row() {
                Text('R').fontColor(Color.Red).fontSize(16).margin(2)
                Text('G').fontColor(Color.Green).fontSize(16).margin(2)
                Text('B').fontColor(Color.Blue).fontSize(16).margin(2)
              }
              .margin({ bottom: 5 })

              Text('"" Blend')
                .fontSize(10)
                .fontColor(Color.Gray)
            }
            .width('13.89%')
            .height('6.56%')
            .backgroundColor('#F0F8FF')
            .border({ width: 1, color: Color.Gray })
            .justifyContent(FlexAlign.Center)
            .colorBlend(this.colorBlendValues[this.currentIndex])
            .id('colorblend_component_commonmodifier_0370')
          }
          .width('16.67%')
          .margin(10)
          .padding(10)
          .backgroundColor('#FFFACD')
          .borderRadius(8)
        }
        .justifyContent(FlexAlign.SpaceAround)
        .width('41.67%')
        .height('12.3%')
        .backgroundColor('#F0F0F0')
        .border({ width: 2, color: Color.Gray })
      }
      .margin({ top: 20, bottom: 30 })

      // 空字符串边界值验证测试
      Column() {
        Text('Empty String Boundary Effect Test')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 15 })

        Column() {
          Text('Color Palette - Empty String ("") Blend Effect')
            .fontSize(12)
            .margin({ bottom: 10 })
        }
        .width('38.89%')
        .backgroundColor('#FAFAFA')
        .border({ width: 1, color: Color.Gray })
        .padding(10)
        .borderRadius(8)
      }
      .margin({ bottom: 30 })

      // 边界值处理对比测试
      Column() {
        Text('Boundary Value Handling Comparison')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 15 })


        Row() {
          Button('index--')
            .onClick(() => {
              if (this.currentIndex > 0) {
                this.currentIndex--
              }
            })
            .id('index_decrease_button_commonmodifier_0370')
            .margin({ right: 10 })

          Button('index++')
            .onClick(() => {
              if (this.currentIndex < this.colorBlendValues.length - 1) {
                this.currentIndex++
              }
            })
            .id('index_increase_button_commonmodifier_0370')
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
}