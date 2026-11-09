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

interface DirectionOption {
  direction: Direction;
}

@Entry
@Component
struct CommonAttrCommonModifier0180 {
  @State currentIndex: number = 0
  
  private directionValues: DirectionOption[] = [
    { direction: Direction.Ltr },
    { direction: Direction.Rtl },
    { direction: Direction.Auto }
  ]

  private directionNames: string[] = [
    'Direction.Ltr (Left to Right)',
    'Direction.Rtl (Right to Left)',
    'Direction.Auto (Automatic)'
  ]

  build() {
    Column() {
      Text('Direction Test')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text(`Current Index: ${this.currentIndex}`)
        .fontSize(16)
        .margin({ bottom: 10 })

      Text(`Direction: ${this.directionNames[this.currentIndex]}`)
        .fontSize(14)
        .margin({ bottom: 20 })
        .textAlign(TextAlign.Center)

      // 创建测试区域 - Stack组件方向测试
      Column() {
        Text('Stack Direction Test Area')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 })

        // 主要测试Stack
        Stack() {
          // 背景容器
          Column()
            .width('34.72%')
            .height('12.3%')
            .backgroundColor('#E0E0E0')
            .border({ width: 2, color: Color.Gray, style: BorderStyle.Dashed })

          // 文本内容测试方向
          Row() {
            Text('Start')
              .fontSize(14)
              .fontColor(Color.White)
              .backgroundColor(Color.Blue)
              .padding(10)
              .margin(5)

            Text('Middle')
              .fontSize(14)
              .fontColor(Color.White)
              .backgroundColor(Color.Green)
              .padding(10)
              .margin(5)

            Text('End')
              .fontSize(14)
              .fontColor(Color.White)
              .backgroundColor(Color.Red)
              .padding(10)
              .margin(5)
          }
          .justifyContent(FlexAlign.SpaceBetween)
          .width('90%')
          .id('direction_component_commonmodifier_0180')
        }
        .width('37.5%')
        .height('13.93%')
        .backgroundColor('#F0F0F0')
        .border({ width: 2, color: Color.Black })
        .direction(this.directionValues[this.currentIndex].direction)
      }
      .margin({ top: 20, bottom: 30 })

      // 添加另一个测试场景：文本和布局方向测试
      Column() {
        Text('Text and Layout Direction Test')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Column() {
          // 文本方向测试
          Text('Hello World! مرحبا بالعالم')
            .fontSize(16)
            .width('100%')
            .textAlign(TextAlign.Start)
            .backgroundColor('#FFE4E1')
            .padding(10)
            .margin({ bottom: 10 })
            .direction(this.directionValues[this.currentIndex].direction)

          // 布局方向测试
          Row() {
            Column() {
              Text('1')
                .fontSize(14)
                .fontColor(Color.White)
            }
            .width('5.56%')
            .height('3.28%')
            .backgroundColor(Color.Blue)
            .justifyContent(FlexAlign.Center)
            .margin(5)

            Column() {
              Text('2')
                .fontSize(14)
                .fontColor(Color.White)
            }
            .width('5.56%')
            .height('3.28%')
            .backgroundColor(Color.Green)
            .justifyContent(FlexAlign.Center)
            .margin(5)

            Column() {
              Text('3')
                .fontSize(14)
                .fontColor(Color.White)
            }
            .width('5.56%')
            .height('3.28%')
            .backgroundColor(Color.Orange)
            .justifyContent(FlexAlign.Center)
            .margin(5)

            Column() {
              Text('4')
                .fontSize(14)
                .fontColor(Color.White)
            }
            .width('5.56%')
            .height('3.28%')
            .backgroundColor('#800080')
            .justifyContent(FlexAlign.Center)
            .margin(5)
          }
          .width('100%')
          .justifyContent(FlexAlign.Start)
          .backgroundColor('#F0F8FF')
          .padding(10)
          .direction(this.directionValues[this.currentIndex].direction)
        }
        .width('41.67%')
        .backgroundColor('#FAFAFA')
        .border({ width: 2, color: '#800080' })
        .padding(10)
      }
      .margin({ bottom: 30 })

      // 显示方向说明
      Column() {
        Text('Direction Guide:')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 })

        Column() {
          Text('• LTR: Left-to-Right (Default for English)')
            .fontSize(12)
            .textAlign(TextAlign.Start)
            .width('100%')
            .margin({ bottom: 3 })

          Text('• RTL: Right-to-Left (For Arabic, Hebrew)')
            .fontSize(12)
            .textAlign(TextAlign.Start)
            .width('100%')
            .margin({ bottom: 3 })

          Text('• Auto: Automatic based on content')
            .fontSize(12)
            .textAlign(TextAlign.Start)
            .width('100%')
        }
        .width('38.89%')
        .backgroundColor('#F0F8FF')
        .border({ width: 1, color: Color.Blue })
        .padding(10)
      }
      .margin({ bottom: 20 })

      Row() {
        Button('index--')
          .onClick(() => {
            if (this.currentIndex > 0) {
              this.currentIndex--
            }
          })
          .id('index_decrease_button_commonmodifier_0180')
          .margin({ right: 10 })

        Button('index++')
          .onClick(() => {
            if (this.currentIndex < this.directionValues.length - 1) {
              this.currentIndex++
            }
          })
          .id('index_increase_button_commonmodifier_0180')
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
