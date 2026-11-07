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
struct CommonAttrCommonModifier0100 {
  @State currentIndex: number = 0
  
  private gridOffsetValues: number[] = [
    1,
    2,
    2,
    2.5,
    -2
  ]

  build() {
    Column() {
      Text('GridOffset Test')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text(`Current Index: ${this.currentIndex}`)
        .fontSize(16)
        .margin({ bottom: 10 })

      Text(`GridOffset Value: ${this.gridOffsetValues[this.currentIndex]}`)
        .fontSize(14)
        .margin({ bottom: 20 })
        .textAlign(TextAlign.Center)

      // 创建Grid容器来测试gridOffset效果
      Column() {
        Text('Grid Container with GridOffset')
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
          .gridOffset(this.gridOffsetValues[this.currentIndex])
          .id('gridoffset_component_commonmodifier_0100')

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

      // 添加另一个测试场景：不同列数的Grid
      Column() {
        Text('Grid Container (4 Columns)')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Grid() {
          GridItem() {
            Text('1')
              .fontSize(14)
              .fontColor(Color.White)
              .textAlign(TextAlign.Center)
          }
          .width('100%')
          .height('4.1%')
          .backgroundColor(Color.Blue)

          GridItem() {
            Text('2')
              .fontSize(14)
              .fontColor(Color.White)
              .textAlign(TextAlign.Center)
          }
          .width('100%')
          .height('4.1%')
          .backgroundColor(Color.Gray)

          GridItem() {
            Text('Test')
              .fontSize(14)
              .fontColor(Color.White)
              .textAlign(TextAlign.Center)
          }
          .width('100%')
          .height('4.1%')
          .backgroundColor(Color.Red)
          .gridOffset(this.gridOffsetValues[this.currentIndex])

          GridItem() {
            Text('3')
              .fontSize(14)
              .fontColor(Color.White)
              .textAlign(TextAlign.Center)
          }
          .width('100%')
          .height('4.1%')
          .backgroundColor(Color.Green)

          GridItem() {
            Text('4')
              .fontSize(14)
              .fontColor(Color.White)
              .textAlign(TextAlign.Center)
          }
          .width('100%')
          .height('4.1%')
          .backgroundColor(Color.Orange)

          GridItem() {
            Text('5')
              .fontSize(14)
              .fontColor(Color.White)
              .textAlign(TextAlign.Center)
          }
          .width('100%')
          .height('4.1%')
          .backgroundColor('#800080')
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

      Text('Note: GridOffset moves the item by specified number of columns')
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
          .id('index_decrease_button_commonmodifier_0100')
          .margin({ right: 10 })

        Button('index++')
          .onClick(() => {
            if (this.currentIndex < this.gridOffsetValues.length - 1) {
              this.currentIndex++
            }
          })
          .id('index_increase_button_commonmodifier_0100')
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
