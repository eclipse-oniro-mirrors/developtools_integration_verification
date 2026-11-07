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
import { LengthUnit, ComponentContent } from '@kit.ArkUI';


class FootBuilderParams {
  text: string | Resource;
  constructor(text: string | Resource) {
    this.text = text;
  }
}

@Builder
function footerComponentContent(params: FootBuilderParams) {
  Column() {
    Text(params.text)
      .fontSize(20)
      .height('48vp')
      .padding(10)
      .width('100%')
      .backgroundColor(Color.Orange)
  }
}

@Entry
@Component
struct UIComponentWaterFlowCachedCount0110 {
  @State name: string = 'UIComponentWaterFlowCachedCount0110';
  @State message: string = this.name;
  @State itemIndex: number = -1;
  @State numbers: number[] = [];
  @State gutterValue: Dimension = 10;
  @State waterFlowDirection: FlexDirection = FlexDirection.Column;
  @State itemWidth: Length = 100;
  @State itemHeight: Length = 100;
  @State waterFlowWidth: Length = 400;
  @State waterFlowHeight: Length = 300;
  @State gapValue: number | string = 10;
  @State cachedCountValue: number = 4;
  @State loadMoreCount: number = 3;
  @State loadMoreTimes: number = 0;
  @State frictionValue: number | Resource = 0.6;
  @State totalCount: number = 15;
  @State sec1Count: number = 5;
  @State sec2Count: number = 5;
  @State sec3Count: number = 5;
  @State sections: WaterFlowSections = new WaterFlowSections();
  @State fadingLength: number = 20;
  @State fadingEdgeEnabled: boolean | undefined | null = true;
  @State fadingEdgeOptions: FadingEdgeOptions = {
    fadingEdgeLength: {
      value: this.fadingLength,
      unit: LengthUnit.VP
    }
  };
  @State templateString: string = '1fr 1fr';
  @State clipParam: ContentClipMode | RectShape = ContentClipMode.CONTENT_ONLY;
  @State safeAreaTypeParam: SafeAreaType[] = [SafeAreaType.SYSTEM, SafeAreaType.CUTOUT, SafeAreaType.KEYBOARD];
  @State safeAreaEdgeParam: SafeAreaEdge[] = [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM, SafeAreaEdge.START, SafeAreaEdge.END];
  @State dragFromIndex: number = -1;
  @State dragToIndex: number = -1;
  scroller: Scroller = new Scroller();
  footer?: ComponentContent<FootBuilderParams> = undefined;
  footerParam = new FootBuilderParams('FooterText');

  GetFooter(footerText: string) {
    this.footer = new ComponentContent(this.getUIContext(), wrapBuilder(footerComponentContent), new FootBuilderParams(footerText));
    return this.footer;
  }

  @Builder
  footerCustomBuilder() {
    Column() {
      Text('footer')
        .fontSize(20)
        .height('48vp')
        .padding(10)
        .width('100%')
        .backgroundColor(Color.Pink)
    }
  }

  buildSections(totalCount: number) {
    const sec1: SectionOptions = {
      itemsCount: this.sec1Count,
      crossCount: 5,
      columnsGap: 10,
      rowsGap: 10,
      margin: {
        top: 10,
        bottom: 10,
        left: 10,
        right: 10
      }
    };
    const sec2: SectionOptions = {
      itemsCount: this.sec2Count,
      crossCount: 3,
      columnsGap: 10,
      rowsGap: 10,
      margin: {
        top: 10,
        bottom: 10,
        left: 10,
        right: 10
      }
    };
    const sec3: SectionOptions = {
      itemsCount: this.sec3Count,
      crossCount: 2,
      columnsGap: 10,
      rowsGap: 10,
      margin: {
        top: 10,
        bottom: 10,
        left: 10,
        right: 10
      }
    };

    const usedCount: number = this.sec1Count + this.sec2Count + this.sec3Count;
    const remainCount: number = Math.max(totalCount - usedCount, 0);

    const sectionsArr: SectionOptions[] = [sec1, sec2, sec3];
    if (remainCount > 0) {
      const lastSec: SectionOptions = {
        itemsCount: remainCount,
        crossCount: 1,
        columnsGap: 10,
        rowsGap: 10,
        margin: {
          top: 10,
          bottom: 10,
          left: 10,
          right: 10
        }
      };
      sectionsArr.push(lastSec);
    }

    this.sections = new WaterFlowSections();
    this.sections.splice(0, 0, sectionsArr);
  }

  appendItemsFromEnd() {
    if (this.loadMoreTimes >= 1) {
      this.message += `\n WaterFlow reach end again, no more data appended.`;
      return;
    }
    const start = this.numbers.length;
    for (let i = 0; i < this.loadMoreCount; i++) {
      this.numbers.push(start + i);
    }
    this.loadMoreTimes += 1;
    this.totalCount = this.numbers.length;
    this.buildSections(this.totalCount);
    this.message += `\n WaterFlow reach end add ${this.loadMoreCount} items, total: ${this.totalCount}`;
  }

  aboutToAppear() {
    for (let i = 0; i < this.totalCount; i++) {
      this.numbers.push(i);
    }
    this.buildSections(this.totalCount);
  }

  getItemBackground(index: number): ResourceColor {
    if (index === this.dragToIndex) {
      return Color.Pink;
    }
    if (index === this.dragFromIndex) {
      return Color.Orange;
    }
    return Color.White;
  }

  swapItems(fromIndex: number, toIndex: number): boolean {
    if (fromIndex === -1 || toIndex === -1 || fromIndex === toIndex) {
      return false;
    }
    const temp = this.numbers[fromIndex];
    this.numbers[fromIndex] = this.numbers[toIndex];
    this.numbers[toIndex] = temp;
    return true;
  }

  resetDragState() {
    this.dragFromIndex = -1;
    this.dragToIndex = -1;
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
          this.scroller.scrollPage({
            next: true,
            animation: true
          });
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

      Text('cachedCount: ' + this.cachedCountValue + ', loadMore: ' + this.loadMoreCount)
        .fontSize(16)
        .fontColor(Color.Black)
        .textAlign(TextAlign.Center)
        .width('90%')
        .height(20)
        .margin({
          left: 6,
          right: 6,
          top: 6,
          bottom: 6
        })

      WaterFlow({
        layoutMode: WaterFlowLayoutMode.ALWAYS_TOP_DOWN,
        scroller: this.scroller,
        sections: this.sections,
        // footer: this.footerCustomBuilder,
        // footerContent: this.GetFooter('footerContent')
      }) {
        ForEach(this.numbers, (item: number, index: number) => {
          FlowItem() {
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
            .backgroundColor(this.getItemBackground(index))
            .borderRadius(15)
            .margin({
              top: 10
            })
          }
          .id(this.name + '_02_' + item.toString())
          .width(this.itemWidth)
          .height(this.itemHeight)
          .onAppear(() => {
            this.message += `\n item ${item} onAppear (index: ${index})`;
          })
          .draggable(true)
          .onPreDrag((status: PreDragStatus) => {
            this.message += `\n item ${item} onPreDrag (index: ${index}, status: ${status})`;
          })
          .onDragStart(() => {
            this.dragFromIndex = index;
            this.dragToIndex = index;
            this.message += `\n item ${item} onDragStart (index: ${index})`;
          })
          .onDragEnter(() => {
            this.dragToIndex = index;
            this.message += `\n item ${item} onDragEnter (index: ${index})`;
          })
          .onDragMove((event: DragEvent) => {
            this.dragToIndex = index;
            this.message += `\n item ${item} onDragMove (index: ${index}, x: ${event.getWindowX()}, y: ${event.getWindowY()})`;
          })
          .onDragLeave(() => {
            if (this.dragToIndex === index) {
              this.dragToIndex = -1;
            }
            this.message += `\n item ${item} onDragLeave (index: ${index})`;
          })
          .onDrop(() => {
            if (this.swapItems(this.dragFromIndex, index)) {
              this.message += `\n item ${item} onDrop. From index: ${this.dragFromIndex}, To index: ${index}`;
            }
            this.resetDragState();
          })
          .onDragEnd((event: DragEvent) => {
            this.message += `\n item ${item} onDragEnd (index: ${index}, result: ${event.getResult()})`;
            this.resetDragState();
          })
        }, (item: number) => item.toString())
      }
      .id(this.name + '_02')
      .clipContent(this.clipParam)
      .expandSafeArea(this.safeAreaTypeParam, this.safeAreaEdgeParam)
      .layoutDirection(this.waterFlowDirection)
      .fadingEdge(this.fadingEdgeEnabled, this.fadingEdgeOptions)
      .columnsTemplate(this.templateString)
      .columnsGap(this.gapValue)
      .rowsGap(this.gapValue)
      .cachedCount(this.cachedCountValue)
      .friction(this.frictionValue)
      .edgeEffect(EdgeEffect.Spring)
      .backgroundColor(Color.Grey)
      .enableScrollInteraction(true)
      .scrollBar(BarState.On)
      .scrollBarColor(Color.Red)
      .scrollBarWidth(4)
      .backToTop(true)
      .width(this.waterFlowWidth)
      .height(this.waterFlowHeight)
      .margin({
        top: 10,
        bottom: 10,
        left: 5,
        right: 5
      })
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
      .onScrollIndex((first: number, last: number) => {
        console.info('WaterFlow onScrollIndex');
        console.info(first.toString());
        console.info(last.toString());
        this.message += `\n WaterFlow onScrollIndex, first: ${first.toString()}, last: ${last.toString()}`;
      })
      .onScrollFrameBegin((offset: number, state: ScrollState) => {
        console.info('WaterFlow onScrollFrameBegin');
        this.message += `\n WaterFlow onScrollFrameBegin, offset: ${offset}, state: ${state}`;
        return { offsetRemain: offset };
      })
      .onWillScroll((scrollOffset: number, scrollState: ScrollState, scrollSource: ScrollSource) => {
        console.info('WaterFlow onWillScroll');
        this.message += `\n WaterFlow onWillScroll, scrollOffset: ${scrollOffset.toString()}, scrollState: ${scrollState.toString()}, scrollSource: ${scrollSource.toString()}`;
      })
      .onDidScroll((scrollOffset: number, scrollState: ScrollState) => {
        console.info('WaterFlow onDidScroll');
        console.info(scrollOffset.toString());
        console.info(scrollState.toString());
        this.message += `\n WaterFlow onDidScroll, scrollOffset: ${scrollOffset.toString()}, scrollState: ${scrollState.toString()}`;
      })
      .onScrollStart(() => {
        console.info('WaterFlow onScrollStart');
        this.message += `\n WaterFlow onScrollStart`;
      })
      .onScrollStop(() => {
        console.info('WaterFlow onScrollStop');
        this.message += `\n WaterFlow onScrollStop`;
      })
      .onReachStart(() => {
        console.info('WaterFlow onReachStart');
        this.message += `\n WaterFlow onReachStart`;
      })
      .onReachEnd(() => {
        console.info('WaterFlow onReachEnd');
        this.message += `\n WaterFlow onReachEnd`;
        this.appendItemsFromEnd();
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
