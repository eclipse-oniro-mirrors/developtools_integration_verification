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
struct CommonAttrCommonModifier1040 {
  @State currentIndex: number = 0
  
  private layoutWeightValues: Array<number | string> = [
    1,
    3,
    -100,
    'aa'
  ]

  build() {
    Column() {
      Text('LayoutWeight Test')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text(`Current Index: ${this.currentIndex}`)
        .fontSize(16)
        .margin({ bottom: 10 })

      Text(`LayoutWeight: ${this.layoutWeightValues[this.currentIndex]}`)
        .fontSize(12)
        .margin({ bottom: 20 })
        .textAlign(TextAlign.Center)

      // 测试组件
      Row() {
        Shape() {
          Rect()
            .width('100%')
            .height('100%')
            .fill(Color.Blue)
        }
        .width(100)
        .height(100)
        .layoutWeight(this.getCurrentLayoutWeight())
        .id('layoutweight_component_commonmodifier_1040')
        .backgroundColor(Color.Gray)

        Shape() {
          Rect()
            .width('100%')
            .height('100%')
            .fill(Color.Red)
        }
        .width(100)
        .height(100)
        .layoutWeight(1)
        .backgroundColor(Color.Gray)
      }
      .width('80%')
      .height('8.2%')

      Row() {
        Button('index--')
          .onClick(() => {
            if (this.currentIndex > 0) {
              this.currentIndex--
            }
          })
          .id('index_decrease_button_commonmodifier_1040')
          .margin({ right: 10 })

        Button('index++')
          .onClick(() => {
            if (this.currentIndex < this.layoutWeightValues.length - 1) {
              this.currentIndex++
            }
          })
          .id('index_increase_button_commonmodifier_1040')
          .margin({ left: 10 })
      }
      .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Center)
  }

  getCurrentLayoutWeight(): number {
    const value = this.layoutWeightValues[this.currentIndex]
    return typeof value === 'number' ? value : 1
  }
}