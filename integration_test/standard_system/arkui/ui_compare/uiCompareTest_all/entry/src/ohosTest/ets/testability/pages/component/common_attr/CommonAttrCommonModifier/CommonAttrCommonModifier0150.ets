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
struct CommonAttrCommonModifier0150 {
  @State currentIndex: number = 0
  
  private hueRotateValues: Array<number | string> = [
    30,
    90,
    180,
    '60deg',
    'asdfasdf',
    -20,
    0,
    666676
  ]

  private hueRotateNames: string[] = [
    '30 (30 degrees)',
    '90 (90 degrees)',
    '180 (180 degrees)',
    '"60deg" (string format)',
    '"asdfasdf" (invalid string)',
    '-20 (negative value)',
    '0 (no rotation)',
    '666676 (large value)'
  ]

  build() {
    Column() {
      Text('HueRotate Test')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text(`Current Index: ${this.currentIndex}`)
        .fontSize(16)
        .margin({ bottom: 10 })

      Text(`HueRotate: ${this.hueRotateNames[this.currentIndex]}`)
        .fontSize(12)
        .margin({ bottom: 20 })
        .textAlign(TextAlign.Center)
        .maxLines(2)

      // 创建测试区域 - 包含彩色内容来展示色相旋转效果
      Column() {
        Text('HueRotate Test Area')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 })

        Row() {
          // 参考组件（不应用hueRotate）
          Column() {
            Text('Reference')
              .fontSize(14)
              .fontColor(Color.White)
              .margin({ bottom: 5 })
            
            // 彩色条带
            Row() {
              Column().width('2.08%').height('3.28%').backgroundColor(Color.Red)
              Column().width('2.08%').height('3.28%').backgroundColor(Color.Orange)
              Column().width('2.08%').height('3.28%').backgroundColor(Color.Yellow)
              Column().width('2.08%').height('3.28%').backgroundColor(Color.Green)
              Column().width('2.08%').height('3.28%').backgroundColor(Color.Blue)
              Column().width('2.08%').height('3.28%').backgroundColor('#800080')
            }
          }
          .width('16.67%')
          .height('9.84%')
          .backgroundColor(Color.Gray)
          .justifyContent(FlexAlign.Center)
          .margin(10)

          // 测试组件（应用hueRotate）
          Column() {
            Text('Test Item')
              .fontSize(14)
              .fontColor(Color.White)
              .margin({ bottom: 5 })
            
            // 彩色条带
            Row() {
              Column().width('2.08%').height('3.28%').backgroundColor(Color.Red)
              Column().width('2.08%').height('3.28%').backgroundColor(Color.Orange)
              Column().width('2.08%').height('3.28%').backgroundColor(Color.Yellow)
              Column().width('2.08%').height('3.28%').backgroundColor(Color.Green)
              Column().width('2.08%').height('3.28%').backgroundColor(Color.Blue)
              Column().width('2.08%').height('3.28%').backgroundColor('#800080')
            }
          }
          .width('16.67%')
          .height('9.84%')
          .backgroundColor(Color.Pink)
          .justifyContent(FlexAlign.Center)
          .margin(10)
          .hueRotate(this.hueRotateValues[this.currentIndex])
          .id('huerotate_component_commonmodifier_0150')
        }
        .justifyContent(FlexAlign.Center)
        .width('48.61%')
        .height('13.11%')
        .backgroundColor('#F0F0F0')
        .border({ width: 2, color: Color.Gray })
      }
      .margin({ top: 20, bottom: 30 })

      // 添加另一个测试场景：图像内容测试
      Column() {
        Text('Image Content Test')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Row() {
          // 参考图像
          Column() {
            Column() {
              Text('🌈')
                .fontSize(30)
              Text('🍎🍊🍌')
                .fontSize(20)
              Text('Original')
                .fontSize(12)
                .fontColor(Color.Black)
            }
          }
          .width('13.89%')
          .height('8.2%')
          .backgroundColor('#FFE4E1')
          .justifyContent(FlexAlign.Center)
          .margin(10)

          // 测试图像
          Column() {
            Column() {
              Text('🌈')
                .fontSize(30)
              Text('🍎🍊🍌')
                .fontSize(20)
              Text('HueRotate')
                .fontSize(12)
                .fontColor(Color.Black)
            }
          }
          .width('13.89%')
          .height('8.2%')
          .backgroundColor('#FFE4E1')
          .justifyContent(FlexAlign.Center)
          .margin(10)
          .hueRotate(this.hueRotateValues[this.currentIndex])

          // 另一个测试组件
          Column() {
            Column() {
              Text('Color')
                .fontSize(14)
                .fontColor(Color.White)
            }
            .width('8.33%')
            .height('4.92%')
            .backgroundColor('#FF6B6B')
            .justifyContent(FlexAlign.Center)
          }
          .width('13.89%')
          .height('8.2%')
          .backgroundColor('#4ECDC4')
          .justifyContent(FlexAlign.Center)
          .margin(10)
          .hueRotate(this.hueRotateValues[this.currentIndex])
        }
        .justifyContent(FlexAlign.SpaceAround)
        .width('48.61%')
        .height('10.66%')
        .backgroundColor('#F0F0F0')
        .border({ width: 2, color: Color.Gray })
      }
      .margin({ bottom: 30 })

      Text('Note: HueRotate shifts colors around the color wheel')
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
          .id('index_decrease_button_commonmodifier_0150')
          .margin({ right: 10 })

        Button('index++')
          .onClick(() => {
            if (this.currentIndex < this.hueRotateValues.length - 1) {
              this.currentIndex++
            }
          })
          .id('index_increase_button_commonmodifier_0150')
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
