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
struct CommonAttrCommonModifier1590 {
  @State currentIndex: number = 0
  
  private borderColorOptions: Resource[] = [$r('app.color.red')]

  build() {
    Column() {
      Text('BorderColor Test (Resource)')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text(`Current Index: ${this.currentIndex}`)
        .fontSize(16)
        .margin({ bottom: 10 })

      Text(`BorderColor: $r("app.color.red")`)
        .fontSize(12)
        .margin({ bottom: 20 })

      Column() {
        Text('Test Component')
          .fontSize(18)
          .padding(20)
          .borderRadius(10)
          .backgroundColor(Color.Gray)
          .borderWidth(3)
          .borderColor(this.borderColorOptions[this.currentIndex])
          .id('bordercolor_component_commonmodifier_1590')
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
          .id('index_decrease_button_commonmodifier_1590')
          .margin({ right: 10 })

        Button('index++')
          .onClick(() => {
            if (this.currentIndex < this.borderColorOptions.length - 1) {
              this.currentIndex++
            }
          })
          .id('index_increase_button_commonmodifier_1590')
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

