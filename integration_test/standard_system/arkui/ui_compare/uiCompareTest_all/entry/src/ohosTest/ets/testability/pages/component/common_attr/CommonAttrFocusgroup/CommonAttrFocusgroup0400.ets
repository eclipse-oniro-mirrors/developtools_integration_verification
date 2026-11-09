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
struct PageOneTmpFocusgroup0400 {
  @Consume('navPathStack') navPathStack: NavPathStack
  @State focusLog: string = ''

  build() {
    NavDestination() {
      Column() {
        Text('PageOneTmp页面')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Text(this.focusLog)
          .id('commonattr_focusgroup_0400_pageonetmp_log')
          .fontSize(12)
          .fontColor(Color.Blue)
          .margin({ bottom: 10 })

        // 焦点组
        Column() {
          Text('焦点组')
            .fontSize(12)
            .margin({ bottom: 5 })

          Button('btn1')
            .id('commonattr_focusgroup_0400_pageonetmp_btn1')
            .width('80%')
            .height(40)
            .margin({ bottom: 5 })
            .onFocus(() => {
              this.focusLog = 'PageOneTmp btn1 获得焦点'
            })

          Button('btn2')
            .id('commonattr_focusgroup_0400_pageonetmp_btn2')
            .width('80%')
            .height(40)
            .margin({ bottom: 5 })
            .onFocus(() => {
              this.focusLog = 'PageOneTmp btn2 获得焦点'
            })
        }
        .width('90%')
        .padding(10)
        .backgroundColor('#F5F5F5')
        .borderRadius(8)
        .margin({ bottom: 10 })
        .focusScopeId('pageOneTmpFocusGroup', true)

        // 非焦点组按钮
        Button('btn3')
          .id('commonattr_focusgroup_0400_pageonetmp_btn3')
          .width('80%')
          .height(40)
          .margin({ bottom: 10 })
          .onFocus(() => {
            this.focusLog = 'PageOneTmp btn3 获得焦点'
          })
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Start)
      .padding({ top: 20 })
    }
    .title('PageOneTmp')
  }
}

@Component
struct PageOneFocusgroup0400 {
  @Consume('navPathStack') navPathStack: NavPathStack
  @State focusLog: string = ''

  build() {
    NavDestination() {
      Column() {
        Text('PageOne页面')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Text(this.focusLog)
          .id('commonattr_focusgroup_0400_pageone_log')
          .fontSize(12)
          .fontColor(Color.Blue)
          .margin({ bottom: 10 })

        // 焦点组1
        Column() {
          Text('焦点组1')
            .fontSize(12)
            .margin({ bottom: 5 })

          Button('btn1')
            .id('commonattr_focusgroup_0400_pageone_btn1')
            .width('80%')
            .height(40)
            .margin({ bottom: 5 })
            .onFocus(() => {
              this.focusLog = 'PageOne 焦点组1 btn1 获得焦点'
            })

          Button('btn2')
            .id('commonattr_focusgroup_0400_pageone_btn2')
            .width('80%')
            .height(40)
            .margin({ bottom: 5 })
            .onFocus(() => {
              this.focusLog = 'PageOne 焦点组1 btn2 获得焦点'
            })

          Button('btn3')
            .id('commonattr_focusgroup_0400_pageone_btn3')
            .width('80%')
            .height(40)
            .onFocus(() => {
              this.focusLog = 'PageOne 焦点组1 btn3 获得焦点'
            })
        }
        .width('90%')
        .padding(10)
        .backgroundColor('#F5F5F5')
        .borderRadius(8)
        .margin({ bottom: 10 })
        .focusScopeId('pageOneFocusGroup1', true)

        Button('pushPageOneTmp')
          .id('commonattr_focusgroup_0400_push_pageonetmp')
          .width('80%')
          .height(40)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.navPathStack.pushPathByName('PageOneTmp', null)
          })
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Start)
      .padding({ top: 20 })
    }
    .title('PageOne')
  }
}

@Entry
@Component
struct CommonAttrFocusgroup0400 {
  @Provide('navPathStack') navPathStack: NavPathStack = new NavPathStack()
  @State focusLog: string = ''
  @State navMode: NavigationMode = NavigationMode.Stack

  @Builder
  PageMap(name: string) {
    if (name === 'PageOne') {
      PageOneFocusgroup0400()
    } else if (name === 'PageOneTmp') {
      PageOneTmpFocusgroup0400()
    }
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_0400')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text(this.focusLog)
        .id('commonattr_focusgroup_0400_log')
        .fontSize(12)
        .fontColor(Color.Blue)
        .margin({ bottom: 10 })

      Row() {
        Button('单栏')
          .id('commonattr_focusgroup_0400_single')
          .width('45%')
          .height(40)
          .onClick(() => {
            this.navMode = NavigationMode.Stack
            this.focusLog = '切换为单栏模式'
          })

        Button('双栏')
          .id('commonattr_focusgroup_0400_double')
          .width('45%')
          .height(40)
          .onClick(() => {
            this.navMode = NavigationMode.Split
            this.focusLog = '切换为双栏模式'
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceAround)
      .margin({ bottom: 10 })

      Navigation(this.navPathStack) {
        Column() {
          Text('Navbar区域')
            .fontSize(14)
            .margin({ bottom: 10 })

          Button('pushPageOne')
            .id('commonattr_focusgroup_0400_push_pageone')
            .width('80%')
            .height(40)
            .margin({ bottom: 10 })
            .onFocus(() => {
              this.focusLog = 'pushPageOne按钮获得焦点'
            })
            .onClick(() => {
              this.navPathStack.pushPathByName('PageOne', null)
            })
        }
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Start)
        .padding({ top: 20 })
      }
      .navDestination(this.PageMap)
      .mode(this.navMode)
      .width('100%')
      .height('80%')
    }
    .width('100%')
    .height('100%')
    .padding({ top: 10 })
  }
}

