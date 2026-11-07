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
struct BackwardAnalysisAln1400 {
  @State isSheetShow: boolean = false
  @State sheetHeight: number = 300
  @State listData: string[] = []

  aboutToAppear() {
    // 初始化列表数据
    for (let i = 1; i <= 50; i++) {
      this.listData.push(`列表项 ${i}`)
    }
    // 自动显示半模态
    this.isSheetShow = true
  }

  @Builder
  sheetBuilder() {
    Column() {
      Text('半模态内容')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      List({ space: 5 }) {
        ForEach(this.listData, (item: string, index: number) => {
          ListItem() {
            Text(item)
              .fontSize(16)
              .width('100%')
              .height(50)
              .textAlign(TextAlign.Center)
              .backgroundColor(index % 2 === 0 ? '#E8E8E8' : '#FFFFFF')
          }
        })
      }
      .id('sheet_list_1400')
      .width('100%')
      .layoutWeight(1)
      .scrollBar(BarState.Auto)
    }
    .width('100%')
    .height('100%')
  }

  build() {
    Column() {
      Text('半模态快速滑动测试')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Button('显示半模态')
        .id('show_sheet_btn_1400')
        .onClick(() => {
          this.isSheetShow = true
        })
        .margin(20)

      Text('请快速滑动半模态到底部，然后连续快速滑动多次')
        .fontSize(14)
        .fontColor('#666666')
        .textAlign(TextAlign.Center)
        .margin(20)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .bindSheet($$this.isSheetShow, this.sheetBuilder(), {
      height: SheetSize.MEDIUM,
      dragBar: true,
      showClose: true,
      title: { title: '半模态弹窗' }
    })
  }
}

