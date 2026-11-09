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
struct CommonAttrCommonModifier1820 {
  @State currentIndex: number = 0

  build() {
    Column() {
      Text('Shadow/Outline/Obscured Test')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text(`Current Index: ${this.currentIndex}`)
        .fontSize(16)
        .margin({ bottom: 10 })

      Column() {
        Text('Test Component')
          .fontSize(18)
          .width(200)
          .height(100)
          .textAlign(TextAlign.Center)
          .backgroundColor(Color.White)
          .useShadowBatching(true)
          .outline({
            width: { left: 3, right: 6, top: 10, bottom: 15 },
            color: { left: '#e3bbbb', right: Color.Blue, top: Color.Red, bottom: Color.Green },
            radius: { topLeft: 10, topRight: 20, bottomLeft: 30, bottomRight: 40 },
            style: { left: OutlineStyle.SOLID, right: OutlineStyle.DASHED, top: OutlineStyle.DOTTED, bottom: OutlineStyle.SOLID }
          })
          .shadow({
            radius: 10,
            color: Color.Gray,
            offsetX: 5,
            offsetY: 5
          })
          .id('shadow_component_commonmodifier_1820')
      }
      .justifyContent(FlexAlign.Center)
      .height('16.39%')
      .margin({ bottom: 20 })

      Row() {
        Button('index--')
          .onClick(() => {
            if (this.currentIndex > 0) {
              this.currentIndex--
            }
          })
          .id('index_decrease_button_commonmodifier_1820')
          .margin({ right: 10 })

        Button('index++')
          .onClick(() => {
            if (this.currentIndex < 0) {
              this.currentIndex++
            }
          })
          .id('index_increase_button_commonmodifier_1820')
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

