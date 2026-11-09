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


class WaterFlowDataSource implements IDataSource {
  private listeners: DataChangeListener[] = [];
  private dataArray: number[] = [];

  constructor(data: number[] = []) {
    this.dataArray = data;
  }

  public getData(index: number): number {
    return this.dataArray[index];
  }

  notifyDataReload(): void {
    this.listeners.forEach(listener => listener.onDataReloaded());
  }

  notifyDataAdd(index: number): void {
    this.listeners.forEach(listener => listener.onDataAdd(index));
  }

  notifyDataChange(index: number): void {
    this.listeners.forEach(listener => listener.onDataChange(index));
  }

  notifyDataDelete(index: number): void {
    this.listeners.forEach(listener => listener.onDataDelete(index));
  }

  notifyDataMove(from: number, to: number): void {
    this.listeners.forEach(listener => listener.onDataMove(from, to));
  }

  notifyDatasetChange(operations: DataOperation[]): void {
    this.listeners.forEach(listener => listener.onDatasetChange(operations));
  }

  totalCount(): number {
    return this.dataArray.length;
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      this.listeners.push(listener);
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      this.listeners.splice(pos, 1);
    }
  }

  addItem(): number {
    const newValue = this.dataArray.length;
    const insertIndex = this.dataArray.length;
    this.dataArray.push(newValue);
    this.notifyDataAdd(insertIndex);
    return newValue;
  }

  deleteItem(index: number): boolean {
    if (index < 0 || index >= this.dataArray.length) {
      return false;
    }
    this.dataArray.splice(index, 1);
    this.notifyDataDelete(index);
    return true;
  }

  swapItems(fromIndex: number, toIndex: number): boolean {
    if (fromIndex < 0 || toIndex < 0 || fromIndex >= this.dataArray.length || toIndex >= this.dataArray.length || fromIndex === toIndex) {
      return false;
    }
    const temp = this.dataArray[fromIndex];
    this.dataArray[fromIndex] = this.dataArray[toIndex];
    this.dataArray[toIndex] = temp;
    this.notifyDataMove(fromIndex, toIndex);
    this.notifyDataChange(fromIndex);
    this.notifyDataChange(toIndex);
    return true;
  }

  indexOf(value: number): number {
    return this.dataArray.indexOf(value);
  }
}

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
struct UIComponentWaterFlowSldingWindow0060 {
  @State name: string = 'UIComponentWaterFlowSldingWindow0060';
  @State message: string = this.name;
  @State itemIndex: number = -1;
  @State numbers: number[] = [];
  dataSource: WaterFlowDataSource = new WaterFlowDataSource(this.numbers);
  @State gutterValue: Dimension = 10;
  @State waterFlowDirection: FlexDirection = FlexDirection.Column;
  @State itemWidth: Length = 100;
  @State itemHeight: Length = 100;
  @State waterFlowWidth: Length = 400;
  @State waterFlowHeight: Length = 300;
  @State gapValue: number | string = 10;
  @State frictionValue: number | Resource = 0.6;
  @State totalCount: number = 15;
  @State sec1Count: number = 5;
  @State sec2Count: number = 5;
  @State sec3Count: number = 3;
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

  aboutToAppear() {
    for (let i = 0; i < this.totalCount; i++) {
      this.numbers.push(i);
    }
    this.dataSource.notifyDataReload();

    const sec1: SectionOptions = {
      itemsCount: this.sec1Count,
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

    const usedCount: number = this.sec1Count + this.sec2Count + this.sec3Count;
    const remainCount: number = Math.max(this.totalCount - usedCount, 0);

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

    this.sections.splice(0, 0, sectionsArr);
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
    return this.dataSource.swapItems(fromIndex, toIndex);
  }

  resetDragState() {
    this.dragFromIndex = -1;
    this.dragToIndex = -1;
  }

  deleteLazyItem(index: number) {
    if (!this.dataSource.deleteItem(index)) {
      this.message += `\n delete lazy item fail, index: ${index}`;
      return;
    }
    this.totalCount = this.numbers.length;
    this.message += `\n delete lazy item success, index: ${index}`;
    this.resetDragState();
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

      Button('delete lazy item')
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
          const targetIndex = this.numbers.length - 1;
          if (targetIndex < 0) {
            this.message += `\n no lazy item to delete`;
            return;
          }
          this.deleteLazyItem(targetIndex);
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

      WaterFlow({
        layoutMode: WaterFlowLayoutMode.SLIDING_WINDOW,
        scroller: this.scroller,
        // sections: this.sections,
        // footer: this.footerCustomBuilder,
        // footerContent: this.GetFooter('footerContent')
      }) {
        FlowItem() {
          Stack() {
            Text('顶部单独FlowItem')
              .width('100%')
              .height('100%')
              .fontColor(Color.White)
              .fontSize(18)
              .textAlign(TextAlign.Center)
          }
          .width('100%')
          .height('100%')
          .backgroundColor(Color.Blue)
          .borderRadius(15)
          .margin({
            top: 10
          })
        }
        .id(this.name + '_topFlowItem')
        .width(this.itemWidth)
        .height(this.itemHeight)

        LazyForEach(this.dataSource, (item: number, currentIndex: number) => {
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
            .backgroundColor(this.getItemBackground(currentIndex))
            .borderRadius(15)
            .margin({
              top: 10
            })
          }
          .id(this.name + '_02_' + item.toString())
          .width(this.itemWidth)
          .height(this.itemHeight)
          .draggable(true)
          .onPreDrag((status: PreDragStatus) => {
            this.message += `\n item ${item} onPreDrag (index: ${currentIndex}, status: ${status})`;
          })
          .onDragStart(() => {
            this.dragFromIndex = currentIndex;
            this.dragToIndex = currentIndex;
            this.message += `\n item ${item} onDragStart (index: ${currentIndex})`;
          })
          .onDragEnter(() => {
            this.dragToIndex = currentIndex;
            this.message += `\n item ${item} onDragEnter (index: ${currentIndex})`;
          })
          .onDragMove((event: DragEvent) => {
            this.dragToIndex = currentIndex;
            this.message += `\n item ${item} onDragMove (index: ${currentIndex}, x: ${event.getWindowX()}, y: ${event.getWindowY()})`;
          })
          .onDragLeave(() => {
            if (this.dragToIndex === currentIndex) {
              this.dragToIndex = -1;
            }
            this.message += `\n item ${item} onDragLeave (index: ${currentIndex})`;
          })
          .onDrop(() => {
            if (this.swapItems(this.dragFromIndex, currentIndex)) {
              this.message += `\n item ${item} onDrop. From index: ${this.dragFromIndex}, To index: ${currentIndex}`;
            }
            this.resetDragState();
          })
          .onDragEnd((event: DragEvent) => {
            this.message += `\n item ${item} onDragEnd (index: ${currentIndex}, result: ${event.getResult()})`;
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
      .padding({
        top: 10,
        bottom: 10,
        left: 5,
        right: 5
      })
      .safeAreaPadding({
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

