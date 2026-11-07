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

interface OffsetOption {
  offset: Position;
}

@Entry
@Component
struct CommonAttrCommonModifier0210 {
  @State currentIndex: number = 0
  
  private offsetValues: OffsetOption[] = [
    { offset: { x: 30, y: 10 } },
    { offset: { x: 10, y: 20 } },
    { offset: { x: '10px', y: '10px' } },
    { offset: { x: '10vp', y: '10vp' } },
    { offset: { x: '10fp', y: '10fp' } },
    { offset: { x: '10lpx', y: '10lpx' } },
    { offset: { x: '10%', y: '10%' } },
    { offset: { x: -10, y: -10 } },
    { offset: { x: '20px', y: '22px' } }
  ]

  private offsetNames: string[] = [
    'x: 30, y: 10 (number)',
    'x: 10, y: 20 (number)',
    'x: "10px", y: "10px" (px unit)',
    'x: "10vp", y: "10vp" (vp unit)',
    'x: "10fp", y: "10fp" (fp unit)',
    'x: "10lpx", y: "10lpx" (lpx unit)',
    'x: "10%", y: "10%" (percentage)',
    'x: -10, y: -10 (negative)',
    'x: $r("..."), y: $r("...") (resource)'
  ]

  build() {
    Column() {
      // 创建测试区域 - Stack组件偏移测试
      Column() {
        Text('Stack Offset Test Area')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 })

        // 主要测试Stack
        Stack() {
          // 背景容器 - 带网格线帮助观察偏移
          Column() {
            // 水平网格线
            Row().width('100%').height('0.08%').backgroundColor('#CCCCCC').margin({ top: 25 })
            Row().width('100%').height('0.08%').backgroundColor('#CCCCCC').margin({ top: 25 })
            Row().width('100%').height('0.08%').backgroundColor('#CCCCCC').margin({ top: 25 })
            Row().width('100%').height('0.08%').backgroundColor('#CCCCCC').margin({ top: 25 })
            Row().width('100%').height('0.08%').backgroundColor('#CCCCCC').margin({ top: 25 })
          }
          .width('34.72%')
          .height('16.39%')
          .backgroundColor('#F0F0F0')

          // 垂直网格线
          Row() {
            Column().width('0.14%').height('100%').backgroundColor('#CCCCCC').margin({ left: 30 })
            Column().width('0.14%').height('100%').backgroundColor('#CCCCCC').margin({ left: 30 })
            Column().width('0.14%').height('100%').backgroundColor('#CCCCCC').margin({ left: 30 })
            Column().width('0.14%').height('100%').backgroundColor('#CCCCCC').margin({ left: 30 })
            Column().width('0.14%').height('100%').backgroundColor('#CCCCCC').margin({ left: 30 })
          }
          .width('34.72%')
          .height('16.39%')

          // 参考组件（无偏移）
          Column() {
            Text('Ref')
              .fontSize(12)
              .fontColor(Color.White)
          }
          .width('8.33%')
          .height('3.28%')
          .backgroundColor(Color.Gray)
          .justifyContent(FlexAlign.Center)

          // 测试组件（应用offset）
          Column() {
            Text('Test')
              .fontSize(14)
              .fontColor(Color.White)
          }
          .width('11.11%')
          .height('4.1%')
          .backgroundColor(Color.Red)
          .justifyContent(FlexAlign.Center)
          .offset(this.offsetValues[this.currentIndex].offset)
          .id('offset_component_commonmodifier_0210')
        }
        .width('37.5%')
        .height('18.03%')
        .backgroundColor('#E0E0E0')
        .border({ width: 2, color: Color.Black })
      }
      .margin({ top: 20, bottom: 30 })

      // 添加另一个测试场景：布局中的偏移测试
      Column() {
        Text('Layout Offset Test')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Column() {
          Row() {
            // 正常组件
            Column() {
              Text('Normal')
                .fontSize(12)
                .fontColor(Color.White)
            }
            .width('8.33%')
            .height('3.28%')
            .backgroundColor(Color.Blue)
            .justifyContent(FlexAlign.Center)
            .margin(5)

            // 偏移组件
            Column() {
              Text('Offset')
                .fontSize(12)
                .fontColor(Color.White)
            }
            .width('8.33%')
            .height('3.28%')
            .backgroundColor(Color.Green)
            .justifyContent(FlexAlign.Center)
            .margin(5)
            .offset(this.offsetValues[this.currentIndex].offset)

            // 正常组件
            Column() {
              Text('Normal')
                .fontSize(12)
                .fontColor(Color.White)
            }
            .width('8.33%')
            .height('3.28%')
            .backgroundColor(Color.Orange)
            .justifyContent(FlexAlign.Center)
            .margin(5)
          }
          .justifyContent(FlexAlign.SpaceAround)
          .width('100%')

          // 第二行
          Row() {
            Column() {
              Text('Item')
                .fontSize(12)
                .fontColor(Color.White)
            }
            .width('6.94%')
            .height('2.87%')
            .backgroundColor('#800080')
            .justifyContent(FlexAlign.Center)
            .margin(5)

            Column() {
              Text('Item')
                .fontSize(12)
                .fontColor(Color.White)
            }
            .width('6.94%')
            .height('2.87%')
            .backgroundColor(Color.Pink)
            .justifyContent(FlexAlign.Center)
            .margin(5)
          }
          .justifyContent(FlexAlign.SpaceAround)
          .width('100%')
          .margin({ top: 10 })
        }
        .width('38.89%')
        .height('9.84%')
        .backgroundColor('#FAFAFA')
        .border({ width: 2, color: '#800080' })
        .padding(10)
      }
      .margin({ bottom: 30 })

      // 显示偏移说明
      Column() {
        Text('Offset Guide:')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 })

        Column() {
          Text('• Offset moves component from its normal position')
            .fontSize(11)
            .textAlign(TextAlign.Start)
            .width('100%')
            .margin({ bottom: 2 })

          Text('• Does not affect layout of other components')
            .fontSize(11)
            .textAlign(TextAlign.Start)
            .width('100%')
            .margin({ bottom: 2 })

          Text('• Positive x: move right, positive y: move down')
            .fontSize(11)
            .textAlign(TextAlign.Start)
            .width('100%')
            .margin({ bottom: 2 })

          Text('• Negative values move in opposite direction')
            .fontSize(11)
            .textAlign(TextAlign.Start)
            .width('100%')
            .margin({ bottom: 2 })

          Text('• Supports px, vp, fp, lpx, % units')
            .fontSize(11)
            .textAlign(TextAlign.Start)
            .width('100%')
        }
        .width('41.67%')
        .backgroundColor('#F0F8FF')
        .border({ width: 1, color: Color.Blue })
        .padding(8)
      }
      .margin({ bottom: 20 })

      Row() {
        Button('index--')
          .onClick(() => {
            if (this.currentIndex > 0) {
              this.currentIndex--
            }
          })
          .id('index_decrease_button_commonmodifier_0210')
          .margin({ right: 10 })

        Button('index++')
          .onClick(() => {
            if (this.currentIndex < this.offsetValues.length - 1) {
              this.currentIndex++
            }
          })
          .id('index_increase_button_commonmodifier_0210')
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
