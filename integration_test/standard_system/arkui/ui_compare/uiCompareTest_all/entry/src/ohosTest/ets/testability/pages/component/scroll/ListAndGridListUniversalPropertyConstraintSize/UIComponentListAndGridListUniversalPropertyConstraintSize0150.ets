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
struct UIComponentListAndGridListUniversalPropertyConstraintSize0150 {
  @State name: string = 'UIComponentListAndGridListUniversalPropertyConstraintSize0150';
  @State message: string = this.name;
  @State numbers: number[] = [];
  @State text: string = 'drag';
  @State gutterValue: Dimension = 10;
  @State scrollDirection: ScrollDirection = ScrollDirection.Vertical;
  @State itemWidth: Length = 100;
  @State itemHeight: Length = 50;
  @State scrollFatherWidth: Length = 400;
  @State scrollFatherHeight: Length = 300;
  @State minWidth: Length = 300;
  @State minHeight: Length = 400;
  @State spaceValue: number | string = 10;
  scroller: Scroller = new Scroller();

  aboutToAppear() {
    for (let i = 0; i < 15; i++) {
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
          this.scroller.scrollPage({
            next: true,
            animation: true
          });
        })

      Column() {
        Scroll(this.scroller) {
          Column() {
            ForEach(this.numbers, (item: number) => {
              Text(item.toString())
                .backgroundColor(Color.White)
                .borderRadius(15)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .margin({
                  top: 10
                })
                .id(this.name + '_02_' + item.toString())
                .width(this.itemWidth)
                .height(this.itemHeight)
            }, (item: number) => item.toString())
          }
          .width('100%')
        }
        .id(this.name + '_02')
        .backToTop(true)
        .friction(0.6)
        .backgroundColor(Color.Grey)
        .enableScrollInteraction(true)
        .edgeEffect(EdgeEffect.Spring)
        .scrollBar(BarState.On)
        .scrollBarColor(Color.Red)
        .scrollBarWidth(4)
        .scrollable(this.scrollDirection)
        .constraintSize({
          minWidth: this.minWidth,
          minHeight: this.minHeight
        })
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
        .onWillScroll((xOffset: number, yOffset: number,  scrollState: ScrollState) => {
          console.info('Scroll onWillScroll');
          this.message += `\n Scroll onWillScroll, xOffset: ${xOffset}, yOffset: ${yOffset}, scrollState: ${scrollState}`;
        })
        .onDidScroll((scrollOffset: number, scrollState: ScrollState) => {
          console.info('Scroll onDidScroll');
          console.info(scrollOffset.toString());
          console.info(scrollState.toString());
          this.message += `\n Scroll onDidScroll, scrollOffset: ${scrollOffset.toString()}, scrollState: ${scrollState.toString()}`;
        })
        .onScrollFrameBegin((offset: number, state: ScrollState) => {
          console.info('Scroll onScrollFrameBegin');
          this.message += `\n Scroll onScrollFrameBegin, offset: ${offset}, state: ${state}`;
          return { offsetRemain: offset };
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
      }
      .width(this.scrollFatherWidth)
      .height(this.scrollFatherHeight)
      .margin({
        bottom: 50
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

