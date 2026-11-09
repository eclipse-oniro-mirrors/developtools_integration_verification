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
struct UIComponentListAndGridGridLayout0170193 {
  @State name: string = 'UIComponentListAndGridGridLayout0170193';
  @State message: string = this.name;
  @State numbers: number[] = [];
  scroller: Scroller = new Scroller();
  @State originColor: ResourceColor = 0xF9CF93;
  @State actualColor: ResourceColor = this.originColor;
  @State originColors: ResourceColor[] = [];
  @State actualColors: ResourceColor[] = [];
  @State text: string = 'drag';
  columnCount: number = 5;
  itemCount: number = 0;
  rowCount: number = 0;
  itemHeight: number = 80;
  rowsGap: number = 15;

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
    for (let i = 0;i < 9; i++) {
      this.itemCount++;
      this.numbers.push(i);
      this.originColors.push(0xF9CF93);
      this.actualColors.push(0xF9CF93);
    }
    this.rowCount = Math.ceil(this.itemCount / this.columnCount);
  }

  changeIndex(index1: number, index2: number) {
    let temp: number;
    temp = this.numbers[index1];
    this.numbers[index1] = this.numbers[index2];
    this.numbers[index2] = temp;
  }

  build() {
    Column() {
      Text(this.message)
        .fontSize(20)
        .fontColor(Color.Pink)
        .fontWeight(FontWeight.Medium)
        .fontStyle(FontStyle.Italic)
        .textAlign(TextAlign.Center)
        .width('90%')
        .height(100)
        .border({ width: 1 })
        .lineHeight(20)
        .maxLines(2)
        .margin({
          left: 6,
          right: 6,
          top: 10,
          bottom: 10
        })

      Button('next page')
        .id(this.name + '_01')
        .borderRadius(20)
        .backgroundColor(0x317aff)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin(10)
        .onClick(() => {
          this.scroller.scrollPage({
            next: true,
            animation: true
          });
        })

      Grid(this.scroller) {
        ForEach(this.numbers, (day: number) => {
          GridItem() {
            Text(day.toString())
              .fontSize(16)
              .backgroundColor(0xF9CF93)
              .width('100%')
              .height(this.itemHeight)
              .textAlign(TextAlign.Center)
          }
          .backgroundColor(this.actualColors[day])
          .onSelect((isSelect: boolean) => {
            if (isSelect) {
              this.message += `\n Grid item ${day} selected`;
              this.actualColors[day] = Color.Orange;
            } else {
              this.message += `\n Grid item ${day} unselected`;
              this.actualColors[day] = this.originColors[day];
            }
          })
        }, (day: number) => day.toString())
      }
      .id(this.name + '_03')
      .columnsTemplate('1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr 1fr')
      .columnsGap(20)
      .rowsGap(this.rowsGap)
      .friction(0.6)
      .enableScrollInteraction(true)
      .supportAnimation(false)
      .multiSelectable(true)
      .edgeEffect(EdgeEffect.Spring)
      .scrollBar(BarState.On)
      .scrollBarColor(Color.Red)
      .scrollBarWidth(4)
      .width('41.67%')
      .backgroundColor(Color.Grey)
      .height('24.59%')
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
          totalOffset: (index / this.columnCount) * (this.itemHeight + this.rowsGap) - offset,
          totalLength: this.itemHeight * this.rowCount + this.rowsGap * (this.rowCount - 1)
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
      .id(this.name + '_04')
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
