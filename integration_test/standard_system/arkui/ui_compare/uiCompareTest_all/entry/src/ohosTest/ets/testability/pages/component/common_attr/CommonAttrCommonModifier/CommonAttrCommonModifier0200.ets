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

interface MarkAnchorOption0200 {
  markAnchor: Position;
}

@Entry
@Component
struct CommonAttrCommonModifier0200 {
  @State currentIndex: number = 0
  
  private markAnchorValues: MarkAnchorOption0200[] = [
    { markAnchor: { x: 30, y: 10 } },
    { markAnchor: { x: 10, y: 20 } },
    { markAnchor: { x: '10px', y: '10px' } },
    { markAnchor: { x: '10vp', y: '10vp' } },
    { markAnchor: { x: '10fp', y: '10fp' } },
    { markAnchor: { x: '10lpx', y: '10lpx' } },
    { markAnchor: { x: '10%', y: '10%' } },
    { markAnchor: { x: -10, y: -10 } },
    { markAnchor: { x: '20px', y: '21px' } }
  ]

  private markAnchorNames: string[] = [
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
      // 创建测试区域 - Stack组件锚点测试
      Column() {
        Text('Stack MarkAnchor Test Area')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 })

        // 主要测试Stack
        Stack() {
          // 背景容器 - 带网格线和标记点
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

          // 中心参考点
          Column() {
            Text('Center')
              .fontSize(10)
              .fontColor(Color.Black)
          }
          .width('5.56%')
          .height('1.64%')
          .backgroundColor(Color.Yellow)
          .justifyContent(FlexAlign.Center)
          .position({ x: 105, y: 90 })

          // 测试组件 - 使用markAnchor定位
          Column() {
            Text('Test')
              .fontSize(14)
              .fontColor(Color.White)
            Text('Anchor')
              .fontSize(10)
              .fontColor(Color.White)
          }
          .width('11.11%')
          .height('4.1%')
          .backgroundColor(Color.Red)
          .justifyContent(FlexAlign.Center)
          .markAnchor(this.markAnchorValues[this.currentIndex].markAnchor)
          .position({ x: 125, y: 100 })
          .id('markanchor_component_commonmodifier_0200')

          // 锚点标记
          Column() {
            Text('●')
              .fontSize(8)
              .fontColor(Color.Blue)
          }
          .width('1.39%')
          .height('0.82%')
          .justifyContent(FlexAlign.Center)
          .position({ x: 120, y: 95 })
        }
        .width('37.5%')
        .height('18.03%')
        .backgroundColor('#E0E0E0')
        .border({ width: 2, color: Color.Black })
      }
      .margin({ top: 20, bottom: 30 })

      // 添加另一个测试场景：多个组件锚点对比
      Column() {
        Text('Multiple MarkAnchor Test')
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

          // 参考线
          Row().width('100%').height('0.08%').backgroundColor('#DDD').position({ x: 0, y: 60 })
          Column().width('0.14%').height('100%').backgroundColor('#DDD').position({ x: 100, y: 0 })

          // 固定锚点组件
          Column() {
            Text('Fixed')
              .fontSize(12)
              .fontColor(Color.White)
          }
          .width('6.94%')
          .height('2.46%')
          .backgroundColor(Color.Blue)
          .justifyContent(FlexAlign.Center)
          .markAnchor({ x: 25, y: 15 })
          .position({ x: 100, y: 60 })

          // 测试锚点组件
          Column() {
            Text('Test')
              .fontSize(12)
              .fontColor(Color.White)
          }
          .width('6.94%')
          .height('2.46%')
          .backgroundColor(Color.Green)
          .justifyContent(FlexAlign.Center)
          .markAnchor(this.markAnchorValues[this.currentIndex].markAnchor)
          .position({ x: 100, y: 60 })
        }
        .width('30.56%')
        .height('11.48%')
        .backgroundColor('#FAFAFA')
        .border({ width: 2, color: '#800080' })
      }
      .margin({ bottom: 30 })

      // 显示锚点说明
      Column() {
        Text('MarkAnchor Guide:')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 })

        Column() {
          Text('• MarkAnchor sets the anchor point for positioning')
            .fontSize(11)
            .textAlign(TextAlign.Start)
            .width('100%')
            .margin({ bottom: 2 })

          Text('• (0,0) = top-left corner of component')
            .fontSize(11)
            .textAlign(TextAlign.Start)
            .width('100%')
            .margin({ bottom: 2 })

          Text('• Positive values move anchor inside component')
            .fontSize(11)
            .textAlign(TextAlign.Start)
            .width('100%')
            .margin({ bottom: 2 })

          Text('• Negative values move anchor outside component')
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
          .id('index_decrease_button_commonmodifier_0200')
          .margin({ right: 10 })

        Button('index++')
          .onClick(() => {
            if (this.currentIndex < this.markAnchorValues.length - 1) {
              this.currentIndex++
            }
          })
          .id('index_increase_button_commonmodifier_0200')
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
