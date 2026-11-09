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
struct CommonAttrCommonModifier0300 {
  @State currentIndex: number = 0
  
  private saturateValues: number[] = [2.0]
  private saturateNames: string[] = ['saturate: 2.0 (双倍饱和度)']

  build() {
    Column() {
      // 创建测试区域 - 双倍饱和度测试
      Column() {
        Text('Double Saturation Test (2.0x)')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 })

        Row() {
          // 参考组件（无saturate效果）
          Column() {
            Text('Reference')
              .fontSize(14)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 10 })

            Column() {
              Text('🌈 Original Colors')
                .fontSize(12)
                .margin({ bottom: 5 })

              Row() {
                Text('R').fontColor(Color.Red).fontSize(16).margin(2)
                Text('G').fontColor(Color.Green).fontSize(16).margin(2)
                Text('B').fontColor(Color.Blue).fontSize(16).margin(2)
              }
              .margin({ bottom: 5 })

              Text('Normal Saturation')
                .fontSize(10)
                .fontColor(Color.Gray)
            }
            .width('13.89%')
            .height('6.56%')
            .backgroundColor('#FFE0E0')
            .border({ width: 1, color: Color.Gray })
            .justifyContent(FlexAlign.Center)
          }
          .width('16.67%')
          .margin(10)
          .padding(10)
          .backgroundColor('#F5F5F5')
          .borderRadius(8)

          // 测试组件（应用saturate(2.0)）
          Column() {
            Text('Test Component')
              .fontSize(14)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 10 })

            Column() {
              Text('🌈 Enhanced Colors')
                .fontSize(12)
                .margin({ bottom: 5 })

              Row() {
                Text('R').fontColor(Color.Red).fontSize(16).margin(2)
                Text('G').fontColor(Color.Green).fontSize(16).margin(2)
                Text('B').fontColor(Color.Blue).fontSize(16).margin(2)
              }
              .margin({ bottom: 5 })

              Text('2.0x Saturation')
                .fontSize(10)
                .fontColor(Color.Gray)
            }
            .width('13.89%')
            .height('6.56%')
            .backgroundColor('#FFE0E0')
            .border({ width: 1, color: Color.Gray })
            .justifyContent(FlexAlign.Center)
            .saturate(this.saturateValues[this.currentIndex])
            .id('saturate_component_commonmodifier_0300')
          }
          .width('16.67%')
          .margin(10)
          .padding(10)
          .backgroundColor('#E3F2FD')
          .borderRadius(8)
        }
        .justifyContent(FlexAlign.SpaceAround)
        .width('41.67%')
        .height('12.3%')
        .backgroundColor('#F0F0F0')
        .border({ width: 2, color: Color.Gray })
      }
      .margin({ top: 20, bottom: 30 })

      // 双倍饱和度彩色验证测试
      Column() {
        Text('Double Saturation Enhancement Test')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 15 })

        Column() {
          Text('Color Palette - Double Saturation Effect')
            .fontSize(12)
            .margin({ bottom: 10 })

          // 第五行：柔和色彩测试
          Row() {
            Text('Pastels:')
              .fontSize(10)
              .width(60)
              .textAlign(TextAlign.Start)

            Row() {
              Column().width('3.47%').height('2.05%').backgroundColor('#FFB3BA').margin(2) // 浅粉
              Column().width('3.47%').height('2.05%').backgroundColor('#FFDFBA').margin(2) // 浅橙
              Column().width('3.47%').height('2.05%').backgroundColor('#FFFFBA').margin(2) // 浅黄
              Column().width('3.47%').height('2.05%').backgroundColor('#BAFFC9').margin(2) // 浅绿
              Column().width('3.47%').height('2.05%').backgroundColor('#BAE1FF').margin(2) // 浅蓝
              Column().width('3.47%').height('2.05%').backgroundColor('#E1BAFF').margin(2) // 浅紫
            }
            .saturate(this.saturateValues[this.currentIndex])
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

      // 饱和度对比测试
      Column() {
        Text('Saturation Comparison Test')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 15 })

        Row() {
          // 标准饱和度(1.0)
          Column() {
            Text('1.0x')
              .fontSize(12)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 5 })

            Column() {
              Text('🌺')
                .fontSize(24)
              Text('Standard')
                .fontSize(8)
            }
            .width('8.33%')
            .height('4.1%')
            .backgroundColor('#FFB6C1')
            .saturate(1.0)
            .justifyContent(FlexAlign.Center)
            .border({ width: 1, color: Color.Gray })
          }
          .margin(5)

          // 双倍饱和度(2.0)
          Column() {
            Text('2.0x')
              .fontSize(12)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 5 })

            Column() {
              Text('🌺')
                .fontSize(24)
              Text('Enhanced')
                .fontSize(8)
            }
            .width('8.33%')
            .height('4.1%')
            .backgroundColor('#FFB6C1')
            .saturate(this.saturateValues[this.currentIndex])
            .justifyContent(FlexAlign.Center)
            .border({ width: 2, color: Color.Blue })
          }
          .margin(5)

          // 三倍饱和度(3.0)对比
          Column() {
            Text('3.0x')
              .fontSize(12)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 5 })

            Column() {
              Text('🌺')
                .fontSize(24)
              Text('Extreme')
                .fontSize(8)
            }
            .width('8.33%')
            .height('4.1%')
            .backgroundColor('#FFB6C1')
            .saturate(3.0)
            .justifyContent(FlexAlign.Center)
            .border({ width: 1, color: Color.Gray })
          }
          .margin(5)
        }
        .justifyContent(FlexAlign.SpaceAround)
        .width('38.89%')
        .backgroundColor('#F8F8FF')
        .border({ width: 1, color: Color.Blue })
        .padding(10)
        .borderRadius(8)
      }
      .margin({ bottom: 30 })

      // 显示当前saturate值和说明
      Column() {
        Text(`Current Saturate Value: ${this.saturateValues[this.currentIndex]}`)
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
          .id('index_decrease_button_commonmodifier_0300')
          .margin({ right: 10 })

        Button('index++')
          .onClick(() => {
            if (this.currentIndex < this.saturateValues.length - 1) {
              this.currentIndex++
            }
          })
          .id('index_increase_button_commonmodifier_0300')
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
