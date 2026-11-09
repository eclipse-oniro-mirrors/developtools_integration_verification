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
struct CommonAttrCommonModifier0330 {
  @State currentIndex: number = 0
  
  private colorBlendValues: Color[] = [Color.Orange]
  private colorBlendNames: string[] = ['colorBlend: Color.Orange (橙色混合增强版)']

  build() {
    Column() {
      // 创建测试区域 - 橙色混合增强测试
      Column() {
        Text('Enhanced Orange Color Blend Test')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 })

        Column() {

          // 下排：多元素测试
          Row() {
            // 图标测试
            Column() {
              Text('Icon Test')
                .fontSize(10)
                .fontWeight(FontWeight.Bold)
                .margin({ bottom: 5 })

              Text('⭐🌟✨')
                .fontSize(16)
                .colorBlend(this.colorBlendValues[this.currentIndex])
            }
            .width('9.72%')
            .height('4.92%')
            .backgroundColor('#FFFACD')
            .border({ width: 1, color: Color.Gray })
            .justifyContent(FlexAlign.Center)
            .margin(5)

            // 形状测试
            Column() {
              Text('Shape Test')
                .fontSize(10)
                .fontWeight(FontWeight.Bold)
                .margin({ bottom: 5 })

              Circle({ width: 30, height: 30 })
                .fill(Color.Pink)
                .colorBlend(this.colorBlendValues[this.currentIndex])
            }
            .width('9.72%')
            .height('4.92%')
            .backgroundColor('#FFE4E1')
            .border({ width: 1, color: Color.Gray })
            .justifyContent(FlexAlign.Center)
            .margin(5)
          }
          .justifyContent(FlexAlign.SpaceAround)
          .width('100%')
        }
        .width('44.44%')
        .backgroundColor('#FAFAFA')
        .border({ width: 2, color: Color.Gray })
        .padding(15)
        .borderRadius(10)
      }
      .margin({ top: 20, bottom: 30 })

      // 橙色混合深度测试
      Column() {
        Text('Orange Blend Depth Analysis')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 15 })

        Column() {
          Text('Multi-Layer Orange Blend Effect')
            .fontSize(12)
            .margin({ bottom: 10 })

          // 层级测试
          Stack() {
            // 背景层
            Column()
              .width('34.72%')
              .height('9.84%')
              .backgroundColor('#E6E6FA')
              .border({ width: 1, color: Color.Gray })

            // 中间层
            Column() {
              Text('Layer 2')
                .fontSize(12)
                .fontColor(Color.White)
            }
            .width('25%')
            .height('6.56%')
            .backgroundColor('#4169E1')
            .colorBlend(this.colorBlendValues[this.currentIndex])
            .justifyContent(FlexAlign.Center)

            // 前景层
            Column() {
              Text('Layer 3')
                .fontSize(10)
                .fontColor(Color.Black)
            }
            .width('16.67%')
            .height('4.1%')
            .backgroundColor('#FFD700')
            .colorBlend(this.colorBlendValues[this.currentIndex])
            .justifyContent(FlexAlign.Center)

            // 顶层元素
            Text('🔥')
              .fontSize(20)
              .colorBlend(this.colorBlendValues[this.currentIndex])
          }
          .alignContent(Alignment.Center)
          .margin({ bottom: 15 })

          // 渐变与混合组合测试
          Column() {
            Text('Gradient + Orange Blend')
              .fontSize(12)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Row() {
              Column()
                .width('8.33%')
                .height('3.28%')
                .linearGradient({
                  direction: GradientDirection.Top,
                  colors: [[Color.Red, 0.0], [Color.Yellow, 1.0]]
                })
                .colorBlend(this.colorBlendValues[this.currentIndex])
                .margin(3)

              Column()
                .width('8.33%')
                .height('3.28%')
                .linearGradient({
                  direction: GradientDirection.Left,
                  colors: [[Color.Blue, 0.0], [Color.Green, 1.0]]
                })
                .colorBlend(this.colorBlendValues[this.currentIndex])
                .margin(3)

              Column()
                .width('8.33%')
                .height('3.28%')
                .linearGradient({
                  direction: GradientDirection.LeftTop,
                  colors: [[Color.Pink, 0.0], [Color.Pink, 1.0]]
                })
                .colorBlend(this.colorBlendValues[this.currentIndex])
                .margin(3)
            }
            .justifyContent(FlexAlign.SpaceAround)
          }
        }
        .width('38.89%')
        .backgroundColor('#FAFAFA')
        .border({ width: 1, color: Color.Gray })
        .padding(15)
        .borderRadius(8)
      }
      .margin({ bottom: 30 })

      // 橙色混合应用场景测试
      Column() {
        Text('Orange Blend Application Scenarios')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 15 })

        Grid() {
          GridItem() {
            Column() {
              Text('🍂')
                .fontSize(24)
              Text('Autumn')
                .fontSize(10)
            }
            .width('8.33%')
            .height('4.1%')
            .backgroundColor('#DEB887')
            .colorBlend(this.colorBlendValues[this.currentIndex])
            .justifyContent(FlexAlign.Center)
            .border({ width: 1, color: Color.Gray })
          }

          GridItem() {
            Column() {
              Text('🌅')
                .fontSize(24)
              Text('Sunset')
                .fontSize(10)
            }
            .width('8.33%')
            .height('4.1%')
            .backgroundColor('#FFE4B5')
            .colorBlend(this.colorBlendValues[this.currentIndex])
            .justifyContent(FlexAlign.Center)
            .border({ width: 1, color: Color.Gray })
          }

          GridItem() {
            Column() {
              Text('🔥')
                .fontSize(24)
              Text('Fire')
                .fontSize(10)
            }
            .width('8.33%')
            .height('4.1%')
            .backgroundColor('#FF6347')
            .colorBlend(this.colorBlendValues[this.currentIndex])
            .justifyContent(FlexAlign.Center)
            .border({ width: 1, color: Color.Gray })
          }

          GridItem() {
            Column() {
              Text('🍊')
                .fontSize(24)
              Text('Fruit')
                .fontSize(10)
            }
            .width('8.33%')
            .height('4.1%')
            .backgroundColor('#FFA500')
            .colorBlend(this.colorBlendValues[this.currentIndex])
            .justifyContent(FlexAlign.Center)
            .border({ width: 1, color: Color.Gray })
          }
        }
        .columnsTemplate('1fr 1fr 1fr 1fr')
        .rowsTemplate('1fr')
        .width('38.89%')
        .height('5.74%')
        .backgroundColor('#FFF8DC')
        .border({ width: 1, color: Color.Orange })
        .padding(10)
        .borderRadius(8)
      }
      .margin({ bottom: 30 })

      // 显示当前colorBlend值和说明

      Row() {
        Button('index--')
          .onClick(() => {
            if (this.currentIndex > 0) {
              this.currentIndex--
            }
          })
          .id('index_decrease_button_commonmodifier_0330')
          .margin({ right: 10 })

        Button('index++')
          .onClick(() => {
            if (this.currentIndex < this.colorBlendValues.length - 1) {
              this.currentIndex++
            }
          })
          .id('index_increase_button_commonmodifier_0330')
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
