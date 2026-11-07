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
struct UiComponentButtonButtonRadius03 {
  @State text: string = 'button set borderRadius to 10vp';
  @State widthShortSize: number = 200;
  @State count : number = 0

  build() {
    Row() {
      Column() {
        Text(this.text+'click count:'+this.count)
          .width('80%')
          .height('20%')
          .padding(3)
          .ellipsisMode(EllipsisMode.END)
          .fontSize(10)
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
            bottom:20,
            left:1,
            right:1
          })
          .padding(20)
          .borderWidth(1)

        Button('NORMAL')
          .width(this.widthShortSize)
          .type(ButtonType.Normal)
          .stateEffect(true)
          .id('UiComponentButtonButtonRadius03_01')
          .controlSize(ControlSize.NORMAL)
          .height(100)
          .labelStyle({
            overflow: TextOverflow.Clip,
            maxLines: 1,
            minFontSize: 20,
            maxFontSize: 20,
            font: {
              size: 20,
              weight: 900,
              family: 'cursive',
              style: FontStyle.Italic,
            }
          })
          .onClick(()=>{
            this.count++;
            console.log('NORMAL onclick success')
          })
          .borderRadius(10)
          .buttonStyle(ButtonStyleMode.NORMAL)
          .fontColor(Color.Red)
          .fontSize(40)

        Button('EMPHASIZED', { type: ButtonType.Normal, stateEffect: true })
          .width(this.widthShortSize)
          .stateEffect(true)
          .type(ButtonType.Normal)
          .controlSize(ControlSize.NORMAL)
          .id('UiComponentButtonButtonRadius03_02')
          .height(100)
          .labelStyle({
            overflow: TextOverflow.Clip,
            maxLines: 1,
            minFontSize: 20,
            maxFontSize: 20,
            font: {
              size: 20,
              weight: 900,
              family: 'cursive',
              style: FontStyle.Italic,
            }
          })
          .onClick(()=>{
            this.count++;
            console.log('EMPHASIZED onclick success')
          })
          .borderRadius(10)
          .buttonStyle(ButtonStyleMode.EMPHASIZED)
          .fontColor(Color.Red)
          .fontSize(40)
      }
      .width('100%')
    }
    .height('100%')
  }
}