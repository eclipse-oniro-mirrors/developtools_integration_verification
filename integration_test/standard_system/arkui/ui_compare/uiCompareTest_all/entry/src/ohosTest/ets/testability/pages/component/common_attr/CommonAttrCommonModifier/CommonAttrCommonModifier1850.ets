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
struct CommonAttrCommonModifier1850 {
  @State currentIndex: number = 0
  
  private renderFitOptions: RenderFit[] = [
    RenderFit.CENTER,
    RenderFit.TOP,
    RenderFit.BOTTOM,
    RenderFit.LEFT,
    RenderFit.RIGHT
  ]

  build() {
    Column() {
      Text('RenderFit Test')
        .fontSize(24)
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
          .backgroundColor(Color.Green)
          .fontColor(Color.White)
          .renderFit(this.renderFitOptions[this.currentIndex])
          .id('renderfit_component_commonmodifier_1850')
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
          .id('index_decrease_button_commonmodifier_1850')
          .margin({ right: 10 })

        Button('index++')
          .onClick(() => {
            if (this.currentIndex < this.renderFitOptions.length - 1) {
              this.currentIndex++
            }
          })
          .id('index_increase_button_commonmodifier_1850')
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

