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
struct CommonAttrPriority0110 {
  @State focusLog: string = ''
  @State menuVisible: boolean = false

  @Builder
  MenuBuilder() {
    Menu() {
      // 焦点组内的菜单项
      MenuItemGroup({ header: '焦点组' }) {
        MenuItem({ content: 'MenuItem1' })
          .id('menuitem_priority_0110_item1')
          .focusScopePriority('menuFocusGroup', FocusPriority.PRIOR)
          .onFocus(() => {
            this.focusLog = 'MenuItem1 获得焦点'
          })
        MenuItem({ content: 'MenuItem2' })
          .id('menuitem_priority_0110_item2')
          .onFocus(() => {
            this.focusLog = 'MenuItem2 获得焦点'
          })
        MenuItem({ content: 'MenuItem3' })
          .id('menuitem_priority_0110_item3')
          .focusScopePriority('menuFocusGroup', FocusPriority.PREVIOUS)
          .onFocus(() => {
            this.focusLog = 'MenuItem3 获得焦点'
          })
      }
      .focusScopeId('menuFocusGroup', true)

      // 非焦点组内的菜单项
      MenuItemGroup({ header: '非焦点组' }) {
        MenuItem({ content: 'MenuItem4' })
          .id('menuitem_priority_0110_item4')
          .onFocus(() => {
            this.focusLog = 'MenuItem4 获得焦点'
          })
        MenuItem({ content: 'MenuItem5' })
          .id('menuitem_priority_0110_item5')
          .focusScopePriority('menuNonFocusGroup', FocusPriority.PRIOR)
          .onFocus(() => {
            this.focusLog = 'MenuItem5 获得焦点'
          })
        MenuItem({ content: 'MenuItem6' })
          .id('menuitem_priority_0110_item6')
          .onFocus(() => {
            this.focusLog = 'MenuItem6 获得焦点'
          })
      }
      .focusScopeId('menuNonFocusGroup', false)
    }
  }

  build() {
    Navigation() {
      Column() {
        Text('SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0110')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Text('Menu非子窗口,焦点组和非焦点组之间走焦')
          .fontSize(12)
          .margin({ bottom: 5 })

        Text(this.focusLog)
          .id('commonattr_priority_0110_log')
          .fontSize(12)
          .fontColor(Color.Blue)
          .margin({ bottom: 10 })

        Button('bindMenu 非子窗口')
          .id('button_priority_0110_bindmenu')
          .width('80%')
          .height(50)
          .margin({ bottom: 20 })
          .bindMenu(this.MenuBuilder(), {
            showInSubWindow: false
          })

        // 普通按钮用于走焦测试
        Column() {
          Text('普通按钮组')
            .fontSize(12)
            .margin({ bottom: 5 })

          Button('Button1')
            .id('button_priority_0110_btn1')
            .width('80%')
            .height(20)
            .margin({ bottom: 5 })
            .onFocus(() => {
              this.focusLog = 'Button1 获得焦点'
            })

          Button('Button2')
            .id('button_priority_0110_btn2')
            .width('80%')
            .height(20)
            .margin({ bottom: 5 })
            .onFocus(() => {
              this.focusLog = 'Button2 获得焦点'
            })

          Button('Button3')
            .id('button_priority_0110_btn3')
            .width('80%')
            .height(20)
            .onFocus(() => {
              this.focusLog = 'Button3 获得焦点'
            })
        }
        .width('90%')
        .padding(10)
        .backgroundColor('#F5F5F5')
        .borderRadius(8)
        .margin({ bottom: 10 })
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Start)
      .padding({ top: 20 })
    }
    .title('menuFocusPrioirty')
    .mode(NavigationMode.Stack)
    .width('100%')
    .height('100%')
  }
}

