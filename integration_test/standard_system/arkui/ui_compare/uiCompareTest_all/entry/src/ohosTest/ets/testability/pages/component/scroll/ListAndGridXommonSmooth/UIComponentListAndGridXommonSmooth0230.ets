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
struct UIComponentListAndGridXommonSmooth0230 {
  @State name: string = 'UIComponentListAndGridXommonSmooth0230';
  @State message: string = this.name;
  @State numbers: number[] = [];
  @State waterFlowDirection: FlexDirection = FlexDirection.Column;
  @State itemWidth: Length = 100;
  @State itemHeight: Length = 100;
  @State waterFlowWidth: Length = '100%';
  @State waterFlowHeight: Length = '80%';
  @State gapValue: number | string = 10;
  @State frictionValue: number | Resource = 0.6;
  @State totalCount: number = 15;
  @State templateString: string = '1fr 1fr';
  @State scrollNumber: number = -1;
  @State scrollSmooth: boolean = true;
  @State scrollAlign: ScrollAlign = ScrollAlign.END;
  scroller: Scroller = new Scroller();
  @State loading: boolean = false;

  aboutToAppear() {
    for (let i = 0; i < this.totalCount; i++) {
      this.numbers.push(i);
    }
  }

  loadMoreIfNeeded() {
    if (this.loading) {
      return;
    }
    if (this.numbers.length >= 100) {
      return;
    }
    this.loading = true;
    const start = this.numbers.length;
    const end = Math.min(start + this.totalCount, 100);
    for (let i = start; i < end; i++) {
      this.numbers.push(i);
    }
    this.loading = false;
  }

  build() {
    Column() {
      Text(this.name)
        .fontSize(15)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Medium)
        .fontStyle(FontStyle.Italic)
        .textAlign(TextAlign.Center)
        .width('90%')
        .height('7%')
        .border({ width: 1 })
        .lineHeight(20)
        .maxLines(2)
        .margin({
          left: 6,
          right: 6,
          top: 10,
          bottom: 10
        })

      Button('Scroll To Index')
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
          this.scroller.scrollToIndex(this.scrollNumber, this.scrollSmooth);
        })

      WaterFlow({
        scroller: this.scroller,
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
          .onAppear(() => {
            if (item >= this.numbers.length - 4) {
              this.loadMoreIfNeeded();
            }
          })
        }, (item: number) => item.toString())
      }
      .id(this.name + '_02')
      .columnsTemplate(this.templateString)
      .layoutDirection(this.waterFlowDirection)
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
      .height('10%')
      .margin(10)

    }
    .justifyContent(FlexAlign.Center)
    .backgroundColor(Color.Green)
    .width('100%')
    .height('100%')

  }

}
