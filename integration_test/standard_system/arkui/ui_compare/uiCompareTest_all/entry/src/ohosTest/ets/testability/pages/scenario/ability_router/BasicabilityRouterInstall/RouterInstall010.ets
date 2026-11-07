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

const TAG = 'RouterInstall010';

@Entry
@ComponentV2
export struct RouterInstall010 {
  @Local statusInfo: string = '等待测试';
  @Local jumpCount: number = 0;
  @Local avgTime: number = 0;
  private startTime: number = 0;
  private totalTime: number = 0;

  build() {
    Scroll() {
      Column({ space: 10 }) {
        Text(`测试用例：SUB_ACE_BASICABILITY_ROUTER_SR000HV0U4_010`)
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .width('100%')

        Divider()

        Text(`测试名称：性能测试，调用router实现免安装路由，跳转不卡顿、不掉帧`)
          .fontSize(13)
          .fontColor(Color.Blue)
          .width('100%')

        Divider()

        Text(`测试步骤：连续跳转，测试性能`)
          .fontSize(13)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)

        Divider()

        Text(`预期结果：页面跳转不卡顿、不掉帧`)
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

        Text(`平均耗时：${this.avgTime.toFixed(2)}ms`)
          .fontSize(12)
          .fontColor(Color.Green)
          .width('100%')

        Divider()

        Button('开始性能测试\n（跳转20次）')
          .id('btn')
          .width('90%')
          .margin({ top: 20 })
          .onClick(async () => {
            this.jumpCount = 0;
            this.totalTime = 0;
            this.statusInfo = '⏳ 性能测试进行中...';
            
            for (let i = 0; i < 20; i++) {
              this.startTime = Date.now();
              
              try {
                await router.pushUrl({
                  url: 'testability/pages/scenario/ability_router/BasicabilityRouterInstall/RouterInstallPerformancePage',
                  params: { index: i }
                });
                
                const elapsed = Date.now() - this.startTime;
                this.totalTime += elapsed;
                this.jumpCount++;
                this.avgTime = this.totalTime / this.jumpCount;
                
                hilog.info(0x0000, TAG, `Jump ${i + 1} took ${elapsed}ms`);
                
                // 立即返回
                await new Promise<void>(resolve => setTimeout(resolve, 100));
                router.back();
                await new Promise<void>(resolve => setTimeout(resolve, 100));
              } catch (error) {
                hilog.error(0x0000, TAG, `Jump error: ${JSON.stringify(error)}`);
              }
            }
            
            if (this.avgTime < 100) {
              this.statusInfo = `✅ 性能良好：平均${this.avgTime.toFixed(2)}ms，不卡顿`;
            } else if (this.avgTime < 300) {
              this.statusInfo = `⚠️ 性能一般：平均${this.avgTime.toFixed(2)}ms`;
            } else {
              this.statusInfo = `❌ 性能较差：平均${this.avgTime.toFixed(2)}ms，可能卡顿`;
            }
          })

        Text(`说明：测试router跳转性能，统计平均耗时`)
          .fontSize(11)
          .fontColor(Color.Gray)
          .width('100%')
          .margin({ top: 20 })
      }
      .width('100%')
      .padding(20)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}

