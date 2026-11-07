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

@Component
struct PageThree0140 {
  @Consume('navPathStack') navPathStack: NavPathStack
  @State inputText: string = ''
  @State focusLog: string = ''

  build() {
    NavDestination() {
      Column() {
        Text('PageThree')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 })

        TextInput({ placeholder: '请输入内容', text: this.inputText })
          .id('setautofocustransfer_focusview_0140_pagethree_textinput')
          .width('90%')
          .height(50)
          .defaultFocus(false)
          .onChange((value: string) => {
            this.inputText = value
          })
          .onFocus(() => {
            this.focusLog = 'pageThree_TextInput Gain TestFocus'
            console.log('pageThree_TextInput Gain TestFocus')
          })
          .onBlur(() => {
            this.focusLog = 'pageThree_TextInput Out of TestFocus'
            console.log('pageThree_TextInput Out of TestFocus')
          })

        Text(this.focusLog)
          .id('setautofocustransfer_focusview_0140_pagethree_log')
          .fontSize(14)
          .fontColor(Color.Blue)
          .margin({ bottom: 5 })

        Button('pop')
          .id('setautofocustransfer_focusview_0140_pop')
          .width('80%')
          .height(50)
          .focusable(true)
          .onClick(() => {
            this.navPathStack.pop()
          })
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .focusable(false)
    }
    .title('PageThree')
  }
}

@Builder
export function pageThreeBuilder0140() {
  PageThree0140()
}

@Entry
@Component
struct SetAutofocusTransferFocusview0140 {
  @Provide('navPathStack') navPathStack: NavPathStack = new NavPathStack()

  @Builder
  navDestinationBuilder(name: string) {
    if (name === 'PageThree') {
      pageThreeBuilder0140()
    }
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0140')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 })

      Button('Navigation(navbar, navdestination)场景测试')
        .id('setautofocustransfer_focusview_0140_nav_test')
        .width('90%')
        .height(20)

      Navigation(this.navPathStack) {
        Column() {
          Text('主页面')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 10 })

          Button('replacePathPageThree')
            .id('setautofocustransfer_focusview_0140_replace_three')
            .width('80%')
            .height(50)
            .onClick(() => {
              this.navPathStack.replacePath({ name: 'PageThree' })
            })
        }
        .width('100%')
        .height('80%')
        .justifyContent(FlexAlign.Center)
      }
      .navDestination(this.navDestinationBuilder)
      .mode(NavigationMode.Stack)
      .width('100%')
      .height('70%')
    }
    .width('100%')
    .height('100%')
  }
}

