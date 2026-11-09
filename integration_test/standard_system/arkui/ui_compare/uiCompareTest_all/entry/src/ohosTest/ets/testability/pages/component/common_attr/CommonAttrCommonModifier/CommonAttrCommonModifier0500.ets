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
struct CommonAttrCommonModifier0500 {
  @State currentIndex: number = 0
  
  private contrastValues: number[] = [0.8]
  private contrastNames: string[] = ['contrast: 0.8']

  build() {
    Column() {
      Text('Contrast Test (0.8)')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text(`Current Index: ${this.currentIndex}`)
        .fontSize(16)
        .margin({ bottom: 10 })

      Text(`Config: ${this.contrastNames[this.currentIndex]}`)
        .fontSize(12)
        .margin({ bottom: 20 })

      // 简洁的对比测试区域
      Row() {
        // 参考组件
        Column() {
          Text('Reference')
            .fontSize(14)
            .margin({ bottom: 10 })

          Column() {
            Text('🔍')
              .fontSize(32)
            Text('Normal')
              .fontSize(12)
          }
          .width('13.89%')
          .height('8.2%')
          .backgroundColor('#F0F8FF')
          .justifyContent(FlexAlign.Center)
          .border({ width: 1, color: Color.Gray })
        }
        .margin(20)

        // 测试组件
        Column() {
          Text('Contrast 0.8')
            .fontSize(14)
            .margin({ bottom: 10 })

          Column() {
            Text('🔍')
              .fontSize(32)
            Text('Reduced')
              .fontSize(12)
          }
          .width('13.89%')
          .height('8.2%')
          .backgroundColor('#F0F8FF')
          .contrast(this.contrastValues[this.currentIndex])
          .justifyContent(FlexAlign.Center)
          .border({ width: 2, color: Color.Blue })
          .id('contrast_component_commonmodifier_0500')
        }
        .margin(20)
      }
      .justifyContent(FlexAlign.SpaceAround)
      .margin({ top: 30, bottom: 40 })

      // 简洁的颜色测试
      Column() {
        Text('Reduced Contrast Effect Test')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 15 })

        Row() {
          Column().width('5.56%').height('3.28%').backgroundColor('#2F4F4F').margin(5) // 深灰绿
          Column().width('5.56%').height('3.28%').backgroundColor('#696969').margin(5) // 暗灰色
          Column().width('5.56%').height('3.28%').backgroundColor('#F5F5DC').margin(5) // 米色
          Column().width('5.56%').height('3.28%').backgroundColor('#DC143C').margin(5) // 深红色
          Column().width('5.56%').height('3.28%').backgroundColor('#4169E1').margin(5) // 皇家蓝
        }
        .contrast(this.contrastValues[this.currentIndex])
        .margin({ bottom: 20 })

        Text(`80% contrast - slightly reduced difference`)
          .fontSize(12)
          .fontColor(Color.Gray)
      }
      .margin({ bottom: 40 })

      Row() {
        Button('index--')
          .onClick(() => {
            if (this.currentIndex > 0) {
              this.currentIndex--
            }
          })
          .id('index_decrease_button_commonmodifier_0500')
          .margin({ right: 10 })

        Button('index++')
          .onClick(() => {
            if (this.currentIndex < this.contrastValues.length - 1) {
              this.currentIndex++
            }
          })
          .id('index_increase_button_commonmodifier_0500')
          .margin({ left: 10 })
      }
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Center)
  }
}
