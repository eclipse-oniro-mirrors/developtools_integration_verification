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
struct CommonAttrCommonModifier1110 {
  @State currentIndex: number = 0
  
  private pixelStretchEffectValues: string[] = [
    'negative values',
    'positive values',
    'small values',
    'percentage top'
  ]

  build() {
    Column() {
      Text('PixelStretchEffect Test')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text(`Current Index: ${this.currentIndex}`)
        .fontSize(16)
        .margin({ bottom: 10 })

      Text(`PixelStretchEffect: ${this.pixelStretchEffectValues[this.currentIndex]}`)
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
          .pixelStretchEffect(this.getCurrentPixelStretchEffect())
          .id('pixelstretcheffect_component_commonmodifier_1110')
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
          .id('index_decrease_button_commonmodifier_1110')
          .margin({ right: 10 })

        Button('index++')
          .onClick(() => {
            if (this.currentIndex < this.pixelStretchEffectValues.length - 1) {
              this.currentIndex++
            }
          })
          .id('index_increase_button_commonmodifier_1110')
          .margin({ left: 10 })
      }
      .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Center)
  }

  getCurrentPixelStretchEffect(): PixelStretchEffectOptions {
    switch (this.currentIndex) {
      case 0:
        return { top: -10, left: -10, right: -10, bottom: -10 }
      case 1:
        return { right: 5, bottom: 5, top: 5, left: 5 }
      case 2:
        return { right: 2, bottom: 2, top: 2, left: 2 }
      case 3:
        return { top: '50%', left: 10, right: 10, bottom: 10 }
      default:
        return { top: 0, left: 0, right: 0, bottom: 0 }
    }
  }
}