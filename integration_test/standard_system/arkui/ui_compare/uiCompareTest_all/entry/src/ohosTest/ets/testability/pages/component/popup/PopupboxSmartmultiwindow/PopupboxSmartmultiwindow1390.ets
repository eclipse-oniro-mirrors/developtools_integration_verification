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
struct PopupboxSmartmultiwindow1390 {
  @State message: string = '点击按钮弹出Toast'

  showToast() {
    promptAction.showToast({
      message: 'default组件Toast消息',
      duration: 5000,
      bottom: 100,
      showMode: promptAction.ToastShowMode.DEFAULT
    })
    this.message = 'Toast已弹出'
  }

  aboutToAppear() {
    setTimeout(() => {
      this.showToast()
    }, 500)
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1390')
        .id('popupbox_smartmultiwindow_1390_title')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Text('直板机上下分屏操作：default组件')
        .id('popupbox_smartmultiwindow_1390_desc1')
        .fontSize(12)
        .margin({ bottom: 5 })

      Text('观察蒙层效果、组件布局和对齐状态')
        .id('popupbox_smartmultiwindow_1390_desc2')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 20 })

      Text(this.message)
        .id('popupbox_smartmultiwindow_1390_message')
        .fontSize(14)
        .fontColor(Color.Blue)
        .margin({ bottom: 20 })

      Button('弹出Toast')
        .id('popupbox_smartmultiwindow_1390_open')
        .width('80%')
        .height(50)
        .margin({ bottom: 20 })
        .onClick(() => {
          this.showToast()
        })

      Text('预期结果：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 })

      Text('1、窗大小和主窗大小保持一致')
        .id('popupbox_smartmultiwindow_1390_expect1')
        .fontSize(11)
        .margin({ bottom: 3 })

      Text('2、组件布局和对齐完全基于子窗进行')
        .id('popupbox_smartmultiwindow_1390_expect2')
        .fontSize(11)
        .margin({ bottom: 3 })

      Text('3、上下分屏比例小于1:1较大窗口依然底部对齐展示')
        .id('popupbox_smartmultiwindow_1390_expect3')
        .fontSize(11)
        .margin({ bottom: 3 })

      Text('4、较小窗口居中展示')
        .id('popupbox_smartmultiwindow_1390_expect4')
        .fontSize(11)
        .margin({ bottom: 3 })

      Text('5、使用默认规则避让安全区和键盘')
        .id('popupbox_smartmultiwindow_1390_expect5')
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

