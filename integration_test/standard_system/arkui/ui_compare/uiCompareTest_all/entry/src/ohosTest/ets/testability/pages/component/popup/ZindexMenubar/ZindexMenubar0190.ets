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
struct ZindexMenubar0190 {
  @State dialogClickResult: string = ''
  @State handlePopup: boolean = true

  build() {
    Column() {
      Text('SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0190')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Text('showInSubWindow=true, Popup')
        .fontSize(14)
        .fontColor(Color.Gray)
        .margin({ bottom: 10 })

      Button('打开Popup')
        .id('zindex_menubar_0190_open')
        .onClick(() => {
          this.handlePopup = !this.handlePopup
        })
        .margin(10)
        .bindPopup(this.handlePopup, {
          message: '验证Popup组件Z序在menuBar之下',
          showInSubWindow: true,
          placement: Placement.Bottom,
          primaryButton: {
            value: '确定',
            action: () => {
              this.dialogClickResult = 'Popup确定按钮被点击'
              this.handlePopup = false
            }
          },
          secondaryButton: {
            value: '取消',
            action: () => {
              this.dialogClickResult = 'Popup取消按钮被点击'
              this.handlePopup = false
            }
          },
          onStateChange: (e) => {
            if (!e.isVisible) {
              this.handlePopup = false
            }
          }
        })

      Button('MenuBar功能按钮')
        .id('zindex_menubar_0190_menubar')
        .onClick(() => {
          this.dialogClickResult = 'MenuBar按钮被点击'
        })
        .margin(10)

      Text(this.dialogClickResult)
        .id('zindex_menubar_0190_result')
        .fontSize(14)
        .fontColor(Color.Blue)
        .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
    .padding(20)
  }
}

