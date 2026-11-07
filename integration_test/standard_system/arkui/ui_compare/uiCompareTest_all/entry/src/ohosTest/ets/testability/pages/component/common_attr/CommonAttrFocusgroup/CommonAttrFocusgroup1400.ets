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

import { LengthMetrics, ColorMetrics } from '@kit.ArkUI'

@Component
struct PageOne1400 {
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
          .id('commonattr_focusgroup_1400_pageone_log')
          .fontSize(12)
          .fontColor(Color.Blue)
          .margin({ bottom: 10 })

        // 焦点组1（设置focusBox红色焦点框）
        Column() {
          Text('焦点组1')
            .fontSize(12)
            .margin({ bottom: 5 })

          Button('btn1')
            .id('commonattr_focusgroup_1400_pageone_btn1')
            .width('80%')
            .height(40)
            .margin({ bottom: 5 })
            .focusBox({
              strokeWidth: LengthMetrics.vp(2),
              strokeColor: ColorMetrics.rgba(255, 0, 0, 255)
            })
            .onFocus(() => {
              this.focusLog = '焦点组1 btn1 获得焦点（红色焦点框）'
            })

          Button('btn2')
            .id('commonattr_focusgroup_1400_pageone_btn2')
            .width('80%')
            .height(40)
            .focusBox({
              strokeWidth: LengthMetrics.vp(2),
              strokeColor: ColorMetrics.rgba(255, 0, 0, 255)
            })
            .onFocus(() => {
              this.focusLog = '焦点组1 btn2 获得焦点（红色焦点框）'
            })
        }
        .width('90%')
        .padding(10)
        .backgroundColor('#F5F5F5')
        .borderRadius(8)
        .margin({ bottom: 10 })
        .focusScopeId('pageOneFocusGroup1', true)

        // 焦点组2（设置focusBox红色焦点框）
        Column() {
          Text('焦点组2')
            .fontSize(12)
            .margin({ bottom: 5 })

          Button('btn3')
            .id('commonattr_focusgroup_1400_pageone_btn3')
            .width('80%')
            .height(40)
            .margin({ bottom: 5 })
            .focusBox({
              strokeWidth: LengthMetrics.vp(2),
              strokeColor: ColorMetrics.rgba(255, 0, 0, 255)
            })
            .onFocus(() => {
              this.focusLog = '焦点组2 btn3 获得焦点（红色焦点框）'
            })

          Button('btn4')
            .id('commonattr_focusgroup_1400_pageone_btn4')
            .width('80%')
            .height(40)
            .focusBox({
              strokeWidth: LengthMetrics.vp(2),
              strokeColor: ColorMetrics.rgba(255, 0, 0, 255)
            })
            .onFocus(() => {
              this.focusLog = '焦点组2 btn4 获得焦点（红色焦点框）'
            })
        }
        .width('90%')
        .padding(10)
        .backgroundColor('#E0E0E0')
        .borderRadius(8)
        .margin({ bottom: 10 })
        .focusScopeId('pageOneFocusGroup2', true)
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
struct CommonAttrFocusgroup1400 {
  @Provide('navPathStack') navPathStack: NavPathStack = new NavPathStack()
  @State focusLog: string = ''

  @Builder
  PageMap(name: string) {
    if (name === 'PageOne') {
      PageOne1400()
    }
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_1400')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text(this.focusLog)
        .id('commonattr_focusgroup_1400_log')
        .fontSize(12)
        .fontColor(Color.Blue)
        .margin({ bottom: 10 })

      Navigation(this.navPathStack) {
        Column() {
          Text('主页面')
            .fontSize(14)
            .margin({ bottom: 10 })

          Button('pushPageOne')
            .id('commonattr_focusgroup_1400_push_pageone')
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
      .mode(NavigationMode.Stack)
      .width('100%')
      .height('90%')
    }
    .width('100%')
    .height('100%')
    .padding({ top: 10 })
  }
}

