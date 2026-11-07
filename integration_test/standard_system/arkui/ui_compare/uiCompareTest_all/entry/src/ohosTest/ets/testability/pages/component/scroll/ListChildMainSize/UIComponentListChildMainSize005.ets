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
struct UIComponentListChildMainSize005 {
  @State numbers: number[] = [];
  @State columnsGap: number = 10;
  @State rowsGap: number = 10;
  private scroller: Scroller = new Scroller();
  private caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CHILDMAINSIZE_0580';
  @State listChildrenSize1: ChildrenMainSize = new ChildrenMainSize(40);
  @State listChildrenSize2: ChildrenMainSize = new ChildrenMainSize(40);
  @State listChildrenSize3: ChildrenMainSize = new ChildrenMainSize(40);
  @State listChildrenSize4: ChildrenMainSize = new ChildrenMainSize(40);

  aboutToAppear(): void {
    for(let i: number = 0; i < 20; i++) {
      this.numbers.push(i);
    }
  }

  build() {
    Column() {
      Column() {
        Row() {
          Column() {
            Column() {
              Text('childSize=50')
                .textAlign(TextAlign.Center)
            }.justifyContent(FlexAlign.Center).height('10%')
            List({ scroller: this.scroller, space: 10 }) {
              ForEach(this.numbers, (item: number) => {
                ListItem() {
                  Text('item' + item)
                    .height(this.listChildrenSize1)
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
            .height('100%')
          }.width('25%').height('100%')
          Column() {
            Column() {
              Text('childSize=50.2')
                .textAlign(TextAlign.Center)
            }.justifyContent(FlexAlign.Center).height('10%')
            List({ scroller: this.scroller, space: 10 }) {
              ForEach(this.numbers, (item: number) => {
                ListItem() {
                  Text('item' + item)
                    .width('100%')
                    .height(this.listChildrenSize2)
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
            .height('100%')
          }.width('25%').height('100%')
          Column() {
            Column() {
              Text('childSize=100')
                .textAlign(TextAlign.Center)
            }.justifyContent(FlexAlign.Center).height('10%')
            List({ scroller: this.scroller, space: 10 }) {
              ForEach(this.numbers, (item: number) => {
                ListItem() {
                  Text('item' + item)
                    .width('100%')
                    .height(this.listChildrenSize3)
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
            .height('100%')
          }.width('25%').height('100%')
          Column() {
            Column() {
              Text('childSize=100.2')
                .textAlign(TextAlign.Center)
            }.justifyContent(FlexAlign.Center).height('10%')
            List({ scroller: this.scroller, space: 10 }) {
              ForEach(this.numbers, (item: number) => {
                ListItem() {
                  Text('item' + item)
                    .width('100%')
                    .height(this.listChildrenSize4)
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
            .height('100%')
          }.width('25%').height('100%')
        }.width('100%').height('90%')
      }.width('100%').height('90%')
      Column() {
        Row() {
          Button('update')
            .id('update')
            .stateEffect(true)
            .buttonStyle(ButtonStyleMode.NORMAL)
            .type(ButtonType.Capsule)
            .onClick(() => {
              this.listChildrenSize1.update(5, 50);
              this.listChildrenSize2.update(5, 50.2);
              this.listChildrenSize3.update(5, 100);
              this.listChildrenSize4.update(5, 100.2);
              console.info(`${this.caseName} ChildrenMainSize update.`);
            })
        }
      }.width('100%').height('5%')
    }
    .width('100%')
    .height('100%')
  }
}