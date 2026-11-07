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
struct CommonAttrCommonModifier1030 {
  @State currentIndex: number = 0
  
  private backgroundImageValues: string[] = [
    'normal image',
    'repeat X',
    'repeat Y', 
    'repeat XY',
    'invalid size',
    'undefined src',
    'width only',
    'height only',
    'negative size',
    'partial size'
  ]

  build() {
    Column() {
      Text('BackgroundImage Test')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text(`Current Index: ${this.currentIndex}`)
        .fontSize(16)
        .margin({ bottom: 10 })

      Text(`BackgroundImage: ${this.backgroundImageValues[this.currentIndex]}`)
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
          .backgroundImage(this.getCurrentBackgroundImage())
          .id('backgroundimage_component_commonmodifier_1030')
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
          .id('index_decrease_button_commonmodifier_1030')
          .margin({ right: 10 })

        Button('index++')
          .onClick(() => {
            if (this.currentIndex < this.backgroundImageValues.length - 1) {
              this.currentIndex++
            }
          })
          .id('index_increase_button_commonmodifier_1030')
          .margin({ left: 10 })
      }
      .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Center)
  }

  getCurrentBackgroundImage(): Resource | string {
    // 由于资源文件不存在，使用简单的颜色背景
    return ''
  }
}