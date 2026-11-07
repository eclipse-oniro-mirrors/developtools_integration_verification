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
struct CommonAttrCommonModifier1830 {
  @State currentIndex: number = 0

  build() {
    Column() {
      Text('Outline/Blur/Brightness Test')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text(`Current Index: ${this.currentIndex}`)
        .fontSize(16)
        .margin({ bottom: 10 })

      Column() {
        Text('Test Component')
          .fontSize(18)
          .width(100)
          .height(30)
          .textAlign(TextAlign.Center)
          .backgroundColor(Color.White)
          .outlineRadius({ topLeft: 10, topRight: 20, bottomLeft: 30, bottomRight: 40 })
          .outlineStyle({ left: OutlineStyle.SOLID, right: OutlineStyle.DASHED, top: OutlineStyle.DOTTED, bottom: OutlineStyle.SOLID })
          .outlineWidth({ left: 3, right: 6, top: 10, bottom: 15 })
          .outlineColor({ left: '#e3bbbb', right: Color.Blue, top: Color.Red, bottom: Color.Green })
          .backdropBlur(10)
          .invert(0.2)
          .backgroundBrightness({ rate: 0.5, lightUpDegree: 0.5 })
          .blur(5)
          .id('outline_component_commonmodifier_1830')
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
          .id('index_decrease_button_commonmodifier_1830')
          .margin({ right: 10 })

        Button('index++')
          .onClick(() => {
            if (this.currentIndex < 0) {
              this.currentIndex++
            }
          })
          .id('index_increase_button_commonmodifier_1830')
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

