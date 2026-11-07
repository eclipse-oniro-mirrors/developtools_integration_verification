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
struct PopupboxSpecificationsBind0280 {
  @State isShow: boolean = false
  @State message: string = 'isShow值: false'
  @State menuItemStatus: string = '等待操作'

  @Builder
  MyMenu() {
    Menu() {
      MenuItem({ content: '菜单项1' })
        .onClick(() => {
          this.menuItemStatus = '点击菜单项1'
          this.isShow = false
          this.message = '点击菜单项1关闭，isShow值: ' + this.isShow
        })
      MenuItem({ content: '菜单项2' })
        .onClick(() => {
          this.menuItemStatus = '点击菜单项2'
          this.isShow = false
          this.message = '点击菜单项2关闭，isShow值: ' + this.isShow
        })
      MenuItem({ content: '菜单项3' })
        .onClick(() => {
          this.menuItemStatus = '点击菜单项3'
          this.isShow = false
          this.message = '点击菜单项3关闭，isShow值: ' + this.isShow
        })
    }
  }

  build() {
    Column() {
      Text('双向绑定测试页面(bindMenu点击菜单项退出)')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text(this.message)
        .fontSize(16)
        .margin({ bottom: 20 })
        .id('message_text_bind_0280')

      Text('菜单项状态: ' + this.menuItemStatus)
        .fontSize(16)
        .margin({ bottom: 20 })
        .id('menu_item_status_bind_0280')

      Button('点击打开菜单')
        .id('button_bind_0280')
        .fontSize(16)
        .margin({ bottom: 20 })
        .bindMenu(this.MyMenu)

      Button('显示isShow状态')
        .id('show_status_bind_0280')
        .fontSize(16)
        .onClick(() => {
          this.message = '当前isShow值: ' + this.isShow
        })

      Text('操作说明：')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Text('1. 点击按钮打开菜单(bindMenu)')
        .fontSize(12)
        .margin({ bottom: 5 })

      Text('2. 观察isShow值变为true')
        .fontSize(12)
        .margin({ bottom: 5 })

      Text('3. 点击菜单选项')
        .fontSize(12)
        .margin({ bottom: 5 })

      Text('4. 观察菜单关闭，isShow值变为false')
        .fontSize(12)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Start)
  }
}
