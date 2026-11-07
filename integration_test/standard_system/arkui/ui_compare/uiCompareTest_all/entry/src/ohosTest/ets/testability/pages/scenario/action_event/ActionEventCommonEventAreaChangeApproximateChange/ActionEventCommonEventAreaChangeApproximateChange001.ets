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

const caseName: string= 'SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0010';

@Entry
@Component
struct ActionEventCommonEventAreaChangeApproximateChange001 {
  scroller: Scroller = new Scroller();
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  @State isExpanding: string = '';
  @State currentRatio: string = '';
  @State ratiosArr: number[] = [];
  @State updateTime: number = 0;
  @State textColor: Color = Color.White;
  @State trend: string = '';

  build() {
    Column() {
      Column() {
        Text('isExpanding: ' + this.isExpanding)
          .fontSize(12)

        Text('currentRatio: ' + this.currentRatio)
          .fontSize(12)

        Text('比例变化趋势：' + this.trend)
          .fontSize(12)
      }
      .id('setting')
      .onClick(() => {
        this.ratiosArr = [0.5];
        this.updateTime = 1000;
        this.textColor = Color.Grey;
      })
      .backgroundColor(this.textColor)

      Scroll(this.scroller) {
        Column() {
          Text('Test Text Visible Change')
            .fontSize(20)
            .height(200)
            .margin({ top: 50, bottom: 20 })
            .backgroundColor(Color.Green)

          Row() {
            Text('Test Row Visible  Change')
              .fontSize(20)
              .margin({ bottom: 20 })
          }
          .height('16.39%')
          .backgroundColor(Color.Yellow)
          .onVisibleAreaApproximateChange({ratios: this.ratiosArr, expectedUpdateInterval: this.updateTime}, (isExpanding: boolean, currentRatio: number) => {
            console.info('Test Row isExpanding:' + isExpanding + ', currentRatio:' + currentRatio);
            this.isExpanding = isExpanding.toString();
            this.currentRatio = currentRatio.toString();
            if (isExpanding) {
              this.trend = '比例慢慢变大';
            }
            if (!isExpanding) {
              this.trend = '比例慢慢变小';
            }
            console.info(`${caseName} isExpanding is ${isExpanding}`);
            console.info(`${caseName} currentRatio is ${currentRatio}`);
            console.info(`${caseName} trend is ${this.trend}`);
          })

          ForEach(this.arr, (item:number) => {
            Text(item.toString())
              .width('90%')
              .height(150)
              .backgroundColor(0xFFFFFF)
              .borderRadius(15)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .margin({ top: 10 })
          }, (item:number) => (item.toString()))

        }
        .width('100%')
      }
      .backgroundColor(0x317aff)
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.On)
      .scrollBarColor(Color.Gray)
      .scrollBarWidth(10)
      .onWillScroll((xOffset: number, yOffset: number, scrollState: ScrollState) => {
        console.info(xOffset + ' ' + yOffset)
      })
      .onScrollEdge((side: Edge) => {
        console.info('To the edge')
      })
      .onScrollStop(() => {
        console.info('Scroll Stop')
      })

    }.width('100%').height('100%').backgroundColor(0xDCDCDC)
  }
}
