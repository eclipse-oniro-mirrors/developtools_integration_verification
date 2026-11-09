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
struct CommonAttrFocusgroup2000 {
  @State focusLog: string = ''
  @State showSheet: boolean = false

  @Builder
  SheetBuilder() {
    Column() {
      Text('半模态面板')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      // 焦点组1
      Column() {
        Text('焦点组1')
          .fontSize(12)
          .margin({ bottom: 5 })

        Button('btn1')
          .id('commonattr_focusgroup_2000_sheet_btn1')
          .width('80%')
          .height(35)
          .margin({ bottom: 5 })
          .onFocus(() => {
            this.focusLog = 'btn1 获得焦点'
          })

        Button('btn2')
          .id('commonattr_focusgroup_2000_sheet_btn2')
          .width('80%')
          .height(35)
          .margin({ bottom: 5 })
          .onFocus(() => {
            this.focusLog = 'btn2 获得焦点'
          })
      }
      .width('90%')
      .padding(10)
      .backgroundColor('#F5F5F5')
      .borderRadius(8)
      .margin({ bottom: 10 })
      .focusScopeId('sheetFocusGroup1', true)

      // 焦点组2
      Column() {
        Text('焦点组2')
          .fontSize(12)
          .margin({ bottom: 5 })

        Button('btn3')
          .id('commonattr_focusgroup_2000_sheet_btn3')
          .width('80%')
          .height(35)
          .margin({ bottom: 5 })
          .onFocus(() => {
            this.focusLog = 'btn3 获得焦点'
          })

        Button('btn4')
          .id('commonattr_focusgroup_2000_sheet_btn4')
          .width('80%')
          .height(35)
          .onFocus(() => {
            this.focusLog = 'btn4 获得焦点'
          })
      }
      .width('90%')
      .padding(10)
      .backgroundColor('#E0E0E0')
      .borderRadius(8)
      .margin({ bottom: 10 })
      .focusScopeId('sheetFocusGroup2', true)

      Button('关闭按钮')
        .id('commonattr_focusgroup_2000_sheet_close')
        .width('80%')
        .height(35)
        .onClick(() => {
          this.showSheet = false
        })
        .onFocus(() => {
          this.focusLog = '关闭按钮 获得焦点'
        })
    }
    .width('100%')
    .padding(20)
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_2000')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('半模态页面')
        .fontSize(12)
        .margin({ bottom: 5 })

      Text(this.focusLog)
        .id('commonattr_focusgroup_2000_log')
        .fontSize(12)
        .fontColor(Color.Blue)
        .margin({ bottom: 10 })

      // bindSheet按钮（子窗口）
      Button('bindSheet')
        .id('commonattr_focusgroup_2000_open_sheet')
        .width('80%')
        .height(40)
        .margin({ bottom: 10 })
        .onClick(() => {
          this.showSheet = true
        })
        .bindSheet($$this.showSheet, this.SheetBuilder, {
          showClose: false,
          height: SheetSize.MEDIUM,
          showInSubWindow: true
        })
        .onFocus(() => {
          this.focusLog = 'bindSheet按钮 获得焦点'
        })

      Button('其他按钮')
        .id('commonattr_focusgroup_2000_other_btn')
        .width('80%')
        .height(40)
        .margin({ bottom: 10 })
        .onFocus(() => {
          this.focusLog = '其他按钮 获得焦点'
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .padding({ top: 20 })
  }
}

