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
struct UIComponentListOffSet003 {
  @State numbers: number[] = [];
  @State columnsGap: number = 10;
  @State rowsGap: number = 10;
  private scroller: Scroller = new Scroller();
  private caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_OFFSET_0030';

  aboutToAppear(): void {
    for(let i: number = 0; i < 20; i++) {
      this.numbers.push(i);
    }
  }

  build() {
    Column() {
      Column() {
        Text(`contentStartOffset和contentEndOffset属性同时设置`)
          .fontSize(20)
          .width('100%')
          .height('10%')
          .textAlign(TextAlign.Center)
          .fontStyle(FontStyle.Normal)
      }
      Row() {
        Column() {
          List({ scroller: this.scroller, space: 10 }) {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('item' + item)
                  .width('100%')
                  .height('20%')
                  .textAlign(TextAlign.Center)
                  .fontStyle(FontStyle.Normal)
              }.backgroundColor(0xF9CF93)
            }, (item: string) => item)
          }
          .contentStartOffset(10)
          .contentEndOffset(10)
          .scrollBarColor(Color.Gray)
          .enableScrollInteraction(true)
          .multiSelectable(false)
          .edgeEffect(EdgeEffect.Spring)
          .scrollBar(BarState.On)
          .scrollBarWidth(10)
          .backgroundColor(0xFAEEE0)
          .width('50%')
          .height('24.59%')
          .margin(5)
        }
        Column() {
          List({ scroller: this.scroller, space: 10, initialIndex: 19 }) {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('item' + item)
                  .width('100%')
                  .height('20%')
                  .textAlign(TextAlign.Center)
                  .fontStyle(FontStyle.Normal)
              }.backgroundColor(0xF9CF93)
            }, (item: string) => item)
          }
          .contentStartOffset(10)
          .contentEndOffset(10)
          .scrollBarColor(Color.Gray)
          .enableScrollInteraction(true)
          .multiSelectable(false)
          .edgeEffect(EdgeEffect.Spring)
          .scrollBar(BarState.On)
          .scrollBarWidth(10)
          .backgroundColor(0xFAEEE0)
          .width('50%')
          .height('24.59%')
          .margin(5)
        }
      }

    }
    .width('100%')
    .height('100%')
  }
}