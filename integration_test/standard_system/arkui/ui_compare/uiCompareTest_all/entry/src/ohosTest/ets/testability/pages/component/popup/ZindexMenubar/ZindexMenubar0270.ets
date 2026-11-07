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
struct ZindexMenubar0270 {
  @State dialogClickResult: string = ''

  aboutToAppear() {
    this.showActionSheet()
  }

  showActionSheet() {
    ActionSheet.show({
      title: 'ActionSheet标题',
      message: '验证UIContext拉起ActionSheet组件Z序在menuBar之下',
      autoCancel: true,
      confirm: {
        value: '确定',
        action: () => {
          this.dialogClickResult = 'ActionSheet确定按钮被点击'
        }
      },
      sheets: [
        {
          title: '选项一',
          action: () => {
            this.dialogClickResult = 'ActionSheet选项一被点击'
          }
        },
        {
          title: '选项二',
          action: () => {
            this.dialogClickResult = 'ActionSheet选项二被点击'
          }
        }
      ]
    })
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0270')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Text('UIContext拉起ActionSheet Z序测试')
        .fontSize(14)
        .fontColor(Color.Gray)
        .margin({ bottom: 10 })

      Button('打开ActionSheet')
        .id('zindex_menubar_0270_open')
        .onClick(() => {
          this.showActionSheet()
        })
        .margin(10)

      Button('MenuBar功能按钮')
        .id('zindex_menubar_0270_menubar')
        .onClick(() => {
          this.dialogClickResult = 'MenuBar按钮被点击'
        })
        .margin(10)

      Text(this.dialogClickResult)
        .id('zindex_menubar_0270_result')
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

