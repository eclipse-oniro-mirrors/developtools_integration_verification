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
struct UIComponentGridClipComent0010 {
  @State name: string = 'UIComponentGridClipComent0010';
  @State message: string = this.name;
  @State numbers: String[] = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  @State nextValue: boolean = true;
  scroller: Scroller = new Scroller();

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
            next: this.nextValue,
            animation: true
          });
        })

      Button('change next value')
        .id(this.name + '_02')
        .borderRadius(20)
        .backgroundColor(0x317aff)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin(10)
        .onClick(() => {
          this.nextValue = !this.nextValue;
        })

      Text(`next value: ${this.nextValue}`)
        .fontSize(15)
        .fontColor(Color.Pink)
        .fontWeight(FontWeight.Medium)
        .textAlign(TextAlign.Center)
        .margin({
          left: 6,
          right: 6,
          top: 10,
          bottom: 10
        })

      Grid(this.scroller) {
        ForEach(this.numbers, (day: string) => {
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
        }, (day: string) => day)
      }
      .padding({
        left: 15,
        right: 30,
        top: 45,
        bottom: 60
      })
      .safeAreaPadding({
        left: 10,
        right: 20,
        top: 30,
        bottom: 40
      })
      .clipContent(ContentClipMode.CONTENT_ONLY)
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
      .onScrollIndex((first: number, last: number) => {
        console.info(first.toString());
        console.info(last.toString());
        this.message += `\n Grid onScrollIndex, first: ${first.toString()}, last: ${last.toString()}`;
      })
      .onDidScroll((scrollOffset: number, scrollState: ScrollState) => {
        console.info(scrollOffset.toString());
        console.info(scrollState.toString());
        this.message += `\n Grid onDidScroll, scrollOffset: ${scrollOffset.toString()}, scrollState: ${scrollState.toString()}`;
      })
      .onScrollStart(() => {
        console.info('XXX' + 'Grid onScrollStart');
        this.message += `\n Grid onScrollStart`;
      })
      .onScrollStop(() => {
        console.info('XXX' + 'Grid onScrollStop');
        this.message += `\n Grid onScrollStop`;
      })
      .onReachStart(() => {
        console.info('XXX' + 'Grid onReachStart');
        this.message += `\n Grid onReachStart`;
      })
      .onReachEnd(() => {
        console.info('XXX' + 'Grid onReachEnd');
        this.message += `\n Grid onReachEnd`;
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