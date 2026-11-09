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

interface Info_UIComponentGridEventModifier0140 {
  message: string;
}

class GridModifierUIComponentGridEventModifier0140 implements AttributeModifier<GridAttribute> {
  private info: Info_UIComponentGridEventModifier0140 = {
    message: ''
  };

  constructor(info: Info_UIComponentGridEventModifier0140) {
    this.info = info;
  }

  applyNormalAttribute(instance: GridAttribute): void {
    instance
      .onItemDrop((event: ItemDragInfo, itemIndex: number, insertIndex: number, isSuccess: boolean) => {
        console.info('Grid onItemDrop');
        this.info.message += `\n Grid onItemDrop, event: ${JSON.stringify(event)}, itemIndex: ${itemIndex.toString()}, insertIndex: ${insertIndex.toString()}, isSuccess: ${isSuccess}`;
      })
  }
}


@Entry
@Component
struct UIComponentGridEventModifier0140 {
  @State name: string = 'UIComponentGridEventModifier0140';
  @State message: string = this.name;
  @State info: Info_UIComponentGridEventModifier0140 = {
    message: this.name
  };
  @State modifier: GridModifierUIComponentGridEventModifier0140 = new GridModifierUIComponentGridEventModifier0140(this.info);
  @State numbers: string[] = [];
  scroller: Scroller = new Scroller();
  @State text: string = 'drag';

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
    for (let i = 1;i <= 30; i++) {
      this.numbers.push(i + '');
    }
  }

  changeIndex(index1: number, index2: number) {
    let temp: string;
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
        ForEach(this.numbers, (day: string) => {
          GridItem() {
            Text(day)
              .fontSize(16)
              .backgroundColor(0xF9CF93)
              .width('100%')
              .height(80)
              .textAlign(TextAlign.Center)
          }
        }, (day: string) => day)
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
      .attributeModifier(this.modifier)
      .onItemDragStart((event: ItemDragInfo, itemIndex: number) => {
        this.text = this.numbers[itemIndex];
        return this.pixelMapBuilder();
      })
      .onItemDragEnter((event: ItemDragInfo) => {
        console.info('Grid onItemDragEnter');
        this.info.message += `\n Grid onItemDragEnter, event: ${JSON.stringify(event)}`;
      })
      .onItemDragLeave((event: ItemDragInfo, itemIndex: number) => {
        console.info('Grid onItemDragLeave');
        this.info.message += `\n Grid onItemDragLeave, event: ${JSON.stringify(event)}, itemIndex: ${itemIndex.toString()}`;
      })
      .onItemDragMove((event: ItemDragInfo, itemIndex: number, insertIndex: number) => {
        console.info('Grid onItemDragMove');
        this.info.message += `\n Grid onItemDragMove, event: ${JSON.stringify(event)}, itemIndex: ${itemIndex.toString()}, insertIndex: ${insertIndex.toString()}`;
      })
      .onScrollFrameBegin((offset: number, state: ScrollState) => {
        this.info.message += `\n Grid onScrollFrameBegin, offset: ${offset}, state: ${state}`;
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
        this.info.message += `\n Grid onReachEnd, first: ${first.toString()}, last: ${last.toString()}`;
      })
      .onWillScroll((scrollOffset: number, scrollState: ScrollState, scrollSource: ScrollSource) => {
        console.info('Grid onWillScroll');
        this.info.message += `\n Grid onWillScroll, scrollOffset: ${scrollOffset.toString()}, scrollState: ${scrollState.toString()}, scrollSource: ${scrollSource.toString()}`;
      })
      .onDidScroll((scrollOffset: number, scrollState: ScrollState) => {
        console.info(scrollOffset.toString());
        console.info(scrollState.toString());
        this.info.message += `\n Grid onDidScroll, scrollOffset: ${scrollOffset.toString()}, scrollState: ${scrollState.toString()}`;
      })
      .onScrollFrameBegin((offset: number, state: ScrollState) => {
        this.info.message += `\n Grid onScrollFrameBegin, offset: ${offset}, state: ${state}`;
        return { offsetRemain: offset };
      })
      .onScrollStart(() => {
        this.info.message += `\n Grid onScrollStart`;
      })
      .onScrollStop(() => {
        console.info('Grid onScrollStop');
        this.info.message += `\n Grid onScrollStop`;
      })
      .onReachStart(() => {
        console.info('Grid onReachStart');
        this.info.message += `\n Grid onReachStart`;
      })
      .onReachEnd(() => {
        console.info('Grid onReachEnd');
        this.info.message += `\n Grid onReachEnd`;
      })

      Scroll() {
        Text(this.info.message)
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
