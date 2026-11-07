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
struct CommonAttrCommonModifier0140 {
  @State currentIndex: number = 0
  
  private renderGroupValues: boolean[] = [
    true,
    false
  ]

  private renderGroupNames: string[] = [
    'true (enable render group)',
    'false (disable render group)'
  ]

  build() {
    Column() {
      Text('RenderGroup Test')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text(`Current Index: ${this.currentIndex}`)
        .fontSize(16)
        .margin({ bottom: 10 })

      Text(`RenderGroup: ${this.renderGroupNames[this.currentIndex]}`)
        .fontSize(14)
        .margin({ bottom: 20 })
        .textAlign(TextAlign.Center)

      // 创建测试区域 - 复杂的组件层次结构来测试renderGroup效果
      Column() {
        Text('RenderGroup Test Area')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 })

        // 测试组件 - 包含多个子组件的复杂结构
        Column() {
          Row() {
            Column() {
              Text('Child 1')
                .fontSize(12)
                .fontColor(Color.White)
            }
            .width('8.33%')
            .height('4.92%')
            .backgroundColor(Color.Blue)
            .justifyContent(FlexAlign.Center)
            .margin(5)

            Column() {
              Text('Child 2')
                .fontSize(12)
                .fontColor(Color.White)
            }
            .width('8.33%')
            .height('4.92%')
            .backgroundColor(Color.Green)
            .justifyContent(FlexAlign.Center)
            .margin(5)
          }

          Row() {
            Column() {
              Text('Child 3')
                .fontSize(12)
                .fontColor(Color.White)
            }
            .width('8.33%')
            .height('4.92%')
            .backgroundColor(Color.Orange)
            .justifyContent(FlexAlign.Center)
            .margin(5)

            Column() {
              Text('Child 4')
                .fontSize(12)
                .fontColor(Color.White)
            }
            .width('8.33%')
            .height('4.92%')
            .backgroundColor('#800080')
            .justifyContent(FlexAlign.Center)
            .margin(5)
          }

          Text('Test Container')
            .fontSize(14)
            .fontColor(Color.White)
            .margin({ top: 10 })
        }
        .width('27.78%')
        .height('14.75%')
        .backgroundColor(Color.Red)
        .justifyContent(FlexAlign.Center)
        .renderGroup(this.renderGroupValues[this.currentIndex])
        .id('rendergroup_component_commonmodifier_0140')
      }
      .margin({ top: 20, bottom: 30 })

      // 添加另一个测试场景：对比不同renderGroup设置
      Column() {
        Text('Comparison Test')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Row() {
          // 参考组件（固定renderGroup为false）
          Column() {
            Column() {
              Text('Ref')
                .fontSize(10)
                .fontColor(Color.White)
            }
            .width('5.56%')
            .height('3.28%')
            .backgroundColor(Color.Blue)
            .justifyContent(FlexAlign.Center)

            Text('RenderGroup: false')
              .fontSize(10)
              .fontColor(Color.White)
              .margin({ top: 5 })
          }
          .width('16.67%')
          .height('8.2%')
          .backgroundColor(Color.Gray)
          .justifyContent(FlexAlign.Center)
          .renderGroup(false)
          .margin(10)

          // 测试组件（使用当前设置）
          Column() {
            Column() {
              Text('Test')
                .fontSize(10)
                .fontColor(Color.White)
            }
            .width('5.56%')
            .height('3.28%')
            .backgroundColor(Color.Red)
            .justifyContent(FlexAlign.Center)

            Text(`RenderGroup: ${this.renderGroupValues[this.currentIndex]}`)
              .fontSize(10)
              .fontColor(Color.White)
              .margin({ top: 5 })
          }
          .width('16.67%')
          .height('8.2%')
          .backgroundColor(Color.Pink)
          .justifyContent(FlexAlign.Center)
          .renderGroup(this.renderGroupValues[this.currentIndex])
          .margin(10)
        }
        .justifyContent(FlexAlign.SpaceAround)
        .width('48.61%')
        .height('10.66%')
        .backgroundColor('#F0F0F0')
        .border({ width: 2, color: Color.Gray })
      }
      .margin({ bottom: 30 })

      Text('Note: RenderGroup affects rendering optimization and performance')
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
          .id('index_decrease_button_commonmodifier_0140')
          .margin({ right: 10 })

        Button('index++')
          .onClick(() => {
            if (this.currentIndex < this.renderGroupValues.length - 1) {
              this.currentIndex++
            }
          })
          .id('index_increase_button_commonmodifier_0140')
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
