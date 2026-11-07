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
struct CommonAttrCommonModifier0730 {
  @State currentIndex: number = 0
  
  private borderValues: string[] = [
    'Complex Border'
  ]

  build() {
    Column() {
      Text('Border Test')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text(`Current Index: ${this.currentIndex}`)
        .fontSize(16)
        .margin({ bottom: 10 })

      Text(`Border: Complex combination`)
        .fontSize(12)
        .margin({ bottom: 20 })
        .textAlign(TextAlign.Center)

      // 测试组件
      Column() {
        Text('Test Component')
          .fontSize(18)
          .fontColor(Color.White)
          .padding(20)
          .backgroundColor(Color.Blue)
          .borderRadius(10)
          .border({
            width: { left: 3, right: 6, top: 10, bottom: 15 },
            color: { left: '#e3bbbb', right: Color.Blue, top: Color.Red, bottom: Color.Green },
            radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
            style: { left: BorderStyle.Dotted, right: BorderStyle.Dotted, top: BorderStyle.Solid, bottom: BorderStyle.Dashed }
          })
          .id('border_component_commonmodifier_0730')
      }
      .justifyContent(FlexAlign.Center)
      .height('16.39%')
      .width('80%')
      .backgroundColor(Color.Gray)
      .borderRadius(10)

      Row() {
        Button('index--')
          .onClick(() => {
            if (this.currentIndex > 0) {
              this.currentIndex--
            }
          })
          .id('index_decrease_button_commonmodifier_0730')
          .margin({ right: 10 })

        Button('index++')
          .onClick(() => {
            if (this.currentIndex < this.borderValues.length - 1) {
              this.currentIndex++
            }
          })
          .id('index_increase_button_commonmodifier_0730')
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