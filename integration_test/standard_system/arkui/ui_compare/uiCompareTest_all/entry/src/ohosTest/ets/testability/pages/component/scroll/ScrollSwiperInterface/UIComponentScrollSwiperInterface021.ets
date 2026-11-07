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

class SwipeInterfaceSource21 implements IDataSource {
  private list: number[] = [];

  constructor(list: number[]) {
    this.list = list;
  }

  totalCount(): number {
    return this.list.length;
  }

  getData(index: number): number {
    return this.list[index];
  }
  registerDataChangeListener(listener: DataChangeListener): void {}

  unregisterDataChangeListener() {}
}

@Entry
@Component
struct UIComponentScrollSwiperInterface021 {
  private swiperController: SwiperController = new SwiperController();
  private data: SwipeInterfaceSource21 = new SwipeInterfaceSource21([]);
  textTimerController: TextTimerController = new TextTimerController();
  @State format: string = 'mm:ss.SS';

  aboutToAppear(): void {
    let list: number[] = [];
    for (let i = 1; i <= 10; i++) {
      list.push(i);
    }
    this.data = new SwipeInterfaceSource21(list);
  }

  build() {
    Column() {
      Column() {
        Text(`设置duration为5000`)
          .fontSize(20)
          .width('100%')
          .height('10%')
          .textAlign(TextAlign.Center)
          .fontStyle(FontStyle.Normal)
        TextTimer({ isCountDown: false, count: 0, controller: this.textTimerController })
          .format(this.format)
          .fontColor(Color.Black)
          .fontSize(50)
          .onTimer((utc: number, elapsedTime: number) => {
            console.info('textTimer notCountDown utc is：' + utc + ', elapsedTime: ' + elapsedTime);
          })
      }
      Column({ space: 5 }) {
        Swiper(this.swiperController) {
          LazyForEach(this.data, (item: string) => {
            Text(item.toString())
              .width('90%')
              .height(160)
              .backgroundColor(0xAFEEEE)
              .textAlign(TextAlign.Center)
              .fontSize(30)
          }, (item: string) => item)
        }
        .id('Swipe')
        .index(0)
        .duration(5000)
        .curve(Curve.Linear)
        .cachedCount(2)
        .autoPlay(true)
        .indicator(true)
        .loop(false)
        .itemSpace(0)
        .displayArrow(true, false)
      }.width('100%')
      Row() {
        Button('开始计时')
          .id('time')
          .stateEffect(true)
          .buttonStyle(ButtonStyleMode.NORMAL)
          .type(ButtonType.Capsule)
          .onClick(() => {
            this.textTimerController.start();
          })
      }
    }
  }
}
