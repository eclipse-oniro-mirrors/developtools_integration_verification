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
struct UiComponentMediaProgress08 {
  @State text : string = 'Capsule set topWidth to -10 and set borderWidth to 3'

  build() {
    Column({ space: 5 }) {
      Text(this.text)
        .width('80%')
        .height('10%')
        .padding(3)
        .ellipsisMode(EllipsisMode.END)
        .fontSize(7)
        .maxLines(3)
        .wordBreak(WordBreak.NORMAL)
        .textCase(TextCase.Normal)
        .draggable(true)
        .copyOption(CopyOptions.InApp)
        .fontColor(Color.Red)
        .lineHeight(20)
        .fontWeight(FontWeight.Bolder)
        .textAlign(TextAlign.Center)
        .decoration({
          type: TextDecorationType.Underline,
          color:Color.Black
        })
        .margin({
          top:1,
          bottom:1,
          left:1,
          right:1
        })
        .borderWidth(1)
      Text('Linear Progress')
        .fontSize(9)
        .fontColor(0xCCCCCC)
        .width('90%')
        .fontWeight(FontWeight.Bolder)
        .fontStyle(FontStyle.Italic)
      Progress({ value: 10, type: ProgressType.Linear })
        .width(200)
      Progress({ value: 20, total: 150, type: ProgressType.Linear })
        .color(Color.Grey)
        .value(50)
        .width(200)
        .style({
          strokeWidth:8,
          strokeRadius:2
        })

      Text('Eclipse Progress')
        .fontSize(9)
        .fontColor(0xCCCCCC)
        .width('90%')
        .fontWeight(FontWeight.Bolder)
        .fontStyle(FontStyle.Italic)
      Row({ space: 40 }) {
        Progress({ value: 10, type: ProgressType.Eclipse })
          .width(100)
        Progress({ value: 20, total: 150, type: ProgressType.Eclipse })
          .color(Color.Grey)
          .value(50)
          .width(100)
      }

      Text('ScaleRing Progress')
        .fontSize(9)
        .fontColor(0xCCCCCC)
        .width('90%')
        .fontWeight(FontWeight.Bolder)
        .fontStyle(FontStyle.Italic)
      Row({ space: 40 }) {
        Progress({ value: 10, type: ProgressType.ScaleRing })
          .width(100)
        Progress({ value: 20, total: 150, type: ProgressType.ScaleRing })
          .color(Color.Grey)
          .value(50)
          .width(100)
          .style({
            strokeWidth: 15,
            scaleCount: 15,
            scaleWidth: 5
          })
      }

      Row({ space: 40 }) {
        Progress({ value: 20, total: 150, type: ProgressType.ScaleRing })
          .color(Color.Grey)
          .value(50)
          .width(100)
          .style({
            strokeWidth: 20,
            scaleCount: 20,
            scaleWidth: 5
          })
        Progress({ value: 20, total: 150, type: ProgressType.ScaleRing })
          .color(Color.Grey)
          .value(50)
          .width(100)
          .style({
            strokeWidth: 20,
            scaleCount: 30,
            scaleWidth: 3
          })
      }

      Text('Ring Progress')
        .fontSize(9)
        .fontColor(0xCCCCCC)
        .width('90%')
        .fontWeight(FontWeight.Bolder)
        .fontStyle(FontStyle.Italic)
      Row({ space: 40 }) {
        Progress({ value: 10, type: ProgressType.Ring })
          .width(100)
        Progress({ value: 20, total: 150, type: ProgressType.Ring })
          .color(Color.Grey)
          .value(50)
          .width(100)
          .style({
            strokeWidth: 20,
            enableScanEffect: true
          })
      }

      Text('Capsule Progress')
        .fontSize(9)
        .fontColor(0xCCCCCC)
        .width('90%')
        .fontWeight(FontWeight.Bolder)
        .fontStyle(FontStyle.Italic)
      Row({ space: 40 }) {
        Progress({ value: 10, type: ProgressType.Capsule })
          .width(100)
          .height(50)
          .borderWidth(3)
          .border({
            width: { top: -10 }
          })
          .style({
            font: { size: 13, style: FontStyle.Normal },
            enableScanEffect: false,
          })
        Progress({ value: 20, total: 150, type: ProgressType.Capsule })
          .color(Color.Red)
          .borderWidth(3)
          .border({
            width: {
              top: -10
            }
          })
          .style({
            font: { size: 13, style: FontStyle.Normal },
            enableScanEffect: false,
          })
          .value(50)
          .width(100)
          .height(50)
      }
    }
    .width('100%')
    .margin({ top: 30 })
  }
}