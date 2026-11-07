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
struct UIComponentGridSettingLayout029 {
  @State message: string = 'scrollToIndex(-5)滑动距离（vp）：';
  @State scrollOffset: number = 0;
  @State numbers: string[] = [];
  @State columnsGap: number = 10;
  @State rowsGap: number = 10;
  private scroller: Scroller = new Scroller();
  private caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0230_076';
  private layoutOptions: GridLayoutOptions = {
    regularSize: [1, 1]
  };

  aboutToAppear(): void {
    for(let i: number = 0; i < 50; i++) {
      this.numbers.push(`${i + 1}`);
    }
  }

  build() {
    Column() {
      Column() {
        Text(this.message + this.scrollOffset)
          .fontSize(20)
          .textAlign(TextAlign.Center)
          .fontStyle(FontStyle.Normal)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Black)
          .width('100%')
      }
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#009999')
      .width('100%')
      .height('10%')
      Column() {
        Column() {
          Row() {
            Button('scrollToIndex(-5)')
              .id('scrollToIndex')
              .stateEffect(true)
              .buttonStyle(ButtonStyleMode.NORMAL)
              .type(ButtonType.Capsule)
              .onClick(() => {
                this.scrollOffset = 0;
                this.scroller.scrollToIndex(-5);
              })
          }
        }
        Column() {
          Grid(this.scroller, this.layoutOptions) {
            ForEach(this.numbers, (day: string) => {
              GridItem() {
                Text(day)
                  .fontSize(20)
                  .width('100%')
                  .height('25%')
                  .textAlign(TextAlign.Center)
              }.backgroundColor(0xF9CF93)
            }, (day: string) => day)
          }
          .id('Grid')
          .columnsTemplate('1fr')
          .columnsGap(this.columnsGap)
          .rowsGap(this.rowsGap)
          .enableScrollInteraction(true)
          .supportAnimation(false)
          .multiSelectable(false)
          .edgeEffect(EdgeEffect.Spring)
          .scrollBar(BarState.On)
          .scrollBarColor(Color.Grey)
          .scrollBarWidth(10)
          .backgroundColor(0xFAEEE0)
          .width('100%')
          .height('100%')
          .onDidScroll((scrollOffset: number, scrollState: ScrollState) => {
            console.info(`${this.caseName} scrollOffset is ${scrollOffset}`);
            this.scrollOffset = scrollOffset;
          })
        }
      }
      .width('100%')
      .height('80%')
    }
  }
}