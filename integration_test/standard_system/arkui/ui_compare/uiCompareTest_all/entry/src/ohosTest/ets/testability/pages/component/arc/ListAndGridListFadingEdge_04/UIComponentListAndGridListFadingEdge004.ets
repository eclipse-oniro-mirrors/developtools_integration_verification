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

class MyListModifier implements AttributeModifier<ListAttribute> {
  applyNormalAttribute(instance: ListAttribute): void {
    instance.fadingEdge(true);
  }
}

@Entry
@Component
struct UIComponentListAndGridListFadingEdge004 {
  @State message: string = 'Hello';
  @State arr: string[] = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];
  private scrollerForList1: Scroller = new Scroller();
  private scrollerForList2: Scroller = new Scroller();
  private scrollerForList3: Scroller = new Scroller();
  @State modifier: MyListModifier = new MyListModifier();

  build() {
    Row() {
      Column() {
        Column() {
          Button('滚动')
            .id('click')
            .stateEffect(true)
            .onClick(() => {
              this.scrollerForList1.fling(-500);
            })
        }
        .height('10%')
        List({ space: 10, scroller: this.scrollerForList1 }) {
          ForEach(this.arr, (item: number) => {
            ListItem() {
              Text('' + item)
                .width('100%')
                .height('20%')
                .textAlign(TextAlign.Center)
                .fontStyle(FontStyle.Normal)
            }
            .backgroundColor(0xF9CF93)
          }, (item: string) => item)
        }
        .attributeModifier(this.modifier)
        .scrollBarColor(Color.Gray)
        .enableScrollInteraction(true)
        .multiSelectable(false)
        .edgeEffect(EdgeEffect.Spring)
        .scrollBar(BarState.On)
        .scrollBarWidth(10)
        .backgroundColor(0xFAEEE0)
        .width('100%')
        .height('85%')
      }.width('33%').height('90%')
      Column() {
        Column() {
          Text(`顶部`)
            .fontSize(20)
            .width('100%')
            .height('10%')
            .textAlign(TextAlign.Center)
            .fontStyle(FontStyle.Normal)
        }
        List({ space:10, scroller: this.scrollerForList2 }) {
          ForEach(this.arr, (item: number) => {
            ListItem() {
              Text('' + item)
                .width('100%')
                .height('20%')
                .textAlign(TextAlign.Center)
                .fontStyle(FontStyle.Normal)
            }
            .backgroundColor(0xF9CF93)
          }, (item: string) => item)
        }
        .attributeModifier(this.modifier)
        .scrollBarColor(Color.Gray)
        .enableScrollInteraction(true)
        .multiSelectable(false)
        .edgeEffect(EdgeEffect.Spring)
        .scrollBar(BarState.On)
        .scrollBarWidth(10)
        .backgroundColor(0xFAEEE0)
        .width('100%')
        .height('80%')
      }.width('33%').height('90%')
      Column() {
        Column() {
          Text(`底部`)
            .fontSize(20)
            .width('100%')
            .height('10%')
            .textAlign(TextAlign.Center)
            .fontStyle(FontStyle.Normal)
        }
        List({ space:10, initialIndex: 10, scroller: this.scrollerForList3 }) {
          ForEach(this.arr, (item: number) => {
            ListItem() {
              Text('' + item)
                .width('100%')
                .height('20%')
                .textAlign(TextAlign.Center)
                .fontStyle(FontStyle.Normal)
            }
            .backgroundColor(0xF9CF93)
          }, (item: string) => item)
        }
        .attributeModifier(this.modifier)
        .scrollBarColor(Color.Gray)
        .enableScrollInteraction(true)
        .multiSelectable(false)
        .edgeEffect(EdgeEffect.Spring)
        .scrollBar(BarState.On)
        .scrollBarWidth(10)
        .backgroundColor(0xFAEEE0)
        .width('100%')
        .height('80%')
      }.width('33%').height('90%')
    }
    .backgroundColor(0xDCDCDC)
    .width('100%')
  }
}