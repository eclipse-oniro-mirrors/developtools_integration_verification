/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct UIComponentAlphabetIndexerAttributeWatch0630 {
  @State name: string = 'UIComponentAlphabetIndexerAttributeWatch0630';
  @State message: string = this.name;
  @State arrayA: string[] = ['安'];
  @State arrayB: string[] = ['卜', '白', '包', '毕', '丙'];
  @State arrayC: string[] = ['曹', '成', '陈', '催'];
  @State arrayL: string[] = ['刘', '李', '楼', '梁', '雷', '吕', '柳', '卢'];
  @State indexArray: string[] = ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G',
    'H', 'I', 'J', 'K', 'L', 'M', 'N',
    'O', 'P', 'Q', 'R', 'S', 'T', 'U',
    'V', 'W', 'X', 'Y', 'Z'];
  @State indexLength: number = this.indexArray.length;
  @State autoCollapseParam: boolean = false;
  @State popupBackgroundBlurStyleParam: BlurStyle = BlurStyle.NONE;
  @State colorParam: ResourceColor = Color.Gray;
  @State selectedColorParam: ResourceColor = 0xFFFFFF;
  @State selectedBackgroundColorParam: ResourceColor = 0xCCCCCC;
  @State popupBackgroundParam: ResourceColor = 0xFAEEE0;
  @State usingPopupParam: boolean = true;
  @State selectedFontParam: Font = {
    size: 16,
    style: FontStyle.Normal,
    weight: FontWeight.Bolder
  };
  @State fontParam: Font = {
    size: 10,
    style: FontStyle.Normal,
    weight: FontWeight.Medium,
  };
  @State popupFontParam: Font = {
    size: 30,
    style: FontStyle.Normal,
    weight: FontWeight.Bolder
  };
  @State selectedParam: number = 0;
  @State widthParam: Length = 'auto';

  listScroller: ListScroller = new ListScroller();

  build() {
    Column() {
      Text(this.name)
        .fontSize(20)
        .fontColor(Color.Black)
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

      Button('Set index length: 30')
        .id(this.name + '_01')
        .borderRadius(20)
        .backgroundColor(0x317aff)
        .fontWeight(FontWeight.Bold)
        .margin(10)
        .labelStyle({
          overflow: TextOverflow.Clip,
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
          if (this.indexLength < 30) {
            let newIndex = this.indexLength;
            for (let i = this.indexLength; i < 30; i++) {
              this.indexArray.push(newIndex.toString());
              newIndex++;
              this.indexLength++;
            }
          }
        })

      Stack({
        alignContent: Alignment.Start
      }) {
        Row() {
          List({
            space: 20,
            initialIndex: 0,
            scroller: this.listScroller
          }) {
            ForEach(this.arrayA, (item: string) => {
              ListItem() {
                Text('A:' + item)
                  .width('50%')
                  .height('5%')
                  .fontSize(15)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(Color.White)
                  .borderRadius(50)
              }
            }, (item: string) => item)

            ForEach(this.arrayB, (item: string) => {
              ListItem() {
                Text('B:' + item)
                  .width('50%')
                  .height('5%')
                  .fontSize(15)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(Color.White)
                  .borderRadius(50)
              }
            }, (item: string) => item)

            ForEach(this.arrayC, (item: string) => {
              ListItem() {
                Text('C:' + item)
                  .width('50%')
                  .height('5%')
                  .fontSize(15)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(Color.White)
                  .borderRadius(50)
              }
            }, (item: string) => item)

            ForEach(this.arrayL, (item: string) => {
              ListItem() {
                Text('L:' + item)
                  .width('50%')
                  .height('5%')
                  .fontSize(15)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(Color.White)
                  .borderRadius(50)
              }
            }, (item: string) => item)
          }
          .id(this.name + '_02_1')
          .width('50%')
          .height('100%')
          .sticky(StickyStyle.Header | StickyStyle.Footer)
          .multiSelectable(true)
          .alignListItem(ListItemAlign.Start)
          .backToTop(true)
          .friction(0.6)
          .backgroundColor(Color.Grey)
          .enableScrollInteraction(true)
          .edgeEffect(EdgeEffect.Spring)
          .scrollBar(BarState.On)
          .scrollBarColor(Color.Red)
          .scrollBarWidth(4)
          .listDirection(Axis.Vertical)
          .margin({
            top: 10,
            bottom: 10,
            left: 5,
            right: 5
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

          AlphabetIndexer({
            arrayValue: this.indexArray,
            selected: 0
          })
            .id(this.name + '_02_2')
            .width(this.widthParam)
            .autoCollapse(this.autoCollapseParam)
            .enableHapticFeedback(false)
            .color(this.colorParam)
            .selectedColor(this.selectedColorParam)
            .popupColor(0xFFFAF0)
            .selectedBackgroundColor(this.selectedBackgroundColorParam)
            .popupBackground(this.popupBackgroundParam)
            .usingPopup(this.usingPopupParam)
            .font(this.fontParam)
            .selectedFont(this.selectedFontParam)
            .popupFont(this.popupFontParam)
            .popupItemFont({
              size: 24,
              style: FontStyle.Normal,
              weight: FontWeight.Medium
            })
            .itemSize(28)
            .alignStyle(IndexerAlign.Left)
            .selected(this.selectedParam)
            .popupPosition({
              x: 40,
              y: 50
            })
            .popupItemBorderRadius(24)
            .itemBorderRadius(14)
            .popupBackgroundBlurStyle(this.popupBackgroundBlurStyleParam)
            .popupTitleBackground(0xCCCCCC)
            .popupSelectedColor(0x00FF00)
            .popupUnselectedColor(0x0000FF)
            .popupItemFont({
              size: 30,
              style: FontStyle.Normal,
              weight: FontWeight.Medium
            })
            .popupItemBackgroundColor(0xCCCCCC)
            .onSelect((index: number) => {
              this.message += `\n AlphabetIndexer onSelect: ${index}`;
            })
            .onRequestPopupData((index: number) => {
              this.message += `\n AlphabetIndexer onRequestPopupData: ${index}`;
              let array: string[] = [];
              switch (this.indexArray[index]) {
                case 'A':
                  array = this.arrayA;
                  this.message += `, return arrayA.`;
                  break;
                case 'B':
                  array = this.arrayB;
                  this.message += `, return arrayB.`;
                  break;
                case 'C':
                  array = this.arrayC;
                  this.message += `, return arrayC.`;
                  break;
                case 'L':
                  array = this.arrayL;
                  this.message += `, return arrayL.`;
                  break;
                default:
                  array = [];
                  this.message += `, return empty array.`;
              }
              return array;
            })
            .onPopupSelect((index: number) => {
              this.message += `\n AlphabetIndexer onPopupSelected: ${index}`;
            })
        }
        .id(this.name + '_02')
        .justifyContent(FlexAlign.Center)
        .width('100%')
        .height('60%')
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
      .id(this.name + '_03')
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
  }
}
