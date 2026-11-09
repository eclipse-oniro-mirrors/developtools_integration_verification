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

import { matrix4 } from '@kit.ArkUI'

@Entry
@Component
struct CommonAttrCommonModifier0080 {
  @State currentIndex: number = 0
  
  private transformValues: Array<Matrix4Transit | null | undefined> = [
    matrix4.identity().translate({ x: 50, y: 50 }).scale({ x: 1.5, y: 1 }).rotate({x: 0, y: 0, z: 1, angle: 60}),
    matrix4.identity().translate({ x: 10, y: 10 }).scale({ x: 1, y: 2 }).rotate({x: 0, y: 0, z: 1, angle: 160}),
    undefined,
    null
  ]

  private transformNames: string[] = [
    'translate(50,50) + scale(1.5,1) + rotate(60°)',
    'translate(10,10) + scale(1,2) + rotate(160°)',
    'undefined',
    'null'
  ]

  build() {
    Column() {
      Text('Transform Test')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text(`Current Index: ${this.currentIndex}`)
        .fontSize(16)
        .margin({ bottom: 10 })

      Text(`Transform: ${this.transformNames[this.currentIndex]}`)
        .fontSize(12)
        .margin({ bottom: 20 })
        .textAlign(TextAlign.Center)
        .maxLines(2)

      // 创建测试区域
      Column() {
        Text('Transform Test Area')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 })

        // 参考组件（不变换）
        Row() {
          Column() {
            Text('Reference')
              .fontSize(14)
              .fontColor(Color.White)
          }
          .width('11.11%')
          .height('6.56%')
          .backgroundColor(Color.Gray)
          .justifyContent(FlexAlign.Center)
          .margin(10)

          // 测试组件（应用transform）
          Column() {
            Text('Test Item')
              .fontSize(14)
              .fontColor(Color.White)
          }
          .width('11.11%')
          .height('6.56%')
          .backgroundColor(Color.Red)
          .justifyContent(FlexAlign.Center)
          .margin(10)
          .transform(this.transformValues[this.currentIndex])
          .id('transform_component_commonmodifier_0080')
        }
        .justifyContent(FlexAlign.Center)
        .alignItems(VerticalAlign.Center)
        .width('41.67%')
        .height('16.39%')
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
          .width('8.33%')
          .height('4.92%')
          .backgroundColor(Color.Blue)
          .justifyContent(FlexAlign.Center)
          .margin(5)

          Column() {
            Text('Transform')
              .fontSize(12)
              .fontColor(Color.White)
          }
          .width('8.33%')
          .height('4.92%')
          .backgroundColor(Color.Green)
          .justifyContent(FlexAlign.Center)
          .margin(5)
          .transform(this.transformValues[this.currentIndex])

          Column() {
            Text('Normal')
              .fontSize(12)
              .fontColor(Color.White)
          }
          .width('8.33%')
          .height('4.92%')
          .backgroundColor(Color.Orange)
          .justifyContent(FlexAlign.Center)
          .margin(5)
        }
        .justifyContent(FlexAlign.SpaceAround)
        .width('41.67%')
        .height('12.3%')
        .backgroundColor('#F0F0F0')
        .border({ width: 2, color: Color.Gray })
      }
      .margin({ bottom: 30 })

      Text('Note: Transform applies translation, scaling, and rotation')
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
          .id('index_decrease_button_commonmodifier_0080')
          .margin({ right: 10 })

        Button('index++')
          .onClick(() => {
            if (this.currentIndex < this.transformValues.length - 1) {
              this.currentIndex++
            }
          })
          .id('index_increase_button_commonmodifier_0080')
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
