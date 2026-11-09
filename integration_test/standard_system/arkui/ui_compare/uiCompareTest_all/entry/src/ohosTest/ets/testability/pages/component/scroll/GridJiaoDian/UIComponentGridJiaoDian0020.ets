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
struct UIComponentGridJiaoDian0020 {
  @State name: string = 'UIComponentGridJiaoDian0020';
  @State message: string = this.name;
  @State numbers: number[] = [];
  scroller: Scroller = new Scroller();
  @State text: string = 'drag';
  @State originColor: ResourceColor = 0xF9CF93;
  @State actualColor: ResourceColor = this.originColor;
  @State originColors: ResourceColor[] = [];
  @State actualColors: ResourceColor[] = [];
  @State originWidth: Length = 80;
  @State actualWidth: Length = this.originWidth;
  @State originHeight: Length = 80;
  @State actualHeight: Length = this.originHeight;
  switchFlag: boolean = false;

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

  build() {
    Column() {
      Text(this.name)
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

      Button('switch size')
        .id(this.name + '_01')
        .borderRadius(20)
        .backgroundColor(0x317aff)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin(10)
        .onClick(() => {
          if (this.switchFlag) {
            this.actualWidth = this.originWidth;
            this.actualHeight = this.originHeight;
            this.switchFlag = false;
          } else {
            this.actualWidth = 100;
            this.actualHeight = 100;
            this.switchFlag = true;
          }
        })

      Grid(this.scroller) {
        GridItem() {
          Text('item')
            .fontSize(16)
            .width('100%')
            .height(80)
            .textAlign(TextAlign.Center)
            .focusable(true)
        }
        .width(this.actualWidth)
        .height(this.actualHeight)
        .backgroundColor(this.actualColor)
        .onFocus(() => {
          this.message += `\n Grid item onFocus`;
          this.actualColor = Color.Orange;
        })
        .onBlur(() => {
          this.message += `\n Grid item onBlur`;
          this.actualColor = this.originColor;
        })
        .focusable(true)

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
        console.info('Grid onItemDrop');
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
