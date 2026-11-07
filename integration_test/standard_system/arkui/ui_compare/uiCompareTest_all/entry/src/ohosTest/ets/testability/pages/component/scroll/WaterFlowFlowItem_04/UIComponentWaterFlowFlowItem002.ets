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
import { WaterFlowDataSource } from '../ScrollScrollAccessible/WaterFlowDataSource';

@Entry
@Component
struct UIComponentWaterFlowFlowItem002 {
  @State numbers: string[] = [];
  @State columnsGap: number = 10;
  @State rowsGap: number = 10;
  @State minSize: number = 80;
  @State maxSize: number = 180;
  private scroller: Scroller = new Scroller();
  dataSource: WaterFlowDataSource = new WaterFlowDataSource();
  private itemWidthArray: number[] = [];
  private itemHeightArray: number[] = [];

  getSize() {
    let ret = Math.floor(Math.random() * this.maxSize);
    return (ret > this.minSize ? ret : this.minSize);
  }

  setItemSizeArray() {
    for (let i = 0; i < 100; i++) {
      this.itemWidthArray.push(this.getSize());
      this.itemHeightArray.push(this.getSize());
    }
  }

  aboutToAppear() {
    this.setItemSizeArray();
  }

  build() {
    Column() {
      Column() {
        Text('FlowItem不设置Visibility.Hidden')
          .fontSize(20)
          .textAlign(TextAlign.Center)
          .fontStyle(FontStyle.Normal)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Black)
          .width('100%')
      }
      Column() {
        WaterFlow({ scroller: this.scroller }) {
          FlowItem() {
            Column() {
              Text('the first item')
                .textAlign(TextAlign.Center)
                .fontStyle(FontStyle.Normal)
            }
          }.width('50%').height('20%').backgroundColor(0xffaabb).visibility(Visibility.Hidden)
          LazyForEach(this.dataSource, (item: number) => {
            FlowItem() {
              Column() {
                Text('N' + item)
                  .textAlign(TextAlign.Center)
                  .fontStyle(FontStyle.Normal)
              }
            }
            .onAppear(() => {
              if (item + 20 == this.dataSource.totalCount()) {
                for (let i = 0; i < 10; i++) {
                  this.dataSource.addLastItem();
                }
              }
            })
            .width('50%')
            .height('20%')
            .backgroundColor(0xF9CF93)
          }, (item: string) => item)
        }
        .id('WaterFlow')
        .layoutDirection(FlexDirection.Column)
        .scrollBar(BarState.On)
        .columnsTemplate('1fr 1fr')
        .columnsGap(10)
        .rowsGap(5)
        .backgroundColor(0xFAEEE0)
        .onDidScroll((scrollOffset: number, scrollState: ScrollState) => {
          console.info(`onScroll scrollState = ScrollState` + scrollState + `, scrollOffset = ` + scrollOffset);
        })
        .backgroundColor(0xDCDCDC)
        .width('100%')
        .height('90%')
      }
    }
  }
}