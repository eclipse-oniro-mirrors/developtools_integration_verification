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
struct PageOne0060 {
  @Consume('navPathStack') navPathStack: NavPathStack

  build() {
    NavDestination() {
      Column() {
        Text('PageOne')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 })

        Button('pushPageTwo')
          .id('setautofocustransfer_focusview_0060_push_two')
          .width('80%')
          .height(50)
          .onClick(() => {
            this.navPathStack.pushPathByName('PageTwo', null)
          })

        Button('clear')
          .id('setautofocustransfer_focusview_0060_clear_one')
          .width('80%')
          .height(50)
          .margin({ top: 10 })
          .focusable(true)
          .onClick(() => {
            this.navPathStack.clear()
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

@Component
struct PageTwo0060 {
  @Consume('navPathStack') navPathStack: NavPathStack

  build() {
    NavDestination() {
      Column() {
        Text('PageTwo')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 })

        Button('pushPageOne')
          .id('setautofocustransfer_focusview_0060_push_one_from_two')
          .width('80%')
          .height(50)
          .onClick(() => {
            this.navPathStack.pushPathByName('PageOne', null)
          })

        Button('clear')
          .id('setautofocustransfer_focusview_0060_clear_two')
          .width('80%')
          .height(50)
          .margin({ top: 10 })
          .focusable(true)
          .onClick(() => {
            this.navPathStack.clear()
          })
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .focusable(false)
    }
    .title('PageTwo')
  }
}

@Builder
export function pageOneBuilder0060() {
  PageOne0060()
}

@Builder
export function pageTwoBuilder0060() {
  PageTwo0060()
}

@Entry
@Component
struct SetAutofocusTransferFocusview0060 {
  @Provide('navPathStack') navPathStack: NavPathStack = new NavPathStack()
  @State inputText: string = ''
  @State focusLog: string = ''

  @Builder
  navDestinationBuilder(name: string) {
    if (name === 'PageOne') {
      pageOneBuilder0060()
    } else if (name === 'PageTwo') {
      pageTwoBuilder0060()
    }
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0060')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 })

      Button('Navigation(navbar, navdestination)场景测试')
        .id('setautofocustransfer_focusview_0060_nav_test')
        .width('90%')
        .height(20)

      Navigation(this.navPathStack) {
        Column() {
          TextInput({ placeholder: '请输入内容', text: this.inputText })
            .id('setautofocustransfer_focusview_0060_textinput')
            .width('90%')
            .height(50)
            .defaultFocus(false)
            .onChange((value: string) => {
              this.inputText = value
            })
            .onFocus(() => {
              this.focusLog = 'Navigation_TextInput Gain TestFocus'
              console.log('Navigation_TextInput Gain TestFocus')
            })
            .onBlur(() => {
              this.focusLog = 'Navigation_TextInput Lost TestFocus'
              console.log('Navigation_TextInput Lost TestFocus')
            })

          Text(this.focusLog)
            .id('setautofocustransfer_focusview_0060_log')
            .fontSize(14)
            .fontColor(Color.Blue)
            .margin({ bottom: 5 })

          Button('pushPageOne')
            .id('setautofocustransfer_focusview_0060_push_one')
            .width('80%')
            .height(50)
            .onClick(() => {
              this.navPathStack.pushPathByName('PageOne', null)
            })

          Button('pushPageTwo')
            .id('setautofocustransfer_focusview_0060_push_two')
            .width('80%')
            .height(50)
            .margin({ top: 10 })
            .onClick(() => {
              this.navPathStack.pushPathByName('PageTwo', null)
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

