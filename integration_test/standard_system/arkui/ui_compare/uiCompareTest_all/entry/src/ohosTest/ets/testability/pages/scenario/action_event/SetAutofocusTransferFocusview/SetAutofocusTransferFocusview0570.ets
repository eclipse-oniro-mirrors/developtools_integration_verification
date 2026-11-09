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
struct PageOne0570 {
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
          .id('setautofocustransfer_focusview_0570_pageone_log')
          .fontSize(14)
          .fontColor(Color.Blue)
          .margin({ bottom: 10 })

        Button('defaultFocus Button PageOne')
          .id('setautofocustransfer_focusview_0570_pageone_default_focus')
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

        Button('pop')
          .id('setautofocustransfer_focusview_0570_pop')
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
    }
    .title('PageOne')
  }
}

@Entry
@Component
struct SetAutofocusTransferFocusview0570 {
  @Provide('navPathStack') navPathStack: NavPathStack = new NavPathStack()
  @State focusLog: string = ''
  @State showPopup: boolean = false
  @State showSheet: boolean = false

  @Builder
  PageMap(name: string) {
    if (name === 'PageOne') {
      PageOne0570()
    }
  }

  @Builder
  popupBuilder() {
    Column() {
      Text('Popup弹窗')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Button('关闭Popup')
        .id('setautofocustransfer_focusview_0570_close_popup')
        .width(120)
        .height(40)
        .onClick(() => {
          this.showPopup = false
        })
    }
    .padding(15)
    .backgroundColor(Color.White)
    .borderRadius(10)
  }

  @Builder
  sheetBuilder() {
    Column() {
      Text('ActionSheet')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 15 })

      Button('Confirm')
        .id('setautofocustransfer_focusview_0570_confirm')
        .width(150)
        .height(50)
        .onClick(() => {
          this.showSheet = false
        })
    }
    .width('100%')
    .padding(20)
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0570')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 })

      Button('异常值场景测试')
        .id('setautofocustransfer_focusview_0570_test')
        .width('90%')
        .height(20)

      Navigation(this.navPathStack) {
        Column() {
          Text(this.focusLog)
            .id('setautofocustransfer_focusview_0570_log')
            .fontSize(14)
            .fontColor(Color.Blue)
            .margin({ bottom: 10 })

          Button('defaultFocus Button')
            .id('setautofocustransfer_focusview_0570_default_focus')
            .width('80%')
            .height(50)
            .defaultFocus(true)
            .onFocus(() => {
              this.focusLog = 'Main_DefaultFocus Gain TestFocus'
              console.log('Main_DefaultFocus Gain TestFocus')
            })
            .onBlur(() => {
              this.focusLog = 'Main_DefaultFocus Lost TestFocus'
              console.log('Main_DefaultFocus Lost TestFocus')
            })

          Button('pushPageOne')
            .id('setautofocustransfer_focusview_0570_push')
            .width('80%')
            .height(40)
            .margin({ top: 10 })
            .onClick(() => {
              this.navPathStack.pushPathByName('PageOne', null)
            })

          Button('show Popup')
            .id('setautofocustransfer_focusview_0570_show_popup')
            .width('80%')
            .height(40)
            .margin({ top: 10 })
            .onClick(() => {
              this.showPopup = !this.showPopup
            })
            .bindPopup(this.showPopup, {
              builder: this.popupBuilder,
              placement: Placement.Bottom,
              popupColor: Color.White,
              enableArrow: true,
              autoCancel: true,
              onStateChange: (e) => {
                if (!e.isVisible) {
                  this.showPopup = false
                }
              }
            })

          Button('show Sheet')
            .id('setautofocustransfer_focusview_0570_show_sheet')
            .width('80%')
            .height(40)
            .margin({ top: 10 })
            .onClick(() => {
              this.showSheet = true
            })
            .bindSheet(this.showSheet, this.sheetBuilder(), {
              height: SheetSize.MEDIUM,
              dragBar: true,
              onDisappear: () => {
                this.showSheet = false
              }
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

