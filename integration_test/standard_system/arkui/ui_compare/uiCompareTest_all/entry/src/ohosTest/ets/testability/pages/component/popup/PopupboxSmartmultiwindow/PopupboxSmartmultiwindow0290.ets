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
struct PopupboxSmartmultiwindow0290 {
  @State message: string = '长按图片弹出菜单'
  @State isContextMenuShow: boolean = false

  @Builder
  MyMenu() {
    Menu() {
      MenuItem({ content: '菜单项1' })
        .id('contextmenu_smartmultiwindow_0290_item1')
        .onClick(() => {
          this.message = '点击了菜单项1'
        })
      MenuItem({ content: '菜单项2' })
        .id('contextmenu_smartmultiwindow_0290_item2')
        .onClick(() => {
          this.message = '点击了菜单项2'
        })
      MenuItem({ content: '菜单项3' })
        .id('contextmenu_smartmultiwindow_0290_item3')
        .onClick(() => {
          this.message = '点击了菜单项3'
        })
      MenuItem({ content: '菜单项4' })
        .id('contextmenu_smartmultiwindow_0290_item4')
        .onClick(() => {
          this.message = '点击了菜单项4'
        })
      MenuItem({ content: '菜单项5' })
        .id('contextmenu_smartmultiwindow_0290_item5')
        .onClick(() => {
          this.message = '点击了菜单项5'
        })
    }
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_0290')
        .id('popupbox_smartmultiwindow_0290_title')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Text('直板机上下分屏操作：bindContextMenu组件')
        .id('popupbox_smartmultiwindow_0290_desc1')
        .fontSize(12)
        .margin({ bottom: 5 })

      Text('设置MenuPreviewMode为image')
        .id('popupbox_smartmultiwindow_0290_desc2')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 5 })

      Text('观察蒙层效果、组件布局和对齐状态')
        .id('popupbox_smartmultiwindow_0290_desc3')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 20 })

      Text(this.message)
        .id('popupbox_smartmultiwindow_0290_message')
        .fontSize(14)
        .fontColor(Color.Blue)
        .margin({ bottom: 20 })

      Image($r('app.media.icon'))
        .id('popupbox_smartmultiwindow_0290_image')
        .width(150)
        .height(150)
        .margin({ bottom: 20 })
        .bindContextMenu(this.isContextMenuShow, this.MyMenu, {
          onDisappear: () => {
            this.isContextMenuShow = false
          }
        })
        .gesture(
          LongPressGesture()
            .onAction(() => {
              this.isContextMenuShow = true
            })
        )

      Text('长按上方图片弹出菜单')
        .id('popupbox_smartmultiwindow_0290_tip')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 20 })

      Text('预期结果：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 })

      Text('1、子窗大小和主窗大小保持一致')
        .id('popupbox_smartmultiwindow_0290_expect1')
        .fontSize(11)
        .margin({ bottom: 3 })

      Text('2、组件布局和对齐完全基于子窗进行')
        .id('popupbox_smartmultiwindow_0290_expect2')
        .fontSize(11)
        .margin({ bottom: 3 })

      Text('3、组件根据窗口高度自适应，超长变为滚动模式')
        .id('popupbox_smartmultiwindow_0290_expect3')
        .fontSize(11)
        .margin({ bottom: 3 })

      Text('4、菜单如无位置布局则覆盖在预览容器之上窗口居中显示')
        .id('popupbox_smartmultiwindow_0290_expect4')
        .fontSize(11)
        .margin({ bottom: 3 })

      Text('5、使用默认规则避让安全区和键盘')
        .id('popupbox_smartmultiwindow_0290_expect5')
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
