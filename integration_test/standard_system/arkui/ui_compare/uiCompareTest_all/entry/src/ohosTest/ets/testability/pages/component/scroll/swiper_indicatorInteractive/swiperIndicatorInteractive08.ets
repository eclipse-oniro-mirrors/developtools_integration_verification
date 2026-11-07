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

/**
 * 测试用例0090页面
 * Swiper组件duration设置为2000ms测试 - 导航点移动时长为2000毫秒
 */
class SwiperIndicatorInteractiveDataSource08 implements IDataSource {
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
struct SwiperIndicatorInteractive08 {
  private swiperController: SwiperController = new SwiperController();
  private data: SwiperIndicatorInteractiveDataSource08 = new SwiperIndicatorInteractiveDataSource08([]);
  @State currentIndex: number = 0;

  aboutToAppear(): void {
    let list: number[] = [];
    for (let i = 1; i <= 10; i++) {
      list.push(i);
    }
    this.data = new SwiperIndicatorInteractiveDataSource08(list);
  }

  build() {
    Column() {
      // 页面标题
      Text('测试用例0090 - duration 2000ms测试')
        .height(50)
        .fontSize(16)
        .textAlign(TextAlign.Center)
        .fontColor(Color.Black)
        .width('100%')
        .border({ width: 1 })
        .lineHeight(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 8, bottom: 8 });

      // 状态信息显示
      Text(`当前页面: ${this.currentIndex + 1}, duration: 2000ms`)
        .height(35)
        .fontSize(12)
        .textAlign(TextAlign.Center)
        .fontColor(Color.Black)
        .width('100%')
        .border({ width: 1 })
        .lineHeight(16)
        .fontWeight(300)
        .margin({ bottom: 8 });

      // Swiper测试区域
      Swiper(this.swiperController) {
        LazyForEach(this.data, (item: string) => {
          Text('页面 ' + item.toString())
            .width('90%')
            .height(200)
            .backgroundColor(0xAFEEEE)
            .textAlign(TextAlign.Center)
            .fontSize(30)
            .borderRadius(10)
        }, (item: string) => item)
      }
      .cachedCount(2)
      .index(0)
      .autoPlay(false)
      .loop(true)
      .duration(2000) // 设置duration为2000ms
      .itemSpace(10)
      .prevMargin(20)
      .nextMargin(20)
      .indicator(
        new DotIndicator()
          .itemWidth(12)
          .itemHeight(12)
          .selectedItemWidth(12)
          .selectedItemHeight(12)
          .color(Color.Gray)
          .selectedColor(Color.Blue))
      .onChange((index: number) => {
        console.info('测试用例0090 Swiper onChange:', index);
        this.currentIndex = index;
      })

      // 控制按钮区域
      Row({ space: 12 }) {
        Button('上一页')
          .id('swiperIndicatorInteractive08_01')
          .onClick(() => {
            this.swiperController.showPrevious();
          })
        Button('下一页')
          .id('swiperIndicatorInteractive08_02')
          .onClick(() => {
            this.swiperController.showNext();
          })
      }
      .margin({ top: 10 })

      Row({ space: 12 }) {
        Button('跳转页面1')
          .id('swiperIndicatorInteractive08_03')
          .onClick(() => {
            this.swiperController.changeIndex(0, SwiperAnimationMode.FAST_ANIMATION);
          })
        Button('跳转页面5')
          .id('swiperIndicatorInteractive08_04')
          .onClick(() => {
            this.swiperController.changeIndex(4, SwiperAnimationMode.FAST_ANIMATION);
          })
        Button('跳转页面10')
          .id('swiperIndicatorInteractive08_05')
          .onClick(() => {
            this.swiperController.changeIndex(9, SwiperAnimationMode.FAST_ANIMATION);
          })
      }
      .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
    .padding({ left: 12, right: 12, top: 8, bottom: 8 });
  }
}
