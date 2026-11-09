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
struct PageOne0440 {
  @Consume('navPathStack') navPathStack: NavPathStack
  @State focusLog: string = ''
  @State showDialog: boolean = false

  @Builder
  dialogBuilder() {
    Column() {
      Text('Dialog弹窗')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 15 })

      Text('点击空白处关闭弹窗')
        .fontSize(14)
        .fontColor(Color.Gray)
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
        Text('PageOne')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Text(this.focusLog)
          .id('setautofocustransfer_focusview_0440_pageone_log')
          .fontSize(14)
          .fontColor(Color.Blue)
          .margin({ bottom: 10 })

        Button('defaultFocus Button PageOne')
          .id('setautofocustransfer_focusview_0440_pageone_default_focus')
          .width('80%')
          .height(50)
          .margin({ bottom: 15 })
          .defaultFocus(true)
          .onFocus(() => {
            this.focusLog = 'PageOne_DefaultFocus Gain TestFocus'
            console.log('PageOne_DefaultFocus Gain TestFocus')
          })
          .onBlur(() => {
            this.focusLog = 'PageOne_DefaultFocus Lost TestFocus'
            console.log('PageOne_DefaultFocus Lost TestFocus')
          })

        Button('dialog')
          .id('setautofocustransfer_focusview_0440_dialog')
          .width('80%')
          .height(50)
          .onClick(() => {
            this.showDialog = true
          })
          .bindPopup(this.showDialog, {
            builder: this.dialogBuilder,
            placement: Placement.Top,
            popupColor: Color.Transparent,
            enableArrow: false,
            autoCancel: true,
            onStateChange: (e) => {
              if (!e.isVisible) {
                this.showDialog = false
              }
            }
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
struct SetAutofocusTransferFocusview0440 {
  @Provide('navPathStack') navPathStack: NavPathStack = new NavPathStack()
  @State focusLog: string = ''

  @Builder
  PageMap(name: string) {
    if (name === 'PageOne') {
      PageOne0440()
    }
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0440')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 })

      Button('defaultFocus场景测试')
        .id('setautofocustransfer_focusview_0440_focus_test')
        .width('90%')
        .height(40)

      Text(this.focusLog)
        .id('setautofocustransfer_focusview_0440_log')
        .fontSize(14)
        .fontColor(Color.Blue)
        .margin({ top: 10, bottom: 10 })

      Navigation(this.navPathStack) {
        Column() {
          Button('defaultFocus Button')
            .id('setautofocustransfer_focusview_0440_default_focus')
            .width('80%')
            .height(50)
            .margin({ bottom: 20 })
            .defaultFocus(true)
            .onFocus(() => {
              this.focusLog = 'Main_DefaultFocus Gain TestFocus'
              console.log('Main_DefaultFocus Gain TestFocus')
            })
            .onBlur(() => {
              this.focusLog = 'Main_DefaultFocus Lost TestFocus'
              console.log('Main_DefaultFocus Lost TestFocus')
            })

          Button('跳转')
            .id('setautofocustransfer_focusview_0440_jump')
            .width('80%')
            .height(50)
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
      .height('80%')
    }
    .width('100%')
    .height('100%')
  }
}

