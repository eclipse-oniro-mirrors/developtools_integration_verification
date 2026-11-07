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
struct PageThree0380 {
  @Consume('navPathStack') navPathStack: NavPathStack
  @State focusLog: string = ''

  build() {
    NavDestination() {
      Column() {
        Text('PageThree')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Text(this.focusLog)
          .id('setautofocustransfer_focusview_0380_pagethree_log')
          .fontSize(14)
          .fontColor(Color.Blue)
          .margin({ bottom: 10 })

        Button('clear')
          .id('setautofocustransfer_focusview_0380_clear')
          .width('80%')
          .height(50)
          .onClick(() => {
            this.navPathStack.clear()
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

@Entry
@Component
struct SetAutofocusTransferFocusview0380 {
  @Provide('navPathStack') navPathStack: NavPathStack = new NavPathStack()
  @State focusLog: string = ''

  @Builder
  PageMap(name: string) {
    if (name === 'PageThree') {
      PageThree0380()
    }
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0380')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 })

      Button('Navigation场景测试')
        .id('setautofocustransfer_focusview_0380_nav_test')
        .width('90%')
        .height(20)

      Navigation(this.navPathStack) {
        Column() {
          Text(this.focusLog)
            .id('setautofocustransfer_focusview_0380_log')
            .fontSize(14)
            .fontColor(Color.Blue)
            .margin({ bottom: 10 })

          Button('defaultFocus Button')
            .id('setautofocustransfer_focusview_0380_default_focus')
            .width('80%')
            .height(50)
            .defaultFocus(true)
            .onFocus(() => {
              this.focusLog = 'Navigation_DefaultFocus Gain TestFocus'
              console.log('Navigation_DefaultFocus Gain TestFocus')
            })
            .onBlur(() => {
              this.focusLog = 'Navigation_DefaultFocus Lost TestFocus'
              console.log('Navigation_DefaultFocus Lost TestFocus')
            })

          Button('replacePageThree')
            .id('setautofocustransfer_focusview_0380_replace')
            .width('80%')
            .height(50)
            .margin({ top: 10 })
            .onClick(() => {
              this.navPathStack.replacePath({ name: 'PageThree' })
            })
        }
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center)
      }
      .navDestination(this.PageMap)
      .mode(NavigationMode.Stack)
      .width('100%')
      .height('90%')
    }
    .width('100%')
    .height('100%')
  }
}

