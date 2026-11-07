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
struct CommonAttrCommonModifier0250 {
  @State currentIndex: number = 0
  
  private saturateValues: number[] = [
    1
  ]

  private saturateNames: string[] = [
    '1 (normal saturation)'
  ]

  build() {
    Column() {
      Text('Saturate Test (1.0)')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text(`Current Index: ${this.currentIndex}`)
        .fontSize(16)
        .margin({ bottom: 10 })

      Text(`Saturate: ${this.saturateNames[this.currentIndex]}`)
        .fontSize(14)
        .margin({ bottom: 20 })
        .textAlign(TextAlign.Center)

      // 创建测试区域 - 包含彩色内容来展示标准饱和度效果
      Column() {
        Text('Normal Saturate Test Area')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 })

        Row() {
          // 参考组件（不应用saturate）
          Column() {
            Text('Reference')
              .fontSize(14)
              .fontColor(Color.White)
              .margin({ bottom: 5 })
            
            // 彩色内容 - 标准色彩
            Column() {
              Row() {
                Column().width('3.47%').height('2.05%').backgroundColor('#FF0000') // 纯红
                Column().width('3.47%').height('2.05%').backgroundColor('#00FF00') // 纯绿
                Column().width('3.47%').height('2.05%').backgroundColor('#0000FF') // 纯蓝
              }
              Row() {
                Column().width('3.47%').height('2.05%').backgroundColor('#FFFF00') // 黄色
                Column().width('3.47%').height('2.05%').backgroundColor('#FF00FF') // 品红
                Column().width('3.47%').height('2.05%').backgroundColor('#00FFFF') // 青色
              }
            }
            .margin({ top: 5 })
          }
          .width('16.67%')
          .height('9.84%')
          .backgroundColor(Color.Gray)
          .justifyContent(FlexAlign.Center)
          .margin(10)

          // 测试组件（应用saturate 1.0）
          Column() {
            Text('Test Item')
              .fontSize(14)
              .fontColor(Color.White)
              .margin({ bottom: 5 })
            
            // 彩色内容 - 相同的标准色彩
            Column() {
              Row() {
                Column().width('3.47%').height('2.05%').backgroundColor('#FF0000') // 纯红
                Column().width('3.47%').height('2.05%').backgroundColor('#00FF00') // 纯绿
                Column().width('3.47%').height('2.05%').backgroundColor('#0000FF') // 纯蓝
              }
              Row() {
                Column().width('3.47%').height('2.05%').backgroundColor('#FFFF00') // 黄色
                Column().width('3.47%').height('2.05%').backgroundColor('#FF00FF') // 品红
                Column().width('3.47%').height('2.05%').backgroundColor('#00FFFF') // 青色
              }
            }
            .margin({ top: 5 })
          }
          .width('16.67%')
          .height('9.84%')
          .backgroundColor(Color.Pink)
          .justifyContent(FlexAlign.Center)
          .margin(10)
          .saturate(this.saturateValues[this.currentIndex])
          .id('saturate_component_commonmodifier_0250')
        }
        .justifyContent(FlexAlign.Center)
        .width('48.61%')
        .height('13.11%')
        .backgroundColor('#F0F0F0')
        .border({ width: 2, color: Color.Gray })
      }
      .margin({ top: 20, bottom: 30 })

      // 添加另一个测试场景：标准饱和度验证测试
      Column() {
        Text('Standard Saturation Verification')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Row() {
          // 参考内容 - 无滤镜
          Column() {
            Text('🎨🌈✨🎯')
              .fontSize(18)
              .margin({ bottom: 5 })
            
            // 标准色彩调色板
            Column() {
              Row() {
                Column().width('2.5%').height('0.98%').backgroundColor('#F44336') // Red 500
                Column().width('2.5%').height('0.98%').backgroundColor('#E91E63') // Pink 500
                Column().width('2.5%').height('0.98%').backgroundColor('#9C27B0') // Purple 500
              }
              Row() {
                Column().width('2.5%').height('0.98%').backgroundColor('#673AB7') // Deep Purple 500
                Column().width('2.5%').height('0.98%').backgroundColor('#3F51B5') // Indigo 500
                Column().width('2.5%').height('0.98%').backgroundColor('#2196F3') // Blue 500
              }
              Row() {
                Column().width('2.5%').height('0.98%').backgroundColor('#03A9F4') // Light Blue 500
                Column().width('2.5%').height('0.98%').backgroundColor('#00BCD4') // Cyan 500
                Column().width('2.5%').height('0.98%').backgroundColor('#009688') // Teal 500
              }
            }
            
            Text('No Filter')
              .fontSize(11)
              .fontColor('#333333')
              .margin({ top: 3 })
          }
          .width('12.5%')
          .height('8.2%')
          .backgroundColor('#FAFAFA')
          .justifyContent(FlexAlign.Center)
          .margin(8)

          // 测试内容（应用saturate 1.0 - 应该与参考完全相同）
          Column() {
            Text('🎨🌈✨🎯')
              .fontSize(18)
              .margin({ bottom: 5 })
            
            // 相同的标准色彩调色板
            Column() {
              Row() {
                Column().width('2.5%').height('0.98%').backgroundColor('#F44336') // Red 500
                Column().width('2.5%').height('0.98%').backgroundColor('#E91E63') // Pink 500
                Column().width('2.5%').height('0.98%').backgroundColor('#9C27B0') // Purple 500
              }
              Row() {
                Column().width('2.5%').height('0.98%').backgroundColor('#673AB7') // Deep Purple 500
                Column().width('2.5%').height('0.98%').backgroundColor('#3F51B5') // Indigo 500
                Column().width('2.5%').height('0.98%').backgroundColor('#2196F3') // Blue 500
              }
              Row() {
                Column().width('2.5%').height('0.98%').backgroundColor('#03A9F4') // Light Blue 500
                Column().width('2.5%').height('0.98%').backgroundColor('#00BCD4') // Cyan 500
                Column().width('2.5%').height('0.98%').backgroundColor('#009688') // Teal 500
              }
            }
            
            Text('Saturate 1.0')
              .fontSize(11)
              .fontColor('#333333')
              .margin({ top: 3 })
          }
          .width('12.5%')
          .height('8.2%')
          .backgroundColor('#FAFAFA')
          .justifyContent(FlexAlign.Center)
          .margin(8)
          .saturate(this.saturateValues[this.currentIndex])

          // 第三个测试组件 - 渐变和文字
          Column() {
            Column() {
              Text('Normal')
                .fontSize(11)
                .fontColor('#FFFFFF')
                .fontWeight(FontWeight.Bold)
            }
            .width('6.94%')
            .height('2.05%')
            .backgroundColor('#FF9800')
            .justifyContent(FlexAlign.Center)
            .margin(2)

            Column() {
              Text('Saturate')
                .fontSize(11)
                .fontColor('#FFFFFF')
                .fontWeight(FontWeight.Bold)
            }
            .width('6.94%')
            .height('2.05%')
            .backgroundColor('#4CAF50')
            .justifyContent(FlexAlign.Center)
            .margin(2)

            Text('1.0')
              .fontSize(14)
              .fontColor('#FF9800')
              .fontWeight(FontWeight.Bold)
              .margin({ top: 3 })
          }
          .width('12.5%')
          .height('8.2%')
          .backgroundColor('#F3E5F5')
          .justifyContent(FlexAlign.Center)
          .margin(8)
          .saturate(this.saturateValues[this.currentIndex])
        }
        .justifyContent(FlexAlign.SpaceAround)
        .width('48.61%')
        .height('10.66%')
        .backgroundColor('#F0F0F0')
        .border({ width: 2, color: Color.Gray })
      }
      .margin({ bottom: 30 })

      // 添加说明区域
      Column() {
        Text('Saturate(1.0) Explanation:')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 })

        Column() {
          Text('• Saturate(1.0) maintains 100% original saturation')
            .fontSize(11)
            .textAlign(TextAlign.Start)
            .width('100%')
            .margin({ bottom: 2 })

          Text('• Should appear identical to no filter applied')
            .fontSize(11)
            .textAlign(TextAlign.Start)
            .width('100%')
            .margin({ bottom: 2 })

          Text('• This is the baseline/reference value')
            .fontSize(11)
            .textAlign(TextAlign.Start)
            .width('100%')
            .margin({ bottom: 2 })

          Text('• Values < 1.0 reduce saturation, > 1.0 increase it')
            .fontSize(11)
            .textAlign(TextAlign.Start)
            .width('100%')
        }
        .width('44.44%')
        .backgroundColor('#F0F8FF')
        .border({ width: 1, color: Color.Blue })
        .padding(8)
      }
      .margin({ bottom: 20 })

      Row() {
        Button('index--')
          .onClick(() => {
            if (this.currentIndex > 0) {
              this.currentIndex--
            }
          })
          .id('index_decrease_button_commonmodifier_0250')
          .margin({ right: 10 })

        Button('index++')
          .onClick(() => {
            if (this.currentIndex < this.saturateValues.length - 1) {
              this.currentIndex++
            }
          })
          .id('index_increase_button_commonmodifier_0250')
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
