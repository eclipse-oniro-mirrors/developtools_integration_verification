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

import { promptAction } from '@kit.ArkUI'

@Entry
@Component
struct PopupboxSmartmultiwindow0970 {
  @State message: string = '点击按钮打开showActionMenu'

  aboutToAppear() {
    setTimeout(() => {
      this.showActionMenu()
    }, 500)
  }

  showActionMenu() {
    promptAction.showActionMenu({
      title: 'showActionMenu弹窗',
      showInSubWindow: false,
      buttons: [
        {
          text: '选项一',
          color: '#007DFF'
        },
        {
          text: '选项二',
          color: '#007DFF'
        },
        {
          text: '选项三',
          color: '#007DFF'
        },
        {
          text: '取消',
          color: '#999999'
        }
      ]
    }).then((result) => {
      this.message = `选择了: 选项${result.index + 1}`
    }).catch((err: Error) => {
      this.message = 'ActionMenu已取消'
    })
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_0970')
        .id('popupbox_smartmultiwindow_0970_title')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Text('直板机上下分屏：showActionMenu组件')
        .id('popupbox_smartmultiwindow_0970_desc1')
        .fontSize(12)
        .margin({ bottom: 5 })

      Text('UIExtension，ShowInSubWindow为false')
        .id('popupbox_smartmultiwindow_0970_desc2')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 5 })

      Text('观察蒙层效果、组件布局和对齐状态')
        .id('popupbox_smartmultiwindow_0970_desc3')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 20 })

      Text(this.message)
        .id('popupbox_smartmultiwindow_0970_message')
        .fontSize(14)
        .fontColor(Color.Blue)
        .margin({ bottom: 20 })

      Button('打开showActionMenu')
        .id('popupbox_smartmultiwindow_0970_open')
        .width('80%')
        .height(50)
        .margin({ bottom: 20 })
        .onClick(() => {
          this.showActionMenu()
        })

      Text('预期结果：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 })

      Text('1、蒙层覆盖整个UIExtension窗口')
        .id('popupbox_smartmultiwindow_0970_expect1')
        .fontSize(11)
        .margin({ bottom: 3 })

      Text('2、组件布局和对齐完全基于UIExtension窗口进行')
        .id('popupbox_smartmultiwindow_0970_expect2')
        .fontSize(11)
        .margin({ bottom: 10 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
    .padding(15)
  }
}

