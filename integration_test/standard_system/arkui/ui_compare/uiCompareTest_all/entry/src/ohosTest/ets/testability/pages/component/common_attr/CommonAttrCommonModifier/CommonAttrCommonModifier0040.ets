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
struct CommonAttrCommonModifier0040 {
  @State currentIndex: number = 0
  
  private alignSelfValues: Array<ItemAlign | null | undefined> = [
    ItemAlign.Auto,
    ItemAlign.Start,
    ItemAlign.Center,
    ItemAlign.End,
    ItemAlign.Baseline,
    ItemAlign.Stretch,
    undefined,
    null
  ]

  private alignSelfNames: string[] = [
    'ItemAlign.Auto',
    'ItemAlign.Start',
    'ItemAlign.Center',
    'ItemAlign.End',
    'ItemAlign.Baseline',
    'ItemAlign.Stretch',
    'undefined',
    'null'
  ]

  build() {
    Column() {
      Text('AlignSelf Test')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text(`Current Index: ${this.currentIndex}`)
        .fontSize(16)
        .margin({ bottom: 10 })

      Text(`AlignSelf Value: ${this.alignSelfNames[this.currentIndex]}`)
        .fontSize(14)
        .margin({ bottom: 20 })
        .textAlign(TextAlign.Center)

      // 创建一个Flex容器来测试alignSelf效果
      Column() {
        Text('Flex Container (Cross Axis Alignment)')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceAround }) {
          Column() {
            Text('Item 1')
              .fontSize(12)
              .fontColor(Color.White)
          }
          .width('8.33%')
          .height('4.92%')
          .backgroundColor(Color.Blue)
          .justifyContent(FlexAlign.Center)

          Column() {
            Text('Test Item')
              .fontSize(12)
              .fontColor(Color.White)
          }
          .width('11.11%')
          .height('8.2%')
          .backgroundColor(Color.Red)
          .justifyContent(FlexAlign.Center)
          .alignSelf(this.alignSelfValues[this.currentIndex])
          .id('alignself_component_commonmodifier_0040')

          Column() {
            Text('Item 2')
              .fontSize(12)
              .fontColor(Color.White)
          }
          .width('8.33%')
          .height('6.56%')
          .backgroundColor(Color.Green)
          .justifyContent(FlexAlign.Center)
        }
        .width('41.67%')
        .height('12.3%')
        .backgroundColor('#F0F0F0')
        .border({ width: 2, color: Color.Gray })
      }
      .margin({ top: 20, bottom: 30 })

      // 添加另一个测试场景：Column布局
      Column() {
        Text('Column Container (Cross Axis Alignment)')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Column({ space: 10 }) {
          Row() {
            Text('Normal Item')
              .fontSize(12)
              .fontColor(Color.White)
          }
          .width('16.67%')
          .height('3.28%')
          .backgroundColor(Color.Blue)
          .justifyContent(FlexAlign.Center)

          Row() {
            Text('Test Item')
              .fontSize(12)
              .fontColor(Color.White)
          }
          .width('20.83%')
          .height('4.1%')
          .backgroundColor(Color.Red)
          .justifyContent(FlexAlign.Center)
          .alignSelf(this.alignSelfValues[this.currentIndex])

          Row() {
            Text('Normal Item')
              .fontSize(12)
              .fontColor(Color.White)
          }
          .width('13.89%')
          .height('3.28%')
          .backgroundColor(Color.Green)
          .justifyContent(FlexAlign.Center)
        }
        .width('41.67%')
        .height('14.75%')
        .backgroundColor('#F0F0F0')
        .border({ width: 2, color: Color.Gray })
        .alignItems(HorizontalAlign.Start)
      }
      .margin({ bottom: 30 })

      Row() {
        Button('index--')
          .onClick(() => {
            if (this.currentIndex > 0) {
              this.currentIndex--
            }
          })
          .id('index_decrease_button_commonmodifier_0040')
          .margin({ right: 10 })

        Button('index++')
          .onClick(() => {
            if (this.currentIndex < this.alignSelfValues.length - 1) {
              this.currentIndex++
            }
          })
          .id('index_increase_button_commonmodifier_0040')
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
