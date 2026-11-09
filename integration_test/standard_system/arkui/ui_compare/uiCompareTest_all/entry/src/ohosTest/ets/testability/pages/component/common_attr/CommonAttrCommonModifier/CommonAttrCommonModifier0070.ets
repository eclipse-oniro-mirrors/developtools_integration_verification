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
struct CommonAttrCommonModifier0070 {
  @State currentIndex: number = 0
  
  private flexShrinkValues: number[] = [
    1,
    3,
    2,
    0,
    99999,
    -555,
    1.66
  ]

  build() {
    Column() {
      Text('FlexShrink Test')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text(`Current Index: ${this.currentIndex}`)
        .fontSize(16)
        .margin({ bottom: 10 })

      Text(`FlexShrink Value: ${this.flexShrinkValues[this.currentIndex]}`)
        .fontSize(14)
        .margin({ bottom: 20 })
        .textAlign(TextAlign.Center)

      // 创建一个Flex容器来测试flexShrink效果
      // 设置容器宽度较小，使内容溢出，从而触发收缩行为
      Column() {
        Text('Flex Container (Row Direction - Overflow)')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.Start }) {
          Column() {
            Text('Item 1')
              .fontSize(12)
              .fontColor(Color.White)
          }
          .width('16.67%')
          .height('6.56%')
          .backgroundColor(Color.Blue)
          .justifyContent(FlexAlign.Center)
          .flexShrink(1)

          Column() {
            Text('Test Item')
              .fontSize(12)
              .fontColor(Color.White)
          }
          .width('20.83%')
          .height('6.56%')
          .backgroundColor(Color.Red)
          .justifyContent(FlexAlign.Center)
          .flexShrink(this.flexShrinkValues[this.currentIndex])
          .id('flexshrink_component_commonmodifier_0070')

          Column() {
            Text('Item 2')
              .fontSize(12)
              .fontColor(Color.White)
          }
          .width('16.67%')
          .height('6.56%')
          .backgroundColor(Color.Green)
          .justifyContent(FlexAlign.Center)
          .flexShrink(1)
        }
        .width('41.67%') // 容器宽度小于子项总宽度，触发收缩
        .height(100)
        .backgroundColor('#F0F0F0')
        .border({ width: 2, color: Color.Gray })
      }
      .margin({ top: 20, bottom: 30 })

      // 添加另一个测试场景：Column方向的Flex
      Column() {
        Text('Flex Container (Column Direction - Overflow)')
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
          .height('6.56%')
          .backgroundColor(Color.Blue)
          .justifyContent(FlexAlign.Center)
          .flexShrink(1)

          Row() {
            Text('Test Item')
              .fontSize(12)
              .fontColor(Color.White)
          }
          .width('27.78%')
          .height('8.2%')
          .backgroundColor(Color.Red)
          .justifyContent(FlexAlign.Center)
          .flexShrink(this.flexShrinkValues[this.currentIndex])

          Row() {
            Text('Item 2')
              .fontSize(12)
              .fontColor(Color.White)
          }
          .width('27.78%')
          .height('6.56%')
          .backgroundColor(Color.Green)
          .justifyContent(FlexAlign.Center)
          .flexShrink(1)
        }
        .width('34.72%')
        .height('14.75%') // 容器高度小于子项总高度，触发收缩
        .backgroundColor('#F0F0F0')
        .border({ width: 2, color: Color.Gray })
      }
      .margin({ bottom: 30 })

      Text('Note: FlexShrink determines how much items should shrink when space is insufficient')
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
          .id('index_decrease_button_commonmodifier_0070')
          .margin({ right: 10 })

        Button('index++')
          .onClick(() => {
            if (this.currentIndex < this.flexShrinkValues.length - 1) {
              this.currentIndex++
            }
          })
          .id('index_increase_button_commonmodifier_0070')
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
