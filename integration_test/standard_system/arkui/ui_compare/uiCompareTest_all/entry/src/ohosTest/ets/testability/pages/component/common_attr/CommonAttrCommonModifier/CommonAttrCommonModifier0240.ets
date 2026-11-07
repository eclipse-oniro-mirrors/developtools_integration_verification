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
struct CommonAttrCommonModifier0240 {
  @State currentIndex: number = 0
  
  private saturateValues: number[] = [
    0.2
  ]

  private saturateNames: string[] = [
    '0.2 (low saturation)'
  ]

  build() {
    Column() {
      Text('Saturate Test (0.2)')
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

      // 创建测试区域 - 包含彩色内容来展示低饱和度滤镜效果
      Column() {
        Text('Low Saturate Test Area')
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
            
            // 彩色内容 - 使用更鲜艳的颜色来突出0.2饱和度的效果
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

          // 测试组件（应用saturate 0.2）
          Column() {
            Text('Test Item')
              .fontSize(14)
              .fontColor(Color.White)
              .margin({ bottom: 5 })
            
            // 彩色内容 - 相同的鲜艳颜色
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
          .id('saturate_component_commonmodifier_0240')
        }
        .justifyContent(FlexAlign.Center)
        .width('48.61%')
        .height('13.11%')
        .backgroundColor('#F0F0F0')
        .border({ width: 2, color: Color.Gray })
      }
      .margin({ top: 20, bottom: 30 })

      // 添加另一个测试场景：渐变和复杂色彩测试
      Column() {
        Text('Complex Color Saturation Test')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Row() {
          // 参考内容 - 高饱和度内容
          Column() {
            Text('🌺🌻🌷🌹')
              .fontSize(18)
              .margin({ bottom: 5 })
            
            // 高饱和度色彩组合
            Column() {
              Row() {
                Column().width('2.5%').height('0.98%').backgroundColor('#FF1744') // 鲜红
                Column().width('2.5%').height('0.98%').backgroundColor('#E91E63') // 粉红
                Column().width('2.5%').height('0.98%').backgroundColor('#9C27B0') // 紫色
              }
              Row() {
                Column().width('2.5%').height('0.98%').backgroundColor('#3F51B5') // 靛蓝
                Column().width('2.5%').height('0.98%').backgroundColor('#2196F3') // 蓝色
                Column().width('2.5%').height('0.98%').backgroundColor('#00BCD4') // 青色
              }
              Row() {
                Column().width('2.5%').height('0.98%').backgroundColor('#4CAF50') // 绿色
                Column().width('2.5%').height('0.98%').backgroundColor('#8BC34A') // 浅绿
                Column().width('2.5%').height('0.98%').backgroundColor('#CDDC39') // 柠檬绿
              }
            }
            
            Text('Original')
              .fontSize(11)
              .fontColor('#333333')
              .margin({ top: 3 })
          }
          .width('12.5%')
          .height('8.2%')
          .backgroundColor('#FFF8E1')
          .justifyContent(FlexAlign.Center)
          .margin(8)

          // 测试内容（应用saturate 0.2）
          Column() {
            Text('🌺🌻🌷🌹')
              .fontSize(18)
              .margin({ bottom: 5 })
            
            // 相同的高饱和度色彩组合
            Column() {
              Row() {
                Column().width('2.5%').height('0.98%').backgroundColor('#FF1744') // 鲜红
                Column().width('2.5%').height('0.98%').backgroundColor('#E91E63') // 粉红
                Column().width('2.5%').height('0.98%').backgroundColor('#9C27B0') // 紫色
              }
              Row() {
                Column().width('2.5%').height('0.98%').backgroundColor('#3F51B5') // 靛蓝
                Column().width('2.5%').height('0.98%').backgroundColor('#2196F3') // 蓝色
                Column().width('2.5%').height('0.98%').backgroundColor('#00BCD4') // 青色
              }
              Row() {
                Column().width('2.5%').height('0.98%').backgroundColor('#4CAF50') // 绿色
                Column().width('2.5%').height('0.98%').backgroundColor('#8BC34A') // 浅绿
                Column().width('2.5%').height('0.98%').backgroundColor('#CDDC39') // 柠檬绿
              }
            }
            
            Text('Saturate 0.2')
              .fontSize(11)
              .fontColor('#333333')
              .margin({ top: 3 })
          }
          .width('12.5%')
          .height('8.2%')
          .backgroundColor('#FFF8E1')
          .justifyContent(FlexAlign.Center)
          .margin(8)
          .saturate(this.saturateValues[this.currentIndex])

          // 第三个测试组件 - 文字和背景
          Column() {
            Column() {
              Text('Bright')
                .fontSize(11)
                .fontColor('#FFFFFF')
                .fontWeight(FontWeight.Bold)
            }
            .width('6.94%')
            .height('2.05%')
            .backgroundColor('#FF5722')
            .justifyContent(FlexAlign.Center)
            .margin(2)

            Column() {
              Text('Colors')
                .fontSize(11)
                .fontColor('#FFFFFF')
                .fontWeight(FontWeight.Bold)
            }
            .width('6.94%')
            .height('2.05%')
            .backgroundColor('#607d7B')
            .justifyContent(FlexAlign.Center)
            .margin(2)

            Text('Test')
              .fontSize(11)
              .fontColor('#FF5722')
              .fontWeight(FontWeight.Bold)
              .margin({ top: 3 })
          }
          .width('12.5%')
          .height('8.2%')
          .backgroundColor('#E8F5E8')
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

      Text('Note: Saturate(0.2) dramatically reduces color saturation to 20%')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 20 })
        .textAlign(TextAlign.Center)

      Row() {
        Button('index--')
          .onClick(() => {
            if (this.currentIndex > 0) {
              this.currentIndex--
            }
          })
          .id('index_decrease_button_commonmodifier_0240')
          .margin({ right: 10 })

        Button('index++')
          .onClick(() => {
            if (this.currentIndex < this.saturateValues.length - 1) {
              this.currentIndex++
            }
          })
          .id('index_increase_button_commonmodifier_0240')
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
