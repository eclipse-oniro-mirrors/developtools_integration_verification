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
struct CommonAttrCommonModifier0030 {
  @State currentIndex: number = 0
  
  private displayPriorityValues: number[] = [
    2,
    0.1,
    1,
    0,
    2.5,
    0.9,
    5
  ]

  build() {
    Column() {
      Text('DisplayPriority Test')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text(`Current Index: ${this.currentIndex}`)
        .fontSize(16)
        .margin({ bottom: 10 })

      Text(`DisplayPriority Value: ${this.displayPriorityValues[this.currentIndex]}`)
        .fontSize(14)
        .margin({ bottom: 20 })
        .textAlign(TextAlign.Center)

      // 创建一个Flex容器来测试displayPriority效果
      // 当空间不足时，displayPriority值较低的组件会被优先隐藏
      Flex({ wrap: FlexWrap.NoWrap, justifyContent: FlexAlign.SpaceAround }) {
        Column() {
          Text('Component A')
            .fontSize(14)
            .fontColor(Color.White)
        }
        .width('16.67%')
        .height('6.56%')
        .backgroundColor(Color.Blue)
        .justifyContent(FlexAlign.Center)
        .displayPriority(1)
        .margin(5)

        Column() {
          Text('Test Component')
            .fontSize(14)
            .fontColor(Color.White)
        }
        .width('16.67%')
        .height('6.56%')
        .backgroundColor(Color.Red)
        .justifyContent(FlexAlign.Center)
        .displayPriority(this.displayPriorityValues[this.currentIndex])
        .id('displaypriority_component_commonmodifier_0030')
        .margin(5)

        Column() {
          Text('Component B')
            .fontSize(14)
            .fontColor(Color.White)
        }
        .width('16.67%')
        .height('6.56%')
        .backgroundColor(Color.Green)
        .justifyContent(FlexAlign.Center)
        .displayPriority(1)
        .margin(5)

        Column() {
          Text('Component C')
            .fontSize(14)
            .fontColor(Color.White)
        }
        .width('16.67%')
        .height('6.56%')
        .backgroundColor(Color.Orange)
        .justifyContent(FlexAlign.Center)
        .displayPriority(0.5)
        .margin(5)
      }
      .width('41.67%')
      .height('9.84%')
      .backgroundColor(Color.Gray)
      .margin({ top: 20, bottom: 30 })

      Text('Note: Reduce window width to see displayPriority effect')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 20 })

      Row() {
        Button('index--')
          .onClick(() => {
            if (this.currentIndex > 0) {
              this.currentIndex--
            }
          })
          .id('index_decrease_button_commonmodifier_0030')
          .margin({ right: 10 })

        Button('index++')
          .onClick(() => {
            if (this.currentIndex < this.displayPriorityValues.length - 1) {
              this.currentIndex++
            }
          })
          .id('index_increase_button_commonmodifier_0030')
          .margin({ left: 10 })
      }
      .margin({ top: 20 })

      Button('Simulate Space Constraint')
        .onClick(() => {
          // 这个按钮可以用来模拟空间约束效果
        })
        .id('simulate_constraint_button_commonmodifier_0030')
        .backgroundColor('#800080')
        .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Center)
  }
}
