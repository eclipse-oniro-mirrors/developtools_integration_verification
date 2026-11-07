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
struct CommonAttrCommonModifier1060 {
  @State currentIndex: number = 0
  
  private sizeValues: string[] = [
    'normal values',
    'negative width',
    'different height',
    'negative height', 
    'padding values',
    'negative padding',
    'margin values',
    'undefined padding',
    'undefined margin',
    'visible',
    'hidden',
    'opacity 0.2',
    'undefined opacity',
    'string color'
  ]

  build() {
    Column() {
      Text('Multi-Attribute Test')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text(`Current Index: ${this.currentIndex}`)
        .fontSize(16)
        .margin({ bottom: 10 })

      Text(`Attributes: ${this.sizeValues[this.currentIndex]}`)
        .fontSize(12)
        .margin({ bottom: 20 })
        .textAlign(TextAlign.Center)

      // 测试组件
      Column() {
        Text('Test Component')
          .fontSize(18)
          .fontColor(Color.White)
          .padding(this.getCurrentPadding())
          .margin(this.getCurrentMargin())
          .visibility(this.getCurrentVisibility())
          .opacity(this.getCurrentOpacity())
          .backgroundColor(this.getCurrentBackgroundColor())
          .borderRadius(10)
          .width(this.getCurrentWidth())
          .height(this.getCurrentHeight())
          .id('multiattr_component_commonmodifier_1060')
      }
      .justifyContent(FlexAlign.Center)
      .height('20.49%')
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
          .id('index_decrease_button_commonmodifier_1060')
          .margin({ right: 10 })

        Button('index++')
          .onClick(() => {
            if (this.currentIndex < this.sizeValues.length - 1) {
              this.currentIndex++
            }
          })
          .id('index_increase_button_commonmodifier_1060')
          .margin({ left: 10 })
      }
      .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Center)
  }

  getCurrentWidth(): Length {
    return this.currentIndex === 1 ? -1 : 200
  }

  getCurrentHeight(): Length {
    return this.currentIndex === 3 ? -1 : (this.currentIndex === 2 ? 150 : 200)
  }

  getCurrentPadding(): Padding | undefined {
    switch (this.currentIndex) {
      case 4:
        return { top: 5, left: 5, bottom: 0, right: 0 }
      case 5:
        return { top: -1, left: 1, bottom: 1, right: 1 }
      case 7:
        return undefined
      case 10:
      case 11:
        return { top: 50, left: 50, bottom: 0, right: 0 }
      case 13:
        return { top: 5, left: 5, bottom: 0, right: 0 }
      default:
        return { top: 0, left: 0, bottom: 0, right: 0 }
    }
  }

  getCurrentMargin(): Margin | undefined {
    switch (this.currentIndex) {
      case 6:
        return { top: 20, bottom: 20, left: 20, right: 20 }
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
        return undefined
      default:
        return { top: 0, bottom: 0, left: 0, right: 0 }
    }
  }

  getCurrentVisibility(): Visibility {
    switch (this.currentIndex) {
      case 9:
      case 11:
      case 12:
        return Visibility.Visible
      case 10:
        return Visibility.Hidden
      default:
        return Visibility.Visible
    }
  }

  getCurrentOpacity(): number | undefined {
    switch (this.currentIndex) {
      case 11:
        return 0.2
      case 12:
        return undefined
      default:
        return 1
    }
  }

  getCurrentBackgroundColor(): ResourceColor {
    return this.currentIndex === 13 ? '#BBFFFF' : Color.Blue
  }
}