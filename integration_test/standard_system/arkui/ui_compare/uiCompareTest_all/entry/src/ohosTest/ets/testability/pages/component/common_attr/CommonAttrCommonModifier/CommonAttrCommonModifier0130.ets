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

interface TranslateOption {
  x: number;
  y: number;
  z?: number;
}

@Entry
@Component
struct CommonAttrCommonModifier0130 {
  @State currentIndex: number = 0
  
  private translateValues: Array<TranslateOption | null | undefined> = [
    {x: 0, y: 0, z: 0},
    {x: 100, y: 10},
    undefined,
    null
  ]

  private translateNames: string[] = [
    'x:0, y:0, z:0 (no translation)',
    'x:100, y:10 (move right & down)',
    'undefined',
    'null'
  ]

  build() {
    Column() {
      Text('Translate Test')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text(`Current Index: ${this.currentIndex}`)
        .fontSize(16)
        .margin({ bottom: 10 })

      Text(`Translate: ${this.translateNames[this.currentIndex]}`)
        .fontSize(14)
        .margin({ bottom: 20 })
        .textAlign(TextAlign.Center)

      // 创建测试区域
      Column() {
        Text('Translate Test Area')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 })

        // 参考组件（不平移）
        Stack() {
          // 背景网格线帮助观察位移
          Column() {
            Row().width('100%').height('0.08%').backgroundColor(Color.Gray)
            Blank()
            Row().width('100%').height('0.08%').backgroundColor(Color.Gray)
            Blank()
            Row().width('100%').height('0.08%').backgroundColor(Color.Gray)
          }
          .width('100%')
          .height('100%')
          
          Column() {
            Row().width('0.14%').height('100%').backgroundColor(Color.Gray)
            Blank()
            Row().width('0.14%').height('100%').backgroundColor(Color.Gray)
            Blank()
            Row().width('0.14%').height('100%').backgroundColor(Color.Gray)
          }
          .width('100%')
          .height('100%')
          .direction(Direction.Ltr)

          // 参考组件
          Column() {
            Text('Reference')
              .fontSize(14)
              .fontColor(Color.White)
          }
          .width('13.89%')
          .height('8.2%')
          .backgroundColor(Color.Gray)
          .justifyContent(FlexAlign.Center)
          .position({ x: 50, y: 50 })

          // 测试组件（应用translate）
          Column() {
            Text('Test Item')
              .fontSize(14)
              .fontColor(Color.White)
          }
          .width('13.89%')
          .height('8.2%')
          .backgroundColor(Color.Red)
          .justifyContent(FlexAlign.Center)
          .position({ x: 50, y: 50 })
          .translate(this.translateValues[this.currentIndex])
          .id('translate_component_commonmodifier_0130')
        }
        .width('48.61%')
        .height('20.49%')
        .backgroundColor('#F0F0F0')
        .border({ width: 2, color: Color.Gray })
      }
      .margin({ top: 20, bottom: 30 })

      // 添加另一个测试场景：多个组件对比
      Column() {
        Text('Multiple Components Comparison')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Row() {
          Column() {
            Text('Normal')
              .fontSize(12)
              .fontColor(Color.White)
          }
          .width('11.11%')
          .height('6.56%')
          .backgroundColor(Color.Blue)
          .justifyContent(FlexAlign.Center)
          .margin(10)

          Column() {
            Text('Translate')
              .fontSize(12)
              .fontColor(Color.White)
          }
          .width('11.11%')
          .height('6.56%')
          .backgroundColor(Color.Green)
          .justifyContent(FlexAlign.Center)
          .margin(10)
          .translate(this.translateValues[this.currentIndex])

          Column() {
            Text('Normal')
              .fontSize(12)
              .fontColor(Color.White)
          }
          .width('11.11%')
          .height('6.56%')
          .backgroundColor(Color.Orange)
          .justifyContent(FlexAlign.Center)
          .margin(10)
        }
        .justifyContent(FlexAlign.SpaceAround)
        .width('48.61%')
        .height('12.3%')
        .backgroundColor('#F0F0F0')
        .border({ width: 2, color: Color.Gray })
      }
      .margin({ bottom: 30 })

      // 显示当前平移参数详情
      if (this.translateValues[this.currentIndex] !== null && this.translateValues[this.currentIndex] !== undefined) {
        Text(`Details: x=${this.translateValues[this.currentIndex]!.x}, y=${this.translateValues[this.currentIndex]!.y}`)
          .fontSize(12)
          .fontColor(Color.Gray)
          .margin({ bottom: 20 })
          .textAlign(TextAlign.Center)
      } else {
        Text('Details: No translation applied')
          .fontSize(12)
          .fontColor(Color.Gray)
          .margin({ bottom: 20 })
          .textAlign(TextAlign.Center)
      }

      Row() {
        Button('index--')
          .onClick(() => {
            if (this.currentIndex > 0) {
              this.currentIndex--
            }
          })
          .id('index_decrease_button_commonmodifier_0130')
          .margin({ right: 10 })

        Button('index++')
          .onClick(() => {
            if (this.currentIndex < this.translateValues.length - 1) {
              this.currentIndex++
            }
          })
          .id('index_increase_button_commonmodifier_0130')
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
