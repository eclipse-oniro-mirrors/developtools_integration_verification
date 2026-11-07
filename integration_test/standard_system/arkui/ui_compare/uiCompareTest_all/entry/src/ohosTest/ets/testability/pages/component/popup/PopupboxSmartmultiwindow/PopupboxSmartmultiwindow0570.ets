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
struct PopupboxSmartmultiwindow0570 {
  @State message: string = '点击按钮打开openCustomDialog'

  aboutToAppear() {
    setTimeout(() => {
      this.openCustomDialog()
    }, 500)
  }

  openCustomDialog() {
    promptAction.openCustomDialog({
      builder: () => {
        this.CustomDialogBuilder()
      },
      alignment: DialogAlignment.Center,
      showInSubWindow: true,
      maskColor: 'rgba(0, 0, 0, 0.6)'
    })
    this.message = 'openCustomDialog已弹出'
  }

  @Builder
  CustomDialogBuilder() {
    Column() {
      Text('openCustomDialog弹窗')
        .id('opencustomdialog_smartmultiwindow_0570_title')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 15 })

      Text('ShowInSubWindow为true')
        .id('opencustomdialog_smartmultiwindow_0570_desc')
        .fontSize(14)
        .fontColor(Color.Gray)
        .margin({ bottom: 10 })

      Text('上下分屏操作：观察蒙层效果、组件布局和对齐状态')
        .id('opencustomdialog_smartmultiwindow_0570_info')
        .fontSize(12)
        .fontColor(Color.Blue)
        .margin({ bottom: 20 })

      TextInput({ placeholder: '请输入内容' })
        .id('opencustomdialog_smartmultiwindow_0570_input')
        .width('80%')
        .height(40)
        .margin({ bottom: 15 })

      Button('关闭弹窗')
        .id('opencustomdialog_smartmultiwindow_0570_close')
        .width('60%')
        .height(40)
        .onClick(() => {
          promptAction.closeCustomDialog(0)
        })
    }
    .width('90%')
    .padding(20)
    .backgroundColor(Color.White)
    .borderRadius(16)
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_0570')
        .id('popupbox_smartmultiwindow_0570_title')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Text('直板机上下分屏：openCustomDialog组件')
        .id('popupbox_smartmultiwindow_0570_desc1')
        .fontSize(12)
        .margin({ bottom: 5 })

      Text('非UIExtension，ShowInSubWindow为true')
        .id('popupbox_smartmultiwindow_0570_desc2')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 5 })

      Text('观察蒙层效果、组件布局和对齐状态')
        .id('popupbox_smartmultiwindow_0570_desc3')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 20 })

      Text(this.message)
        .id('popupbox_smartmultiwindow_0570_message')
        .fontSize(14)
        .fontColor(Color.Blue)
        .margin({ bottom: 20 })

      Button('打开openCustomDialog')
        .id('popupbox_smartmultiwindow_0570_open')
        .width('80%')
        .height(50)
        .margin({ bottom: 20 })
        .onClick(() => {
          this.openCustomDialog()
        })

      Text('预期结果：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 })

      Text('1、子窗大小和主窗大小保持一致')
        .id('popupbox_smartmultiwindow_0570_expect1')
        .fontSize(11)
        .margin({ bottom: 3 })

      Text('2、蒙层覆盖整个子窗')
        .id('popupbox_smartmultiwindow_0570_expect2')
        .fontSize(11)
        .margin({ bottom: 3 })

      Text('3、组件布局和对齐完全基于子窗进行')
        .id('popupbox_smartmultiwindow_0570_expect3')
        .fontSize(11)
        .margin({ bottom: 3 })

      Text('4、不避让软键盘')
        .id('popupbox_smartmultiwindow_0570_expect4')
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

