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
struct CommonAttrCommonModifier0350 {
  @State currentIndex: number = 0
  
  private colorBlendValues: Array<Color | Resource | string> = [Color.Red]
  private colorBlendNames: string[] = ['colorBlend: Color.Red (资源引用蓝色混合)']

  build() {
    Column() {
      // 创建测试区域 - 资源引用蓝色混合测试
      Column() {
        Text('Resource Reference Blue Blend Test')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 })

        Row() {

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

              Text('$r() Blend')
                .fontSize(10)
                .fontColor(Color.Gray)
            }
            .width('13.89%')
            .height('6.56%')
            .backgroundColor('#FFF8DC')
            .border({ width: 1, color: Color.Gray })
            .justifyContent(FlexAlign.Center)
            .colorBlend(this.colorBlendValues[this.currentIndex])
            .id('colorblend_component_commonmodifier_0350')
          }
          .width('16.67%')
          .margin(10)
          .padding(10)
          .backgroundColor('#E6F3FF')
          .borderRadius(8)
        }
        .justifyContent(FlexAlign.SpaceAround)
        .width('41.67%')
        .height('12.3%')
        .backgroundColor('#F0F0F0')
        .border({ width: 2, color: Color.Gray })
      }
      .margin({ top: 20, bottom: 30 })

      // 资源引用混合彩色验证测试
      Column() {
        Text('Resource Reference Blend Effect Test')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 15 })

        Column() {
          Text('Color Palette - Color.Red Blend Effect')
            .fontSize(12)
            .margin({ bottom: 10 })

          // 第三行：彩色方块测试
          Row() {
            Text('Blocks:')
              .fontSize(10)
              .width(60)
              .textAlign(TextAlign.Start)

            Row() {
              Column().width('3.47%').height('2.05%').backgroundColor('#FF0000').margin(2) // 红色
              Column().width('3.47%').height('2.05%').backgroundColor('#FFA500').margin(2) // 橙色
              Column().width('3.47%').height('2.05%').backgroundColor('#FFFF00').margin(2) // 黄色
              Column().width('3.47%').height('2.05%').backgroundColor('#00FF00').margin(2) // 绿色
              Column().width('3.47%').height('2.05%').backgroundColor('#800080').margin(2) // 紫色
              Column().width('3.47%').height('2.05%').backgroundColor('#FFFFFF').margin(2) // 白色
            }
            .colorBlend(this.colorBlendValues[this.currentIndex])
          }
          .width('100%')
          .margin({ bottom: 8 })

          // 第五行：图像风格测试
          Row() {
            Text('Images:')
              .fontSize(10)
              .width(60)
              .textAlign(TextAlign.Start)

            Row() {
              Column() {
                Text('🌊')
                  .fontSize(24)
                Text('Ocean')
                  .fontSize(8)
              }
              .width('5.56%')
              .height('2.87%')
              .backgroundColor('#87CEEB')
              .colorBlend(this.colorBlendValues[this.currentIndex])
              .justifyContent(FlexAlign.Center)
              .margin(2)

              Column() {
                Text('🌸')
                  .fontSize(24)
                Text('Flower')
                  .fontSize(8)
              }
              .width('5.56%')
              .height('2.87%')
              .backgroundColor('#FFB6C1')
              .colorBlend(this.colorBlendValues[this.currentIndex])
              .justifyContent(FlexAlign.Center)
              .margin(2)

              Column() {
                Text('🌳')
                  .fontSize(24)
                Text('Tree')
                  .fontSize(8)
              }
              .width('5.56%')
              .height('2.87%')
              .backgroundColor('#90EE90')
              .colorBlend(this.colorBlendValues[this.currentIndex])
              .justifyContent(FlexAlign.Center)
              .margin(2)

              Column() {
                Text('☀️')
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

      // 资源引用对比测试
      Column() {
        Text('Resource vs Direct Value Comparison')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 15 })

        Column() {
          Text('Resource Reference vs Direct Color Value')
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
                Text('🎯')
                  .fontSize(24)
                Text('Original')
                  .fontSize(8)
              }
              .width('8.33%')
              .height('4.1%')
              .backgroundColor('#DDA0DD')
              .justifyContent(FlexAlign.Center)
              .border({ width: 1, color: Color.Gray })
            }
            .margin(5)

            // 资源引用混合
            Column() {
              Text('$r() Blue')
                .fontSize(10)
                .fontWeight(FontWeight.Bold)
                .margin({ bottom: 5 })
            }
            .margin(5)
          }
          .justifyContent(FlexAlign.SpaceAround)
        }
        .width('38.89%')
        .backgroundColor('#F0F8FF')
        .border({ width: 1, color: Color.Blue })
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
          .id('index_decrease_button_commonmodifier_0350')
          .margin({ right: 10 })

        Button('index++')
          .onClick(() => {
            if (this.currentIndex < this.colorBlendValues.length - 1) {
              this.currentIndex++
            }
          })
          .id('index_increase_button_commonmodifier_0350')
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
