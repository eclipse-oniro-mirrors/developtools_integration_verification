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
struct DialogSpecificationsHand0070 {
  @State showPopup: boolean = true

  // 自定义气泡内容
  @Builder
  popupBuilder() {
    Column({ space: 15 }) {
      // 关闭按钮X
      Row() {
        Text('')
          .layoutWeight(1)  // 占据剩余空间，实现右对齐效果
        Text('X')
          .id('DialogSpecificationsHand0070_close')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Red)
          .textAlign(TextAlign.Center)
          .width(30)
          .height(30)
          .borderRadius(15)
          .backgroundColor(Color.White)
          .border({ width: 1, color: Color.Gray })
          .onClick(() => {
            this.showPopup = false
          })
      }
      .width('100%')

      Text('气泡弹窗内容')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      // 按钮一
      Button('按钮一')
        .id('DialogSpecificationsHand0070_001')
        .width(120)
        .height(40)
        .fontSize(14)
        .fontColor(Color.White)
        .backgroundColor(Color.Blue)
        .borderRadius(8)
        .onClick(() => {
          console.info('点击了按钮一')
        })

      // 按钮二
      Button('按钮二')
        .id('DialogSpecificationsHand0070_002')
        .width(120)
        .height(40)
        .fontSize(14)
        .fontColor(Color.White)
        .backgroundColor(Color.Green)
        .borderRadius(8)
        .onClick(() => {
          console.info('点击了按钮二')
        })
    }
    .padding(20)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .border({ width: 1, color: Color.Gray })
    .shadow({ radius: 10, color: Color.Gray, offsetX: 2, offsetY: 2 })
    .alignItems(HorizontalAlign.Center)
  }

  build() {
    Column({ space: 20 }) {
      Text('规格补充')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      // 步骤1：popup控制按钮
      Button('popup控制')
        .id('DialogSpecificationsHand0070_003')
        .fontSize(16)
        .width(150)
        .height(50)
        .onClick(() => {
          // 步骤2：拉起弹窗
          this.showPopup = !this.showPopup
        })
        .bindPopup(this.showPopup, {
          builder: this.popupBuilder,
          placement: Placement.Bottom,
          maskColor: 0x33000000,
          popupColor: Color.Transparent,
          enableArrow: true,
          showInSubWindow: false,
          onStateChange: (e) => {
            if (!e.isVisible) {
              this.showPopup = false
            }
          }
        })

      Text('点击上方按钮拉起气泡弹窗')
        .fontSize(14)
        .fontColor(Color.Gray)
        .margin({ top: 20 })

      Text('气泡内包含：')
        .fontSize(14)
        .fontColor(Color.Black)
        .margin({ top: 10 })

      Column({ space: 5 }) {
        Text('• 按钮一（蓝色）- 文本默认居中')
          .fontSize(12)
          .fontColor(Color.Gray)
        Text('• 按钮二（绿色）- 文本默认居中')
          .fontSize(12)
          .fontColor(Color.Gray)
        Text('• 关闭按钮X - 位于右上角中间位置')
          .fontSize(12)
          .fontColor(Color.Gray)
      }
      .alignItems(HorizontalAlign.Start)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Start)
  }
}


