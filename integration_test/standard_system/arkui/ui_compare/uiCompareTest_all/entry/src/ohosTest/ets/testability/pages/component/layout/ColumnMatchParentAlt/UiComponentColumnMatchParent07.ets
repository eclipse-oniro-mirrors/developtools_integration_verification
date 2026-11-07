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
struct UiComponentColumnMatchParent07 {
  @State Mywidth: number=40
  @State Myheight: number=40
  @State text : string = 'change height and width'

  build() {
    Column() {
      Column() {
        Text('Column1')
          .width('80%')
          .height(55)
          .padding(3)
          .ellipsisMode(EllipsisMode.END)
          .fontSize(5)
          .wordBreak(WordBreak.NORMAL)
          .textCase(TextCase.Normal)
          .draggable(true)
          .copyOption(CopyOptions.InApp)
          .fontColor(0xCCCCCC)
          .lineHeight(20)
          .fontWeight(FontWeight.Bolder)
          .textAlign(TextAlign.Center)
          .decoration({
            type: TextDecorationType.Underline,
            color:Color.Black
          })
          .textShadow({
            radius: 5,
            color: Color.Black,
            offsetX: 0,
            offsetY: 0
          })
          .margin({
            top:6,
            bottom:6,
            left:6,
            right:6
          })
          .borderWidth(1)
        Button(this.text)
          .controlSize(ControlSize.NORMAL)
          .id('UiComponentColumnMatchParent07')
          .type(ButtonType.Capsule)
          .width(50)
          .borderRadius(5)
          .height(20)
          .fontWeight(FontWeight.Bolder)
          .backgroundColor(Color.Green)
          .onClick(()=>{
            this.Mywidth+=20;
            this.Myheight+=20;
          })
          .labelStyle({ overflow: TextOverflow.Clip,
            maxLines: 1,
            minFontSize: 2,
            maxFontSize: 20,
            font: {
              size: 5,
              weight: FontWeight.Bolder,
              family: 'cursive',
              style: FontStyle.Italic
            }
          })
          .fontSize(2)
      }
      .backgroundColor(Color.Blue)
      .height(LayoutPolicy.matchParent)
      .alignItems(HorizontalAlign.Start)
      .border({ width: 1 })

      Column() {
        Text('Column2')
          .width('80%')
          .height(20)
          .ellipsisMode(EllipsisMode.END)
          .wordBreak(WordBreak.NORMAL)
          .textCase(TextCase.Normal)
          .draggable(true)
          .copyOption(CopyOptions.InApp)
          .fontSize(5)
          .padding(1)
          .fontWeight(FontWeight.Bolder)
          .fontColor(0xCCCCCC)
          .lineHeight(20)
          .textAlign(TextAlign.Center)
          .decoration({
            type: TextDecorationType.Underline,
            color:Color.Black
          })
          .textShadow({
            radius: 10,
            color: Color.Black,
            offsetX: 0,
            offsetY: 0
          })
          .margin({
            top:6,
            bottom:6,
            left:6,
            right:6
          })
          .borderWidth(1)
      }
      .backgroundColor(Color.Green)
      .alignItems(HorizontalAlign.Start)
      .width(this.Mywidth)
      .height(this.Myheight)
      .border({ width: 1 })

      Column() {
        Text('Column3')
          .width('80%')
          .height(20)
          .fontSize(5)
          .textCase(TextCase.Normal)
          .padding(1)
          .ellipsisMode(EllipsisMode.END)
          .wordBreak(WordBreak.NORMAL)
          .draggable(true)
          .copyOption(CopyOptions.InApp)
          .fontColor(0xCCCCCC)
          .lineHeight(20)
          .fontWeight(FontWeight.Bolder)
          .textAlign(TextAlign.Center)
          .decoration({
            type: TextDecorationType.Underline,
            color:Color.Black
          })
          .textShadow({
            radius: 1,
            color: Color.Black,
            offsetX: 0,
            offsetY: 0
          })
          .margin({
            top:6,
            bottom:6,
            left:6,
            right:6
          })
          .borderWidth(1)
      }
      .backgroundColor(Color.Yellow)
      .alignItems(HorizontalAlign.Start)
      .width(this.Mywidth)
      .height(this.Myheight)
      .border({ width: 1 })
    }
    .width('100%')
    .height('100%')
    .border({
      width: 2 ,
      color:Color.Blue}
    )}
}