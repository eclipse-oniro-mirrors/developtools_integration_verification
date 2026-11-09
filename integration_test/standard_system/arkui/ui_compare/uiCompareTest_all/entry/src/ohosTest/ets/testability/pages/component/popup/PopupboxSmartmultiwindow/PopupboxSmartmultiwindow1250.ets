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
struct PopupboxSmartmultiwindow1250 {
  @State message: string = '点击按钮打开ActionSheet'
  @State showActionSheet: boolean = false

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1250')
        .id('popupbox_smartmultiwindow_1250_title')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Text('直板机上下分屏操作：ActionSheet组件')
        .id('popupbox_smartmultiwindow_1250_desc1')
        .fontSize(12)
        .margin({ bottom: 5 })

      Text('观察蒙层效果、组件布局和对齐状态')
        .id('popupbox_smartmultiwindow_1250_desc2')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 20 })

      Text(this.message)
        .id('popupbox_smartmultiwindow_1250_message')
        .fontSize(14)
        .fontColor(Color.Blue)
        .margin({ bottom: 20 })

      Button('打开ActionSheet')
        .id('popupbox_smartmultiwindow_1250_open')
        .width('80%')
        .height(50)
        .margin({ bottom: 20 })
        .onClick(() => {
          this.showActionSheet = true
        })
        .bindSheet($$this.showActionSheet, this.ActionSheetBuilder(), {
          height: SheetSize.MEDIUM,
          showClose: true,
          title: { title: 'ActionSheet弹窗', subtitle: '观察蒙层效果、组件布局和对齐状态' }
        })

      Text('预期结果：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 })

      Text('1、子窗大小和主窗大小保持一致')
        .id('popupbox_smartmultiwindow_1250_expect1')
        .fontSize(11)
        .margin({ bottom: 3 })

      Text('2、蒙层覆盖整个子窗')
        .id('popupbox_smartmultiwindow_1250_expect2')
        .fontSize(11)
        .margin({ bottom: 3 })

      Text('3、组件布局和对齐完全基于子窗进行')
        .id('popupbox_smartmultiwindow_1250_expect3')
        .fontSize(11)
        .margin({ bottom: 3 })

      Text('4、使用默认规则避让安全区和键盘')
        .id('popupbox_smartmultiwindow_1250_expect4')
        .fontSize(11)
        .margin({ bottom: 10 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
    .padding(15)
  }

  @Builder
  ActionSheetBuilder() {
    Column() {
      Text('ActionSheet内容')
        .id('popupbox_smartmultiwindow_1250_sheet_title')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text('这是ActionSheet组件的内容区域')
        .id('popupbox_smartmultiwindow_1250_sheet_content')
        .fontSize(14)
        .fontColor(Color.Gray)
        .margin({ bottom: 20 })

      Button('选项一')
        .id('popupbox_smartmultiwindow_1250_option1')
        .width('80%')
        .height(45)
        .margin({ bottom: 10 })
        .onClick(() => {
          this.message = '选择了选项一'
          this.showActionSheet = false
        })

      Button('选项二')
        .id('popupbox_smartmultiwindow_1250_option2')
        .width('80%')
        .height(45)
        .margin({ bottom: 10 })
        .onClick(() => {
          this.message = '选择了选项二'
          this.showActionSheet = false
        })

      Button('选项三')
        .id('popupbox_smartmultiwindow_1250_option3')
        .width('80%')
        .height(45)
        .margin({ bottom: 10 })
        .onClick(() => {
          this.message = '选择了选项三'
          this.showActionSheet = false
        })

      Button('取消')
        .id('popupbox_smartmultiwindow_1250_cancel')
        .width('80%')
        .height(45)
        .backgroundColor('#F5F5F5')
        .fontColor(Color.Black)
        .onClick(() => {
          this.message = 'ActionSheet已取消'
          this.showActionSheet = false
        })
    }
    .width('100%')
    .padding(20)
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
  }

  aboutToAppear() {
    setTimeout(() => {
      this.showActionSheet = true
    }, 500)
  }
}

