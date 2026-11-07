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
struct UIComponentListAndGridXommonScrollTo0250 {
  @State name: string = 'UIComponentListAndGridXommonScrollTo0250';
  @State message: string = this.name;
  @State numbers: number[] = [];
  @State gridDirection: GridDirection = GridDirection.Column;
  @State frictionValue: number | Resource = 0.6;
  @State totalCount: number = 30;
  @State itemWidth: number = 100;
  @State itemHeight: number = 100;
  @State gridWidth: Length = 400;
  @State gridHeight: Length = '60%';
  @State edgeEffectValue: EdgeEffect = EdgeEffect.Spring;
  @State canOverScroll: boolean = true;
  @State text: string = 'drag';
  @State gapValue: number = 10;
  @State templateString: string = '1fr 1fr 1fr';
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

      Button('Scroll To')
        .id(this.name + '_01')
        .borderRadius(20)
        .backgroundColor(0x317aff)
        .fontWeight(FontWeight.Bold)
        .margin(10)
        .labelStyle({ overflow: TextOverflow.Clip,
          maxLines: 1,
          minFontSize: 10,
          maxFontSize: 20,
          font: {
            size: 14,
            weight: FontWeight.Bolder,
            family: 'cursive',
            style: FontStyle.Italic
          }
        })
        .onClick(() => {
          this.scroller.scrollTo({
            xOffset: 600,
            yOffset: 2000,
            animation: {
              duration: 1000,
              curve: Curve.Ease,
              canOverScroll: this.canOverScroll
            }
          });
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
      .enableScrollInteraction(true)
      .multiSelectable(false)
      .edgeEffect(this.edgeEffectValue)
      .scrollBar(BarState.On)
      .scrollBarColor(Color.Red)
      .scrollBarWidth(4)
      .layoutDirection(this.gridDirection)
      .supportAnimation(true)
      .editMode(true)
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
