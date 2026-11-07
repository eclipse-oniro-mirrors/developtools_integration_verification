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
struct SmartMultiwindowCustomDialog1920 {
  controller: CustomDialogController
  @State inputValue: string = ''

  build() {
    Column() {
      Text('CustomDialog弹窗')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })
        .id('customdialog_smartmultiwindow_1920_title')

      Text('KeyboardAvoidMode为none时观察蒙层效果、组件布局和对齐状态')
        .fontSize(14)
        .fontColor(Color.Gray)
        .margin({ bottom: 20 })
        .id('customdialog_smartmultiwindow_1920_description')

      TextInput({ placeholder: '请输入内容', text: this.inputValue })
        .id('customdialog_smartmultiwindow_1920_textinput')
        .width('90%')
        .height(50)
        .backgroundColor('#F5F5F5')
        .borderRadius(8)
        .padding({ left: 10, right: 10 })
        .onChange((value: string) => {
          this.inputValue = value
        })
        .margin({ bottom: 20 })

      Button('关闭弹窗')
        .id('customdialog_smartmultiwindow_1920_close')
        .width(150)
        .height(50)
        .onClick(() => {
          this.controller.close()
        })
    }
    .width('80%')
    .padding(20)
    .backgroundColor(Color.White)
    .borderRadius(20)
    .justifyContent(FlexAlign.Center)
  }
}

@Entry
@Component
struct PopupboxSmartmultiwindow1920 {
  dialogController: CustomDialogController = new CustomDialogController({
    builder: SmartMultiwindowCustomDialog1920({}),
    showInSubWindow: true,
    maskColor: 'rgba(0, 0, 0, 0.6)',
    alignment: DialogAlignment.Center,
    autoCancel: true
  })

  aboutToAppear() {
    setTimeout(() => {
      this.dialogController.open()
    }, 500)
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1920')
        .id('popupbox_smartmultiwindow_1920_title')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Text('直板机上下分屏操作：CustomDialog组件')
        .id('popupbox_smartmultiwindow_1920_desc1')
        .fontSize(12)
        .margin({ bottom: 5 })

      Text('KeyboardAvoidMode为none时观察蒙层效果、组件布局和对齐状态')
        .id('popupbox_smartmultiwindow_1920_desc2')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 20 })

      Button('打开CustomDialog')
        .id('popupbox_smartmultiwindow_1920_open')
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
        .id('popupbox_smartmultiwindow_1920_expect1')
        .fontSize(11)
        .margin({ bottom: 3 })

      Text('2、蒙层覆盖整个子窗')
        .id('popupbox_smartmultiwindow_1920_expect2')
        .fontSize(11)
        .margin({ bottom: 3 })

      Text('3、组件布局和对齐完全基于子窗进行')
        .id('popupbox_smartmultiwindow_1920_expect3')
        .fontSize(11)
        .margin({ bottom: 3 })

      Text('4、不避让软键盘')
        .id('popupbox_smartmultiwindow_1920_expect4')
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
