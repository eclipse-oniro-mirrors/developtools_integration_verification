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
 * 测试用例0020页面
 * Refresh嵌套纵向滑动Swiper场景测试
 */
@Entry
@Component
struct RefreshInterconnection01 {
  @State isRefreshing: boolean = false;
  @State currentIndex: number = 0;
  private swiperController: SwiperController = new SwiperController();

  build() {
    Column() {
      // 页面标题
      Text('测试用例0020 - Refresh嵌套Swiper测试')
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
      Text(`当前Swiper索引: ${this.currentIndex}, 刷新状态: ${this.isRefreshing ? '刷新中' : '未刷新'}`)
        .height(35)
        .fontSize(12)
        .textAlign(TextAlign.Center)
        .fontColor(Color.Black)
        .width('100%')
        .border({ width: 1 })
        .lineHeight(16)
        .fontWeight(300)
        .margin({ bottom: 8 });

      // Refresh嵌套Swiper测试区域
      Refresh({ refreshing: $$this.isRefreshing }) {
        Swiper(this.swiperController) {
          // 第一个页面
          Column() {
            Text('Swiper页面 1')
              .fontSize(18)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 20 });
            
            ForEach([1, 2, 3, 4, 5], (item: number) => {
              Text(`列表项 ${item}`)
                .width('90%')
                .height(60)
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.White)
                .borderRadius(8)
                .margin({ bottom: 10 });
            })
          }
          .width('100%')
          .height('100%')
          .backgroundColor('0xF0F8FF')
          .padding(20)

          // 第二个页面
          Column() {
            Text('Swiper页面 2')
              .fontSize(18)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 20 });
            
            ForEach([6, 7, 8, 9, 10], (item: number) => {
              Text(`列表项 ${item}`)
                .width('90%')
                .height(60)
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.White)
                .borderRadius(8)
                .margin({ bottom: 10 });
            })
          }
          .width('100%')
          .height('100%')
          .backgroundColor('0xFFF0F5')
          .padding(20)

          // 第三个页面
          Column() {
            Text('Swiper页面 3')
              .fontSize(18)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 20 });
            
            ForEach([11, 12, 13, 14, 15], (item: number) => {
              Text(`列表项 ${item}`)
                .width('90%')
                .height(60)
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.White)
                .borderRadius(8)
                .margin({ bottom: 10 });
            })
          }
          .width('100%')
          .height('100%')
          .backgroundColor('0xF0FFF0')
          .padding(20)
        }
        .width('100%')
        .height('100%')
        .loop(true)
        .autoPlay(false)
        .indicator(true)
        .onChange((index: number) => {
          this.currentIndex = index;
          console.info('测试用例0020 Swiper onChange:', index);
        })
      }
      .width('100%')
      .height('80%')
      .backgroundColor('0xE6E6FA')
      .pullToRefresh(true)
      .refreshOffset(64)
      .onStateChange((refreshStatus: RefreshStatus) => {
        console.info('测试用例0020 Refresh onStateChange:', refreshStatus);
      })
      .onOffsetChange((value: number) => {
        console.info('测试用例0020 Refresh onOffsetChange:', value);
      })
      .onRefreshing(() => {
        console.info('测试用例0020 Refresh onRefreshing triggered');
        setTimeout(() => {
          this.isRefreshing = false;
        }, 2000);
      })

      // 控制按钮区域
      Row({ space: 10 }) {
        Button('下一页')
          .id('refreshInterconnection01_01')
          .onClick(() => {
            this.swiperController.showNext();
          })
        
        Button('上一页')
          .id('refreshInterconnection01_02')
          .onClick(() => {
            this.swiperController.showPrevious();
          })
        
        Button('开始刷新')
          .id('refreshInterconnection01_03')
          .onClick(() => {
            this.isRefreshing = true;
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .margin({ top: 10 });
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
    .padding({ left: 12, right: 12, top: 8, bottom: 8 });
  }
}
