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
struct UiComponentColumnMatchParent10 {
  @State Mywidth: number=40
  @State Myheight: number=40
  @State text : string = 'change height and width'

  build() {
    Column() {
      Column() {
        Row() {
          Text('Row2')
            .width('80%')
            .height(55)
            .padding(3)
            .ellipsisMode(EllipsisMode.END)
            .fontSize(7)
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
        }
        Column() {
          Text('Column2')
            .width('80%')
            .height(55)
            .padding(3)
            .ellipsisMode(EllipsisMode.END)
            .fontSize(7)
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
        }
      }
      .backgroundColor(Color.Blue)
      .width(LayoutPolicy.matchParent)
      .alignItems(HorizontalAlign.Start)
      .border({ width: 1 })

      Row() {
        Row() {
          Text('Row3')
            .width('40%')
            .height(30)
            .padding(3)
            .ellipsisMode(EllipsisMode.END)
            .fontSize(4)
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
              bottom:0,
              left:0,
              right:0
            })
            .borderWidth(1)
        }
        Column() {
          Text('Column3')
            .height(30)
            .width('40%')
            .padding(3)
            .ellipsisMode(EllipsisMode.END)
            .fontSize(4)
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
              left:0,
              right:0
            })
            .borderWidth(1)
        }
      }
      .backgroundColor(Color.Green)
      .alignItems(VerticalAlign.Top)
      .width('6.94%')
      .height(LayoutPolicy.matchParent)
      .border({ width: 1 })
    }
    .width('100%')
    .height('100%')
    .border({
      width:3 ,
      color:Color.Black}
    )}
}