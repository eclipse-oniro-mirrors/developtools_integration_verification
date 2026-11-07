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
struct PopupboxSpecificationsBind0080 {
  @State isShow: boolean = false
  @State message: string = 'isShow值: false'

  @Builder
  MyMenu() {
    Menu() {
      MenuItem({ content: '一级菜单项1' })
        .onClick(() => {
          this.message = 'isShow值: ' + this.isShow
        })
      MenuItem({ content: '一级菜单项2' })
        .onClick(() => {
          this.message = 'isShow值: ' + this.isShow
        })
      MenuItem({
        content: '带二级菜单项',
        labelInfo: '二级',
        builder: this.SubMenu
      })
        .onClick(() => {
          this.message = 'isShow值: ' + this.isShow
        })
    }
  }

  @Builder
  SubMenu() {
    Menu() {
      MenuItem({ content: '二级菜单项1' })
        .onClick(() => {
          this.message = '二级菜单点击，isShow值: ' + this.isShow
          this.isShow = false
        })
      MenuItem({ content: '二级菜单项2' })
        .onClick(() => {
          this.message = '二级菜单点击，isShow值: ' + this.isShow
          this.isShow = false
        })
    }
  }

  build() {
    Column() {
      Text('双向绑定测试页面')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text(this.message)
        .fontSize(16)
        .margin({ bottom: 20 })
        .id('message_text_bind_0080')

      Button('长按打开菜单')
        .id('button_bind_0080')
        .fontSize(16)
        .margin({ bottom: 20 })
        .bindContextMenu(this.MyMenu, ResponseType.LongPress)

      Button('显示isShow状态')
        .id('show_status_bind_0080')
        .fontSize(16)
        .onClick(() => {
          this.message = '当前isShow值: ' + this.isShow
        })

      Text('操作说明：')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Text('1. 长按按钮打开一级菜单')
        .fontSize(12)
        .margin({ bottom: 5 })

      Text('2. 点击"带二级菜单项"打开二级菜单')
        .fontSize(12)
        .margin({ bottom: 5 })

      Text('3. 点击二级菜单项关闭菜单')
        .fontSize(12)
        .margin({ bottom: 5 })

      Text('4. 观察isShow值的变化')
        .fontSize(12)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Start)
  }
}

