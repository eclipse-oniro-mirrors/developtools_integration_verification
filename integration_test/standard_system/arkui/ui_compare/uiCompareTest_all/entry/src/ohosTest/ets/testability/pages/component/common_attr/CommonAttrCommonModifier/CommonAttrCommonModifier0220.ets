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

interface MarkAnchorOption0220 {
  markAnchor: Position;
}

@Entry
@Component
struct CommonAttrCommonModifier0220 {
  @State currentIndex: number = 0
  
  private markAnchorValues: MarkAnchorOption0220[] = [
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
      // 创建测试区域 - 高级锚点测试场景
      Column() {
        Text('Advanced MarkAnchor Test')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 })

        // 坐标系统显示
        Stack() {
          // 坐标轴背景
          Column() {
            // X轴
            Row().width('100%').height('0.16%').backgroundColor(Color.Black).position({ x: 0, y: 99 })
            // Y轴
            Column().width('0.28%').height('100%').backgroundColor(Color.Black).position({ x: 124, y: 0 })
            
            // 刻度标记
            Text('0').fontSize(10).position({ x: 120, y: 105 })
            Text('50').fontSize(10).position({ x: 165, y: 105 })
            Text('100').fontSize(10).position({ x: 210, y: 105 })
            Text('50').fontSize(10).position({ x: 105, y: 55 })
            Text('100').fontSize(10).position({ x: 105, y: 10 })
          }
          .width('34.72%')
          .height('16.39%')
          .backgroundColor('#F8F8F8')

          // 目标位置标记
          Column() {
            Text('Target')
              .fontSize(10)
              .fontColor(Color.Blue)
          }
          .width('4.17%')
          .height('1.23%')
          .backgroundColor('#E0E0FF')
          .justifyContent(FlexAlign.Center)
          .position({ x: 175, y: 75 })

          // 测试组件 - 使用markAnchor定位到目标位置
          Column() {
            Text('Anchor')
              .fontSize(12)
              .fontColor(Color.White)
            Text('Test')
              .fontSize(10)
              .fontColor(Color.White)
          }
          .width('9.72%')
          .height('3.28%')
          .backgroundColor(Color.Red)
          .justifyContent(FlexAlign.Center)
          .markAnchor(this.markAnchorValues[this.currentIndex].markAnchor)
          .position({ x: 175, y: 75 })
          .id('markanchor_component_commonmodifier_0220')
        }
        .width('37.5%')
        .height('18.03%')
        .backgroundColor('#F0F0F0')
        .border({ width: 2, color: Color.Black })
      }
      .margin({ top: 20, bottom: 30 })

      // 添加另一个测试场景：动态锚点测试
      Column() {
        Text('Dynamic MarkAnchor Comparison')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Row() {
          // 左侧：固定锚点
          Stack() {
            Column()
              .width('16.67%')
              .height('8.2%')
              .backgroundColor('#F0F0F0')
              .border({ width: 1, color: Color.Gray })

            Text('Fixed Anchor (25,15)')
              .fontSize(10)
              .position({ x: 10, y: 5 })

            Column() {
              Text('Fixed')
                .fontSize(11)
                .fontColor(Color.White)
            }
            .width('6.94%')
            .height('2.46%')
            .backgroundColor(Color.Blue)
            .justifyContent(FlexAlign.Center)
            .markAnchor({ x: 25, y: 15 })
            .position({ x: 60, y: 50 })
          }
          .width('19.44%')
          .height('9.84%')
          .margin(5)

          // 右侧：动态锚点
          Stack() {
            Column()
              .width('16.67%')
              .height('8.2%')
              .backgroundColor('#F0F0F0')
              .border({ width: 1, color: Color.Gray })

            Text('Dynamic Anchor')
              .fontSize(10)
              .position({ x: 10, y: 5 })

            Column() {
              Text('Test')
                .fontSize(11)
                .fontColor(Color.White)
            }
            .width('6.94%')
            .height('2.46%')
            .backgroundColor(Color.Green)
            .justifyContent(FlexAlign.Center)
            .markAnchor(this.markAnchorValues[this.currentIndex].markAnchor)
            .position({ x: 60, y: 50 })
          }
          .width('19.44%')
          .height('9.84%')
          .margin(5)
        }
        .justifyContent(FlexAlign.SpaceAround)
        .width('44.44%')
        .backgroundColor('#FAFAFA')
        .border({ width: 2, color: '#800080' })
        .padding(10)
      }
      .margin({ bottom: 30 })

      // 显示详细的锚点说明
      Column() {
        Text('MarkAnchor Detailed Guide:')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 })

        Column() {
          Text('• MarkAnchor defines the reference point within component')
            .fontSize(11)
            .textAlign(TextAlign.Start)
            .width('100%')
            .margin({ bottom: 2 })

          Text('• Default anchor is (0,0) at top-left corner')
            .fontSize(11)
            .textAlign(TextAlign.Start)
            .width('100%')
            .margin({ bottom: 2 })

          Text('• Positive values move anchor towards bottom-right')
            .fontSize(11)
            .textAlign(TextAlign.Start)
            .width('100%')
            .margin({ bottom: 2 })

          Text('• Percentage values are relative to component size')
            .fontSize(11)
            .textAlign(TextAlign.Start)
            .width('100%')
            .margin({ bottom: 2 })

          Text('• Used with position() for precise positioning')
            .fontSize(11)
            .textAlign(TextAlign.Start)
            .width('100%')
        }
        .width('44.44%')
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
          .id('index_decrease_button_commonmodifier_0220')
          .margin({ right: 10 })

        Button('index++')
          .onClick(() => {
            if (this.currentIndex < this.markAnchorValues.length - 1) {
              this.currentIndex++
            }
          })
          .id('index_increase_button_commonmodifier_0220')
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
