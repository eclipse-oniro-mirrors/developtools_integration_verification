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
struct UIComponentListAndGridXommonScrollTo0480 {
  @State name: string = 'UIComponentListAndGridXommonScrollTo0480';
  @State message: string = this.name;
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
  @State enablePagingValue: boolean = false;
  @State edgeEffectValue: EdgeEffect = EdgeEffect.None;
  @State canOverScroll: boolean = false;
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

      Button('Scroll To')
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
          this.scroller.scrollTo({
            xOffset: 600,
            yOffset: 2000,
            animation: {
              duration: 1000,
              curve: Curve.Ease,
              canOverScroll: this.canOverScroll
            }
          });
        })

      Scroll(this.scroller) {
        Column() {
          ForEach(this.numbers, (item: number) => {
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
            .id(this.name + '_02_' + item.toString())
            .width(this.itemWidth)
            .height(this.itemHeight)
            .backgroundColor(Color.White)
            .borderRadius(15)
            .margin({
              top: 10
            })

          }, (item: number) => item.toString())
        }
      }
      .id(this.name + '_02')
      .enablePaging(this.enablePagingValue)
      .fadingEdge(this.fadingEdgeEnabled, this.fadingEdgeOptions)
      .friction(this.frictionValue)
      .edgeEffect(this.edgeEffectValue)
      .backgroundColor(Color.Grey)
      .enableScrollInteraction(true)
      .scrollBar(BarState.On)
      .scrollBarColor(Color.Red)
      .scrollBarWidth(4)
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
        console.info('Scroll onScrollFrameBegin');
        this.message += `\n Scroll onScrollFrameBegin, offset: ${offset}, state: ${state}`;
        return { offsetRemain: offset };
      })
      .onWillScroll((xOffset: number, yOffset: number, scrollState: ScrollState) => {
        console.info('Scroll onWillScroll');
        this.message += `\n Scroll onWillScroll, scrollXOffset: ${xOffset.toString()}, scrollYOffset: ${yOffset.toString()}, scrollState: ${scrollState.toString()}`;
      })
      .onDidScroll((xOffset: number, yOffset: number, scrollState: ScrollState) => {
        console.info('Scroll onDidScroll');
        console.info(xOffset.toString());
        console.info(yOffset.toString());
        console.info(scrollState.toString());
        this.message += `\n Scroll onDidScroll, xOffset: ${xOffset.toString()}, yOffset: ${yOffset.toString()}, scrollState: ${scrollState.toString()}`;
      })
      .onScrollStart(() => {
        console.info('Scroll onScrollStart');
        this.message += `\n Scroll onScrollStart`;
      })
      .onScrollStop(() => {
        console.info('Scroll onScrollStop');
        this.message += `\n Scroll onScrollStop`;
      })
      .onReachStart(() => {
        console.info('Scroll onReachStart');
        this.message += `\n Scroll onReachStart`;
      })
      .onReachEnd(() => {
        console.info('Scroll onReachEnd');
        this.message += `\n Scroll onReachEnd`;
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

