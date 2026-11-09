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
struct CommonAttrCommonModifier1050 {
  @State currentIndex: number = 0
  
  private constraintSizeValues: string[] = [
    'full constraints',
    'minWidth only',
    'maxWidth only', 
    'minHeight only',
    'maxHeight only',
    'negative minWidth',
    'negative maxWidth',
    'negative minHeight',
    'negative maxHeight'
  ]

  build() {
    Column() {
      Text('ConstraintSize Test')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text(`Current Index: ${this.currentIndex}`)
        .fontSize(16)
        .margin({ bottom: 10 })

      Text(`ConstraintSize: ${this.constraintSizeValues[this.currentIndex]}`)
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
          .constraintSize(this.getCurrentConstraintSize())
          .id('constraintsize_component_commonmodifier_1050')
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
          .id('index_decrease_button_commonmodifier_1050')
          .margin({ right: 10 })

        Button('index++')
          .onClick(() => {
            if (this.currentIndex < this.constraintSizeValues.length - 1) {
              this.currentIndex++
            }
          })
          .id('index_increase_button_commonmodifier_1050')
          .margin({ left: 10 })
      }
      .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Center)
  }

  getCurrentConstraintSize(): ConstraintSizeOptions {
    switch (this.currentIndex) {
      case 0:
        return { minWidth: 100, maxWidth: 150, minHeight: 100, maxHeight: 100 }
      case 1:
        return { minWidth: 100 }
      case 2:
        return { maxWidth: 150 }
      case 3:
        return { minHeight: 100 }
      case 4:
        return { maxHeight: 100 }
      case 5:
        return { minWidth: -1, maxWidth: 150, minHeight: 100, maxHeight: 100 }
      case 6:
        return { minWidth: 100, maxWidth: -1, minHeight: 100, maxHeight: 100 }
      case 7:
        return { minWidth: 100, maxWidth: 150, minHeight: -1, maxHeight: 100 }
      case 8:
        return { minWidth: 100, maxWidth: 150, minHeight: 100, maxHeight: -1 }
      default:
        return {}
    }
  }
}