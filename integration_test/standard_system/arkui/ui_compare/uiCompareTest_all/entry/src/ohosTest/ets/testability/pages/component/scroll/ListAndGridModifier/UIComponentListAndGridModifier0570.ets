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

class ModifierUIComponentListAndGridModifier0570 implements AttributeModifier<ListAttribute> {
  private boolValue: boolean = true;

  constructor(boolValue: boolean) {
    this.boolValue = boolValue;
  }

  applyNormalAttribute(instance: ListAttribute): void {
    instance.multiSelectable(this.boolValue);
  }
}

@Entry
@Component
struct UIComponentListAndGridModifier0570 {
  @State name: string = 'UIComponentListAndGridModifier0570';
  @State message: string = this.name;
  @State numbers1: number[] = [];
  @State originColors1: ResourceColor[] = [];
  @State actualColors1: ResourceColor[] = [];
  @State numbers2: number[] = [];
  @State originColors2: ResourceColor[] = [];
  @State actualColors2: ResourceColor[] = [];
  @State text: string = 'drag';
  @State gutterValue: Dimension = 10;
  @State listDirection: Axis = Axis.Vertical;
  @State frictionValue: number | Resource = 0.6;
  @State totalCount: number = 30;
  @State itemWidth: Length = 50;
  @State itemHeight: Length = 50;
  @State listWidth: Length = 150;
  @State listHeight: Length = 300;
  @State spaceValue: number | string = 10;
  @State edgeEffectValue: EdgeEffect = EdgeEffect.Spring;
  @State canOverScroll: boolean = true;
  @State groupIndices: number[] = [];
  @State boolValue: boolean = false;
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
        .width(100)
        .height('90%')
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
        .width(100)
        .height('90%')
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
    Text(`Group ${groupIndex + 1} Header`)
      .fontSize(18)
      .fontColor(Color.White)
      .fontWeight(FontWeight.Bold)
      .fontStyle(FontStyle.Normal)
      .textAlign(TextAlign.Start)
      .backgroundColor(0x3366CC)
      .width('100%')
      .height(40)
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
    Text(`Group ${groupIndex + 1} Footer`)
      .fontSize(18)
      .fontColor(Color.White)
      .fontWeight(FontWeight.Bold)
      .fontStyle(FontStyle.Normal)
      .textAlign(TextAlign.Start)
      .backgroundColor(0x3366CC)
      .width('100%')
      .height(40)
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
    temp = this.numbers1[index1];
    this.numbers1[index1] = this.numbers1[index2];
    this.numbers1[index2] = temp;
  }

  aboutToAppear() {
    for (let i = 0; i < this.totalCount; i++) {
      this.numbers1.push(i);
      this.originColors1.push(Color.White);
      this.actualColors1.push(Color.White);
      this.numbers2.push(i);
      this.originColors2.push(Color.White);
      this.actualColors2.push(Color.White);
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

      Button('Change boolValue: ' + this.boolValue)
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
          this.boolValue = !this.boolValue;
        })

      Row() {
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
              ForEach(this.numbers1.slice(groupIndex * 5, Math.min((groupIndex + 1) * 5, this.totalCount)), (item: number) => {
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
                  .backgroundColor(Color.Transparent)
                  .borderRadius(15)
                  .margin({
                    top: 10
                  })
                }
                .backgroundColor(this.actualColors1[item])
                .id(this.name + '_02_' + item.toString())
                .width(this.itemWidth)
                .height(this.itemHeight)
                .enabled(true)
                .selectable(true)
                .onSelect((isSelect: boolean) => {
                  if (isSelect) {
                    this.message += `\n List item ${item} selected`;
                    this.actualColors1[item] = Color.Orange;
                  } else {
                    this.message += `\n List item ${item} unselected`;
                    this.actualColors1[item] = this.originColors1[item];
                  }
                })
              }, (item: number) => item.toString())
            }

          }, (groupIndex: number) => groupIndex.toString())
        }
        .attributeModifier(new ModifierUIComponentListAndGridModifier0570(this.boolValue))
        .alignListItem(ListItemAlign.Center)
        .id(this.name + '_02')
        .enabled(true)
        .backToTop(true)
        .friction(this.frictionValue)
        .backgroundColor(Color.Grey)
        .width(this.listWidth)
        .height(this.listHeight)
        .edgeEffect(this.edgeEffectValue)
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
              ForEach(this.numbers2.slice(groupIndex * 5, Math.min((groupIndex + 1) * 5, this.totalCount)), (item: number) => {
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
                  .backgroundColor(Color.Transparent)
                  .borderRadius(15)
                  .margin({
                    top: 10
                  })
                }
                .backgroundColor(this.actualColors2[item])
                .id(this.name + '_03_' + item.toString())
                .width(this.itemWidth)
                .height(this.itemHeight)
                .enabled(true)
                .selectable(true)
                .onSelect((isSelect: boolean) => {
                  if (isSelect) {
                    this.message += `\n List item ${item} selected`;
                    this.actualColors2[item] = Color.Orange;
                  } else {
                    this.message += `\n List item ${item} unselected`;
                    this.actualColors2[item] = this.originColors2[item];
                  }
                })
              }, (item: number) => item.toString())
            }

          }, (groupIndex: number) => groupIndex.toString())
        }
        .attributeModifier(new ModifierUIComponentListAndGridModifier0570(this.boolValue))
        .alignListItem(ListItemAlign.Center)
        .id(this.name + '_03')
        .enabled(true)
        .backToTop(true)
        .friction(this.frictionValue)
        .backgroundColor(Color.Grey)
        .width(this.listWidth)
        .height(this.listHeight)
        .edgeEffect(this.edgeEffectValue)
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
          this.text = this.numbers2[itemIndex].toString();
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
          if (!isSuccess || insertIndex >= this.numbers2.length) {
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
      .id(this.name + '_04')
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
