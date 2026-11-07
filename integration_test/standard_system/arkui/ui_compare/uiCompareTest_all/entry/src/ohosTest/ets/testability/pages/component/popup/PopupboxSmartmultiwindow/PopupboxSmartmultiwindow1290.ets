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

import { ComponentContent } from '@kit.ArkUI'

@Builder
function buildCustomDialogContent1290() {
  Column() {
    Text('openCustomDialog弹窗')
      .fontSize(20)
      .fontWeight(FontWeight.Bold)
      .margin({ bottom: 10 })
      .id('customdialog_smartmultiwindow_1290_title')

    Text('UIExtension，ShowInSubWindow为false')
      .fontSize(14)
      .fontColor(Color.Gray)
      .margin({ bottom: 10 })
      .id('customdialog_smartmultiwindow_1290_description')

    Text('观察蒙层效果、组件布局和对齐状态')
      .fontSize(14)
      .fontColor(Color.Gray)
      .margin({ bottom: 20 })
      .id('customdialog_smartmultiwindow_1290_desc2')

    TextInput({ placeholder: '请输入内容' })
      .id('customdialog_smartmultiwindow_1290_textinput')
      .width('90%')
      .height(50)
      .backgroundColor('#F5F5F5')
      .borderRadius(8)
      .padding({ left: 10, right: 10 })
      .margin({ bottom: 20 })
  }
  .width('80%')
  .padding(20)
  .backgroundColor(Color.White)
  .borderRadius(20)
  .justifyContent(FlexAlign.Center)
}

@Entry
@Component
struct PopupboxSmartmultiwindow1290 {
  @State message: string = '点击按钮打开openCustomDialog'

  openCustomDialog() {
    let uiContext = this.getUIContext()
    if (!uiContext) {
      this.message = '获取UIContext失败'
      return
    }
    let promptActionApi = uiContext.getPromptAction()
    let contentNode = new ComponentContent(uiContext, wrapBuilder(buildCustomDialogContent1290))
    promptActionApi.openCustomDialog(contentNode, {
      showInSubWindow: false,
      maskColor: 'rgba(0, 0, 0, 0.6)',
      alignment: DialogAlignment.Center,
      autoCancel: true
    }).then(() => {
      this.message = 'Dialog已打开'
    }).catch((err: Error) => {
      this.message = `打开失败: ${err.message}`
    })
  }

  aboutToAppear() {
    setTimeout(() => {
      this.openCustomDialog()
    }, 500)
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1290')
        .id('popupbox_smartmultiwindow_1290_title')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Text('直板机上下分屏：openCustomDialog组件')
        .id('popupbox_smartmultiwindow_1290_desc1')
        .fontSize(12)
        .margin({ bottom: 5 })

      Text('UIExtension，ShowInSubWindow为false')
        .id('popupbox_smartmultiwindow_1290_desc2')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 5 })

      Text('观察蒙层效果、组件布局和对齐状态')
        .id('popupbox_smartmultiwindow_1290_desc3')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 20 })

      Text(this.message)
        .id('popupbox_smartmultiwindow_1290_message')
        .fontSize(14)
        .fontColor(Color.Blue)
        .margin({ bottom: 20 })

      Button('打开openCustomDialog')
        .id('popupbox_smartmultiwindow_1290_open')
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

      Text('1、蒙层覆盖整个UIExtension窗口')
        .id('popupbox_smartmultiwindow_1290_expect1')
        .fontSize(11)
        .margin({ bottom: 3 })

      Text('2、组件布局和对齐完全基于UIExtension窗口进行')
        .id('popupbox_smartmultiwindow_1290_expect2')
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
