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
struct CommonAttrCommonModifier0340 {
  @State currentIndex: number = 0
  
  private colorBlendValues: string[] = ['rgba(255, 100, 100, 0.5)']
  private colorBlendNames: string[] = ['colorBlend: "rgba(255, 100, 100, 0.5)" (RGBA半透明红色混合)']

  build() {
    Column() {
      // 创建测试区域 - RGBA半透明红色混合测试
      Column() {
        Text('RGBA Semi-Transparent Red Blend Test')
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

          // 测试组件（应用colorBlend("rgba(255, 100, 100, 0.5)")）
        }
        .justifyContent(FlexAlign.SpaceAround)
        .width('41.67%')
        .height('12.3%')
        .backgroundColor('#F0F0F0')
        .border({ width: 2, color: Color.Gray })
      }
      .margin({ top: 20, bottom: 30 })

      // RGBA半透明混合彩色验证测试
      Column() {
        Text('RGBA Semi-Transparent Blend Effect Test')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 15 })

        Column() {
          Text('Color Palette - RGBA(255,100,100,0.5) Blend Effect')
            .fontSize(12)
            .margin({ bottom: 10 })

          // 第一行：原始颜色
          Row() {
            Text('Original:')
              .fontSize(10)
              .width(60)
              .textAlign(TextAlign.Start)

            Row() {
              Text('🔴').fontSize(20).margin(2)
              Text('🟠').fontSize(20).margin(2)
              Text('🟡').fontSize(20).margin(2)
              Text('🟢').fontSize(20).margin(2)
              Text('🔵').fontSize(20).margin(2)
              Text('🟣').fontSize(20).margin(2)
            }
            .backgroundColor('#FFFFFF')
            .padding(5)
            .border({ width: 1, color: Color.Gray })
          }
          .width('100%')
          .margin({ bottom: 8 })

          // 第二行：colorBlend("rgba(255, 100, 100, 0.5)")效果
          Row() {
            Text('RGBA:')
              .fontSize(10)
              .width(60)
              .textAlign(TextAlign.Start)

            Row() {
              Text('🔴').fontSize(20).margin(2)
              Text('🟠').fontSize(20).margin(2)
              Text('🟡').fontSize(20).margin(2)
              Text('🟢').fontSize(20).margin(2)
              Text('🔵').fontSize(20).margin(2)
              Text('🟣').fontSize(20).margin(2)
            }
            .backgroundColor('#FFFFFF')
            .padding(5)
            .border({ width: 1, color: Color.Gray })
            .colorBlend(this.colorBlendValues[this.currentIndex])
          }
          .width('100%')
          .margin({ bottom: 8 })

          // 第三行：彩色方块测试
          Row() {
            Text('Blocks:')
              .fontSize(10)
              .width(60)
              .textAlign(TextAlign.Start)

            Row() {
              Column().width('3.47%').height('2.05%').backgroundColor('#FF0000').margin(2) // 纯红
              Column().width('3.47%').height('2.05%').backgroundColor('#00FF00').margin(2) // 纯绿
              Column().width('3.47%').height('2.05%').backgroundColor('#0000FF').margin(2) // 纯蓝
              Column().width('3.47%').height('2.05%').backgroundColor('#FFFF00').margin(2) // 黄色
              Column().width('3.47%').height('2.05%').backgroundColor('#FF00FF').margin(2) // 紫红
              Column().width('3.47%').height('2.05%').backgroundColor('#00FFFF').margin(2) // 青色
            }
            .colorBlend(this.colorBlendValues[this.currentIndex])
          }
          .width('100%')
          .margin({ bottom: 8 })

          // 第四行：不同背景测试
          Row() {
            Text('Backgrounds:')
              .fontSize(9)
              .width(60)
              .textAlign(TextAlign.Start)

            Row() {
              Column().width('3.47%').height('2.05%').backgroundColor('#FFFFFF').margin(2) // 白色背景
              Column().width('3.47%').height('2.05%').backgroundColor('#808080').margin(2) // 灰色背景
              Column().width('3.47%').height('2.05%').backgroundColor('#000000').margin(2) // 黑色背景
              Column().width('3.47%').height('2.05%').backgroundColor('#FFE4B5').margin(2) // 米色背景
              Column().width('3.47%').height('2.05%').backgroundColor('#E0E0E0').margin(2) // 浅灰背景
              Column().width('3.47%').height('2.05%').backgroundColor('#F0F0F0').margin(2) // 极浅灰背景
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

      // 透明度效果对比测试
      Column() {
        Text('Transparency Effect Comparison')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 15 })

        Column() {
          Text('RGBA vs Solid Color Blend Comparison')
            .fontSize(12)
            .margin({ bottom: 10 })
          // RGBA值解析说明
          Column() {
            Text('RGBA Value Analysis:')
              .fontSize(12)
              .fontWeight(FontWeight.Bold)
              .margin({ top: 15, bottom: 8 })
          }
        }
        .width('38.89%')
        .backgroundColor('#FFF5F5')
        .border({ width: 1, color: '#FF6464' })
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
          .id('index_decrease_button_commonmodifier_0340')
          .margin({ right: 10 })

        Button('index++')
          .onClick(() => {
            if (this.currentIndex < this.colorBlendValues.length - 1) {
              this.currentIndex++
            }
          })
          .id('index_increase_button_commonmodifier_0340')
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
