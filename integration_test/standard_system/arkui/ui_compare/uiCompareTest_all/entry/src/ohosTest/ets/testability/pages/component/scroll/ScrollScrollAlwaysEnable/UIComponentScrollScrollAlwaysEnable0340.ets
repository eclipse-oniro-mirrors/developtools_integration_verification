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
import { LengthUnit, screen } from '@kit.ArkUI';

@Entry
@Component
struct UIComponentScrollScrollAlwaysEnable0340 {
  @State name: string = 'UIComponentScrollScrollAlwaysEnable0340';
  @State TAG: string = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ALWAYSENABLE_0340';
  @State message: string = this.name;
  @State numbers: number[] = [];
  @State originColors: ResourceColor[] = [];
  @State actualColors: ResourceColor[] = [];
  @State text: string = 'drag';
  @State gutterValue: Dimension = 10;
  @State listDirection: Axis = Axis.Horizontal;
  @State frictionValue: number | Resource = 0.6;
  @State totalCount: number = 10;
  @State itemWidth: number = 100;
  @State itemHeight: number = 100;
  @State listWidth: Length = 400;
  @State listHeight: Length = 200;
  @State gridWidth: Length = 200;
  @State gridHeight: Length = 200;
  @State scrollWidth: Length = 200;
  @State scrollHeight: Length = 200;
  @State spaceValue: number | string = 10;
  @State edgeEffectValue: EdgeEffect = EdgeEffect.Spring;
  @State alwaysEnableValue: boolean = false;
  @State enableScrollInteractionValue: boolean = true;
  @State canOverScroll: boolean = true;
  @State groupIndices: number[] = [];
  @State dragFromIndex: number = -1;
  @State dragToIndex: number = -1;
  @State gapValue: number = 10;
  @State templateString: string = '1fr';
  @State itemIndex: number = -1;
  @State gridDirection: GridDirection = GridDirection.Column;
  @State fadingLength: number = 20;
  @State fadingEdgeEnabled: boolean | undefined | null = true;
  @State fadingEdgeOptions: FadingEdgeOptions = {
    fadingEdgeLength: {
      value: this.fadingLength,
      unit: LengthUnit.VP
    }
  };
  @State scrollDirection: ScrollDirection = ScrollDirection.Vertical;
  scroller: ListScroller = new ListScroller();
  columnCount: number = 1;
  itemCount: number = 0;
  rowCount: number = 0;

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
    this.rowCount = Math.ceil(this.totalCount / this.columnCount);
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

      Button('Switch screen orientation')
        .id(this.name + '_01')
        .borderRadius(10)
        .backgroundColor(0x317aff)
        .fontWeight(FontWeight.Bold)
        .fontSize(8)
        .margin(5)
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
      .enableScrollInteraction(true)
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

      Row() {

        Grid(this.scroller) {
          ForEach(this.numbers, (item: number) => {
            GridItem() {
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
            .id(this.name + '_03_' + item.toString())
            .width(this.itemWidth)
            .height(this.itemHeight)
            .enabled(true)
          }, (item: number) => item.toString())
        }
        .id(this.name + '_03')
        .columnsTemplate(this.templateString)
        .columnsGap(this.gapValue)
        .rowsGap(this.gapValue)
        .alignItems(GridItemAlignment.DEFAULT)
        .enabled(true)
        .backToTop(true)
        .friction(this.frictionValue)
        .backgroundColor(Color.Grey)
        .width(this.gridWidth)
        .height(this.gridHeight)
        .enableScrollInteraction(this.enableScrollInteractionValue)
        .multiSelectable(false)
        .edgeEffect(this.edgeEffectValue, {alwaysEnabled: this.alwaysEnableValue})
        .scrollBar(BarState.On)
        .scrollBarColor(Color.Red)
        .scrollBarWidth(4)
        .layoutDirection(this.gridDirection)
        .supportAnimation(true)
        .editMode(true)
        .gesture(
          PanGesture()
            .onActionUpdate((event: GestureEvent) => {
              if (event.fingerList[0] != undefined && event.fingerList[0].localX != undefined && event.fingerList[0].localY != undefined) {
                this.itemIndex = this.scroller.getItemIndex(event.fingerList[0].localX, event.fingerList[0].localY);
                this.message += `\n item index: ${this.itemIndex} onActionUpdate in PanGesture.`;
              }
            })
        )
        .gesture(
          TapGesture({
            count: 1,
            fingers: 1
          })
            .onAction((event: GestureEvent) => {
              if (event.fingerList[0] != undefined && event.fingerList[0].localX != undefined && event.fingerList[0].localY != undefined) {
                this.itemIndex = this.scroller.getItemIndex(event.fingerList[0].localX, event.fingerList[0].localY);
                this.message += `\n item index: ${this.itemIndex} onAction in TapGesture.`;
              }
            })
        )
        .onItemDragStart((event: ItemDragInfo, itemIndex: number) => {
          console.info('Grid onItemDragStart');
          this.message += `\n Grid onItemDragStart, event: ${JSON.stringify(event)}, itemIndex: ${itemIndex.toString()}`;
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
          console.info('Grid onItemDrop');
          if (!isSuccess || insertIndex >= this.numbers.length) {
            return;
          }
          this.changeIndex(itemIndex, insertIndex);
          this.message += `\n Grid onItemDrop, event: ${event.toString()}, itemIndex: ${itemIndex.toString()}, insertIndex: ${insertIndex.toString()}, isSuccess: ${isSuccess}`;
        })
        .onScrollFrameBegin((offset: number, state: ScrollState) => {
          console.info('Grid onScrollFrameBegin');
          this.message += `\n Grid onScrollFrameBegin, offset: ${offset}, state: ${state}`;
          return { offsetRemain: offset };
        })
        .onScrollBarUpdate((index: number, offset: number) => {
          console.info('Grid onScrollBarUpdate,index : ' + index.toString() + ',offset' + offset.toString());
          this.message += `\n Grid onScrollBarUpdate, index: ${index.toString()}, offset: ${offset.toString()}`;
          return {
            totalOffset: (index / this.columnCount) * (this.itemHeight + this.gapValue) - offset,
            totalLength: this.itemHeight * this.rowCount + this.gapValue * (this.rowCount - 1)
          };
        })
        .onScrollIndex((first: number, last: number) => {
          console.info(first.toString());
          console.info(last.toString());
          this.message += `\n Grid onScrollIndex, first: ${first.toString()}, last: ${last.toString()}`;
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

        Scroll(this.scroller) {
          Column() {
            ForEach(this.numbers, (item: number, index: number) => {
              Text(item.toString())
                .fontSize(30)
                .fontColor(Color.Red)
                .textAlign(TextAlign.Center)
                .fontWeight(FontWeight.Medium)
                .fontStyle(FontStyle.Italic)
                .border({ width: 1 })
                .lineHeight(20)
                .maxLines(2)
                .margin({
                  left: 5,
                  right: 5,
                  top: 10,
                  bottom: 10
                })
                .id(this.name + '_04_' + item.toString())
                .width(this.itemWidth)
                .height(this.itemHeight)
                .borderRadius(15)
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
            }, (item: number) => item.toString())
          }
        }
        .id(this.name + '_04')
        .fadingEdge(this.fadingEdgeEnabled, this.fadingEdgeOptions)
        .friction(this.frictionValue)
        .edgeEffect(this.edgeEffectValue, {alwaysEnabled: this.alwaysEnableValue})
        .backgroundColor(Color.Grey)
        .enableScrollInteraction(this.enableScrollInteractionValue)
        .scrollable(this.scrollDirection)
        .scrollBar(BarState.On)
        .scrollBarColor(Color.Red)
        .scrollBarWidth(10)
        .backToTop(true)
        .width(this.scrollWidth)
        .height(this.scrollHeight)
        .margin({
          top: 10,
          bottom: 10,
          left: 5,
          right: 5
        })
        .onScrollFrameBegin((offset: number, state: ScrollState) => {
          console.info('Scroll onScrollFrameBegin');
          this.message += `\n Scroll onScrollFrameBegin, offset: ${offset}, state: ${state}`;
          return { offsetRemain: offset };
        })
        .onWillScroll((xOffset: number, yOffset: number, scrollState: ScrollState) => {
          console.info('Scroll onWillScroll');
          this.message += `\n Scroll onWillScroll, scrollXOffset: ${xOffset.toString()}, scrollYOffset: ${yOffset.toString()}, scrollState: ${scrollState.toString()}`;
        })
        .onDidScroll((xOffset: number, yOffset: number, scrollState: ScrollState) => {
          console.info('Scroll onDidScroll');
          console.info(xOffset.toString());
          console.info(yOffset.toString());
          console.info(scrollState.toString());
          this.message += `\n Scroll onDidScroll, xOffset: ${xOffset.toString()}, yOffset: ${yOffset.toString()}, scrollState: ${scrollState.toString()}`;
        })
        .onScrollEdge((side: Edge) => {
          console.info('Scroll onScrollEdge');
          this.message += `\n Scroll onScrollEdge, side: ${side}`;
        })
        .onScrollStart(() => {
          console.info('Scroll onScrollStart');
          this.message += `\n Scroll onScrollStart`;
        })
        .onScrollStop(() => {
          console.info('Scroll onScrollStop');
          this.message += `\n Scroll onScrollStop`;
        })
        .onReachStart(() => {
          console.info('Scroll onReachStart');
          this.message += `\n Scroll onReachStart`;
        })
        .onReachEnd(() => {
          console.info('Scroll onReachEnd');
          this.message += `\n Scroll onReachEnd`;
        })

      }

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
      .id(this.name + '_05')
      .friction(0.6)
      .backgroundColor(Color.Yellow)
      .edgeEffect(EdgeEffect.Spring)
      .width('90%')
      .height('12.3%')
      .margin(10)

    }
    .justifyContent(FlexAlign.Center)
    .backgroundColor(Color.Green)
    .width('100%')
    .height('100%')

  }

}

