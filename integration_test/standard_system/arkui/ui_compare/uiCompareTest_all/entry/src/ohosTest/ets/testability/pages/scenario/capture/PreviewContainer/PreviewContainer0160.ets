/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// xxx.ets
class SwiperDataSource implements IDataSource {
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

  registerDataChangeListener(listener: DataChangeListener): void {
  }

  unregisterDataChangeListener() {
  }
}

@Entry
@Component
struct PreviewContainer0160 {
  private swiperController: SwiperController = new SwiperController();
  private data: SwiperDataSource = new SwiperDataSource([]);

  aboutToAppear(): void {
    let list: number[] = [];
    for (let i = 1; i <= 10; i++) {
      list.push(i);
    }
    this.data = new SwiperDataSource(list);
  }

  build() {
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
      .cachedCount(3)
      .index(0)
      .autoPlay(true)
      .interval(3000)
      .loop(true)
      .vertical(false)
      .indicatorInteractive(true)
      .duration(800)
      .itemSpace(10)
      .prevMargin(20)
      .nextMargin(20)
      .displayCount(1)
      .effectMode(EdgeEffect.Spring)
      .indicator( // 设置圆点导航点样式
        new DotIndicator()
          .itemWidth(12)
          .itemHeight(12)
          .selectedItemWidth(18)
          .selectedItemHeight(18)
          .color(Color.Gray)
          .selectedColor(Color.Blue)
          .mask(true))
      .displayArrow({ // 设置导航点箭头样式
        showBackground: true,
        isSidebarMiddle: true,
        backgroundSize: 28,
        backgroundColor: Color.White,
        arrowSize: 20,
        arrowColor: Color.Blue
      }, true)
      .indicatorStyle({
        left: '10vp',
        top: '10vp',
        right: '10vp',
        bottom: '10vp'
      })
      .curve(Curve.EaseInOut)
      .disableSwipe(false)
      .enabled(true)
      .nestedScroll(SwiperNestedScrollMode.SELF_ONLY)
      .onChange((index: number) => {
        console.info(index.toString());
      })
      .onScrollStateChanged((event: ScrollState) => {
        console.info('event: ' + event);
      })
      .onGestureSwipe((index: number, extraInfo: SwiperAnimationEvent) => {
        console.info('index: ' + index);
        console.info('current offset: ' + extraInfo.currentOffset);
      })
      .onAnimationStart((index: number, targetIndex: number, extraInfo: SwiperAnimationEvent) => {
        console.info('index: ' + index);
        console.info('targetIndex: ' + targetIndex);
        console.info('current offset: ' + extraInfo.currentOffset);
        console.info('target offset: ' + extraInfo.targetOffset);
        console.info('velocity: ' + extraInfo.velocity);
      })
      .onAnimationEnd((index: number, extraInfo: SwiperAnimationEvent) => {
        console.info('index: ' + index);
        console.info('current offset: ' + extraInfo.currentOffset);
      })

      Row({ space: 12 }) {
        Button('showPrevious')
          .onClick(() => {
            this.swiperController.showPrevious();
          })
        Button('showNext')
          .onClick(() => {
            this.swiperController.showNext();
          })
      }.margin(5)
      Row({ space: 5 }) {
        Button('FAST 0')
          .onClick(() => {
            this.swiperController.changeIndex(0, SwiperAnimationMode.FAST_ANIMATION);
          })
        Button('FAST 3')
          .onClick(() => {
            this.swiperController.changeIndex(3, SwiperAnimationMode.FAST_ANIMATION);
          })
        Button('FAST ' + 9)
          .onClick(() => {
            this.swiperController.changeIndex(9, SwiperAnimationMode.FAST_ANIMATION);
          })
      }.margin(5)
    }.width('100%')
    .margin({ top: 5 })
  }
}
