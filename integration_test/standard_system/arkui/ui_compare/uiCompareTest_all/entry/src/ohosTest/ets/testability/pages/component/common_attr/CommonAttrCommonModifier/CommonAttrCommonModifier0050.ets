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
struct CommonAttrCommonModifier0050 {
  @State currentIndex: number = 0
  
  private flexBasisValues: Array<number | string> = [
    100,
    'auto',
    20,
    0,
    999999,
    -100,
    55.5
  ]

  private flexBasisNames: string[] = [
    '100',
    '"auto"',
    '20',
    '0',
    '999999',
    '-100',
    '55.5'
  ]

  build() {
    Column() {
      Text('FlexBasis Test')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text(`Current Index: ${this.currentIndex}`)
        .fontSize(16)
        .margin({ bottom: 10 })

      Text(`FlexBasis Value: ${this.flexBasisNames[this.currentIndex]}`)
        .fontSize(14)
        .margin({ bottom: 20 })
        .textAlign(TextAlign.Center)

      // 创建一个Flex容器来测试flexBasis效果
      Column() {
        Text('Flex Container (Row Direction)')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.Start }) {
          Column() {
            Text('Item 1')
              .fontSize(12)
              .fontColor(Color.White)
          }
          .height('6.56%')
          .backgroundColor(Color.Blue)
          .justifyContent(FlexAlign.Center)
          .flexBasis(50)

          Column() {
            Text('Test Item')
              .fontSize(12)
              .fontColor(Color.White)
          }
          .height('6.56%')
          .backgroundColor(Color.Red)
          .justifyContent(FlexAlign.Center)
          .flexBasis(this.flexBasisValues[this.currentIndex])
          .id('flexbasis_component_commonmodifier_0050')

          Column() {
            Text('Item 2')
              .fontSize(12)
              .fontColor(Color.White)
          }
          .height('6.56%')
          .backgroundColor(Color.Green)
          .justifyContent(FlexAlign.Center)
          .flexBasis(80)
        }
        .width('48.61%')
        .height('8.2%')
        .backgroundColor('#F0F0F0')
        .border({ width: 2, color: Color.Gray })
      }
      .margin({ top: 20, bottom: 30 })

      // 添加另一个测试场景：Column方向的Flex
      Column() {
        Text('Flex Container (Column Direction)')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Start }) {
          Row() {
            Text('Item 1')
              .fontSize(12)
              .fontColor(Color.White)
          }
          .width('27.78%')
          .backgroundColor(Color.Blue)
          .justifyContent(FlexAlign.Center)
          .flexBasis(30)

          Row() {
            Text('Test Item')
              .fontSize(12)
              .fontColor(Color.White)
          }
          .width('27.78%')
          .backgroundColor(Color.Red)
          .justifyContent(FlexAlign.Center)
          .flexBasis(this.flexBasisValues[this.currentIndex])

          Row() {
            Text('Item 2')
              .fontSize(12)
              .fontColor(Color.White)
          }
          .width('27.78%')
          .backgroundColor(Color.Green)
          .justifyContent(FlexAlign.Center)
          .flexBasis(40)
        }
        .width('34.72%')
        .height('16.39%')
        .backgroundColor('#F0F0F0')
        .border({ width: 2, color: Color.Gray })
      }
      .margin({ bottom: 30 })

      Text('Note: FlexBasis sets the initial main size of flex items')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 20 })

      Row() {
        Button('index--')
          .onClick(() => {
            if (this.currentIndex > 0) {
              this.currentIndex--
            }
          })
          .id('index_decrease_button_commonmodifier_0050')
          .margin({ right: 10 })

        Button('index++')
          .onClick(() => {
            if (this.currentIndex < this.flexBasisValues.length - 1) {
              this.currentIndex++
            }
          })
          .id('index_increase_button_commonmodifier_0050')
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
