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
import { LengthMetrics, LengthUnit } from '@kit.ArkUI';

@Entry
@Component
struct UIComponentListAndGridWaterFlowFadingEdge0190 {
  @State name: string = 'UIComponentListAndGridWaterFlowFadingEdge0190';
  @State message: string = this.name;
  @State numbers: number[] = [];
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
  @State fadingLength: number = 50;
  @State fadingEdgeEnabled: boolean | undefined | null = true;
  @State fadingEdgeOptions: FadingEdgeOptions = {
    fadingEdgeLength: {
      value: this.fadingLength,
      unit: LengthUnit.VP
    }
  };
  @State templateString: string = '1fr 1fr';
  scroller: Scroller = new Scroller();

  aboutToAppear() {
    for (let i = 0; i < this.totalCount; i++) {
      this.numbers.push(i);
    }

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

      Tabs() {
        TabContent() {
          WaterFlow({
            scroller: this.scroller,
            sections: this.sections,
          }) {
            ForEach(this.numbers, (item: number) => {
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
                .backgroundColor(Color.White)
                .borderRadius(15)
                .margin({
                  top: 10
                })
              }
              .id(this.name + '_02_' + item.toString())
              .width(this.itemWidth)
              .height(this.itemHeight)
            }, (item: number) => item.toString())
          }
          .id(this.name + '_02')
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
          .margin({
            top: 10,
            bottom: 10,
            left: 5,
            right: 5
          })
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
        }
      }
      .backgroundColor('#DCDCDC')
      .width('90%')
      .height('50%')
      .edgeEffect(EdgeEffect.Spring)
      .margin({
        top: 10,
        bottom: 10,
        left: 5,
        right: 5
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

