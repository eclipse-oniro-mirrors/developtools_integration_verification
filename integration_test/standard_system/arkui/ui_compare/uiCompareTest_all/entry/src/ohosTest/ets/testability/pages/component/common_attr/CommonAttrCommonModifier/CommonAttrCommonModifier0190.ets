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

interface PositionOption {
  position: Position;
}

@Entry
@Component
struct CommonAttrCommonModifier0190 {
  @State currentIndex: number = 0
  
  private positionValues: PositionOption[] = [
    { position: { x: 30, y: 10 } },
    { position: { x: 10, y: 20 } },
    { position: { x: '10px', y: '10px' } },
    { position: { x: '10vp', y: '10vp' } },
    { position: { x: '10fp', y: '10fp' } },
    { position: { x: '10lpx', y: '10lpx' } },
    { position: { x: '10%', y: '10%' } },
    { position: { x: -10, y: -10 } },
    { position: { x: '20px', y: '20px' } }
  ]

  private positionNames: string[] = [
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

      // 创建测试区域 - Stack组件位置测试
      Column() {
        Text('Stack Position Test Area')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 })

        // 主要测试Stack
        Stack() {
          // 背景容器 - 带网格线帮助观察位置
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

          // 参考点 (0,0)
          Column() {
            Text('(0,0)')
              .fontSize(10)
              .fontColor(Color.Black)
          }
          .width('4.17%')
          .height('1.64%')
          .backgroundColor(Color.Yellow)
          .justifyContent(FlexAlign.Center)
          .position({ x: 0, y: 0 })

          // 测试组件
          Column() {
            Text('Test')
              .fontSize(14)
              .fontColor(Color.White)
          }
          .width('8.33%')
          .height('3.28%')
          .backgroundColor(Color.Red)
          .justifyContent(FlexAlign.Center)
          .position(this.positionValues[this.currentIndex].position)
          .id('position_component_commonmodifier_0190')
        }
        .width('37.5%')
        .height('18.03%')
        .backgroundColor('#E0E0E0')
        .border({ width: 2, color: Color.Black })
      }
      .margin({ top: 20, bottom: 30 })

      // 添加另一个测试场景：多个组件位置对比
      Column() {
        Text('Multiple Position Test')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Stack() {
          // 背景
          Column()
            .width('27.78%')
            .height('9.84%')
            .backgroundColor('#F5F5F5')
            .border({ width: 1, color: Color.Gray, style: BorderStyle.Dotted })

          // 固定位置组件1
          Column() {
            Text('Fixed')
              .fontSize(12)
              .fontColor(Color.White)
          }
          .width('5.56%')
          .height('2.46%')
          .backgroundColor(Color.Blue)
          .justifyContent(FlexAlign.Center)
          .position({ x: 20, y: 20 })

          // 测试位置组件
          Column() {
            Text('Test')
              .fontSize(12)
              .fontColor(Color.White)
          }
          .width('5.56%')
          .height('2.46%')
          .backgroundColor(Color.Green)
          .justifyContent(FlexAlign.Center)
          .position(this.positionValues[this.currentIndex].position)

          // 固定位置组件2
          Column() {
            Text('Fixed')
              .fontSize(12)
              .fontColor(Color.White)
          }
          .width('5.56%')
          .height('2.46%')
          .backgroundColor(Color.Orange)
          .justifyContent(FlexAlign.Center)
          .position({ x: 140, y: 70 })
        }
        .width('30.56%')
        .height('11.48%')
        .backgroundColor('#FAFAFA')
        .border({ width: 2, color: '#800080' })
      }
      .margin({ bottom: 30 })

      // 显示位置说明
      Column() {
        Text('Position Units Guide:')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 })

        Column() {
          Text('• Number: Device pixels (dp)')
            .fontSize(11)
            .textAlign(TextAlign.Start)
            .width('100%')
            .margin({ bottom: 2 })

          Text('• px: Physical pixels')
            .fontSize(11)
            .textAlign(TextAlign.Start)
            .width('100%')
            .margin({ bottom: 2 })

          Text('• vp: Virtual pixels (density-independent)')
            .fontSize(11)
            .textAlign(TextAlign.Start)
            .width('100%')
            .margin({ bottom: 2 })

          Text('• fp: Font pixels (scale with font size)')
            .fontSize(11)
            .textAlign(TextAlign.Start)
            .width('100%')
            .margin({ bottom: 2 })

          Text('• %: Percentage of parent size')
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
          .id('index_decrease_button_commonmodifier_0190')
          .margin({ right: 10 })

        Button('index++')
          .onClick(() => {
            if (this.currentIndex < this.positionValues.length - 1) {
              this.currentIndex++
            }
          })
          .id('index_increase_button_commonmodifier_0190')
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
