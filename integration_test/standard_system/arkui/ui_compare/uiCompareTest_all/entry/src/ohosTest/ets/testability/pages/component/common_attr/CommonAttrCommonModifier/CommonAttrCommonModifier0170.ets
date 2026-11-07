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
struct CommonAttrCommonModifier0170 {
  @State currentIndex: number = 0
  
  private alignValues: Alignment[] = [
    Alignment.Start,
    Alignment.TopStart,
    Alignment.Top,
    Alignment.TopEnd,
    Alignment.Start,
    Alignment.Center,
    Alignment.End,
    Alignment.BottomStart,
    Alignment.Bottom,
    Alignment.BottomEnd
  ]

  private alignNames: string[] = [
    'Alignment.Start',
    'Alignment.TopStart',
    'Alignment.Top',
    'Alignment.TopEnd',
    'Alignment.Start (duplicate)',
    'Alignment.Center',
    'Alignment.End',
    'Alignment.BottomStart',
    'Alignment.Bottom',
    'Alignment.BottomEnd'
  ]

  build() {
    Column() {
      Text('Stack Align Test')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text(`Current Index: ${this.currentIndex}`)
        .fontSize(16)
        .margin({ bottom: 10 })

      Text(`Align: ${this.alignNames[this.currentIndex]}`)
        .fontSize(14)
        .margin({ bottom: 20 })
        .textAlign(TextAlign.Center)

      // 创建测试区域 - Stack组件对齐测试
      Column() {
        Text('Stack Align Test Area')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 })

        // 主要测试Stack
        Stack({ alignContent: this.alignValues[this.currentIndex] }) {
          // 背景容器
          Column()
            .width('27.78%')
            .height('16.39%')
            .backgroundColor('#E0E0E0')
            .border({ width: 2, color: Color.Gray, style: BorderStyle.Dashed })

          // 测试子组件
          Column() {
            Text('Child')
              .fontSize(14)
              .fontColor(Color.White)
          }
          .width('11.11%')
          .height('4.92%')
          .backgroundColor(Color.Red)
          .justifyContent(FlexAlign.Center)
          .id('align_component_commonmodifier_0170')
        }
        .width('30.56%')
        .height('18.03%')
        .backgroundColor('#F0F0F0')
        .border({ width: 2, color: Color.Black })
      }
      .margin({ top: 20, bottom: 30 })

      // 添加另一个测试场景：多个子组件的Stack对齐
      Column() {
        Text('Multiple Children Stack Test')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Stack({ alignContent: this.alignValues[this.currentIndex] }) {
          // 背景
          Column()
            .width('25%')
            .height('9.84%')
            .backgroundColor('#F5F5F5')
            .border({ width: 1, color: Color.Gray, style: BorderStyle.Dotted })

          // 第一个子组件
          Column() {
            Text('A')
              .fontSize(12)
              .fontColor(Color.White)
          }
          .width('5.56%')
          .height('2.46%')
          .backgroundColor(Color.Blue)
          .justifyContent(FlexAlign.Center)

          // 第二个子组件
          Column() {
            Text('B')
              .fontSize(12)
              .fontColor(Color.White)
          }
          .width('4.17%')
          .height('3.28%')
          .backgroundColor(Color.Green)
          .justifyContent(FlexAlign.Center)

          // 第三个子组件
          Column() {
            Text('C')
              .fontSize(12)
              .fontColor(Color.White)
          }
          .width('4.86%')
          .height('2.87%')
          .backgroundColor(Color.Orange)
          .justifyContent(FlexAlign.Center)
        }
        .width('27.78%')
        .height('11.48%')
        .backgroundColor('#FAFAFA')
        .border({ width: 2, color: Color.Pink })
      }
      .margin({ bottom: 30 })

      // 显示对齐说明
      Column() {
        Text('Alignment Guide:')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 })

        Grid() {
          GridItem() { Text('TopStart').fontSize(10).textAlign(TextAlign.Center) }
          GridItem() { Text('Top').fontSize(10).textAlign(TextAlign.Center) }
          GridItem() { Text('TopEnd').fontSize(10).textAlign(TextAlign.Center) }
          GridItem() { Text('Start').fontSize(10).textAlign(TextAlign.Center) }
          GridItem() { Text('Center').fontSize(10).textAlign(TextAlign.Center) }
          GridItem() { Text('End').fontSize(10).textAlign(TextAlign.Center) }
          GridItem() { Text('BottomStart').fontSize(10).textAlign(TextAlign.Center) }
          GridItem() { Text('Bottom').fontSize(10).textAlign(TextAlign.Center) }
          GridItem() { Text('BottomEnd').fontSize(10).textAlign(TextAlign.Center) }
        }
        .columnsTemplate('1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr 1fr')
        .width('25%')
        .height('4.92%')
        .backgroundColor('#F0F8FF')
        .border({ width: 1, color: Color.Blue })
      }
      .margin({ bottom: 20 })

      Row() {
        Button('index--')
          .onClick(() => {
            if (this.currentIndex > 0) {
              this.currentIndex--
            }
          })
          .id('index_decrease_button_commonmodifier_0170')
          .margin({ right: 10 })

        Button('index++')
          .onClick(() => {
            if (this.currentIndex < this.alignValues.length - 1) {
              this.currentIndex++
            }
          })
          .id('index_increase_button_commonmodifier_0170')
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
