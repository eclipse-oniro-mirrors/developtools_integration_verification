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
import { router } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG = 'RouterInstall011';

@Entry
@ComponentV2
export struct RouterInstall011 {
  @Local statusInfo: string = '等待测试';
  @Local jumpCount: number = 0;
  @Local isRunning: boolean = false;

  build() {
    Scroll() {
      Column({ space: 10 }) {
        Text(`测试用例：SUB_ACE_BASICABILITY_ROUTER_SR000HV0U4_011`)
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .width('100%')

        Divider()

        Text(`测试名称：内存测试，调用router实现多个免安装路由，无内存泄漏`)
          .fontSize(13)
          .fontColor(Color.Blue)
          .width('100%')

        Divider()

        Text(`测试步骤：连续跳转100次，观察内存变化`)
          .fontSize(13)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)

        Divider()

        Text(`预期结果：页面跳转正常，无内存泄漏`)
          .fontSize(13)
          .fontColor(Color.Green)
          .width('100%')

        Divider()

        Text(this.statusInfo)
          .fontSize(12)
          .fontColor(Color.Orange)
          .width('100%')

        Text(`跳转次数：${this.jumpCount}`)
          .fontSize(12)
          .fontColor(Color.Blue)
          .width('100%')

        Divider()

        Button(this.isRunning ? '测试进行中...' : '开始内存测试\n（跳转100次）')
          .id('btn')
          .width('90%')
          .margin({ top: 20 })
          .enabled(!this.isRunning)
          .onClick(async () => {
            this.isRunning = true;
            this.jumpCount = 0;
            this.statusInfo = '⏳ 内存测试进行中...';
            
            for (let i = 0; i < 100; i++) {
              try {
                // 跳转到测试页面
                await router.pushUrl({
                  url: 'testability/pages/scenario/ability_router/BasicabilityRouterInstall/RouterInstallPerformancePage',
                  params: { index: i }
                });
                
                this.jumpCount++;
                
                if (this.jumpCount % 10 === 0) {
                  this.statusInfo = `⏳ 已跳转${this.jumpCount}次...`;
                }
                
                // 短暂停留后返回
                await new Promise<void>(resolve => setTimeout(resolve, 50));
                router.back();
                await new Promise<void>(resolve => setTimeout(resolve, 50));
                
                // 当栈深度接近32时清空
                const length = router.getLength();
                if (parseInt(length) > 25) {
                  router.clear();
                  hilog.info(0x0000, TAG, 'Router stack cleared to prevent overflow');
                }
              } catch (error) {
                hilog.error(0x0000, TAG, `Jump error: ${JSON.stringify(error)}`);
              }
            }
            
            this.statusInfo = `✅ 内存测试完成：共跳转${this.jumpCount}次`;
            this.isRunning = false;
            hilog.info(0x0000, TAG, `Memory test completed, ${this.jumpCount} jumps`);
          })

        Text(`说明：`)
          .fontSize(13)
          .fontWeight(FontWeight.Bold)
          .width('100%')
          .margin({ top: 20 })

        Text(`此测试通过大量跳转操作验证是否存在内存泄漏`)
          .fontSize(11)
          .fontColor(Color.Gray)
          .width('100%')

        Text(`建议使用DevEco Studio的Profiler工具监控内存变化`)
          .fontSize(11)
          .fontColor(Color.Gray)
          .width('100%')

        Text(`正常情况下内存应保持稳定，不持续增长`)
          .fontSize(11)
          .fontColor(Color.Gray)
          .width('100%')
      }
      .width('100%')
      .padding(20)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}

