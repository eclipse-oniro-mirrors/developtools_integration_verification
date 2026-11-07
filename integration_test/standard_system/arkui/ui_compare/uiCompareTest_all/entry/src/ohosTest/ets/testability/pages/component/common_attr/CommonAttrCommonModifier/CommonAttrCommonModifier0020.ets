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
struct CommonAttrCommonModifier0020 {
  @State currentIndex: number = 0
  
  private zIndexValues: number[] = [
    2.0,
    0.7,
    0,
    1,
    100,
    -11,
    3.5
  ]

  build() {
    Column() {
      Text('ZIndex Test')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text(`Current Index: ${this.currentIndex}`)
        .fontSize(16)
        .margin({ bottom: 10 })

      Text(`ZIndex Value: ${this.zIndexValues[this.currentIndex]}`)
        .fontSize(14)
        .margin({ bottom: 20 })
        .textAlign(TextAlign.Center)

      // 创建多个重叠的组件来测试zIndex效果
      Stack() {
        // 背景组件
        Column() {
          Text('Background Component')
            .fontSize(16)
            .fontColor(Color.White)
        }
        .width('27.78%')
        .height('12.3%')
        .backgroundColor(Color.Gray)
        .justifyContent(FlexAlign.Center)
        .zIndex(0)

        // 测试组件 - 应用当前zIndex值
        Column() {
          Text('Test Component')
            .fontSize(16)
            .fontColor(Color.White)
        }
        .width('25%')
        .height('9.84%')
        .backgroundColor(Color.Blue)
        .justifyContent(FlexAlign.Center)
        .zIndex(this.zIndexValues[this.currentIndex])
        .id('zindex_component_commonmodifier_0020')

        // 前景组件
        Column() {
          Text('Foreground Component')
            .fontSize(14)
            .fontColor(Color.White)
        }
        .width('22.22%')
        .height('8.2%')
        .backgroundColor(Color.Red)
        .justifyContent(FlexAlign.Center)
        .zIndex(1)
      }
      .width('34.72%')
      .height('16.39%')
      .margin({ top: 20, bottom: 30 })

      Row() {
        Button('index--')
          .onClick(() => {
            if (this.currentIndex > 0) {
              this.currentIndex--
            }
          })
          .id('index_decrease_button_commonmodifier_0020')
          .margin({ right: 10 })

        Button('index++')
          .onClick(() => {
            if (this.currentIndex < this.zIndexValues.length - 1) {
              this.currentIndex++
            }
          })
          .id('index_increase_button_commonmodifier_0020')
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
