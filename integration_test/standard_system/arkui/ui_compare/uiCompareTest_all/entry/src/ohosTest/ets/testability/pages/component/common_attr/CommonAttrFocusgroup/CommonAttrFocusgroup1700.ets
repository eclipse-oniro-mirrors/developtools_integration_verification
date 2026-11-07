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
struct CommonAttrFocusgroup1700 {
  @State focusLog: string = ''

  @Builder
  MenuBuilder() {
    Menu() {
      MenuItemGroup({ header: '菜单组1' }) {
        MenuItem({ content: '菜单一第一项' })
          .id('commonattr_focusgroup_1700_menu1_item1')
          .onFocus(() => {
            this.focusLog = '菜单一第一项 获得焦点'
          })
        MenuItem({ content: '菜单一第二项' })
          .id('commonattr_focusgroup_1700_menu1_item2')
          .onFocus(() => {
            this.focusLog = '菜单一第二项 获得焦点'
          })
      }
      .focusScopeId('menuGroup1', true)

      MenuItemGroup({ header: '菜单组2' }) {
        MenuItem({ content: '菜单二第一项' })
          .id('commonattr_focusgroup_1700_menu2_item1')
          .onFocus(() => {
            this.focusLog = '菜单二第一项 获得焦点'
          })
        MenuItem({ content: '菜单二第二项' })
          .id('commonattr_focusgroup_1700_menu2_item2')
          .onFocus(() => {
            this.focusLog = '菜单二第二项 获得焦点'
          })
      }
      .focusScopeId('menuGroup2', true)
    }
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_1700')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('menu页面')
        .fontSize(12)
        .margin({ bottom: 5 })

      Text(this.focusLog)
        .id('commonattr_focusgroup_1700_log')
        .fontSize(12)
        .fontColor(Color.Blue)
        .margin({ bottom: 10 })

      // bindMenu按钮（子窗口）
      Button('bindMenu')
        .id('commonattr_focusgroup_1700_bind_menu')
        .width('80%')
        .height(40)
        .margin({ bottom: 10 })
        .bindMenu(this.MenuBuilder, { showInSubWindow: true })
        .onFocus(() => {
          this.focusLog = 'bindMenu按钮 获得焦点'
        })

      Button('其他按钮')
        .id('commonattr_focusgroup_1700_other_btn')
        .width('80%')
        .height(40)
        .margin({ bottom: 10 })
        .onFocus(() => {
          this.focusLog = '其他按钮 获得焦点'
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .padding({ top: 20 })
  }
}

