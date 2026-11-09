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
struct UIComponentGridTabs0010 {
  @State name: string = 'UIComponentGridTabs0010';
  @State message: string = this.name;
  @State numbers: number[] = [];
  scroller: Scroller = new Scroller();
  @State text: string = 'drag';
  @State originColorA: ResourceColor = 0xF9CF93;
  @State actualColorA: ResourceColor = this.originColorA;
  @State originColorB: ResourceColor = 0xF9CF93;
  @State actualColorB: ResourceColor = this.originColorB;
  @State originColors: ResourceColor[] = [];
  @State actualColors: ResourceColor[] = [];

  @Builder pixelMapBuilder() {
    Column() {
      Text(this.text)
        .fontSize(16)
        .backgroundColor(0xF9CF93)
        .width(80)
        .height(80)
        .textAlign(TextAlign.Center)
    }
  }

  aboutToAppear() {
    for (let i = 0;i < 30; i++) {
      this.numbers.push(i);
      this.originColors.push(0xF9CF93);
      this.actualColors.push(0xF9CF93);
    }
  }

  changeIndex(index1: number, index2: number) {
    let temp: number;
    temp = this.numbers[index1];
    this.numbers[index1] = this.numbers[index2];
    this.numbers[index2] = temp;
  }

  @Builder tabBuilder1() {
    Column() {
      Text('Tab1')
        .fontSize(20)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Medium)
        .textAlign(TextAlign.Center)
        .margin({
          left: 6,
          right: 6,
          top: 10,
          bottom: 10
        })
    }
    .id(this.name + '_01')
    .width('100%')
  }

  @Builder tabBuilder2() {
    Column() {
      Text('Tab2')
        .fontSize(20)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Medium)
        .textAlign(TextAlign.Center)
        .margin({
          left: 6,
          right: 6,
          top: 10,
          bottom: 10
        })
    }
    .id(this.name + '_02')
    .width('100%')
  }

  build() {
    Tabs() {

      TabContent() {
        Column() {
          Text(this.name + ' Tab1')
            .fontSize(20)
            .fontColor(Color.Black)
            .fontWeight(FontWeight.Bold)
            .textAlign(TextAlign.Center)
            .margin({
              left: 6,
              right: 6,
              top: 10,
              bottom: 10
            })

          Grid(this.scroller) {
            GridItem() {
              Text('itemA')
                .fontSize(16)
                .width('100%')
                .height(80)
                .textAlign(TextAlign.Center)
                .focusable(true)
                .focusOnTouch(true)
            }
            .backgroundColor(this.actualColorA)
            .onFocus(() => {
              this.message += `\n Grid itemA onFocus`;
              this.actualColorA = Color.Orange;
            })
            .onBlur(() => {
              this.message += `\n Grid itemA onBlur`;
              this.actualColorA = this.originColorA;
            })
            .focusable(true)
            .focusOnTouch(true)

            GridItem() {
              Text('itemB')
                .fontSize(16)
                .width('100%')
                .height(80)
                .textAlign(TextAlign.Center)
                .focusable(true)
                .focusOnTouch(true)
            }
            .backgroundColor(this.actualColorB)
            .onFocus(() => {
              this.message += `\n Grid itemB onFocus`;
              this.actualColorB = Color.Orange;
            })
            .onBlur(() => {
              this.message += `\n Grid itemB onBlur`;
              this.actualColorB = this.originColorB;
            })
            .focusable(true)
            .focusOnTouch(true)

            ForEach(this.numbers, (day: number) => {
              GridItem() {
                Text(day.toString())
                  .fontSize(16)
                  .width('100%')
                  .height(80)
                  .textAlign(TextAlign.Center)
                  .focusable(true)
              }
              .backgroundColor(this.actualColors[day])
              .onFocus(() => {
                this.message += `\n Grid item ${day} onFocus`;
                this.actualColors[day] = Color.Orange;
              })
              .onBlur(() => {
                this.message += `\n Grid item ${day} onBlur`;
                this.actualColors[day] = this.originColors[day];
              })
              .focusable(true)
            }, (day: number) => day.toString())
          }
          .id(this.name + '_03')
          .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
          .columnsGap(10)
          .rowsGap(10)
          .friction(0.6)
          .enableScrollInteraction(true)
          .supportAnimation(true)
          .multiSelectable(false)
          .edgeEffect(EdgeEffect.Spring)
          .scrollBar(BarState.On)
          .scrollBarColor(Color.Red)
          .scrollBarWidth(4)
          .width('90%')
          .backgroundColor(Color.Grey)
          .height('24.59%')
          .editMode(true)
          .onItemDragStart((event: ItemDragInfo, itemIndex: number) => {
            this.text = this.numbers[itemIndex].toString();
            return this.pixelMapBuilder();
          })
          .onItemDragEnter((event: ItemDragInfo) => {
            console.info('Grid onItemDragEnter');
            this.message += `\n Grid onItemDragEnter, event: ${JSON.stringify(event)}`;
          })
          .onItemDragLeave((event: ItemDragInfo, itemIndex: number) => {
            console.info('Grid onItemDragLeave');
            this.message += `\n Grid onItemDragLeave, event: ${JSON.stringify(event)}, itemIndex: ${itemIndex.toString()}`;
          })
          .onItemDragMove((event: ItemDragInfo, itemIndex: number, insertIndex: number) => {
            console.info('Grid onItemDragMove');
            this.message += `\n Grid onItemDragMove, event: ${JSON.stringify(event)}, itemIndex: ${itemIndex.toString()}, insertIndex: ${insertIndex.toString()}`;
          })
          .onItemDrop((event: ItemDragInfo, itemIndex: number, insertIndex: number, isSuccess: boolean) => {
            console.info('Grid onItemDragMove');
            this.message += `\n Grid onItemDrop, event: ${JSON.stringify(event)}, itemIndex: ${itemIndex.toString()}, insertIndex: ${insertIndex.toString()}, isSuccess: ${isSuccess}`;
          })
          .onScrollFrameBegin((offset: number, state: ScrollState) => {
            this.message += `\n Grid onScrollFrameBegin, offset: ${offset}, state: ${state}`;
            return { offsetRemain: offset };
          })
          .onScrollBarUpdate((index: number, offset: number) => {
            console.info('Grid onScrollBarUpdate,index : ' + index.toString() + ',offset' + offset.toString());
            return {
              totalOffset: (index / 5) * (80 + 10) - offset,
              totalLength: 80 * 5 + 10 * 4
            };
          })
          .onScrollIndex((first: number, last: number) => {
            console.info(first.toString());
            console.info(last.toString());
            this.message += `\n Grid onReachEnd, first: ${first.toString()}, last: ${last.toString()}`;
          })
          .onWillScroll((scrollOffset: number, scrollState: ScrollState, scrollSource: ScrollSource) => {
            console.info('Grid onWillScroll');
            this.message += `\n Grid onWillScroll, scrollOffset: ${scrollOffset.toString()}, scrollState: ${scrollState.toString()}, scrollSource: ${scrollSource.toString()}`;
          })
          .onDidScroll((scrollOffset: number, scrollState: ScrollState) => {
            console.info(scrollOffset.toString());
            console.info(scrollState.toString());
            this.message += `\n Grid onDidScroll, scrollOffset: ${scrollOffset.toString()}, scrollState: ${scrollState.toString()}`;
          })
          .onScrollFrameBegin((offset: number, state: ScrollState) => {
            console.info('Grid onScrollFrameBegin');
            this.message += `\n Grid onScrollFrameBegin, offset: ${offset}, state: ${state}`;
            return { offsetRemain: offset };
          })
          .onScrollStart(() => {
            console.info('Grid onScrollStart');
            this.message += `\n Grid onScrollStart`;
          })
          .onScrollStop(() => {
            console.info('Grid onScrollStop');
            this.message += `\n Grid onScrollStop`;
          })
          .onReachStart(() => {
            console.info('Grid onReachStart');
            this.message += `\n Grid onReachStart`;
          })
          .onReachEnd(() => {
            console.info('Grid onReachEnd');
            this.message += `\n Grid onReachEnd`;
          })

          Scroll() {
            Text('Tab1 ' + this.message)
              .fontSize(10)
              .fontColor(Color.Red)
              .fontWeight(FontWeight.Medium)
              .textAlign(TextAlign.Center)
              .margin({
                left: 6,
                right: 6,
                top: 10,
                bottom: 10
              })
          }
          .friction(0.6)
          .backgroundColor(Color.Yellow)
          .edgeEffect(EdgeEffect.Spring)
          .width('90%')
          .height('16.39%')
          .margin(10)
        }
        .justifyContent(FlexAlign.Start)
        .width('100%')
        .height('100%')
        .backgroundColor(Color.Pink)
      }
      .tabBar(this.tabBuilder1())

      TabContent() {
        Column() {
          Text(this.name + ' Tab2')
            .fontSize(20)
            .fontColor(Color.Black)
            .fontWeight(FontWeight.Bold)
            .textAlign(TextAlign.Center)
            .margin({
              left: 6,
              right: 6,
              top: 10,
              bottom: 10
            })

          Grid(this.scroller) {
            GridItem() {
              Text('itemA')
                .fontSize(16)
                .width('100%')
                .height(80)
                .textAlign(TextAlign.Center)
                .focusable(true)
                .focusOnTouch(true)
            }
            .backgroundColor(this.actualColorA)
            .onFocus(() => {
              this.message += `\n Grid itemA onFocus`;
              this.actualColorA = Color.Orange;
            })
            .onBlur(() => {
              this.message += `\n Grid itemA onBlur`;
              this.actualColorA = this.originColorA;
            })
            .focusable(true)
            .focusOnTouch(true)

            GridItem() {
              Text('itemB')
                .fontSize(16)
                .width('100%')
                .height(80)
                .textAlign(TextAlign.Center)
                .focusable(true)
                .focusOnTouch(true)
            }
            .backgroundColor(this.actualColorB)
            .onFocus(() => {
              this.message += `\n Grid itemB onFocus`;
              this.actualColorB = Color.Orange;
            })
            .onBlur(() => {
              this.message += `\n Grid itemB onBlur`;
              this.actualColorB = this.originColorB;
            })
            .focusable(true)
            .focusOnTouch(true)

            ForEach(this.numbers, (day: number) => {
              GridItem() {
                Text(day.toString())
                  .fontSize(16)
                  .width('100%')
                  .height(80)
                  .textAlign(TextAlign.Center)
                  .focusable(true)
              }
              .backgroundColor(this.actualColors[day])
              .onFocus(() => {
                this.message += `\n Grid item ${day} onFocus`;
                this.actualColors[day] = Color.Orange;
              })
              .onBlur(() => {
                this.message += `\n Grid item ${day} onBlur`;
                this.actualColors[day] = this.originColors[day];
              })
              .focusable(true)
            }, (day: number) => day.toString())
          }
          .id(this.name + '_04')
          .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
          .columnsGap(10)
          .rowsGap(10)
          .friction(0.6)
          .enableScrollInteraction(true)
          .supportAnimation(true)
          .multiSelectable(false)
          .edgeEffect(EdgeEffect.Spring)
          .scrollBar(BarState.On)
          .scrollBarColor(Color.Red)
          .scrollBarWidth(4)
          .width('90%')
          .backgroundColor(Color.Grey)
          .height('24.59%')
          .editMode(true)
          .onItemDragStart((event: ItemDragInfo, itemIndex: number) => {
            this.text = this.numbers[itemIndex].toString();
            return this.pixelMapBuilder();
          })
          .onItemDragEnter((event: ItemDragInfo) => {
            console.info('Grid onItemDragEnter');
            this.message += `\n Grid onItemDragEnter, event: ${JSON.stringify(event)}`;
          })
          .onItemDragLeave((event: ItemDragInfo, itemIndex: number) => {
            console.info('Grid onItemDragLeave');
            this.message += `\n Grid onItemDragLeave, event: ${JSON.stringify(event)}, itemIndex: ${itemIndex.toString()}`;
          })
          .onItemDragMove((event: ItemDragInfo, itemIndex: number, insertIndex: number) => {
            console.info('Grid onItemDragMove');
            this.message += `\n Grid onItemDragMove, event: ${JSON.stringify(event)}, itemIndex: ${itemIndex.toString()}, insertIndex: ${insertIndex.toString()}`;
          })
          .onItemDrop((event: ItemDragInfo, itemIndex: number, insertIndex: number, isSuccess: boolean) => {
            console.info('Grid onItemDragMove');
            this.message += `\n Grid onItemDrop, event: ${JSON.stringify(event)}, itemIndex: ${itemIndex.toString()}, insertIndex: ${insertIndex.toString()}, isSuccess: ${isSuccess}`;
          })
          .onScrollFrameBegin((offset: number, state: ScrollState) => {
            this.message += `\n Grid onScrollFrameBegin, offset: ${offset}, state: ${state}`;
            return { offsetRemain: offset };
          })
          .onScrollBarUpdate((index: number, offset: number) => {
            console.info('Grid onScrollBarUpdate,index : ' + index.toString() + ',offset' + offset.toString());
            return {
              totalOffset: (index / 5) * (80 + 10) - offset,
              totalLength: 80 * 5 + 10 * 4
            };
          })
          .onScrollIndex((first: number, last: number) => {
            console.info(first.toString());
            console.info(last.toString());
            this.message += `\n Grid onReachEnd, first: ${first.toString()}, last: ${last.toString()}`;
          })
          .onWillScroll((scrollOffset: number, scrollState: ScrollState, scrollSource: ScrollSource) => {
            console.info('Grid onWillScroll');
            this.message += `\n Grid onWillScroll, scrollOffset: ${scrollOffset.toString()}, scrollState: ${scrollState.toString()}, scrollSource: ${scrollSource.toString()}`;
          })
          .onDidScroll((scrollOffset: number, scrollState: ScrollState) => {
            console.info(scrollOffset.toString());
            console.info(scrollState.toString());
            this.message += `\n Grid onDidScroll, scrollOffset: ${scrollOffset.toString()}, scrollState: ${scrollState.toString()}`;
          })
          .onScrollFrameBegin((offset: number, state: ScrollState) => {
            console.info('Grid onScrollFrameBegin');
            this.message += `\n Grid onScrollFrameBegin, offset: ${offset}, state: ${state}`;
            return { offsetRemain: offset };
          })
          .onScrollStart(() => {
            console.info('Grid onScrollStart');
            this.message += `\n Grid onScrollStart`;
          })
          .onScrollStop(() => {
            console.info('Grid onScrollStop');
            this.message += `\n Grid onScrollStop`;
          })
          .onReachStart(() => {
            console.info('Grid onReachStart');
            this.message += `\n Grid onReachStart`;
          })
          .onReachEnd(() => {
            console.info('Grid onReachEnd');
            this.message += `\n Grid onReachEnd`;
          })

          Scroll() {
            Text('Tab2 ' + this.message)
              .fontSize(10)
              .fontColor(Color.Red)
              .fontWeight(FontWeight.Medium)
              .textAlign(TextAlign.Center)
              .margin({
                left: 6,
                right: 6,
                top: 10,
                bottom: 10
              })
          }
          .friction(0.6)
          .backgroundColor(Color.Yellow)
          .edgeEffect(EdgeEffect.Spring)
          .width('90%')
          .height('16.39%')
          .margin(10)
        }
        .justifyContent(FlexAlign.Center)
        .width('100%')
        .height('100%')
        .backgroundColor(Color.Green)
      }
      .tabBar(this.tabBuilder2())

    }
    .height('90%')
    .width('100%')
    .backgroundColor(0xf1f3f5)
    .barMode(BarMode.Fixed)
  }
}
