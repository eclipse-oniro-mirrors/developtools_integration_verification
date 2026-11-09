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

@CustomDialog
struct CustomDialog0560 {
  controller: CustomDialogController

  build() {
    Column() {
      Text('CustomDialog弹窗')
        .id('customdialog_smartmultiwindow_0560_title')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 15 })

      Text('KeyboardAvoidMode为default')
        .id('customdialog_smartmultiwindow_0560_desc')
        .fontSize(14)
        .fontColor(Color.Gray)
        .margin({ bottom: 10 })

      Text('上下分屏操作：观察蒙层效果、组件布局和对齐状态')
        .id('customdialog_smartmultiwindow_0560_info')
        .fontSize(12)
        .fontColor(Color.Blue)
        .margin({ bottom: 20 })

      TextInput({ placeholder: '请输入内容' })
        .id('customdialog_smartmultiwindow_0560_input')
        .width('80%')
        .height(40)
        .margin({ bottom: 15 })

      Button('关闭弹窗')
        .id('customdialog_smartmultiwindow_0560_close')
        .width('60%')
        .height(40)
        .onClick(() => {
          this.controller.close()
        })
    }
    .width('90%')
    .padding(20)
    .backgroundColor(Color.White)
    .borderRadius(16)
    .justifyContent(FlexAlign.Center)
  }
}

@Entry
@Component
struct PopupboxSmartmultiwindow0560 {
  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialog0560(),
    showInSubWindow: true,
    autoCancel: true,
    alignment: DialogAlignment.Center,
    maskColor: 'rgba(0, 0, 0, 0.6)'
  })

  aboutToAppear() {
    setTimeout(() => {
      this.dialogController.open()
    }, 500)
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_0560')
        .id('popupbox_smartmultiwindow_0560_title')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Text('直板机上下分屏操作：CustomDialog组件')
        .id('popupbox_smartmultiwindow_0560_desc1')
        .fontSize(12)
        .margin({ bottom: 5 })

      Text('KeyboardAvoidMode为default时观察蒙层效果、组件布局和对齐状态')
        .id('popupbox_smartmultiwindow_0560_desc2')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 20 })

      Button('打开CustomDialog')
        .id('popupbox_smartmultiwindow_0560_open')
        .width('80%')
        .height(50)
        .margin({ bottom: 20 })
        .onClick(() => {
          this.dialogController.open()
        })

      Text('预期结果：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 })

      Text('1、子窗大小和主窗大小保持一致')
        .id('popupbox_smartmultiwindow_0560_expect1')
        .fontSize(11)
        .margin({ bottom: 3 })

      Text('2、蒙层覆盖整个子窗')
        .id('popupbox_smartmultiwindow_0560_expect2')
        .fontSize(11)
        .margin({ bottom: 3 })

      Text('3、组件布局和对齐完全基于子窗进行')
        .id('popupbox_smartmultiwindow_0560_expect3')
        .fontSize(11)
        .margin({ bottom: 3 })

      Text('4、使用默认规则避让安全区和键盘')
        .id('popupbox_smartmultiwindow_0560_expect4')
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

