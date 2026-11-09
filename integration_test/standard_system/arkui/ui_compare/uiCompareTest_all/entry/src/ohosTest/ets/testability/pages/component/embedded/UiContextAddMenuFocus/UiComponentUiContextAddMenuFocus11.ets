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
struct UiComponentUiContextAddMenuFocus11 {
  @State num:number=0
  aboutToAppear() {
    this.getUIContext().getFocusController().activate(true, false)
  }

  aboutToDisappear() {
    this.getUIContext().getFocusController().activate(false)
  }
  build() {
    Column() {
      Text("default's count is"+this.num)
        .fontSize(15)
        .width('90%')
        .border({ width: 1 })
        .lineHeight(20)
        .margin(30)
        .padding(10)
        .maxLines(2)
        .fontColor(Color.Red)
        .fontStyle(FontStyle.Italic)
        .height(100)
      Button('Button1')
        .width(200)
        .height(70)
        .focusable(false)
        .labelStyle({ overflow: TextOverflow.Clip,
          maxLines: 1,
          minFontSize: 10,
          maxFontSize: 20,
          font: {
            size: 14,
            weight: FontWeight.Bolder,
            family: 'cursive',
            style: FontStyle.Italic
          }
        })
        .onFocus(()=>{
          this.num++;
        })
    }
    .padding(10)
    .justifyContent(FlexAlign.SpaceBetween)
    .width('100%')
  }
}