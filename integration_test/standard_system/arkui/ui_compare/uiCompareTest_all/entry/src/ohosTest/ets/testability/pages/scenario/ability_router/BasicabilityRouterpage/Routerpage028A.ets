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

const TAG = 'Routerpage028A';

@Entry
@ComponentV2
export struct Routerpage028A {
  @Local jumpCount: number = 0;
  @Local stackLength: string = '1';
  @Local paramInfo: string = '参数：无';
  @Local receivedParam: string = '';

  async checkStack(): Promise<void> {
    try {
      this.stackLength = router.getLength();
      
      // 当栈深度达到32时，清空栈
      if (parseInt(this.stackLength) >= 32) {
        router.clear();
        hilog.info(0x0000, TAG, 'Stack reached 32, cleared');
        this.stackLength = '1';
      }
    } catch (error) {
      hilog.error(0x0000, TAG, `checkStack error: ${JSON.stringify(error)}`);
    }
  }

  build() {
    Column({ space: 10 }) {
      Text(`页面A`)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Red)

      Divider()

      Text(`测试用例：SUB_ACE_BASICABILITY_ROUTERPAGE_028`)
        .fontSize(14)
        .width('100%')

      Divider()

      Text(`跳转次数：${this.jumpCount}`)
        .fontSize(12)
        .fontColor(Color.Blue)
        .width('100%')

      Text(`页面栈深度：${this.stackLength}`)
        .fontSize(12)
        .fontColor(Color.Orange)
        .width('100%')

      Text(this.paramInfo)
        .fontSize(12)
        .fontColor(Color.Gray)
        .width('100%')

      if (this.receivedParam) {
        Text(`收到的参数：${this.receivedParam}`)
          .fontSize(11)
          .fontColor(Color.Green)
          .width('100%')
      }

      Divider()

      Button('跳转到页面B')
        .id('btn_to_b')
        .width('90%')
        .margin({ top: 10 })
        .onClick(async () => {
          try {
            this.jumpCount++;
            await this.checkStack();
            
            await router.pushUrl({
              url: 'testability/pages/scenario/ability_router/BasicabilityRouterpage/Routerpage028B',
              params: {
                from: 'PageA',
                timestamp: Date.now(),
                jumpCount: this.jumpCount
              }
            });
            
            hilog.info(0x0000, TAG, `Jump to B, count=${this.jumpCount}`);
          } catch (error) {
            hilog.error(0x0000, TAG, `pushUrl to B error: ${JSON.stringify(error)}`);
          }
        })

      Button('自动跳转测试（10次）')
        .id('btn_auto')
        .width('90%')
        .backgroundColor(Color.Green)
        .onClick(async () => {
          for (let i = 0; i < 10; i++) {
            await this.checkStack();
            
            // 跳转到B
            await router.pushUrl({
              url: 'testability/pages/scenario/ability_router/BasicabilityRouterpage/Routerpage028B',
              params: { from: 'PageA', auto: true, round: i + 1 }
            });
            
            await new Promise<void>(resolve => setTimeout(resolve, 100));
            
            // 返回A
            router.back();
            await new Promise<void>(resolve => setTimeout(resolve, 100));
          }
          
          hilog.info(0x0000, TAG, 'Auto jump test completed');
        })

      Text(`提示：可进行反复跳转测试，当栈深度>=32时自动清空`)
        .fontSize(11)
        .fontColor(Color.Gray)
        .width('100%')
        .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('#FFEBEE')
  }

  async aboutToAppear(): Promise<void> {
    try {
      const params = router.getParams() as Record<string, Object>;
      if (params) {
        this.paramInfo = `✅ 收到参数（来自${params['from']}）`;
        this.receivedParam = JSON.stringify(params);
        hilog.info(0x0000, TAG, `PageA received params: ${JSON.stringify(params)}`);
      } else {
        this.paramInfo = '首次加载，无参数';
      }
      
      await this.checkStack();
    } catch (error) {
      hilog.error(0x0000, TAG, `aboutToAppear error: ${JSON.stringify(error)}`);
    }
  }
}

