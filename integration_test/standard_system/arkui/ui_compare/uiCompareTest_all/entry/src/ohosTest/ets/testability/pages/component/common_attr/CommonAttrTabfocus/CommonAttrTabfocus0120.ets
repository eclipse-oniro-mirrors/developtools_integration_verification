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

@Entry
@Component
struct CommonAttrTabfocus0120 {
  @State focusLog: string = ''

  build() {
    Navigation() {
      Column() {
        Text('SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0120')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Text('方向键非首次在焦点组和非焦点组之间走焦')
          .fontSize(12)
          .margin({ bottom: 5 })

        Text(this.focusLog)
          .id('commonattr_tabfocus_0120_log')
          .fontSize(12)
          .fontColor(Color.Blue)
          .margin({ bottom: 10 })

        // 焦点组5（非焦点组）
        Column() {
          Text('焦点组5')
            .fontSize(12)
            .margin({ bottom: 5 })

          Button('单栏')
            .id('commonattr_tabfocus_0120_group5_single')
            .width('80%')
            .height(35)
            .margin({ bottom: 5 })
            .onFocus(() => {
              this.focusLog = '焦点组5 单栏 获得焦点'
            })

          Button('双栏')
            .id('commonattr_tabfocus_0120_group5_double')
            .width('80%')
            .height(35)
            .margin({ bottom: 5 })
            .onFocus(() => {
              this.focusLog = '焦点组5 双栏 获得焦点'
            })

          Button('pushpageOne')
            .id('commonattr_tabfocus_0120_group5_push')
            .width('80%')
            .height(35)
            .onFocus(() => {
              this.focusLog = '焦点组5 pushpageOne 获得焦点'
            })
        }
        .width('90%')
        .padding(8)
        .backgroundColor('#E0E0E0')
        .borderRadius(8)
        .margin({ bottom: 8 })
        .focusScopeId('focusGroup5', false)

        // 焦点组6
        Column() {
          Text('焦点组6')
            .fontSize(12)
            .margin({ bottom: 5 })

          Button('btn1')
            .id('commonattr_tabfocus_0120_group6_btn1')
            .width('80%')
            .height(35)
            .margin({ bottom: 5 })
            .onFocus(() => {
              this.focusLog = '焦点组6 btn1 获得焦点'
            })

          Button('btn2')
            .id('commonattr_tabfocus_0120_group6_btn2')
            .width('80%')
            .height(35)
            .margin({ bottom: 5 })
            .onFocus(() => {
              this.focusLog = '焦点组6 btn2 获得焦点'
            })

          Button('defaultFocus:true')
            .id('commonattr_tabfocus_0120_group6_default')
            .width('80%')
            .height(35)
            .defaultFocus(true)
            .onFocus(() => {
              this.focusLog = '焦点组6 defaultFocus:true 获得焦点'
            })
        }
        .width('90%')
        .padding(8)
        .backgroundColor('#F5F5F5')
        .borderRadius(8)
        .margin({ bottom: 8 })
        .focusScopeId('focusGroup6', true)
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Start)
      .padding({ top: 20 })
    }
    .title('方向键非首次走焦测试')
    .mode(NavigationMode.Stack)
    .width('100%')
    .height('100%')
  }
}

