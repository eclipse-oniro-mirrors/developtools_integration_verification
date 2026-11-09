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

const TAG = 'Routerpage012';

@Entry
@ComponentV2
export struct Routerpage012 {
  @Local statusInfo: string = '等待测试';
  @Local cycleCount: number = 0;
  @Local isRunning: boolean = false;

  build() {
    Scroll() {
      Column({ space: 10 }) {
        Text(`测试用例：SUB_ACE_BASICABILITY_ROUTERPAGE_012`)
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .width('100%')

        Divider()

        Text(`测试名称：循环跳转返回界面，查询内存是否溢出`)
          .fontSize(13)
          .fontColor(Color.Blue)
          .width('100%')

        Divider()

        Text(`测试步骤：`)
          .fontSize(13)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)

        Text(`1. 从A界面进入B界面`)
          .fontSize(12)
          .width('100%')

        Text(`2. 从B界面返回A界面`)
          .fontSize(12)
          .width('100%')

        Text(`3. 循环执行1000次`)
          .fontSize(12)
          .width('100%')

        Text(`4. 观察内存状态`)
          .fontSize(12)
          .width('100%')

        Divider()

        Text(`预期结果：内存应该一升一降，不应和初始状态有很大差别`)
          .fontSize(13)
          .fontColor(Color.Green)
          .width('100%')

        Divider()

        Text(this.statusInfo)
          .fontSize(12)
          .fontColor(Color.Orange)
          .width('100%')

        Text(`循环次数：${this.cycleCount} / 1000`)
          .fontSize(12)
          .fontColor(Color.Blue)
          .width('100%')

        Divider()

        Button(this.isRunning ? '测试进行中...' : '开始循环测试\n（1000次）')
          .id('btn')
          .width('90%')
          .margin({ top: 20 })
          .enabled(!this.isRunning)
          .onClick(async () => {
            this.isRunning = true;
            this.cycleCount = 0;
            this.statusInfo = '⏳ 循环测试进行中...';
            hilog.info(0x0000, TAG, 'Memory leak test started');
            
            for (let i = 0; i < 1000; i++) {
              try {
                // A -> B
                await router.pushUrl({
                  url: 'testability/pages/scenario/ability_router/BasicabilityRouterInstall/Routerpage012B'
                });
                
                await new Promise<void>(resolve => setTimeout(resolve, 20));
                
                // B -> A (back)
                router.back();
                await new Promise<void>(resolve => setTimeout(resolve, 20));
                
                this.cycleCount++;
                
                if (this.cycleCount % 100 === 0) {
                  this.statusInfo = `⏳ 已循环${this.cycleCount}次...`;
                  hilog.info(0x0000, TAG, `Completed ${this.cycleCount} cycles`);
                }
              } catch (error) {
                hilog.error(0x0000, TAG, `Cycle error: ${JSON.stringify(error)}`);
                break;
              }
            }
            
            this.statusInfo = `✅ 循环测试完成：共${this.cycleCount}次`;
            this.isRunning = false;
            hilog.info(0x0000, TAG, `Memory leak test completed, ${this.cycleCount} cycles`);
          })

        Button('手动跳转到B页面')
          .id('btn_manual')
          .width('90%')
          .backgroundColor(Color.Orange)
          .margin({ top: 10 })
          .onClick(async () => {
            try {
              await router.pushUrl({
                url: 'testability/pages/scenario/ability_router/BasicabilityRouterInstall/Routerpage012B'
              });
            } catch (error) {
              hilog.error(0x0000, TAG, `Manual jump error: ${JSON.stringify(error)}`);
            }
          })

        Text(`说明：`)
          .fontSize(13)
          .fontWeight(FontWeight.Bold)
          .width('100%')
          .margin({ top: 20 })

        Text(`建议使用MMO内存监控工具或DevEco Profiler监控内存`)
          .fontSize(11)
          .fontColor(Color.Gray)
          .width('100%')

        Text(`正常情况下内存应稳定，不持续增长`)
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

