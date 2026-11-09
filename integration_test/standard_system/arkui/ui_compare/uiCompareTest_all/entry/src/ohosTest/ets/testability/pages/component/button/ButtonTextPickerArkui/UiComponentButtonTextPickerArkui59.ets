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
struct UiComponentButtonTextPickerArkui59 {
  @State rating: number = 3;
  @State text : string = 'rating set stepSize to undefined'

  build() {
    Column() {
      Column() {
        Text(this.text)
          .width('80%')
          .height('30%')
          .padding(3)
          .ellipsisMode(EllipsisMode.END)
          .fontSize(10)
          .maxLines(3)
          .wordBreak(WordBreak.NORMAL)
          .textCase(TextCase.Normal)
          .draggable(true)
          .copyOption(CopyOptions.InApp)
          .fontColor(Color.Black)
          .lineHeight(20)
          .fontWeight(FontWeight.Bolder)
          .textAlign(TextAlign.Center)
          .decoration({
            type: TextDecorationType.Underline,
            color:Color.Black
          })
          .margin({
            top:1,
            bottom:20,
            left:1,
            right:1
          })
          .borderWidth(1)
        Rating({ rating: this.rating, indicator: false })
          .stars(5)
          .stepSize(undefined)
          .id('UiComponentButtonTextPickerArkui59')
          .margin({ top: 24 })
          .onChange((value: number) => {
            this.rating = value;
          })
        Text('current score is ' + this.rating)
          .fontSize(16)
          .fontColor('rgba(24,36,49,0.60)')
          .margin({ top: 16 })
      }
      .width('50%')
      .height('24.59%')
      .backgroundColor('#FFFFFF')
      .margin({ top: 68 })

      Row() {
        Image('/icon.png')
          .width(40)
          .height(40)
          .borderRadius(20)
          .margin({ left: 24 })
        Column() {
          Text('Yue')
            .fontSize(16)
            .fontColor('#182431')
            .fontWeight(500)
          Row() {
            Rating({ rating: 3.5, indicator: false })
              .margin({ top: 1, right: 8 })
            Text('2021/06/02')
              .fontSize(10)
              .fontColor('#182431')
          }
        }
        .margin({ left: 12 })
        .alignItems(HorizontalAlign.Start)

        Text('1st Floor')
          .fontSize(10)
          .fontColor('#182431')
          .position({ x: 295, y: 8 })
      }
      .width('50%')
      .height('4.59%')
      .backgroundColor('#FFFFFF')
      .margin({ top: 64 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}