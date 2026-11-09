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
struct UIComponentListAndGridListInterfaceCachedCountShow001 {
  @State message: string = 'Hello';
  @State arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];
  private scrollerForList: Scroller = new Scroller();
  @State showBool: boolean = true;
  @State showNum: number = 0;

  build() {
    Column() {
      List({ space: 20, scroller: this.scrollerForList }) {
        ForEach(this.arr, (item: number) => {
          ListItem() {
            Text('' + item)
              .width('100%')
              .height(100)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
          }
        }, (item: string) => item)
      }
      .height('50%')
      .scrollBar(BarState.On)
      .clip(false)
      .cachedCount(2, this.showBool)

      Row() {
        Button('切换CachedCount中show')
          .id('click')
          .stateEffect(true)
          .onClick(() => {
            this.showNum++;
            if(this.showNum % 2 ==1) {
              this.showBool = false;
            } else {
              this.showBool = true;
            }
          })
      }
      .height('10%')
    }
    .backgroundColor(0xDCDCDC)
    .width('100%')
  }
}