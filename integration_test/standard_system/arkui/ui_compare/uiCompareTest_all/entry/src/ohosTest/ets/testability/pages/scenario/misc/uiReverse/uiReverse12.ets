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
struct UiReverse12 {
  @State text: string = '';
  @State positionInfo: CaretOffset = { index: 0, x: 0, y: 0 };
  @State onFocusTest: string = 'onBlur';
  @State submitValue: string = '';
  @State reverse: boolean | undefined | null = true;
  @State directionAttr: boolean | undefined | null = true;
  scroller: Scroller = new Scroller();

  build() {
    Column() {
      Scroll(this.scroller) {
        Row() {
          Text('Text1')
            .copyOption(CopyOptions.InApp)
            .draggable(true)
            .fontSize(30)
            .width('14%')
            .border({ width: 1 })
            .lineHeight(30)
            .margin('8%')
            .padding(10)

          Text('Text2')
            .copyOption(CopyOptions.InApp)
            .draggable(true)
            .fontSize(30)
            .width('14%')
            .border({ width: 1 })
            .lineHeight(30)
            .margin('8%')
            .padding(10)

          Text('Text3')
            .copyOption(CopyOptions.InApp)
            .draggable(true)
            .fontSize(30)
            .width('14%')
            .border({ width: 1 })
            .lineHeight(30)
            .margin('8%')
            .padding(10)

          Text('Text4')
            .copyOption(CopyOptions.InApp)
            .draggable(true)
            .fontSize(30)
            .width('14%')
            .border({ width: 1 })
            .lineHeight(30)
            .margin('8%')
            .padding(10)

          Text('Text5')
            .copyOption(CopyOptions.InApp)
            .draggable(true)
            .fontSize(30)
            .width('14%')
            .border({ width: 1 })
            .lineHeight(30)
            .margin('8%')
            .padding(10)
        }
        .reverse(this.reverse)
      }
      .width('90%')
      .margin(5)
      .scrollable(ScrollDirection.Horizontal)
      .height('60%')

      Button('reverse = false')
        .id('uiReverse12_01')
        .height(40)
        .fontSize(15)
        .fontColor(Color.Black)
        .width('70%')
        .border({ width: 1 })
        .fontWeight(300)
        .margin(10)
        .onClick( () => {
          this.reverse = false
        })

      Button('scroll 300')
        .id('uiReverse12_02')
        .height(40)
        .fontSize(15)
        .fontColor(Color.Black)
        .width('70%')
        .border({ width: 1 })
        .fontWeight(300)
        .margin(10)
        .onClick(() => {
          this.scroller.scrollBy(250, 0)
        })

      Button('reset scroll')
        .id('uiReverse12_03')
        .height(40)
        .fontSize(15)
        .fontColor(Color.Black)
        .width('70%')
        .border({ width: 1 })
        .fontWeight(300)
        .margin(10)
        .onClick(() => {
          this.scroller.scrollBy(-250, 0)
        })
    }.width('100%')
  }
}

