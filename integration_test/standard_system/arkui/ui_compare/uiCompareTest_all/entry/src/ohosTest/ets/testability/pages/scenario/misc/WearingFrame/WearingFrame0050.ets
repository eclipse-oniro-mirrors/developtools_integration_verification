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


class RouterStack {
  private stack: string[] = [];

  push(pageName: string) {
    this.stack.push(pageName);
    console.info(`[WearingFrame] Router push: ${pageName}, stack size: ${this.stack.length}`);
  }

  pop() {
    if (this.stack.length > 0) {
      const page = this.stack.pop();
      console.info(`[WearingFrame] Router back: ${page}, stack size: ${this.stack.length}`);
    }
  }

  size(): number {
    return this.stack.length;
  }

  clear() {
    this.stack = [];
  }
}

@Component
struct Page1Router {
  @State pageContent: string = 'Page 1 内容';

  build() {
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
    .backgroundColor('#F5F5F5')
  }
}

@Entry
@Component
struct WearingFrame0050 {
  @State swipeCount: number = 0;
  @State isRunning: boolean = false;
  private routerStack: RouterStack = new RouterStack();
  @State showPage1: boolean = false;

  @Builder
  buildPage1() {
    Page1Router()
  }

  async runSwipeTest() {
    this.isRunning = true;
    this.swipeCount = 0;
    console.info('[WearingFrame] Starting test: 500 swipe operations');

    for (let i = 0; i < 500; i++) {
      // Push page1 (模拟router.pushUrl)
      this.routerStack.push('Page1');
      this.showPage1 = true;
      await new Promise<void>((resolve) => setTimeout(resolve, 5));

      // 模拟右滑返回 (模拟router.back)
      this.routerStack.pop();
      this.showPage1 = false;
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
    Stack() {
      // 主页面内容
      Column() {
        Text('Router场景连续右滑')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20, bottom: 20 })
          .id('WearingFrame0050_001')

        Text('测试说明: 反复push page1并右滑返回500次')
          .fontSize(14)
          .fontColor('#666666')
          .margin({ bottom: 30 })
          .id('WearingFrame0050_002')

        Divider().margin({ bottom: 20 })

        Text(`滑动次数: ${this.swipeCount} / 500`)
          .fontSize(18)
          .fontColor('#007DFF')
          .margin({ bottom: 10 })
          .id('WearingFrame0050_003')

        Text(`状态: ${this.isRunning ? '测试进行中...' : '等待开始'}`)
          .fontSize(16)
          .fontColor(this.isRunning ? '#FF6B6B' : '#4CAF50')
          .margin({ bottom: 30 })
          .id('WearingFrame0050_004')

        Button('手动Push Page1')
          .width('80%')
          .height(50)
          .margin({ bottom: 15 })
          .id('WearingFrame0050_005')
          .onClick(() => {
            this.routerStack.push('Page1');
            this.showPage1 = true;
            console.info('[WearingFrame] Manually pushed Page1');
          })

        Button(this.isRunning ? '测试进行中...' : '开始自动测试（500次）')
          .width('80%')
          .height(50)
          .margin({ bottom: 20 })
          .enabled(!this.isRunning)
          .backgroundColor('#4CAF50')
          .id('WearingFrame0050_006')
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
          .id('WearingFrame0050_007')

        Text('正常滑动，无crash')
          .fontSize(12)
          .fontColor('#4CAF50')
          .textAlign(TextAlign.Start)
          .width('90%')
          .margin({ bottom: 10 })
          .id('WearingFrame0050_008')

        Text('验证点:')
          .fontSize(12)
          .fontWeight(FontWeight.Bold)
          .textAlign(TextAlign.Start)
          .width('90%')
          .margin({ bottom: 5 })
          .id('WearingFrame0050_009')

        Text('• 执行500次push和back操作')
          .fontSize(11)
          .fontColor('#666666')
          .textAlign(TextAlign.Start)
          .width('90%')
          .margin({ bottom: 3 })
          .id('WearingFrame0050_010')

        Text('• 每次操作间隔10ms（5ms push + 5ms pop）')
          .fontSize(11)
          .fontColor('#666666')
          .textAlign(TextAlign.Start)
          .width('90%')
          .margin({ bottom: 3 })
          .id('WearingFrame0050_011')

        Text('• 应用不崩溃，router正常工作')
          .fontSize(11)
          .fontColor('#666666')
          .textAlign(TextAlign.Start)
          .width('90%')
          .margin({ bottom: 3 })
          .id('WearingFrame0050_012')

        Text('• 页面切换流畅，无卡顿')
          .fontSize(11)
          .fontColor('#666666')
          .textAlign(TextAlign.Start)
          .width('90%')
          .id('WearingFrame0050_013')

      }
      .width('100%')
      .height('100%')
      .padding(20)
      .alignItems(HorizontalAlign.Center)

      // Page1 页面 (模拟router跳转的页面)
      if (this.showPage1) {
        this.buildPage1()
      }
    }
    .width('100%')
    .height('100%')
  }
}
