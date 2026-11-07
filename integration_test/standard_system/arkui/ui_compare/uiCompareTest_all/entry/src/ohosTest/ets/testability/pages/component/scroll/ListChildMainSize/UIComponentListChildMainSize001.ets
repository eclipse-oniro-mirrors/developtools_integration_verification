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
struct UIComponentListChildMainSize001 {
  @State numbers: number[] = [];
  @State columnsGap: number = 10;
  @State rowsGap: number = 10;
  private scroller: Scroller = new Scroller();
  private listChildrenSize1: ChildrenMainSize = new ChildrenMainSize(50);
  private listChildrenSize2: ChildrenMainSize = new ChildrenMainSize(100);
  private listChildrenSize3: ChildrenMainSize = new ChildrenMainSize(50.2);
  private listChildrenSize4: ChildrenMainSize = new ChildrenMainSize(100.2);

  aboutToAppear(): void {
    for(let i: number = 0; i < 50; i++) {
      this.numbers.push(i);
    }
  }

  build() {
    Column() {
      Row() {
        Column() {
          Column() {
            Text('childDefaultSize为50')
              .textAlign(TextAlign.Center)
          }.justifyContent(FlexAlign.Center).height('10%')
          List({ scroller: this.scroller, space: 10 }) {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('item' + item)
                  .height(this.listChildrenSize1.childDefaultSize)
                  .fontSize(20)
                  .width('100%')
                  .textAlign(TextAlign.Center)
              }.backgroundColor(0xF9CF93)
            }, (item: string) => item)
          }
          .childrenMainSize(this.listChildrenSize1)
          .enableScrollInteraction(true)
          .multiSelectable(false)
          .edgeEffect(EdgeEffect.Spring)
          .scrollBar(BarState.On)
          .scrollBarColor(Color.Grey)
          .scrollBarWidth(10)
          .backgroundColor(0xFAEEE0)
          .width('100%')
          .height('90%')
        }.width('50%').height('45%')
        Column() {
          Column() {
            Text('childDefaultSize为50.2')
              .textAlign(TextAlign.Center)
          }.justifyContent(FlexAlign.Center).height('10%')
          List({ scroller: this.scroller, space: 10 }) {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('item' + item)
                  .height(this.listChildrenSize3.childDefaultSize)
                  .fontSize(20)
                  .width('100%')
                  .textAlign(TextAlign.Center)
              }.backgroundColor(0xF9CF93)
            }, (item: string) => item)
          }
          .childrenMainSize(this.listChildrenSize3)
          .enableScrollInteraction(true)
          .multiSelectable(false)
          .edgeEffect(EdgeEffect.Spring)
          .scrollBar(BarState.On)
          .scrollBarColor(Color.Grey)
          .scrollBarWidth(10)
          .backgroundColor(0xFAEEE0)
          .width('100%')
          .height('90%')
        }.width('50%').height('45%')
      }
      Row() {
        Column() {
          Column() {
            Text('childDefaultSize为100')
              .textAlign(TextAlign.Center).height('10%')
          }.justifyContent(FlexAlign.Center)
          List({ scroller: this.scroller, space: 10 }) {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('item' + item)
                  .height(this.listChildrenSize2.childDefaultSize)
                  .fontSize(20)
                  .width('100%')
                  .textAlign(TextAlign.Center)
              }.backgroundColor(0xF9CF93)
            }, (item: string) => item)
          }
          .childrenMainSize(this.listChildrenSize2)
          .enableScrollInteraction(true)
          .multiSelectable(false)
          .edgeEffect(EdgeEffect.Spring)
          .scrollBar(BarState.On)
          .scrollBarColor(Color.Grey)
          .scrollBarWidth(10)
          .backgroundColor(0xFAEEE0)
          .width('100%')
          .height('90%')
        }.width('50%').height('45%')
        Column() {
          Column() {
            Text('childDefaultSize为100.2')
              .textAlign(TextAlign.Center)
          }.justifyContent(FlexAlign.Center).height('10%')
          List({ scroller: this.scroller, space: 10 }) {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('item' + item)
                  .height(this.listChildrenSize4.childDefaultSize)
                  .fontSize(20)
                  .width('100%')
                  .textAlign(TextAlign.Center)
              }.backgroundColor(0xF9CF93)
            }, (item: string) => item)
          }
          .childrenMainSize(this.listChildrenSize4)
          .enableScrollInteraction(true)
          .multiSelectable(false)
          .edgeEffect(EdgeEffect.Spring)
          .scrollBar(BarState.On)
          .scrollBarColor(Color.Grey)
          .scrollBarWidth(10)
          .backgroundColor(0xFAEEE0)
          .width('100%')
          .height('90%')
        }.width('50%').height('45%')
      }
    }
  }
}