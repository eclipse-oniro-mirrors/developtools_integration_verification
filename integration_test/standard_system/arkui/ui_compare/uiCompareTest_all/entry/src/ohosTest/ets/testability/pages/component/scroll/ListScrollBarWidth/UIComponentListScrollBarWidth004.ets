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
struct UIComponentListScrollBarWidth004 {
  @State numbers: number[] = [];
  private scroller: Scroller = new Scroller();
  private caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_SCROLLBARWIDTH_0040';
  @State valueArr: Array<number | string | undefined> = [20, '20px', -20, 0, 200, '600%', undefined];
  @State index: number = 0;

  aboutToAppear(): void {
    for(let i: number = 0; i < 20; i++) {
      this.numbers.push(i);
    }
  }

  build() {
    Column() {
      Column() {
            Text(`scrollBarWidth值为${this.valueArr[this.index]}`)
              .fontSize(20)
              .textAlign(TextAlign.Center)
              .fontStyle(FontStyle.Normal)
          }.width('100%').height('10%').justifyContent(FlexAlign.Center).backgroundColor(0xfdfaCC)

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
            .scrollBarColor(Color.Gray)
            .enableScrollInteraction(true)
            .multiSelectable(false)
            .edgeEffect(EdgeEffect.Spring)
            .scrollBar(BarState.On)
            .scrollBarWidth(this.valueArr[this.index])
            .backgroundColor(0xFAEEE0)

          }.width('100%').height('70%').justifyContent(FlexAlign.Center)

      Column() {
        Button('切换scrollBarWidth值')
          .id('change')
          .stateEffect(true)
          .type(ButtonType.Capsule)
          .buttonStyle(ButtonStyleMode.NORMAL)
          .onClick(() => {
            this.index++;
            console.info(`${this.caseName} index is ${this.index}, scrollBarWidth is ${this.valueArr[this.index]}`);
          })
      }
    }
    .width('100%')
    .height('100%')
  }
}