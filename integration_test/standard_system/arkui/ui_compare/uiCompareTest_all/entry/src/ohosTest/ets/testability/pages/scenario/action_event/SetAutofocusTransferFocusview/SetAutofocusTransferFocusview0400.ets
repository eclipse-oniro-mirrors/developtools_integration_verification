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
struct PageOne0400 {
  @Consume('navPathStack') navPathStack: NavPathStack
  @State focusLog: string = ''

  build() {
    NavDestination() {
      Column() {
        Text('PageOne')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Text(this.focusLog)
          .id('setautofocustransfer_focusview_0400_pageone_log')
          .fontSize(14)
          .fontColor(Color.Blue)
          .margin({ bottom: 10 })

        Button('defaultFocus Button')
          .id('setautofocustransfer_focusview_0400_pageone_default_focus')
          .width('80%')
          .height(50)
          .defaultFocus(true)
          .onFocus(() => {
            this.focusLog = 'PageOne_DefaultFocus Gain TestFocus'
            console.log('PageOne_DefaultFocus Gain TestFocus')
          })
          .onBlur(() => {
            this.focusLog = 'PageOne_DefaultFocus Lost TestFocus'
            console.log('PageOne_DefaultFocus Lost TestFocus')
          })

        Button('返回')
          .id('setautofocustransfer_focusview_0400_back')
          .width('80%')
          .height(50)
          .margin({ top: 10 })
          .onClick(() => {
            this.navPathStack.pop()
          })
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .focusable(false)
    }
    .title('PageOne')
  }
}

@Entry
@Component
struct SetAutofocusTransferFocusview0400 {
  @Provide('navPathStack') navPathStack: NavPathStack = new NavPathStack()
  @State focusLog: string = ''

  @Builder
  PageMap(name: string) {
    if (name === 'PageOne') {
      PageOne0400()
    }
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0400')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 })

      Button('defaultFocus场景测试')
        .id('setautofocustransfer_focusview_0400_focus_test')
        .width('90%')
        .height(20)

      Navigation(this.navPathStack) {
        Column() {
          Text(this.focusLog)
            .id('setautofocustransfer_focusview_0400_log')
            .fontSize(14)
            .fontColor(Color.Blue)
            .margin({ bottom: 10 })

          Button('defaultFocus Button')
            .id('setautofocustransfer_focusview_0400_default_focus')
            .width('80%')
            .height(50)
            .defaultFocus(true)
            .onFocus(() => {
              this.focusLog = 'DefaultFocus_Button Gain TestFocus'
              console.log('DefaultFocus_Button Gain TestFocus')
            })
            .onBlur(() => {
              this.focusLog = 'DefaultFocus_Button Lost TestFocus'
              console.log('DefaultFocus_Button Lost TestFocus')
            })

          Button('跳转')
            .id('setautofocustransfer_focusview_0400_jump')
            .width('80%')
            .height(50)
            .margin({ top: 10 })
            .onClick(() => {
              this.navPathStack.pushPathByName('PageOne', null)
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

