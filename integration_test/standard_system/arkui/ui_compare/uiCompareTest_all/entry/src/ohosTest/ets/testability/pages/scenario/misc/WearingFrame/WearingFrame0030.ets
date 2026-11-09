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

@Component
struct Page1 {
  @State pageContent: string = 'Page 1 内容';

  build() {
    NavDestination() {
      Column() {
        Text('Page 1')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20, bottom: 20 })

        Text(this.pageContent)
          .fontSize(16)
          .margin({ bottom: 20 })

        Text('向右滑动返回')
          .fontSize(14)
          .fontColor('#999999')
          .margin({ bottom: 20 })

        Button('返回')
          .width('60%')
          .onClick(() => {
            console.info('[WearingFrame] Back button clicked')
          })

      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
    }
    .title('Page 1')
  }
}

@Entry
@Component
struct WearingFrame0030 {
  @State swipeCount: number = 0;
  @State isRunning: boolean = false;
  private navPathStack: NavPathStack = new NavPathStack();

  @Builder
  buildNavDestination() {
    Page1()
  }

  async runSwipeTest() {
    this.isRunning = true;
    this.swipeCount = 0;
    console.info('[WearingFrame] Starting test: 500 swipe operations');

    for (let i = 0; i < 500; i++) {
      // Push page1
      this.navPathStack.pushPath({ name: 'Page1' });
      await new Promise<void>((resolve) => setTimeout(resolve, 5));

      // 模拟右滑返回
      this.navPathStack.pop();
      await new Promise<void>((resolve) => setTimeout(resolve, 5));

      this.swipeCount = i + 1;

      if ((i + 1) % 100 === 0) {
        console.info(`[WearingFrame] Completed ${i + 1} swipe operations, no crash`);
      }
    }

    console.info('[WearingFrame] Test completed: 500 swipe operations, all normal');
    this.isRunning = false;
  }

  build() {
    Navigation(this.navPathStack) {
      Column() {
        Text('Navigation场景连续右滑')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20, bottom: 20 })
          .id('WearingFrame0030_001')

        Text('测试说明: 反复push page1并右滑返回500次')
          .fontSize(14)
          .fontColor('#666666')
          .margin({ bottom: 30 })
          .id('WearingFrame0030_002')

        Divider().margin({ bottom: 20 })

        Text(`滑动次数: ${this.swipeCount} / 500`)
          .fontSize(18)
          .fontColor('#007DFF')
          .margin({ bottom: 10 })
          .id('WearingFrame0030_003')

        Text(`状态: ${this.isRunning ? '测试进行中...' : '等待开始'}`)
          .fontSize(16)
          .fontColor(this.isRunning ? '#FF6B6B' : '#4CAF50')
          .margin({ bottom: 30 })
          .id('WearingFrame0030_004')

        Button('手动Push Page1')
          .width('80%')
          .height(50)
          .margin({ bottom: 15 })
          .id('WearingFrame0030_005')
          .onClick(() => {
            this.navPathStack.pushPath({ name: 'Page1' });
            console.info('[WearingFrame] Manually pushed Page1');
          })

        Button(this.isRunning ? '测试进行中...' : '开始自动测试（500次）')
          .width('80%')
          .height(50)
          .margin({ bottom: 20 })
          .enabled(!this.isRunning)
          .backgroundColor('#4CAF50')
          .id('WearingFrame0030_006')
          .onClick(() => {
            this.runSwipeTest();
          })

        Divider().margin({ bottom: 20 })

        Text('预期结果:')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .textAlign(TextAlign.Start)
          .width('90%')
          .margin({ bottom: 10 })
          .id('WearingFrame0030_007')

        Text('正常滑动，无crash')
          .fontSize(12)
          .fontColor('#4CAF50')
          .textAlign(TextAlign.Start)
          .width('90%')
          .margin({ bottom: 10 })
          .id('WearingFrame0030_008')

        Text('验证点:')
          .fontSize(12)
          .fontWeight(FontWeight.Bold)
          .textAlign(TextAlign.Start)
          .width('90%')
          .margin({ bottom: 5 })
          .id('WearingFrame0030_009')

        Text('• 执行500次push和pop操作')
          .fontSize(11)
          .fontColor('#666666')
          .textAlign(TextAlign.Start)
          .width('90%')
          .margin({ bottom: 3 })
          .id('WearingFrame0030_010')

        Text('• 每次操作间隔10ms（5ms push + 5ms pop）')
          .fontSize(11)
          .fontColor('#666666')
          .textAlign(TextAlign.Start)
          .width('90%')
          .margin({ bottom: 3 })
          .id('WearingFrame0030_011')

        Text('• 应用不崩溃，导航栈正常工作')
          .fontSize(11)
          .fontColor('#666666')
          .textAlign(TextAlign.Start)
          .width('90%')
          .margin({ bottom: 3 })
          .id('WearingFrame0030_012')

        Text('• 页面切换流畅，无卡顿')
          .fontSize(11)
          .fontColor('#666666')
          .textAlign(TextAlign.Start)
          .width('90%')
          .id('WearingFrame0030_013')

      }
      .width('100%')
      .height('100%')
      .padding(20)
      .alignItems(HorizontalAlign.Center)
    }
    .navDestination(this.buildNavDestination.bind(this))
    .id('WearingFrame0030_Navigation')
  }
}
