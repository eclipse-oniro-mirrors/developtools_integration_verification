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
struct PageOne {
  @State focusLog: string = ''

  build() {
    NavDestination() {
      Column() {
        Text('PageOne')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 15 })

        Text(this.focusLog)
          .id('commonattr_tabfocus_0100_pageone_log')
          .fontSize(12)
          .fontColor(Color.Blue)
          .margin({ bottom: 10 })

        Button('btn1')
          .id('commonattr_tabfocus_0100_pageone_btn1')
          .width('80%')
          .height(40)
          .margin({ bottom: 10 })
          .onFocus(() => {
            this.focusLog = 'PageOne btn1 获得焦点'
          })

        Button('btn2')
          .id('commonattr_tabfocus_0100_pageone_btn2')
          .width('80%')
          .height(40)
          .margin({ bottom: 10 })
          .onFocus(() => {
            this.focusLog = 'PageOne btn2 获得焦点'
          })

        Button('btn3')
          .id('commonattr_tabfocus_0100_pageone_btn3')
          .width('80%')
          .height(40)
          .onFocus(() => {
            this.focusLog = 'PageOne btn3 获得焦点'
          })
      }
      .width('100%')
      .height('100%')
      .padding(20)
    }
    .title('PageOne')
  }
}

@Entry
@Component
struct CommonAttrTabfocus0100 {
  @State focusLog: string = ''
  @State navMode: NavigationMode = NavigationMode.Split
  @Provide('navPathStack') navPathStack: NavPathStack = new NavPathStack()

  @Builder
  pageMap(name: string) {
    if (name === 'pageOne') {
      PageOne()
    }
  }

  build() {
    Navigation(this.navPathStack) {
      Column() {
        Text('SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0100')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Text('跨页面走焦，navigation双栏变单栏')
          .fontSize(12)
          .margin({ bottom: 5 })

        Text(this.focusLog)
          .id('commonattr_tabfocus_0100_log')
          .fontSize(12)
          .fontColor(Color.Blue)
          .margin({ bottom: 10 })

        Button('push pageOne')
          .id('commonattr_tabfocus_0100_push_pageone')
          .width('80%')
          .height(40)
          .margin({ bottom: 10 })
          .onFocus(() => {
            this.focusLog = 'push pageOne 获得焦点'
          })
          .onClick(() => {
            this.navPathStack.pushPath({ name: 'pageOne' })
          })

        Button('stack模式')
          .id('commonattr_tabfocus_0100_stack_mode')
          .width('80%')
          .height(40)
          .margin({ bottom: 10 })
          .onFocus(() => {
            this.focusLog = 'stack模式 获得焦点'
          })
          .onClick(() => {
            this.navMode = NavigationMode.Stack
          })

        Button('split模式')
          .id('commonattr_tabfocus_0100_split_mode')
          .width('80%')
          .height(40)
          .margin({ bottom: 10 })
          .onFocus(() => {
            this.focusLog = 'split模式 获得焦点'
          })
          .onClick(() => {
            this.navMode = NavigationMode.Split
          })
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Start)
      .padding({ top: 20 })
    }
    .navDestination(this.pageMap)
    .title('Navigation焦点测试')
    .mode(this.navMode)
    .width('100%')
    .height('100%')
  }
}

