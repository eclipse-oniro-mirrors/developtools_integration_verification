/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct UiComponentButtonTextPickerArkui62 {
  @State ratingValue: number = 2;
  @State isOnChangeTriggered: boolean = false;

  build() {
    Column({ space: 30 }) {
      Rating({
        rating: this.ratingValue,
        indicator: false
      })
        .stars(5)
        .stepSize(0.5)
        .backgroundColor(Color.Transparent)
        .height(50)
        .margin({ top: 24 })
        .onChange(undefined)
        .width('80%')
        .id('UiComponentButtonTextPickerArkui62')

      Text(`当前评星：${this.ratingValue}星`)
        .fontColor(Color.Blue)
        .fontSize(20)
        .maxLines(3)
        .wordBreak(WordBreak.NORMAL)
        .textCase(TextCase.Normal)
        .draggable(true)
        .copyOption(CopyOptions.InApp)
        .fontColor(Color.Red)
        .margin({
          top:1,
          bottom:1,
          left:1,
          right:1
        })

      Text(`onChange是否触发：${this.isOnChangeTriggered ? "是" : "否"}`)
        .fontSize(16)
        .fontColor(this.isOnChangeTriggered ? Color.Red : Color.Green)
        .fontSize(20)
        .maxLines(3)
        .wordBreak(WordBreak.NORMAL)
        .textCase(TextCase.Normal)
        .draggable(true)
        .copyOption(CopyOptions.InApp)
        .fontColor(Color.Red)
        .margin({
          top:1,
          bottom:1,
          left:1,
          right:1
        })

      Text('操作步骤：点击星星改变评星，观察上方两个文本是否变化')
        .fontSize(12)
        .fontColor(Color.Gray)
        .width('80%')
        .textAlign(TextAlign.Center)
        .copyOption(CopyOptions.InApp)
        .margin({
          top:1,
          bottom:1,
          left:1,
          right:1
        })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('#F5F5F5')
  }
}