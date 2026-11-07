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
struct ComponentProgressLinear0017 {
  @State strokeWidth: number = 6
  @State strokeRadius: number = 3
  @State enableSmoothEffect: boolean = false
  @State enableScanEffect: boolean = false
  displayController: RichEditorController = new RichEditorController()

  build() {
    Column({space: 20}) {
      Text('ProgressLinear组件测试')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      // 1. 添加ProgressLinear组件
      Progress({ value: 50, total: 100, type: ProgressType.Linear })
        .id('progress_linear_0017')
        .style({
          strokeWidth: this.strokeWidth,
          strokeRadius: this.strokeRadius,
          enableSmoothEffect: this.enableSmoothEffect,
          enableScanEffect: this.enableScanEffect
        })
        .width('80%')
        .height(20)
        .margin({ top: 10 })

      // 2. 设置属性按钮
      Column({space: 10}) {
        Text('设置属性')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          
        Row({space: 10}) {
          Button('设置strokeWidth')
            .id('ComponentProgressLinear0017_001')
            .onClick(() => {
              this.strokeWidth = this.strokeWidth === 6 ? 10 : 6
            })
          Button('设置strokeRadius')
            .id('ComponentProgressLinear0017_002')
            .onClick(() => {
              this.strokeRadius = this.strokeRadius === 3 ? 8 : 3
            })
        }

        Row({space: 10}) {
          Button('设置SmoothEffect')
            .id('ComponentProgressLinear0017_003')
            .onClick(() => {
              this.enableSmoothEffect = !this.enableSmoothEffect
            })
          Button('设置ScanEffect')
            .id('ComponentProgressLinear0017_004')
            .onClick(() => {
              this.enableScanEffect = !this.enableScanEffect
            })
        }
      }
      .margin({ top: 20 })

      // 属性值显示区域
      Column({space: 10}) {
        Text('获取的属性值显示')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
        
        RichEditor({ controller: this.displayController })
          .width('100%')
          .height(120)
          .borderWidth(1)
          .borderColor(Color.Gray)
          .borderRadius(5)
          .padding(10)
      }
      .margin({ top: 20 })

      // 3. Get按钮
      Button('Get属性')
        .id('ComponentProgressLinear0017_get')
        .width(200)
        .height(40)
        .onClick(() => {
          // 清空之前的内容
          this.displayController.deleteSpans({
            start: 0,
            end: this.displayController.getSpans().length
          })
          // 获取属性值并显示到RichEditor中
          const attributeText = `当前属性值:\nstrokeWidth: ${this.strokeWidth}\nstrokeRadius: ${this.strokeRadius}\nenableSmoothEffect: ${this.enableSmoothEffect}\nenableScanEffect: ${this.enableScanEffect}`
          this.displayController.addTextSpan(attributeText, {
            style: {
              fontColor: Color.Black,
              fontSize: 14
            }
          })
        })
        .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .alignItems(HorizontalAlign.Center)
  }
}
