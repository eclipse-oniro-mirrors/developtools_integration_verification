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
struct SetAutofocusTransferFocusview0220 {
  @State inputText: string = ''
  @State focusLog: string = ''
  @State showMenu: boolean = false

  @Builder
  menuBuilder() {
    Menu() {
      MenuItem({ content: '选项1' })
        .id('setautofocustransfer_focusview_0220_menu_item1')
        .onClick(() => {
          console.log('选项1被点击')
        })
      MenuItem({ content: '选项2' })
        .id('setautofocustransfer_focusview_0220_menu_item2')
        .onClick(() => {
          console.log('选项2被点击')
        })
      MenuItem({ content: '选项3' })
        .id('setautofocustransfer_focusview_0220_menu_item3')
        .onClick(() => {
          console.log('选项3被点击')
        })
    }
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0220')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 })

      Button('Menu场景测试')
        .id('setautofocustransfer_focusview_0220_menu_test')
        .width('90%')
        .height(20)

      Column() {
        TextInput({ placeholder: '请输入内容', text: this.inputText })
          .id('setautofocustransfer_focusview_0220_textinput')
          .width('90%')
          .height(50)
          .defaultFocus(false)
          .onChange((value: string) => {
            this.inputText = value
          })
          .onFocus(() => {
            this.focusLog = 'Menu_TextInput Gain TestFocus'
            console.log('Menu_TextInput Gain TestFocus')
          })
          .onBlur(() => {
            this.focusLog = 'Menu_TextInput Lost TestFocus'
            console.log('Menu_TextInput Lost TestFocus')
          })

        Text(this.focusLog)
          .id('setautofocustransfer_focusview_0220_log')
          .fontSize(14)
          .fontColor(Color.Blue)
          .margin({ bottom: 5 })

        Button('show menu')
          .id('setautofocustransfer_focusview_0220_show_menu')
          .width('80%')
          .height(50)
          .margin({ top: 10 })
          .bindMenu(this.menuBuilder)
      }
      .width('100%')
      .height('50%')
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height('100%')
  }
}

