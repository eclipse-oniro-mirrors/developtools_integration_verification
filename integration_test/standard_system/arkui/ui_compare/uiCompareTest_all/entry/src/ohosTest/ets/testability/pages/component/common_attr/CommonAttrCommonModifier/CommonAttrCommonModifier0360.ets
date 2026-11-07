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
struct CommonAttrCommonModifier0360 {
  @State currentIndex: number = 0
  
  private colorBlendValues: Array<Color | Resource | string> = [Color.Red]
  private colorBlendNames: string[] = ['colorBlend: Color.Red (资源引用红色混合)']

  build() {
    Column() {

      // 创建测试区域 - 资源引用红色混合测试
      Column() {
        Text('Resource Reference Red Blend Test')
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
            .backgroundColor('#E6FFE6')
            .border({ width: 1, color: Color.Gray })
            .justifyContent(FlexAlign.Center)
          }
          .width('16.67%')
          .margin(10)
          .padding(10)
          .backgroundColor('#F5F5F5')
          .borderRadius(8)

          // 测试组件（应用colorBlend(Color.Red)）
          Column() {
            Text('Test Component')
              .fontSize(14)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 10 })

            Column() {
              Text('🎨 Resource Blended')
                .fontSize(12)
                .margin({ bottom: 5 })

              Row() {
                Text('R').fontColor(Color.Red).fontSize(16).margin(2)
                Text('G').fontColor(Color.Green).fontSize(16).margin(2)
                Text('B').fontColor(Color.Blue).fontSize(16).margin(2)
              }
              .margin({ bottom: 5 })

              Text('$r() Red Blend')
                .fontSize(10)
                .fontColor(Color.Gray)
            }
            .width('13.89%')
            .height('6.56%')
            .backgroundColor('#E6FFE6')
            .border({ width: 1, color: Color.Gray })
            .justifyContent(FlexAlign.Center)
            .colorBlend(this.colorBlendValues[this.currentIndex])
            .id('colorblend_component_commonmodifier_0360')
          }
          .width('16.67%')
          .margin(10)
          .padding(10)
          .backgroundColor('#FFE6E6')
          .borderRadius(8)
        }
        .justifyContent(FlexAlign.SpaceAround)
        .width('41.67%')
        .height('12.3%')
        .backgroundColor('#F0F0F0')
        .border({ width: 2, color: Color.Gray })
      }
      .margin({ top: 20, bottom: 30 })

      // 资源引用红色混合彩色验证测试
      Column() {
        Text('Resource Red Blend Effect Test')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 15 })

        Column() {
          Text('Color Palette - Color.Red Blend Effect')
            .fontSize(12)
            .margin({ bottom: 10 })

          // 第四行：冷暖色调对比
          Row() {
            Text('Cool/Warm:')
              .fontSize(9)
              .width(60)
              .textAlign(TextAlign.Start)

            Row() {
              Column().width('3.47%').height('2.05%').backgroundColor('#87CEEB').margin(2) // 天蓝色
              Column().width('3.47%').height('2.05%').backgroundColor('#98FB98').margin(2) // 浅绿色
              Column().width('3.47%').height('2.05%').backgroundColor('#DDA0DD').margin(2) // 梅花色
              Column().width('3.47%').height('2.05%').backgroundColor('#F0E68C').margin(2) // 卡其色
              Column().width('3.47%').height('2.05%').backgroundColor('#FFB6C1').margin(2) // 浅粉色
              Column().width('3.47%').height('2.05%').backgroundColor('#E0E0E0').margin(2) // 浅灰色
            }
            .colorBlend(this.colorBlendValues[this.currentIndex])
          }
          .width('100%')
          .margin({ bottom: 8 })

          // 第五行：自然场景测试
          Row() {
            Text('Nature:')
              .fontSize(10)
              .width(60)
              .textAlign(TextAlign.Start)

            Row() {
              Column() {
                Text('🌲')
                  .fontSize(24)
                Text('Forest')
                  .fontSize(8)
              }
              .width('5.56%')
              .height('2.87%')
              .backgroundColor('#228B22')
              .colorBlend(this.colorBlendValues[this.currentIndex])
              .justifyContent(FlexAlign.Center)
              .margin(2)

              Column() {
                Text('🌊')
                  .fontSize(24)
                Text('Ocean')
                  .fontSize(8)
              }
              .width('5.56%')
              .height('2.87%')
              .backgroundColor('#4682B4')
              .colorBlend(this.colorBlendValues[this.currentIndex])
              .justifyContent(FlexAlign.Center)
              .margin(2)

              Column() {
                Text('🌻')
                  .fontSize(24)
                Text('Sun')
                  .fontSize(8)
              }
              .width('5.56%')
              .height('2.87%')
              .backgroundColor('#FFD700')
              .colorBlend(this.colorBlendValues[this.currentIndex])
              .justifyContent(FlexAlign.Center)
              .margin(2)

              Column() {
                Text('🌙')
                  .fontSize(24)
                Text('Night')
                  .fontSize(8)
              }
              .width('5.56%')
              .height('2.87%')
              .backgroundColor('#2F4F4F')
              .colorBlend(this.colorBlendValues[this.currentIndex])
              .justifyContent(FlexAlign.Center)
              .margin(2)
            }
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

      // 红色资源引用对比测试
      Column() {
        Text('Red Resource Reference Comparison')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 15 })

        Column() {
          Text('Resource Red vs Other Color Values')
            .fontSize(12)
            .margin({ bottom: 10 })

          Row() {
            // 无混合
            Column() {
              Text('None')
                .fontSize(12)
                .fontWeight(FontWeight.Bold)
                .margin({ bottom: 5 })

              Column() {
                Text('🎪')
                  .fontSize(24)
                Text('Original')
                  .fontSize(8)
              }
              .width('8.33%')
              .height('4.1%')
              .backgroundColor('#98FB98')
              .justifyContent(FlexAlign.Center)
              .border({ width: 1, color: Color.Gray })
            }
            .margin(5)

            // 资源引用红色混合
            Column() {
              Text('$r() Red')
                .fontSize(10)
                .fontWeight(FontWeight.Bold)
                .margin({ bottom: 5 })

              Column() {
                Text('🎪')
                  .fontSize(24)
                Text('Resource')
                  .fontSize(8)
              }
              .width('8.33%')
              .height('4.1%')
              .backgroundColor('#98FB98')
              .colorBlend(this.colorBlendValues[this.currentIndex])
              .justifyContent(FlexAlign.Center)
              .border({ width: 2, color: Color.Red })
            }
            .margin(5)

            // 蓝色资源对比
            Column() {
              Text('$r() Blue')
                .fontSize(9)
                .fontWeight(FontWeight.Bold)
                .margin({ bottom: 5 })

              Column() {
                Text('🎪')
                  .fontSize(24)
                Text('Compare')
                  .fontSize(8)
              }
              .width('8.33%')
              .height('4.1%')
              .backgroundColor('#98FB98')
              .colorBlend(Color.Red)
              .justifyContent(FlexAlign.Center)
              .border({ width: 1, color: Color.Gray })
            }
            .margin(5)
          }
          .justifyContent(FlexAlign.SpaceAround)

          // 资源引用详细说明
          Column() {
            Text('Red Resource Analysis:')
              .fontSize(12)
              .fontWeight(FontWeight.Bold)
              .margin({ top: 15, bottom: 8 })
          }
        }
        .width('38.89%')
        .backgroundColor('#FFF0F0')
        .border({ width: 1, color: Color.Red })
        .padding(10)
        .borderRadius(8)
      }
      .margin({ bottom: 30 })

      Row() {
        Button('index--')
          .onClick(() => {
            if (this.currentIndex > 0) {
              this.currentIndex--
            }
          })
          .id('index_decrease_button_commonmodifier_0360')
          .margin({ right: 10 })

        Button('index++')
          .onClick(() => {
            if (this.currentIndex < this.colorBlendValues.length - 1) {
              this.currentIndex++
            }
          })
          .id('index_increase_button_commonmodifier_0360')
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
