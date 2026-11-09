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
struct CommonAttrCommonModifier0110 {
  @State currentIndex: number = 0
  
  private gridSpanValues: number[] = [
    1,
    2,
    1,
    1.5,
    -1
  ]

  build() {
    Column() {
      Text('GridSpan Test')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text(`Current Index: ${this.currentIndex}`)
        .fontSize(16)
        .margin({ bottom: 10 })

      Text(`GridSpan Value: ${this.gridSpanValues[this.currentIndex]}`)
        .fontSize(14)
        .margin({ bottom: 20 })
        .textAlign(TextAlign.Center)

      // 创建Grid容器来测试gridSpan效果
      Column() {
        Text('Grid Container with GridSpan')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Grid() {
          GridItem() {
            Column() {
              Text('Item 1')
                .fontSize(12)
                .fontColor(Color.White)
            }
            .width('100%')
            .height('4.92%')
            .backgroundColor(Color.Blue)
            .justifyContent(FlexAlign.Center)
          }

          GridItem() {
            Column() {
              Text('Item 2')
                .fontSize(12)
                .fontColor(Color.White)
            }
            .width('100%')
            .height('4.92%')
            .backgroundColor(Color.Gray)
            .justifyContent(FlexAlign.Center)
          }

          GridItem() {
            Column() {
              Text('Test Item')
                .fontSize(12)
                .fontColor(Color.White)
            }
            .width('100%')
            .height('4.92%')
            .backgroundColor(Color.Red)
            .justifyContent(FlexAlign.Center)
          }
          .gridSpan(this.gridSpanValues[this.currentIndex])
          .id('gridspan_component_commonmodifier_0110')

          GridItem() {
            Column() {
              Text('Item 3')
                .fontSize(12)
                .fontColor(Color.White)
            }
            .width('100%')
            .height('4.92%')
            .backgroundColor(Color.Green)
            .justifyContent(FlexAlign.Center)
          }

          GridItem() {
            Column() {
              Text('Item 4')
                .fontSize(12)
                .fontColor(Color.White)
            }
            .width('100%')
            .height('4.92%')
            .backgroundColor(Color.Orange)
            .justifyContent(FlexAlign.Center)
          }

          GridItem() {
            Column() {
              Text('Item 5')
                .fontSize(12)
                .fontColor(Color.White)
            }
            .width('100%')
            .height('4.92%')
            .backgroundColor('#800080')
            .justifyContent(FlexAlign.Center)
          }
        }
        .columnsTemplate('1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr')
        .columnsGap(5)
        .rowsGap(5)
        .width('41.67%')
        .height('11.48%')
        .backgroundColor('#F0F0F0')
        .border({ width: 2, color: Color.Gray })
      }
      .margin({ top: 20, bottom: 30 })

      // 添加另一个测试场景：4列Grid
      Column() {
        Text('Grid Container (4 Columns)')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Grid() {
          GridItem() {
            Text('A')
              .fontSize(14)
              .fontColor(Color.White)
              .textAlign(TextAlign.Center)
          }
          .width('100%')
          .height('4.1%')
          .backgroundColor(Color.Blue)

          GridItem() {
            Text('B')
              .fontSize(14)
              .fontColor(Color.White)
              .textAlign(TextAlign.Center)
          }
          .width('100%')
          .height('4.1%')
          .backgroundColor(Color.Gray)

          GridItem() {
            Text('Test Span')
              .fontSize(12)
              .fontColor(Color.White)
              .textAlign(TextAlign.Center)
          }
          .width('100%')
          .height('4.1%')
          .backgroundColor(Color.Red)
          .gridSpan(this.gridSpanValues[this.currentIndex])

          GridItem() {
            Text('C')
              .fontSize(14)
              .fontColor(Color.White)
              .textAlign(TextAlign.Center)
          }
          .width('100%')
          .height('4.1%')
          .backgroundColor(Color.Green)

          GridItem() {
            Text('D')
              .fontSize(14)
              .fontColor(Color.White)
              .textAlign(TextAlign.Center)
          }
          .width('100%')
          .height('4.1%')
          .backgroundColor(Color.Orange)

          GridItem() {
            Text('E')
              .fontSize(14)
              .fontColor(Color.White)
              .textAlign(TextAlign.Center)
          }
          .width('100%')
          .height('4.1%')
          .backgroundColor('#800080')

          GridItem() {
            Text('F')
              .fontSize(14)
              .fontColor(Color.White)
              .textAlign(TextAlign.Center)
          }
          .width('100%')
          .height('4.1%')
          .backgroundColor(Color.Pink)
        }
        .columnsTemplate('1fr 1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr')
        .columnsGap(3)
        .rowsGap(3)
        .width('44.44%')
        .height('9.02%')
        .backgroundColor('#F0F0F0')
        .border({ width: 2, color: Color.Gray })
      }
      .margin({ bottom: 30 })

      Text('Note: GridSpan determines how many columns the item spans')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 20 })
        .textAlign(TextAlign.Center)

      Row() {
        Button('index--')
          .onClick(() => {
            if (this.currentIndex > 0) {
              this.currentIndex--
            }
          })
          .id('index_decrease_button_commonmodifier_0110')
          .margin({ right: 10 })

        Button('index++')
          .onClick(() => {
            if (this.currentIndex < this.gridSpanValues.length - 1) {
              this.currentIndex++
            }
          })
          .id('index_increase_button_commonmodifier_0110')
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
