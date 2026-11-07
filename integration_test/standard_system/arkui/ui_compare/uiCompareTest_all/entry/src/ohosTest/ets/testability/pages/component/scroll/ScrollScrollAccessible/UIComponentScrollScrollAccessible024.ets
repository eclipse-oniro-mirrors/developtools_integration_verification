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
struct UIComponentScrollScrollAccessible024 {
  @State message: string = 'Hello'
  @State arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
  @State scrollOffSet: number = 0;
  @State gutter: number = 0;
  @State strokeWidth: number = 2;

  build() {
    Column() {
      Text(this.message)
        .fontSize(20)
        .fontColor(Color.Blue)
        .margin({ top: 20 })
        .key('UIComponentScrollScrollAccessible024_001')
      Stack({ alignContent: Alignment.TopStart }) {
        List({ space: 20, initialIndex: 0 }) {
          ForEach(this.arr, (item: number) => {
            ListItem() {
              Text('' + item)
                .width('100%')
                .height(100)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .borderRadius(10)
                .backgroundColor(0xFFFFFF)
            }
          }, (item: string) => item)
        }
        .listDirection(Axis.Vertical)
        .scrollBar(BarState.On)
        .scrollBarColor(Color.Blue)
        .lanes({ minLength: 200, maxLength: 200 }, this.gutter)
        .divider({
          strokeWidth: this.strokeWidth,
          startMargin: 20,
          endMargin: 20
        })
        .edgeEffect(EdgeEffect.Spring)
        .onDidScroll((scrollOffset: number, scrollState: ScrollState) => {
          console.info(`onScroll scrollState = ScrollState` + scrollState + `, scrollOffset = ` + scrollOffset);
          this.scrollOffSet += scrollOffset;
        })

        Column() {
          Button('change')
            .id('change')
            .height('5%')
            .stateEffect(true)
            .onClick(() => {
              this.gutter = 20;
              this.strokeWidth = 70;
            })
        }
      }
      .backgroundColor(0xDCDCDC)
      .width('100%')
      .height('85%')
      Row() {
        Text('scrollOffSet: ' + this.scrollOffSet)
          .fontColor(Color.Black)
          .fontSize(20)
      }
      .backgroundColor(0xDCDCDC)
    }
  }
}