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
import MyDataSource from '../../../../../test/model/DataSource';

@Entry
@Component
struct UIComponentListAndGridListFocus003 {
  @State message: string = 'Hello';
  private scrollerForList: Scroller = new Scroller();
  private data: MyDataSource = new MyDataSource();

  aboutToAppear() {
    for (let i = 0; i <= 20; i++) {
      this.data.pushData(`Hello ${i}`);
    }
  }

  build() {
    Column() {
      List({ space: 20, scroller: this.scrollerForList }) {
        LazyForEach(this.data, (item: number) => {
          ListItem() {
            Button('' + item)
              .width('100%')
              .height(100)
              .fontSize(16)
              .borderRadius(10)
              .backgroundColor(0xF9CF93)
              .stateEffect(true)
          }
        }, (item: string) => item)
      }
      .cachedCount(4)
      .height('80%')
      .scrollBar(BarState.On)

      Button('滑动')
        .id('scroll')
        .stateEffect(true)
        .onClick(() => {
          this.scrollerForList.scrollToIndex(10);
        })
    }
    .width('100%')
  }
}