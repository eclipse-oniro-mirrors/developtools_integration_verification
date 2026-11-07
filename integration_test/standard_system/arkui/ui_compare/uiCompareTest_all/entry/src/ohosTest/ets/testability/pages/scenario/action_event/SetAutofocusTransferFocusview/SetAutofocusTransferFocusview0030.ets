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
struct PageOne0030 {
  @Consume('navPathStack') navPathStack: NavPathStack

  build() {
    NavDestination() {
      Column() {
        Text('PageOne')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 })

        Button('pushPageTwo')
          .id('setautofocustransfer_focusview_0030_push_two')
          .width('80%')
          .height(50)
          .onClick(() => {
            this.navPathStack.pushPathByName('PageTwo', null)
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
struct PageTwo0030 {
  @Consume('navPathStack') navPathStack: NavPathStack

  build() {
    NavDestination() {
      Column() {
        Text('PageTwo')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 })

        Button('pop')
          .id('setautofocustransfer_focusview_0030_pop')
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
    .title('PageTwo')
  }
}

@Builder
export function pageOneBuilder0030() {
  PageOne0030()
}

@Builder
export function pageTwoBuilder0030() {
  PageTwo0030()
}

@Entry
@Component
struct SetAutofocusTransferFocusview0030 {
  @Provide('navPathStack') navPathStack: NavPathStack = new NavPathStack()
  @State focusLog: string = ''

  @Builder
  navDestinationBuilder(name: string) {
    if (name === 'PageOne') {
      pageOneBuilder0030()
    } else if (name === 'PageTwo') {
      pageTwoBuilder0030()
    }
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0030')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 })

      Button('Navigation(navbar, navdestination)场景测试')
        .id('setautofocustransfer_focusview_0030_nav_test')
        .width('90%')
        .height(20)

      Navigation(this.navPathStack) {
        Column() {
          Button('粉色Button')
            .id('setautofocustransfer_focusview_0030_pink_button')
            .width('90%')
            .height(50)
            .backgroundColor(Color.Pink)
            .defaultFocus(false)
            .focusable(true)
            .onFocus(() => {
              this.focusLog = 'Navigation_Button Gain TestFocus'
              console.log('Navigation_Button Gain TestFocus')
            })
            .onBlur(() => {
              this.focusLog = 'Navigation_Button Lost TestFocus'
              console.log('Navigation_Button Lost TestFocus')
            })

          Text(this.focusLog)
            .id('setautofocustransfer_focusview_0030_log')
            .fontSize(14)
            .fontColor(Color.Blue)
            .margin({ bottom: 5 })

          Button('pushPageOne')
            .id('setautofocustransfer_focusview_0030_push_one')
            .width('80%')
            .height(50)
            .onClick(() => {
              this.navPathStack.pushPathByName('PageOne', null)
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

