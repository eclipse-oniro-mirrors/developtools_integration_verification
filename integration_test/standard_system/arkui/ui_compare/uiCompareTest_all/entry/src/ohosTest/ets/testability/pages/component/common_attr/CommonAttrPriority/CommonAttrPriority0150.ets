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
struct CommonAttrPriority0150 {
  @State focusLog: string = ''
  @State isSheetOpen: boolean = false

  @Builder
  SheetBuilder() {
    Column() {

      // 焦点组
      Column() {

        Button('btn1')
          .id('sheet_priority_0150_btn1')
          .width('90%')
          .height(15)
          .margin({ bottom: 0 })
          .onFocus(() => {
            this.focusLog = 'btn1 获得焦点'
          })

        Button('FocusPriority.PREVIOUS')
          .id('sheet_priority_0150_previous')
          .width('90%')
          .height(15)
          .margin({ bottom: 0 })
          .focusScopePriority('sheetFocusGroup', FocusPriority.PREVIOUS)
          .onFocus(() => {
            this.focusLog = 'FocusPriority.PREVIOUS 获得焦点'
          })

        Button('btn3')
          .id('sheet_priority_0150_btn3')
          .width('90%')
          .height(15)
          .margin({ bottom: 0 })
          .onFocus(() => {
            this.focusLog = 'btn3 获得焦点'
          })

        Button('FocusPriority.PRIOR')
          .id('sheet_priority_0150_prior_group')
          .width('90%')
          .height(15)
          .margin({ bottom: 0 })
          .focusScopePriority('sheetFocusGroup', FocusPriority.PRIOR)
          .onFocus(() => {
            this.focusLog = 'FocusPriority.PRIOR(焦点组) 获得焦点'
          })
      }
      .width('100%')
      .padding(8)
      .backgroundColor('#F5F5F5')
      .borderRadius(8)
      .margin({ bottom: 8 })
      .focusScopeId('sheetFocusGroup', true)

      // 非焦点组
      Column() {

        Button('btn5')
          .id('sheet_priority_0150_btn5')
          .width('90%')
          .height(15)
          .margin({ bottom: 0 })
          .onFocus(() => {
            this.focusLog = 'btn5 获得焦点'
          })

        Button('FocusPriority.PRIOR')
          .id('sheet_priority_0150_prior')
          .width('90%')
          .height(15)
          .margin({ bottom: 0 })
          .focusScopePriority('sheetNonFocusGroup', FocusPriority.PRIOR)
          .onFocus(() => {
            this.focusLog = 'FocusPriority.PRIOR(非焦点组) 获得焦点'
          })

        Button('btn7')
          .id('sheet_priority_0150_btn7')
          .width('90%')
          .height(15)
          .margin({ bottom: 0 })
          .onFocus(() => {
            this.focusLog = 'btn7 获得焦点'
          })
      }
      .width('100%')
      .padding(8)
      .backgroundColor('#E0E0E0')
      .borderRadius(8)
      .margin({ bottom: 8 })
      .focusScopeId('sheetNonFocusGroup', false)

      Button('关闭')
        .id('sheet_priority_0150_close')
        .width('60%')
        .height(35)
        .onClick(() => {
          this.isSheetOpen = false
        })
    }
    .width('100%')
    .padding(15)
  }

  build() {
    Navigation() {
      Column() {
        Button('bindSheet')
          .id('button_priority_0150_sheet')
          .width('80%')
          .height(50)
          .margin({ bottom: 20 })
          .onClick(() => {
            this.isSheetOpen = true
          })
          .bindSheet($$this.isSheetOpen, this.SheetBuilder(), {
            height: SheetSize.MEDIUM,
            dragBar: true,
            showClose: true,
            onDisappear: () => {
              this.isSheetOpen = false
            }
          })

        // 普通按钮用于走焦测试
        Column() {
          Button('Button1')
            .id('button_priority_0150_btn1')
            .width('80%')
            .height(40)
            .margin({ bottom: 0 })
            .onFocus(() => {
              this.focusLog = 'Button1 获得焦点'
            })

          Button('Button2')
            .id('button_priority_0150_btn2')
            .width('80%')
            .height(40)
            .onFocus(() => {
              this.focusLog = 'Button2 获得焦点'
            })
        }
        .width('90%')
        .padding(10)
        .backgroundColor('#F5F5F5')
        .borderRadius(8)
        .margin({ bottom: 10 })
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Start)
      .padding({ top: 20 })
    }
    .title('半模态FocusPriority')
    .mode(NavigationMode.Stack)
    .width('100%')
    .height('100%')
  }
}

