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
import { LengthUnit } from '@kit.ArkUI';

@Entry
@Component
struct UIComponentListAndGridXommonOnScroll0050 {
  @State name: string = 'UIComponentListAndGridXommonOnScroll0050';
  @State message: string = this.name;
  @State logMessage: string = '';
  @State itemIndex: number = -1;
  @State numbers: number[] = [];
  @State itemWidth: Length = 100;
  @State itemHeight: Length = 100;
  @State scrollWidth: Length = 400;
  @State scrollHeight: Length = 300;
  @State frictionValue: number | Resource = 0.6;
  @State totalCount: number = 10;
  @State fadingLength: number = 20;
  @State fadingEdgeEnabled: boolean | undefined | null = true;
  @State fadingEdgeOptions: FadingEdgeOptions = {
    fadingEdgeLength: {
      value: this.fadingLength,
      unit: LengthUnit.VP
    }
  };
  @State spaceValue: number | string = 10;
  @State enablePagingValue: boolean = false;
  scroller: Scroller = new Scroller();

  aboutToAppear() {
    for (let i = 0; i < this.totalCount; i++) {
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

      List({
        initialIndex: 0,
        space: this.spaceValue,
        scroller: this.scroller
      }) {
        ForEach(this.numbers, (item: number) => {
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
      .fadingEdge(this.fadingEdgeEnabled, this.fadingEdgeOptions)
      .friction(this.frictionValue)
      .edgeEffect(EdgeEffect.Fade)
      .backgroundColor(Color.Grey)
      .enableScrollInteraction(true)
      .scrollBar(BarState.On)
      .scrollBarColor(Color.Red)
      .scrollBarWidth(20)
      .backToTop(true)
      .width(this.scrollWidth)
      .height(this.scrollHeight)
      .margin({
        top: 10,
        bottom: 10,
        left: 5,
        right: 5
      })
      .onScrollFrameBegin((offset: number, state: ScrollState) => {
        console.info('List onScrollFrameBegin');
        this.message += `\n List onScrollFrameBegin, offset: ${offset}, state: ${state}`;
        return { offsetRemain: offset };
      })
      .onWillScroll((scrollOffset: number, scrollState: ScrollState, scrollSource: ScrollSource) => {
        console.info('List onWillScroll');
        this.message += `\n List onWillScroll, scrollOffset: ${scrollOffset.toString()}, scrollState: ${scrollState.toString()}, scrollSource: ${scrollSource.toString()}`;
        this.logMessage += `\n List onWillScroll, scrollOffset: ${scrollOffset.toString()}, scrollState: ${scrollState.toString()}, scrollSource: ${scrollSource.toString()}`;
      })
      .onDidScroll((scrollOffset: number, scrollState: ScrollState) => {
        console.info('List onDidScroll');
        console.info(scrollOffset.toString());
        console.info(scrollState.toString());
        this.message += `\n List onDidScroll, scrollOffset: ${scrollOffset.toString()}, scrollState: ${scrollState.toString()}`;
        this.logMessage += `\n List onDidScroll, scrollOffset: ${scrollOffset.toString()}, scrollState: ${scrollState.toString()}`;
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
        Text(this.logMessage)
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

