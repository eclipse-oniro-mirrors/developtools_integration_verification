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
struct SetAutofocusTransferFocusview0490 {
  @State focusLog: string = ''
  @State selectedItem: string = ''

  @Builder
  MenuBuilder() {
    Menu() {
      MenuItem({ content: '菜单选项1' })
        .id('setautofocustransfer_focusview_0490_menu_item1')
        .onClick(() => {
          this.selectedItem = '菜单选项1'
          console.log('菜单选项1 被点击')
        })
      MenuItem({ content: '菜单选项2' })
        .id('setautofocustransfer_focusview_0490_menu_item2')
        .onClick(() => {
          this.selectedItem = '菜单选项2'
          console.log('菜单选项2 被点击')
        })
      MenuItem({ content: '菜单选项3' })
        .id('setautofocustransfer_focusview_0490_menu_item3')
        .onClick(() => {
          this.selectedItem = '菜单选项3'
          console.log('菜单选项3 被点击')
        })
    }
    .width(200)
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0490')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 })

      Button('Menu场景测试')
        .id('setautofocustransfer_focusview_0490_menu_test')
        .width('90%')
        .height(20)

      Column() {
        Text(this.focusLog)
          .id('setautofocustransfer_focusview_0490_log')
          .fontSize(14)
          .fontColor(Color.Blue)
          .margin({ bottom: 10 })

        Text('已选择: ' + this.selectedItem)
          .id('setautofocustransfer_focusview_0490_selected')
          .fontSize(14)
          .fontColor(Color.Gray)
          .margin({ bottom: 10 })

        Button('defaultFocus Button')
          .id('setautofocustransfer_focusview_0490_default_focus')
          .width('80%')
          .height(50)
          .defaultFocus(true)
          .onFocus(() => {
            this.focusLog = 'Menu_DefaultFocus Gain TestFocus'
            console.log('Menu_DefaultFocus Gain TestFocus')
          })
          .onBlur(() => {
            this.focusLog = 'Menu_DefaultFocus Lost TestFocus'
            console.log('Menu_DefaultFocus Lost TestFocus')
          })

        Button('show menu')
          .id('setautofocustransfer_focusview_0490_show_menu')
          .width('80%')
          .height(50)
          .margin({ top: 10 })
          .bindMenu(this.MenuBuilder)
      }
      .width('100%')
      .height('80%')
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height('100%')
  }
}

