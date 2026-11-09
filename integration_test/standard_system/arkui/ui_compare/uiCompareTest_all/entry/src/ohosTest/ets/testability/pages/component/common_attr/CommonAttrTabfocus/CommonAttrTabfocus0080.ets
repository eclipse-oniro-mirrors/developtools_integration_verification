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
struct CommonAttrTabfocus0080 {
  @State focusLog: string = ''
  @State showSheet: boolean = false

  @Builder
  sheetBuilder() {
    Column() {
      Text('半模态内容')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 15 })

      Button('btn1')
        .id('commonattr_tabfocus_0080_sheet_btn1')
        .width('80%')
        .height(40)
        .margin({ bottom: 10 })
        .onFocus(() => {
          this.focusLog = 'sheet btn1 获得焦点'
        })

      Button('btn2')
        .id('commonattr_tabfocus_0080_sheet_btn2')
        .width('80%')
        .height(40)
        .margin({ bottom: 10 })
        .onFocus(() => {
          this.focusLog = 'sheet btn2 获得焦点'
        })

      Button('btn3')
        .id('commonattr_tabfocus_0080_sheet_btn3')
        .width('80%')
        .height(40)
        .margin({ bottom: 10 })
        .onFocus(() => {
          this.focusLog = 'sheet btn3 获得焦点'
        })

      Button('btn4')
        .id('commonattr_tabfocus_0080_sheet_btn4')
        .width('80%')
        .height(40)
        .margin({ bottom: 10 })
        .onFocus(() => {
          this.focusLog = 'sheet btn4 获得焦点'
        })
    }
    .width('100%')
    .padding(20)
  }

  build() {
    Navigation() {
      Column() {
        Text('SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0080')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Text('半模态中，tab键走焦')
          .fontSize(12)
          .margin({ bottom: 5 })

        Text(this.focusLog)
          .id('commonattr_tabfocus_0080_log')
          .fontSize(12)
          .fontColor(Color.Blue)
          .margin({ bottom: 10 })

        Button('bindSheet')
          .id('commonattr_tabfocus_0080_open_sheet')
          .width('80%')
          .height(40)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.showSheet = true
          })
          .bindSheet($$this.showSheet, this.sheetBuilder(), {
            height: SheetSize.MEDIUM,
            showClose: true,
            dragBar: true,
            onDisappear: () => {
              this.showSheet = false
            }
          })
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Start)
      .padding({ top: 20 })
    }
    .title('半模态焦点测试')
    .mode(NavigationMode.Stack)
    .width('100%')
    .height('100%')
  }
}

