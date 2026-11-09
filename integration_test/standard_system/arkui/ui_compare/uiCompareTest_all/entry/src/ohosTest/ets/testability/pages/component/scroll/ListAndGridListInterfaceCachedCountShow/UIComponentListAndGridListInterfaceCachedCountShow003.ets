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
import { LengthMetrics } from '@kit.ArkUI';

@Entry
@Component
struct UIComponentListAndGridListInterfaceCachedCountShow003 {
  @State arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];
  private scrollerForList: Scroller = new Scroller();
  @State showNum: number = 0;

  build() {
    Row() {
      Column() {
        Column() {
          Text(`CacheCount的show参数设置为true，value设置为0`)
            .fontSize(20)
            .width('100%')
            .height('10%')
            .textAlign(TextAlign.Center)
            .fontStyle(FontStyle.Normal)
        }
        List({ space: 20, scroller: this.scrollerForList }) {
          ForEach(this.arr, (item: number) => {
            ListItem() {
              Text('' + item)
                .width('100%')
                .height('20%')
                .textAlign(TextAlign.Center)
                .fontStyle(FontStyle.Normal)
            }.backgroundColor(0xF9CF93)
          }, (item: string) => item)
        }
        .height('50%')
        .scrollBar(BarState.On)
        .clip(false)
        .cachedCount(0, true)
      }.width('50%').height('90%')
      Column() {
        Column() {
          Text(`CacheCount的show参数设置为true，value设置为-1`)
            .fontSize(20)
            .width('100%')
            .height('10%')
            .textAlign(TextAlign.Center)
            .fontStyle(FontStyle.Normal)
        }
        List({ space: 20, scroller: this.scrollerForList }) {
          ForEach(this.arr, (item: number) => {
            ListItem() {
              Text('' + item)
                .width('100%')
                .height('20%')
                .textAlign(TextAlign.Center)
                .fontStyle(FontStyle.Normal)
            }.backgroundColor(0xF9CF93)
          }, (item: string) => item)
        }
        .height('50%')
        .scrollBar(BarState.On)
        .clip(false)
        .cachedCount(-1, true)
      }.width('50%').height('90%')
    }
    .backgroundColor(0xDCDCDC)
    .width('100%')
  }
}