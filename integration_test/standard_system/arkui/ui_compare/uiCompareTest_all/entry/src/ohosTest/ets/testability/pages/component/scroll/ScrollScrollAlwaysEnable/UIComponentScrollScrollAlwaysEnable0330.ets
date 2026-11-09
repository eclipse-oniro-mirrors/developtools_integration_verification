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
struct UIComponentScrollScrollAlwaysEnable0330 {
  @State name: string = 'UIComponentScrollScrollAlwaysEnable0330';
  @State TAG: string = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ALWAYSENABLE_0330';
  @State message: string = this.name;
  @State itemIndex: number = -1;
  @State numbers: number[] = [];
  @State gridDirection: GridDirection = GridDirection.Column;
  @State frictionValue: number | Resource = 0.6;
  @State totalCount: number = 12;
  @State itemWidth: number = 100;
  @State itemHeight: number = 50;
  @State gridWidth: Length = 400;
  @State gridHeight: Length = 300;
  @State edgeEffectValue: EdgeEffect = EdgeEffect.Spring;
  @State canOverScroll: boolean = true;
  @State text: string = 'drag';
  @State gapValue: number = 10;
  @State templateString: string = '1fr 1fr 1fr';
  @State enableScrollInteractionValue: boolean = true;
  @State alwaysEnableValue: boolean = false;
  columnCount: number = 3;
  itemCount: number = 0;
  rowCount: number = 0;
  scroller: Scroller = new Scroller();

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
    for (let i = 0;i < this.totalCount; i++) {
      this.numbers.push(i);
    }
    this.rowCount = Math.ceil(this.totalCount / this.columnCount);
  }

  changeIndex(index1: number, index2: number) {
    let temp: number;
    temp = this.numbers[index1];
    this.numbers[index1] = this.numbers[index2];
    this.numbers[index2] = temp;
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
        .height(50)
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
              this.gridHeight = 150;
              screenClass.setOrientation(screen.Orientation.HORIZONTAL, (err: BusinessError) => {
                const errCode: number = err.code;
                if (errCode) {
                  console.error(`[${this.TAG}_testpage]: Failed to set the horizontal orientation. Code:${err.code},message is ${err.message}`);
                  return;
                }
                console.info(`[${this.TAG}_testpage]: Succeeded in setting the horizontal orientation.`);
              });
            } else if (screenClass.orientation == screen.Orientation.HORIZONTAL) {
              this.gridHeight = 300;
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
                this.gridHeight = 300;
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
          .id(this.name + '_02_' + item.toString())
          .width(this.itemWidth)
          .height(this.itemHeight)
          .enabled(true)
        }, (item: number) => item.toString())
      }
      .id(this.name + '_02')
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

      Text('get item index: ' + this.itemIndex)
        .fontSize(20)
        .fontColor(Color.White)
        .fontWeight(FontWeight.Bold)
        .fontStyle(FontStyle.Normal)
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

      Scroll() {
        Text(this.message)
          .fontSize(10)
          .fontColor(Color.Red)
          .fontStyle(FontStyle.Normal)
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
    .backgroundColor(Color.Green)
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}
