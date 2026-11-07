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
import { BusinessError } from '@kit.BasicServicesKit';
import { screen } from '@kit.ArkUI';

@Entry
@Component
struct UIComponentScrollScrollAlwaysEnable0100 {
  @State name: string = 'UIComponentScrollScrollAlwaysEnable0100';
  @State TAG: string = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ALWAYSENABLE_0100';
  @State message: string = this.name;
  @State numbers: number[] = [];
  @State originColors: ResourceColor[] = [];
  @State actualColors: ResourceColor[] = [];
  @State text: string = 'drag';
  @State gutterValue: Dimension = 10;
  @State listDirection: Axis = Axis.Vertical;
  @State frictionValue: number | Resource = 0.6;
  @State totalCount: number = 2;
  @State itemWidth: Length = 100;
  @State itemHeight: Length = 50;
  @State listWidth: Length = 400;
  @State listHeight: Length = 300;
  @State spaceValue: number | string = 10;
  @State edgeEffectValue: EdgeEffect = EdgeEffect.Spring;
  @State enableScrollInteractionValue: boolean = true;
  @State alwaysEnableValue: boolean = false;
  @State canOverScroll: boolean = true;
  @State groupIndices: number[] = [];
  @State dragFromIndex: number = -1;
  @State dragToIndex: number = -1;
  scroller: ListScroller = new ListScroller();

  @Builder pixelMapBuilder() {
    Column() {
      Text(this.text)
        .width(100)
        .height(150)
        .backgroundColor(Color.White)
        .borderRadius(15)
        .fontSize(16)
        .textAlign(TextAlign.Center)
        .margin({
          top: 10
        })
    }
  }

  @Builder itemEnd() {
    Row() {
      Text('itemEnd')
        .fontSize(20)
        .fontColor(Color.Orange)
        .fontWeight(FontWeight.Medium)
        .fontStyle(FontStyle.Italic)
        .textAlign(TextAlign.Center)
        .width(this.itemWidth)
        .height(this.itemHeight)
        .border({ width: 1 })
        .lineHeight(20)
        .maxLines(2)
        .margin({
          left: 6,
          right: 6,
          top: 10,
          bottom: 10
        })
    }
    .padding('4vp')
    .justifyContent(FlexAlign.SpaceEvenly)
  }

  @Builder itemStart() {
    Row() {
      Text('itemStart')
        .fontSize(20)
        .fontColor(Color.Yellow)
        .fontWeight(FontWeight.Medium)
        .fontStyle(FontStyle.Italic)
        .textAlign(TextAlign.Center)
        .width(this.itemWidth)
        .height(this.itemHeight)
        .border({ width: 1 })
        .lineHeight(20)
        .maxLines(2)
        .margin({
          left: 6,
          right: 6,
          top: 10,
          bottom: 10
        })
    }
    .padding('4vp')
    .justifyContent(FlexAlign.SpaceEvenly)
  }

  @Builder groupHeader(groupIndex: number) {
    Text(`Group ${groupIndex + 1} header`)
      .fontSize(18)
      .fontColor(Color.White)
      .fontWeight(FontWeight.Bold)
      .fontStyle(FontStyle.Normal)
      .textAlign(TextAlign.Start)
      .backgroundColor(0x3366CC)
      .width(this.itemWidth)
      .height(this.itemHeight)
      .lineHeight(20)
      .maxLines(2)
      .margin({
        left: 6,
        right: 6,
        top: 10,
        bottom: 10
      })
  }

  @Builder groupFooter(groupIndex: number) {
    Text(`Group ${groupIndex + 1} footer`)
      .fontSize(18)
      .fontColor(Color.White)
      .fontWeight(FontWeight.Bold)
      .fontStyle(FontStyle.Normal)
      .textAlign(TextAlign.Start)
      .backgroundColor(0x3366CC)
      .width(this.itemWidth)
      .height(this.itemHeight)
      .lineHeight(20)
      .maxLines(2)
      .margin({
        left: 6,
        right: 6,
        top: 10,
        bottom: 10
      })
  }

  changeIndex(index1: number, index2: number) {
    let temp: number;
    temp = this.numbers[index1];
    this.numbers[index1] = this.numbers[index2];
    this.numbers[index2] = temp;
  }

  setDragFromIndex(index: number) {
    this.dragFromIndex = index;
  }

  setDragToIndexWithHighlight(index: number) {
    this.dragToIndex = index;
    this.actualColors[index] = Color.Pink;
  }

  restoreOriginColor(index: number) {
    this.actualColors[index] = this.originColors[index];
  }

  setFocusColor(index: number) {
    this.actualColors[index] = Color.Orange;
  }

  swapItemsAndColors(fromIndex: number, toIndex: number): boolean {
    if (fromIndex === -1 || toIndex === -1 || fromIndex === toIndex) {
      return false;
    }

    // 交换数组元素
    let temp = this.numbers[fromIndex];
    this.numbers[fromIndex] = this.numbers[toIndex];
    this.numbers[toIndex] = temp;

    // 交换颜色
    let tempColor = this.originColors[fromIndex];
    this.originColors[fromIndex] = this.originColors[toIndex];
    this.originColors[toIndex] = tempColor;

    return true;
  }

  resetDragState() {
    this.dragFromIndex = -1;
    this.dragToIndex = -1;
  }

  aboutToAppear() {
    for (let i = 0; i < this.totalCount; i++) {
      this.numbers.push(i);
      this.originColors.push(Color.White);
      this.actualColors.push(Color.White);
    }
    let groupCount = Math.ceil(this.totalCount / 5);
    for (let i = 0; i < groupCount; i++) {
      this.groupIndices.push(i);
    }
  }

  build() {
    Column() {
      Text(this.name)
        .fontSize(18)
        .fontColor(Color.White)
        .fontWeight(FontWeight.Medium)
        .fontStyle(FontStyle.Italic)
        .textAlign(TextAlign.Center)
        .width('90%')
        .height(20)
        .border({ width: 1 })
        .lineHeight(20)
        .maxLines(2)
        .margin({
          left: 6,
          right: 6,
          top: 10,
          bottom: 10
        })

      Row() {
        Button('Switch list direction')
          .id(this.name + '_01_1')
          .borderRadius(10)
          .backgroundColor(0x317aff)
          .fontWeight(FontWeight.Bold)
          .fontSize(8)
          .margin(5)
          .width('30%')
          .labelStyle({ overflow: TextOverflow.Clip,
            maxLines: 1,
            minFontSize: 8,
            maxFontSize: 20,
            font: {
              size: 8,
              weight: FontWeight.Bold,
              family: 'cursive',
              style: FontStyle.Italic
            }
          })
          .onClick(() => {
            this.listDirection = this.listDirection === Axis.Vertical ? Axis.Horizontal : Axis.Vertical;
          })

        Button('Switch screen orientation')
          .id(this.name + '_01_2')
          .borderRadius(10)
          .backgroundColor(0x317aff)
          .fontWeight(FontWeight.Bold)
          .fontSize(8)
          .margin(5)
          .width('30%')
          .labelStyle({ overflow: TextOverflow.Clip,
            maxLines: 1,
            minFontSize: 8,
            maxFontSize: 20,
            font: {
              size: 8,
              weight: FontWeight.Bold,
              family: 'cursive',
              style: FontStyle.Italic
            }
          })
          .onClick(() => {
            let screenClass: screen.Screen | null = null;
            screen.getAllScreens(async (err: BusinessError, data: screen.Screen[]) => {
              const errCode: number = err.code;
              if (errCode) {
                console.error(`[${this.TAG}_testpage]: Failed to get all screens. Code:${err.code},message is ${err.message}`);
                return;
              }
              console.info(`[${this.TAG}_testpage]: Succeeded in getting all screens. Data:` + JSON.stringify(data));
              screenClass = data[0];
              if (screenClass.orientation == screen.Orientation.VERTICAL) {
                screenClass.setOrientation(screen.Orientation.HORIZONTAL, (err: BusinessError) => {
                  const errCode: number = err.code;
                  if (errCode) {
                    console.error(`[${this.TAG}_testpage]: Failed to set the horizontal orientation. Code:${err.code},message is ${err.message}`);
                    return;
                  }
                  console.info(`[${this.TAG}_testpage]: Succeeded in setting the horizontal orientation.`);
                });
              } else if (screenClass.orientation == screen.Orientation.HORIZONTAL) {
                screenClass.setOrientation(screen.Orientation.VERTICAL, (err: BusinessError) => {
                  const errCode: number = err.code;
                  if (errCode) {
                    console.error(`[${this.TAG}_testpage]: Failed to set the vertical orientation. Code:${err.code},message is ${err.message}`);
                    return;
                  }
                  console.info(`[${this.TAG}_testpage]: Succeeded in setting the vertical orientation.`);
                })
              } else {
                screenClass.setOrientation(screen.Orientation.VERTICAL, (err: BusinessError) => {
                  const errCode: number = err.code;
                  if (errCode) {
                    console.error(`[${this.TAG}_testpage]: Failed to set the vertical orientation. Code:${err.code},message is ${err.message}`);
                    return;
                  }
                  console.info(`[${this.TAG}_testpage]: Succeeded in setting the vertical orientation.`);
                })
              }
            })
          })

        Button('Switch space')
          .id(this.name + '_01_3')
          .borderRadius(10)
          .backgroundColor(0x317aff)
          .fontWeight(FontWeight.Bold)
          .fontSize(8)
          .margin(5)
          .width('30%')
          .labelStyle({ overflow: TextOverflow.Clip,
            maxLines: 1,
            minFontSize: 8,
            maxFontSize: 20,
            font: {
              size: 8,
              weight: FontWeight.Bold,
              family: 'cursive',
              style: FontStyle.Italic
            }
          })
          .onClick(() => {
            this.spaceValue = this.spaceValue === 10 ? 100 : 10;
          })
      }
      .width('100%')

      List({
        initialIndex: 0,
        space: this.spaceValue,
        scroller: this.scroller
      }) {
        ForEach(this.groupIndices, (groupIndex: number) => {
          ListItemGroup({
            header: this.groupHeader(groupIndex),
            footer: this.groupFooter(groupIndex)
          }) {
            ForEach(this.numbers.slice(groupIndex * 5, Math.min((groupIndex + 1) * 5, this.totalCount)), (item: number, index: number) => {
              ListItem() {
                Stack() {
                  Image('/images/app_icon.png')
                    .onComplete((event) => {
                      this.message += `\n image ${item} onComplete, width: ` + event?.width + ', height: ' + event?.height;
                    })
                    .onError((error: ImageError) => {
                      this.message += `\n image ${item} onError, err: ` + JSON.stringify(error);
                    })
                    .backgroundColor(Color.Green)
                    .width('70%')
                    .height('70%')
                    .margin({
                      left: 5,
                      right: 5,
                      top: 10,
                      bottom: 10
                    })
                  Text(item.toString())
                    .width('20%')
                    .height('20%')
                    .fontSize(16)
                    .fontColor(Color.Yellow)
                    .textAlign(TextAlign.Center)
                    .margin({
                      left: 5,
                      right: 5,
                      top: 10,
                      bottom: 10
                    })
                }
                .alignContent(Alignment.TopStart)
                .width('100%')
                .height('100%')
                .backgroundColor(Color.White)
                .borderRadius(15)
                .margin({
                  top: 10
                })
              }
              .id(this.name + '_02_' + item.toString())
              .width(this.itemWidth)
              .height(this.itemHeight)
              .enabled(true)
              .backgroundColor(this.actualColors[index])
              .focusable(true)
              .draggable(true)
              .onFocus(() => {
                console.info(`item ${item} onFocus`);
                this.message += `\n item ${item} onFocus`;
                this.setFocusColor(index);
              })
              .onBlur(() => {
                console.info(`item ${item} onBlur`);
                this.message += `\n item ${item} onBlur`;
                this.restoreOriginColor(index);
              })
              .onPreDrag((status: PreDragStatus) => {
                this.message += `\n item ${item} onPreDrag (index: ${index}, status: ${status})`;
                console.info(`item ${item} onPreDrag (index: ${index}, status: ${status})`);
              })
              .onDragStart(() => {
                this.setDragFromIndex(index);
                this.message += `\n item ${item} onDragStart (index: ${index})`;
                console.info(`item ${item} onDragStart (index: ${index})`);
              })
              .onDragEnter(() => {
                this.setDragToIndexWithHighlight(index);
                this.message += `\n item ${item} onDragEnter (index: ${index})`;
                console.info(`item ${item} onDragEnter (index: ${index})`);
              })
              .onDragLeave(() => {
                this.restoreOriginColor(index);
                this.message += `\n item ${item} onDragLeave (index: ${index})`;
                console.info(`item ${item} onDragLeave (index: ${index})`);
              })
              .onDragMove((event: DragEvent) => {
                this.message += `\n item ${item} onDragMove (index: ${index}, x: ${event.getWindowX()}, y: ${event.getWindowY()})`;
                console.info(`item ${item} onDragMove (index: ${index}, x: ${event.getWindowX()}, y: ${event.getWindowY()})`);
              })
              .onDrop(() => {
                console.info(`item ${item} onDrop (index: ${index})`);
                if (this.swapItemsAndColors(this.dragFromIndex, this.dragToIndex)) {
                  this.message += `\n item ${item} onDrop. From index: ${this.dragFromIndex}, To index: ${this.dragToIndex}`;
                }
                this.restoreOriginColor(index);
                this.resetDragState();
              })
              .onDragEnd((event: DragEvent) => {
                this.message += `\n item ${item} onDragEnd (index: ${index}, result: ${event.getResult()})`;
                console.info(`item ${item} onDragEnd (index: ${index}, result: ${event.getResult()})`);
              })
              .swipeAction({
                end: {
                  builder: () => {
                    this.itemEnd();
                  },
                  onAction: () => {
                    this.getUIContext()?.animateTo({ duration: 1000 }, () => {
                      let index = this.numbers.indexOf(item);
                      this.numbers.splice(index, 1);
                    });
                  },
                  actionAreaDistance: 56,
                  onEnterActionArea: () => {
                    this.message += `\n item ${item} enter end delete area`;
                  },
                  onExitActionArea: () => {
                    this.message += `\n item ${item} exit end delete area`;
                  }
                },
                start: {
                  builder: () => {
                    this.itemStart();
                  },
                  onAction: () => {
                    this.getUIContext()?.animateTo({ duration: 1000 }, () => {
                      let index = this.numbers.indexOf(item);
                      this.numbers.splice(index, 1);
                    });
                  },
                  actionAreaDistance: 56,
                  onEnterActionArea: () => {
                    this.message += `\n item ${item} enter start delete area`;
                  },
                  onExitActionArea: () => {
                    this.message += `\n item ${item} exit start delete area`;
                  }
                },
                edgeEffect: SwipeEdgeEffect.Spring
              })
            }, (item: number) => item.toString())
          }
        }, (groupIndex: number) => groupIndex.toString())
      }
      .alignListItem(ListItemAlign.Center)
      .id(this.name + '_02')
      .enabled(true)
      .backToTop(true)
      .friction(this.frictionValue)
      .backgroundColor(Color.Grey)
      .width(this.listWidth)
      .height(this.listHeight)
      .multiSelectable(false)
      .edgeEffect(this.edgeEffectValue, {alwaysEnabled: this.alwaysEnableValue})
      .scrollBar(BarState.On)
      .scrollBarColor(Color.Red)
      .scrollBarWidth(4)
      .listDirection(this.listDirection)
      .margin({
        top: 10,
        bottom: 10,
        left: 5,
        right: 5
      })
      .onItemMove((from: number, to: number) =>{
        console.info('List onItemMove');
        this.message += `\n List onItemMove, from: ${from.toString()}, to: ${to.toString()}`;
        return true;
      })
      .onItemDragStart((event: ItemDragInfo, itemIndex: number) => {
        console.info('List onItemDragStart');
        this.message += `\n List onItemDragStart, event: ${JSON.stringify(event)}, itemIndex: ${itemIndex.toString()}`;
        this.text = this.numbers[itemIndex].toString();
        return this.pixelMapBuilder();
      })
      .onItemDragEnter((event: ItemDragInfo) => {
        console.info('List onItemDragEnter');
        this.message += `\n List onItemDragEnter, event: ${JSON.stringify(event)}`;
      })
      .onItemDragLeave((event: ItemDragInfo, itemIndex: number) => {
        console.info('List onItemDragLeave');
        this.message += `\n List onItemDragLeave, event: ${JSON.stringify(event)}, itemIndex: ${itemIndex.toString()}`;
      })
      .onItemDragMove((event: ItemDragInfo, itemIndex: number, insertIndex: number) => {
        console.info('List onItemDragMove');
        this.message += `\n List onItemDragMove, event: ${JSON.stringify(event)}, itemIndex: ${itemIndex.toString()}, insertIndex: ${insertIndex.toString()}`;
      })
      .onItemDrop((event: ItemDragInfo, itemIndex: number, insertIndex: number, isSuccess: boolean) => {
        console.info('List onItemDrop');
        if (!isSuccess || insertIndex >= this.numbers.length) {
          return;
        }
        this.changeIndex(itemIndex, insertIndex);
        this.message += `\n List onItemDrop, event: ${JSON.stringify(event)}, itemIndex: ${itemIndex.toString()}, insertIndex: ${insertIndex.toString()}, isSuccess: ${isSuccess}`;
      })
      .onScrollVisibleContentChange((start: VisibleListContentInfo, end: VisibleListContentInfo) => {
        console.info('List onScrollVisibleContentChange');
        this.message += `\n List onScrollVisibleContentChange, start: ${JSON.stringify(start)}, end: ${JSON.stringify(end)}`;
      })
      .onScrollFrameBegin((offset: number, state: ScrollState) => {
        console.info('List onScrollFrameBegin');
        this.message += `\n List onScrollFrameBegin, offset: ${offset}, state: ${state}`;
        return { offsetRemain: offset };
      })
      .onScrollIndex((first: number, last: number) => {
        console.info('List onScrollIndex');
        console.info(first.toString());
        console.info(last.toString());
        this.message += `\n List onScrollIndex, first: ${first.toString()}, last: ${last.toString()}`;
      })
      .onWillScroll((scrollOffset: number, scrollState: ScrollState, scrollSource: ScrollSource) => {
        console.info('List onWillScroll');
        this.message += `\n List onWillScroll, scrollOffset: ${scrollOffset.toString()}, scrollState: ${scrollState.toString()}, scrollSource: ${scrollSource.toString()}`;
      })
      .onDidScroll((scrollOffset: number, scrollState: ScrollState) => {
        console.info('List onDidScroll');
        console.info(scrollOffset.toString());
        console.info(scrollState.toString());
        this.message += `\n List onDidScroll, scrollOffset: ${scrollOffset.toString()}, scrollState: ${scrollState.toString()}`;
      })
      .onScrollFrameBegin((offset: number, state: ScrollState) => {
        console.info('List onScrollFrameBegin');
        this.message += `\n List onScrollFrameBegin, offset: ${offset}, state: ${state}`;
        return { offsetRemain: offset };
      })
      .onScrollStart(() => {
        console.info('List onScrollStart');
        this.message += `\n List onScrollStart`;
      })
      .onScrollStop(() => {
        console.info('List onScrollStop');
        this.message += `\n List onScrollStop`;
      })
      .onReachStart(() => {
        console.info('List onReachStart');
        this.message += `\n List onReachStart`;
      })
      .onReachEnd(() => {
        console.info('List onReachEnd');
        this.message += `\n List onReachEnd`;
      })

      Scroll() {
        Text(this.message)
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
      .id(this.name + '_03')
      .friction(0.6)
      .backgroundColor(Color.Yellow)
      .edgeEffect(EdgeEffect.Spring)
      .width('90%')
      .height('16.39%')
      .margin(10)

    }
    .justifyContent(FlexAlign.Center)
    .backgroundColor(Color.Green)
    .width('100%')
    .height('100%')

  }

}

