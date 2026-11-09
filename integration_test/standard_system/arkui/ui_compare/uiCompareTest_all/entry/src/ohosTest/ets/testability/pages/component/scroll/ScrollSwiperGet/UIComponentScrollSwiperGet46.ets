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

class MyUIComponentScrollSwiperGet46 implements IDataSource {
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
struct UIComponentScrollSwiperGet46 {
  private swiperController: SwiperController = new SwiperController();
  private data: MyUIComponentScrollSwiperGet46 = new MyUIComponentScrollSwiperGet46([]);
  @State text: string = 'SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0430';
  @State currentIndex: number = 0;
  @State isAutoPlaying: boolean = true;
  @State autoPlayStatus: string = '自动播放已开启';
  @State changeCount: number = 0;

  aboutToAppear(): void {
    let list: number[] = [];
    for (let i = 1; i <= 10; i++) {
      list.push(i);
    }
    this.data = new MyUIComponentScrollSwiperGet46(list);
  }

  build() {
    Scroll() {
      Column({ space: 5 }) {
        Text('Swiper curve EaseInOut')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontStyle(FontStyle.Italic)
          .maxLines(1)
          .fontColor(Color.White)
          .backgroundColor('#FF6B35')
          .width('90%')
          .padding(12)
          .borderRadius(8)
          .textAlign(TextAlign.Center)
          .margin({ top: 10 })

        Text('测试编号: ' + this.text)
          .fontSize(12)
          .fontWeight(FontWeight.Bold)
          .fontStyle(FontStyle.Italic)
          .maxLines(1)
          .fontColor('#333')
          .width('90%')
          .margin({ top: 5 })
          .textAlign(TextAlign.Start)

        Text('当前页面索引: ' + this.currentIndex)
          .fontSize(12)
          .fontColor('#666')
          .width('90%')
          .fontWeight(FontWeight.Bold)
          .fontStyle(FontStyle.Italic)
          .maxLines(1)
          .margin({ top: 5 })
          .textAlign(TextAlign.Start)

        Text('页面切换次数: ' + this.changeCount)
          .fontSize(12)
          .fontColor('#2196F3')
          .fontWeight(FontWeight.Bold)
          .fontStyle(FontStyle.Italic)
          .maxLines(1)
          .width('90%')
          .margin({ top: 5 })
          .textAlign(TextAlign.Start)

        Column({ space: 10 }) {
          Text('Swiper轮播组件')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontStyle(FontStyle.Italic)
            .maxLines(1)
            .fontColor('#2196F3')
            .width('100%')
            .textAlign(TextAlign.Center)

          Swiper(this.swiperController) {
            LazyForEach(this.data, (item: number) => {
              Text(item.toString())
                .width('100%')
                .height(200)
                .backgroundColor(0xAFEEEE)
                .textAlign(TextAlign.Center)
                .fontSize(50)
                .fontWeight(FontWeight.Bold)
                .borderRadius(10)
                .id('UIComponentScrollSwiperGet46_'+item)
            }, (item: number) => item.toString())
          }
          .width('100%')
          .height('18.03%')
          .cachedCount(2)
          .index(0)
          .interval(1000)
          .duration(500)
          .itemSpace(10)
          .autoPlay(true)
          .curve(Curve.EaseInOut)
          .indicator(
            new DotIndicator()
              .itemWidth(10)
              .itemHeight(10)
              .selectedItemWidth(12)
              .selectedItemHeight(12)
              .color(Color.Gray)
              .selectedColor(Color.Blue)
          )
          .displayArrow({
            showBackground: true,
            isSidebarMiddle: true,
            backgroundSize: 24,
            backgroundColor: Color.White,
            arrowSize: 18,
            arrowColor: Color.Blue
          }, false)
          .onChange((index: number) => {
            this.currentIndex = index;
            this.changeCount++;
            console.info('Swiper onChange - 当前索引: ' + index + ', 切换次数: ' + this.changeCount);
          })
          .onAnimationStart((index: number, targetIndex: number, extraInfo: SwiperAnimationEvent) => {
            console.info('onAnimationStart - 当前索引: ' + index + ', 目标索引: ' + targetIndex);
          })
          .onAnimationEnd((index: number, extraInfo: SwiperAnimationEvent) => {
            console.info('onAnimationEnd - 索引: ' + index);
          })
        }
        .width('90%')
        .padding(10)
        .backgroundColor('#E3F2FD')
        .borderRadius(5)
        .margin({ top: 10 })

        Column({ space: 10 }) {
          Text('控制按钮')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontColor('#4CAF50')
            .width('100%')
            .textAlign(TextAlign.Center)

          Row({ space: 10 }) {
            Button('上一页')
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
                this.swiperController.showPrevious();
              })
              .id('SwiperAutoPlay_Prev')
              .fontSize(12)
              .height(40)

            Button('下一页')
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
                this.swiperController.showNext();
              })
              .id('SwiperAutoPlay_Next')
              .fontSize(12)
              .height(40)

            Button('跳到第5页')
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
                this.swiperController.changeIndex(4, true);
              })
              .id('SwiperAutoPlay_Jump')
              .fontSize(12)
              .height(40)
          }
        }
        .width('90%')
        .padding(10)
        .backgroundColor('#E8F5E9')
        .borderRadius(5)
        .margin({ top: 10 })

        Text('测试说明: 设置Swiper的动画曲线ARKUI_CURVE_EASE_IN_OUT后获取')
          .fontSize(11)
          .fontColor('#333')
          .width('90%')
          .fontStyle(FontStyle.Italic)
          .fontWeight(800)
          .lineHeight(18)
          .textAlign(TextAlign.Start)
          .margin({ top: 10 })

        Text('预期结果: get到值, 组件创建成功子组件切换的动画以低速开始和结束')
          .fontSize(11)
          .fontColor('#333')
          .fontStyle(FontStyle.Italic)
          .fontWeight(800)
          .width('90%')
          .lineHeight(18)
          .textAlign(TextAlign.Start)
          .margin({
            top: 10,
            bottom: 10
          })
      }
      .width('100%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FAFAFA')
  }
}
