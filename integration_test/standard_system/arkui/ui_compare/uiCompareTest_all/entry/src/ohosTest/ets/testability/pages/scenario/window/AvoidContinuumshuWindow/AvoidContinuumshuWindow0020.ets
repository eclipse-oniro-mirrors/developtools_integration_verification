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
struct AvoidContinuumshuWindow0020 {
  @State showPopup: boolean = false

  @Builder
  popupBuilder() {
    Column() {
      Text('这是一个Popup弹窗')
        .fontSize(16)
        .fontColor(Color.White)
        .margin({ bottom: 10 })
      
      Text('popup内容区域')
        .fontSize(14)
        .fontColor(Color.White)
        .margin({ bottom: 10 })
      
      Button('关闭')
        .fontSize(12)
        .width(60)
        .height(30)
        .onClick(() => {
          this.showPopup = false
        })
    }
    .width('100%')
    .height('100%')
    .padding(15)
    .backgroundColor(Color.Black)
    .borderRadius(8)
  }

  build() {
    Column() {
      Text('验证popup的连续弹子窗场景')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 50, bottom: 30 })

      Button('点击弹出Popup')
        .id('avoid_continuumshu_popup_button_0020')
        .width(200)
        .height(50)
        .fontSize(16)
        .onClick(() => {
          this.showPopup = !this.showPopup
        })
        .bindPopup(this.showPopup, {
          builder: this.popupBuilder,
          showInSubWindow: true,
          onStateChange: (e) => {
            if (!e.isVisible) {
              this.showPopup = false
            }
          }
        })
        .margin({ bottom: 20 })

      Text('说明：点击按钮弹出子窗popup，然后连续点击蒙层处关闭popup')
        .fontSize(14)
        .fontColor(Color.Gray)
        .textAlign(TextAlign.Center)
        .margin({ top: 20 })
        .padding(20)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}


