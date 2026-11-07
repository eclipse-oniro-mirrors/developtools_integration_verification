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
struct CommonAttrCommonModifier0310 {
  @State currentIndex: number = 0
  
  private colorBlendValues: Color[] = [Color.Orange]
  private colorBlendNames: string[] = ['colorBlend: Color.Orange (橙色混合)']

  build() {
    Column() {
      // 创建测试区域 - 橙色混合测试
      Column() {
        Text('Orange Color Blend Test')
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
            .backgroundColor('#E8F5E8')
            .border({ width: 1, color: Color.Gray })
            .justifyContent(FlexAlign.Center)
          }
          .width('16.67%')
          .margin(10)
          .padding(10)
          .backgroundColor('#F5F5F5')
          .borderRadius(8)

          // 测试组件（应用colorBlend(Color.Orange)）
          Column() {
            Text('Test Component')
              .fontSize(14)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 10 })

            Column() {
              Text('🎨 Orange Blended')
                .fontSize(12)
                .margin({ bottom: 5 })

              Row() {
                Text('R').fontColor(Color.Red).fontSize(16).margin(2)
                Text('G').fontColor(Color.Green).fontSize(16).margin(2)
                Text('B').fontColor(Color.Blue).fontSize(16).margin(2)
              }
              .margin({ bottom: 5 })

              Text('Orange Blend')
                .fontSize(10)
                .fontColor(Color.Gray)
            }
            .width('13.89%')
            .height('6.56%')
            .backgroundColor('#E8F5E8')
            .border({ width: 1, color: Color.Gray })
            .justifyContent(FlexAlign.Center)
            .colorBlend(this.colorBlendValues[this.currentIndex])
            .id('colorblend_component_commonmodifier_0310')
          }
          .width('16.67%')
          .margin(10)
          .padding(10)
          .backgroundColor('#FFE4B5')
          .borderRadius(8)
        }
        .justifyContent(FlexAlign.SpaceAround)
        .width('41.67%')
        .height('12.3%')
        .backgroundColor('#F0F0F0')
        .border({ width: 2, color: Color.Gray })
      }
      .margin({ top: 20, bottom: 30 })

      // 橙色混合彩色验证测试
      Column() {
        Text('Orange Color Blend Effect Test')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 15 })

        Column() {
          Text('Color Palette - Orange Blend Effect')
            .fontSize(12)
            .margin({ bottom: 10 })

          // 第四行：渐变测试
          Row() {
            Text('Gradient:')
              .fontSize(10)
              .width(60)
              .textAlign(TextAlign.Start)

            Column() {
              Text('Orange Blended')
                .fontSize(10)
                .fontColor(Color.White)
            }
            .width('25%')
            .height('2.46%')
            .linearGradient({
              direction: GradientDirection.Left,
              colors: [
                [Color.Red, 0.0],
                [Color.Yellow, 0.3],
                [Color.Green, 0.6],
                [Color.Blue, 1.0]
              ]
            })
            .colorBlend(this.colorBlendValues[this.currentIndex])
            .justifyContent(FlexAlign.Center)
          }
          .width('100%')
          .margin({ bottom: 8 })

          // 第五行：灰度测试
          Row() {
            Text('Grays:')
              .fontSize(10)
              .width(60)
              .textAlign(TextAlign.Start)

            Row() {
              Column().width('3.47%').height('2.05%').backgroundColor('#FFFFFF').margin(2) // 白色
              Column().width('3.47%').height('2.05%').backgroundColor('#CCCCCC').margin(2) // 浅灰
              Column().width('3.47%').height('2.05%').backgroundColor('#999999').margin(2) // 中灰
              Column().width('3.47%').height('2.05%').backgroundColor('#666666').margin(2) // 深灰
              Column().width('3.47%').height('2.05%').backgroundColor('#333333').margin(2) // 很深灰
              Column().width('3.47%').height('2.05%').backgroundColor('#000000').margin(2) // 黑色
            }
            .colorBlend(this.colorBlendValues[this.currentIndex])
          }
          .width('100%')
        }
        .width('38.89%')
        .backgroundColor('#FAFAFA')
        .border({ width: 1, color: Color.Gray })
        .padding(10)
        .borderRadius(8)
      }
      .margin({ bottom: 30 })

      // 不同颜色混合对比测试
      Column() {
        Text('Color Blend Comparison Test')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 15 })

        Row() {
          // 无混合
          Column() {
            Text('None')
              .fontSize(12)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 5 })

            Column() {
              Text('🌈')
                .fontSize(24)
              Text('Original')
                .fontSize(8)
            }
            .width('8.33%')
            .height('4.1%')
            .backgroundColor('#87CEEB')
            .justifyContent(FlexAlign.Center)
            .border({ width: 1, color: Color.Gray })
          }
          .margin(5)

          // 橙色混合
          Column() {
            Text('Orange')
              .fontSize(12)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 5 })

            Column() {
              Text('🌈')
                .fontSize(24)
              Text('Blended')
                .fontSize(8)
            }
            .width('8.33%')
            .height('4.1%')
            .backgroundColor('#87CEEB')
            .colorBlend(this.colorBlendValues[this.currentIndex])
            .justifyContent(FlexAlign.Center)
            .border({ width: 2, color: Color.Orange })
          }
          .margin(5)

          // 红色混合对比
          Column() {
            Text('Red')
              .fontSize(12)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 5 })

            Column() {
              Text('🌈')
                .fontSize(24)
              Text('Compare')
                .fontSize(8)
            }
            .width('8.33%')
            .height('4.1%')
            .backgroundColor('#87CEEB')
            .colorBlend(Color.Red)
            .justifyContent(FlexAlign.Center)
            .border({ width: 1, color: Color.Gray })
          }
          .margin(5)

          // 蓝色混合对比
          Column() {
            Text('Blue')
              .fontSize(12)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 5 })

            Column() {
              Text('🌈')
                .fontSize(24)
              Text('Compare')
                .fontSize(8)
            }
            .width('8.33%')
            .height('4.1%')
            .backgroundColor('#87CEEB')
            .colorBlend(Color.Blue)
            .justifyContent(FlexAlign.Center)
            .border({ width: 1, color: Color.Gray })
          }
          .margin(5)
        }
        .justifyContent(FlexAlign.SpaceAround)
        .width('38.89%')
        .backgroundColor('#FFF8DC')
        .border({ width: 1, color: Color.Orange })
        .padding(10)
        .borderRadius(8)
      }
      .margin({ bottom: 30 })

      // 显示当前colorBlend值和说明
      Column() {
        Text(`Current ColorBlend Value: Orange`)
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })
      }
      .margin({ bottom: 20 })

      Row() {
        Button('index--')
          .onClick(() => {
            if (this.currentIndex > 0) {
              this.currentIndex--
            }
          })
          .id('index_decrease_button_commonmodifier_0310')
          .margin({ right: 10 })

        Button('index++')
          .onClick(() => {
            if (this.currentIndex < this.colorBlendValues.length - 1) {
              this.currentIndex++
            }
          })
          .id('index_increase_button_commonmodifier_0310')
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
