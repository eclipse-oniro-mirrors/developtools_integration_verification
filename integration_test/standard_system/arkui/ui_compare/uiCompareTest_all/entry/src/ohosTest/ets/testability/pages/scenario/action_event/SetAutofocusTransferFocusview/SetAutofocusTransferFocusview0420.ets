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
struct PageTwo0420 {
  @Consume('navPathStack') navPathStack: NavPathStack
  @State showDialog: boolean = true

  @Builder
  dialogBuilder() {
    Column() {
      Text('Dialog2弹窗内容')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 15 })

      Button('点击弹窗内容')
        .id('setautofocustransfer_focusview_0420_dialog_content')
        .width(150)
        .height(50)
        .onClick(() => {
          this.showDialog = false
          this.navPathStack.pop()
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
    .borderRadius(10)
    .padding(20)
    .justifyContent(FlexAlign.Center)
    .focusable(false)
  }

  build() {
    NavDestination() {
      Column() {
        Text('PageTwo')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Text('Dialog2弹窗已显示')
          .fontSize(16)
          .margin({ bottom: 20 })
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .focusable(false)
      .bindPopup(this.showDialog, {
        builder: this.dialogBuilder,
        placement: Placement.Bottom,
        popupColor: Color.Transparent,
        enableArrow: false,
        autoCancel: false,
        onStateChange: (e) => {
          if (!e.isVisible) {
            this.showDialog = false
          }
        }
      })
    }
    .title('PageTwo')
  }
}

@Entry
@Component
struct SetAutofocusTransferFocusview0420 {
  @Provide('navPathStack') navPathStack: NavPathStack = new NavPathStack()
  @State focusLog: string = ''

  @Builder
  PageMap(name: string) {
    if (name === 'PageTwo') {
      PageTwo0420()
    }
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0420')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 })

      Button('defaultFocus场景测试')
        .id('setautofocustransfer_focusview_0420_focus_test')
        .width('90%')
        .height(40)

      Text(this.focusLog)
        .id('setautofocustransfer_focusview_0420_log')
        .fontSize(14)
        .fontColor(Color.Blue)
        .margin({ top: 10, bottom: 10 })

      Navigation(this.navPathStack) {
        Column() {
          Button('defaultFocus Button')
            .id('setautofocustransfer_focusview_0420_default_focus')
            .width('80%')
            .height(50)
            .margin({ bottom: 20 })
            .defaultFocus(true)
            .onFocus(() => {
              this.focusLog = 'DefaultFocus_Button Gain TestFocus'
              console.log('DefaultFocus_Button Gain TestFocus')
            })
            .onBlur(() => {
              this.focusLog = 'DefaultFocus_Button Lost TestFocus'
              console.log('DefaultFocus_Button Lost TestFocus')
            })

          Button('Dialog2')
            .id('setautofocustransfer_focusview_0420_dialog2')
            .width('80%')
            .height(50)
            .onClick(() => {
              this.navPathStack.pushPathByName('PageTwo', null)
            })
        }
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center)
      }
      .navDestination(this.PageMap)
      .mode(NavigationMode.Stack)
      .width('100%')
      .height('80%')
    }
    .width('100%')
    .height('100%')
  }
}

