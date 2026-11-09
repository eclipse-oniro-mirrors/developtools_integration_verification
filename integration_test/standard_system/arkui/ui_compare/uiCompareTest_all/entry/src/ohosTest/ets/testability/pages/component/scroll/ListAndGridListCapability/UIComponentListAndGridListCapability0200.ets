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
struct UIComponentListAndGridListCapability0200 {
  @State name: string = 'UIComponentListAndGridListCapability0200';
  @State message: string = this.name + ' message:';
  @State numbers: number[] = [];
  @State text: string = 'drag';
  @State listDirection: Axis = Axis.Vertical;
  @State itemWidth: Length = 50;
  @State itemHeight: Length = 50;
  @State itemAspectRatio: number = 2;
  @State listWidth: Length = 400;
  @State listHeight: Length = 300;
  @State listAspectRatio: number = 2;
  listScroller: ListScroller = new ListScroller();

  @Builder pixelMapBuilder() {
    Column() {
      Text(this.text)
        .width(40)
        .height(80)
        .backgroundColor(Color.White)
        .borderRadius(15)
        .fontSize(16)
        .textAlign(TextAlign.Center)
        .margin({
          top: 10
        })
    }
  }

  changeIndex(index1: number, index2: number) {
    let temp: number;
    temp = this.numbers[index1];
    this.numbers[index1] = this.numbers[index2];
    this.numbers[index2] = temp;
  }

  aboutToAppear() {
    for (let i = 0; i < 10; i++) {
      this.numbers.push(i);
    }
  }

  build() {
    Column() {
      Text(this.name)
        .fontSize(20)
        .fontColor(Color.Black)
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
          this.listScroller.scrollPage({
            next: true,
            animation: true
          });
        })

      List({
        initialIndex: 0,
        space: 10,
        scroller: this.listScroller
      }) {

        ListItem() {
          Text('item1')
            .width('100%')
            .height('100%')
            .backgroundColor(Color.White)
            .borderRadius(15)
            .fontSize(16)
            .textAlign(TextAlign.Center)
            .margin({
              top: 10
            })
        }
        .aspectRatio(this.itemAspectRatio)
        .width(this.itemWidth)

        ListItem() {
          Text('item2')
            .width('100%')
            .height('100%')
            .backgroundColor(Color.White)
            .borderRadius(15)
            .fontSize(16)
            .textAlign(TextAlign.Center)
            .margin({
              top: 10
            })
        }
        .aspectRatio(this.itemAspectRatio)
        .width(this.itemWidth)

        ListItem() {
          Text('item3')
            .width('100%')
            .height('100%')
            .backgroundColor(Color.White)
            .borderRadius(15)
            .fontSize(16)
            .textAlign(TextAlign.Center)
            .margin({
              top: 10
            })
        }
        .aspectRatio(this.itemAspectRatio)
        .width(this.itemWidth)

        ListItem() {
          Text('item4')
            .width('100%')
            .height('100%')
            .backgroundColor(Color.White)
            .borderRadius(15)
            .fontSize(16)
            .textAlign(TextAlign.Center)
            .margin({
              top: 10
            })
        }
        .aspectRatio(this.itemAspectRatio)
        .width(this.itemWidth)

      }
      .aspectRatio(this.listAspectRatio)
      .alignListItem(ListItemAlign.Start)
      .id(this.name + '_02')
      .backToTop(true)
      .friction(0.6)
      .backgroundColor(Color.Grey)
      .width(this.listWidth)
      .height(this.listHeight)
      .enableScrollInteraction(true)
      .multiSelectable(false)
      .edgeEffect(EdgeEffect.Spring)
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
