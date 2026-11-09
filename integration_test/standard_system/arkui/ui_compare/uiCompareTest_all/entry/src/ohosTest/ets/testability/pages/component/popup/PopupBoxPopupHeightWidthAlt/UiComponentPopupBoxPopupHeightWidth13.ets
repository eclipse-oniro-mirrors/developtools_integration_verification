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
struct UiComponentPopupBoxPopupHeightWidth13 {
  @State isPopupShown: boolean = false;

  build() {
    Column() {
      Text('popup新增宽度属性，PopupOptions参数width设为"-50lpx"')
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
        .margin({
          top:1,
          bottom:20,
          left:1,
          right:1
        })

      Button('点击显示气泡')
        .id('UiComponentPopupBoxPopupHeightWidth13')
        .width(200)
        .height(50)
        .fontSize(16)
        .backgroundColor(Color.Orange)
        .borderRadius(25)
        .fontColor(Color.White)
        .fontWeight(FontWeight.Bold)
        .shadow({
          radius: 10,
          color: '#FF8C00',
          offsetX: 2,
          offsetY: 2
        })
        .margin({ top: 50 })
        .bindPopup(this.isPopupShown, {
          message: '这是一个宽度为-50lpx的气泡，包含丰富的样式属性',
          width: '-50lpx',
          placement: Placement.Top,
          enableArrow: true,
          arrowHeight: 15,
          arrowWidth: 20,
          showInSubWindow: false,
          maskColor: '#33000000',
          autoCancel: true,
          offset: { x: 0, y: -10 },
          shadow: {
            radius: 20,
            color: '#4169E1',
            offsetX: 0,
            offsetY: 5
          },
        })
        .onClick(() => {
          this.isPopupShown = !this.isPopupShown;
        })

      Text('预期结果: 气泡宽度为-50lpx')
        .fontSize(14)
        .fontColor(Color.Green)
        .margin({ top: 50 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}
