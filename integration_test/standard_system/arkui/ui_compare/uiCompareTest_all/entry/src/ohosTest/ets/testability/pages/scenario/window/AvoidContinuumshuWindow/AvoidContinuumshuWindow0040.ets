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
struct AvoidContinuumshuWindow0040 {
  @State showActionSheet: boolean = false

  @Builder
  actionSheetBuilder() {
    Column() {
      Text('ActionSheet标题')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 15 })
        .textAlign(TextAlign.Center)

      Text('请选择一个操作')
        .fontSize(14)
        .fontColor(Color.Gray)
        .margin({ bottom: 20 })
        .textAlign(TextAlign.Center)

      Column() {
        Button('选项一')
          .width('100%')
          .height(45)
          .fontSize(16)
          .backgroundColor(Color.White)
          .fontColor(Color.Black)
          .onClick(() => {
            this.showActionSheet = false
          })
          .margin({ bottom: 1 })

        Button('选项二')
          .width('100%')
          .height(45)
          .fontSize(16)
          .backgroundColor(Color.White)
          .fontColor(Color.Black)
          .onClick(() => {
            this.showActionSheet = false
          })
          .margin({ bottom: 1 })

        Button('选项三')
          .width('100%')
          .height(45)
          .fontSize(16)
          .backgroundColor(Color.White)
          .fontColor(Color.Black)
          .onClick(() => {
            this.showActionSheet = false
          })
          .margin({ bottom: 10 })

        Button('取消')
          .width('100%')
          .height(45)
          .fontSize(16)
          .backgroundColor(Color.White)
          .fontColor(Color.Red)
          .onClick(() => {
            this.showActionSheet = false
          })
      }
    }
    .width('90%')
    .padding(15)
    .backgroundColor(Color.White)
    .borderRadius(12)
  }

  build() {
    Column() {
      Text('验证actionsheet的连续弹子窗场景')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 50, bottom: 30 })

      Button('点击弹出ActionSheet')
        .id('avoid_continuumshu_actionsheet_button_0040')
        .width(200)
        .height(50)
        .fontSize(16)
        .onClick(() => {
          this.showActionSheet = true
        })
        .bindSheet(this.showActionSheet, this.actionSheetBuilder(), {
          height: 300,
          showInSubWindow: true,
          onAppear: () => {
            console.log('ActionSheet appeared')
          },
          onDisappear: () => {
            this.showActionSheet = false
          }
        })
        .margin({ bottom: 20 })

      Text('说明：点击按钮弹出子窗actionsheet，然后连续点击蒙层处关闭actionsheet')
        .fontSize(14)
        .fontColor(Color.Gray)
        .textAlign(TextAlign.Center)
        .margin({ top: 20 })
        .padding(20)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}
