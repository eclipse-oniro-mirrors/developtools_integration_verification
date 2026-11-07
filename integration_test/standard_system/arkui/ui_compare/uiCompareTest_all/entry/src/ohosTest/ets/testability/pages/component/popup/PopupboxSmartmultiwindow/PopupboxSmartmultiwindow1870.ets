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
struct PopupboxSmartmultiwindow1870 {
  @State message: string = '点击按钮弹出菜单'

  @Builder
  MyMenu() {
    Menu() {
      MenuItem({ content: '菜单项1' })
        .id('popupbox_smartmultiwindow_1870_menu1')
        .onClick(() => {
          this.message = '点击了菜单项1'
        })
      MenuItem({ content: '菜单项2' })
        .id('popupbox_smartmultiwindow_1870_menu2')
        .onClick(() => {
          this.message = '点击了菜单项2'
        })
      MenuItem({ content: '菜单项3' })
        .id('popupbox_smartmultiwindow_1870_menu3')
        .onClick(() => {
          this.message = '点击了菜单项3'
        })
      MenuItem({ content: '菜单项4' })
        .id('popupbox_smartmultiwindow_1870_menu4')
        .onClick(() => {
          this.message = '点击了菜单项4'
        })
      MenuItem({ content: '菜单项5' })
        .id('popupbox_smartmultiwindow_1870_menu5')
        .onClick(() => {
          this.message = '点击了菜单项5'
        })
    }
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1870')
        .id('popupbox_smartmultiwindow_1870_title')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Text('直板机拉起悬浮窗操作：bindmenu组件')
        .id('popupbox_smartmultiwindow_1870_desc1')
        .fontSize(12)
        .margin({ bottom: 5 })

      Text('设置ShowInSubWindow为false')
        .id('popupbox_smartmultiwindow_1870_desc2')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 5 })

      Text('观察蒙层效果、组件布局和对齐状态')
        .id('popupbox_smartmultiwindow_1870_desc3')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 20 })

      Text(this.message)
        .id('popupbox_smartmultiwindow_1870_message')
        .fontSize(14)
        .fontColor(Color.Blue)
        .margin({ bottom: 20 })

      Button('点击弹出菜单')
        .id('popupbox_smartmultiwindow_1870_open')
        .width('80%')
        .height(50)
        .margin({ bottom: 20 })
        .bindMenu(this.MyMenu, {
          showInSubWindow: false
        })

      Text('预期结果：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 })

      Text('1、子窗大小和主窗大小保持一致')
        .id('popupbox_smartmultiwindow_1870_expect1')
        .fontSize(11)
        .margin({ bottom: 3 })

      Text('2、蒙层覆盖整个子窗')
        .id('popupbox_smartmultiwindow_1870_expect2')
        .fontSize(11)
        .margin({ bottom: 3 })

      Text('3、组件布局和对齐完全基于子窗进行')
        .id('popupbox_smartmultiwindow_1870_expect3')
        .fontSize(11)
        .margin({ bottom: 3 })

      Text('4、组件根据窗口高度自适应，超长变为滚动模式')
        .id('popupbox_smartmultiwindow_1870_expect4')
        .fontSize(11)
        .margin({ bottom: 3 })

      Text('5、菜单如无位置布局则覆盖在预览容器之上窗口居中显示')
        .id('popupbox_smartmultiwindow_1870_expect5')
        .fontSize(11)
        .margin({ bottom: 3 })

      Text('6、使用默认规则避让安全区和键盘')
        .id('popupbox_smartmultiwindow_1870_expect6')
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

