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

const TAG = 'Routerpage008Main';

@Entry
@ComponentV2
export struct Routerpage008Main {
  @Local statusInfo: string = '初始页面';
  @Local stackInfo: string = '页面栈数量：1';

  async checkRouterState(): Promise<void> {
    try {
      const state = router.getState();
      const length = router.getLength();
      this.stackInfo = `页面栈数量：${length}`;
      hilog.info(0x0000, TAG, `Router State: ${JSON.stringify(state)}, Length: ${length}`);
    } catch (error) {
      hilog.error(0x0000, TAG, `checkRouterState error: ${JSON.stringify(error)}`);
    }
  }

  build() {
    Column({ space: 10 }) {
      Text(`测试用例：SUB_ACE_BASICABILITY_ROUTERPAGE_008`)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .textAlign(TextAlign.Start)

      Divider()

      Text(`测试步骤：`)
        .fontSize(13)
        .fontColor(Color.Blue)
        .alignSelf(ItemAlign.Start)

      Text(`1. 从初始页面跳转到A页面`)
        .fontSize(12)
        .alignSelf(ItemAlign.Start)

      Text(`2. 更新到B页面`)
        .fontSize(12)
        .alignSelf(ItemAlign.Start)

      Text(`3. 清空所有页面`)
        .fontSize(12)
        .alignSelf(ItemAlign.Start)

      Text(`4. 更新到C页面`)
        .fontSize(12)
        .alignSelf(ItemAlign.Start)

      Divider()

      Text(`预期结果：各步骤页面状态和数量正确`)
        .fontSize(13)
        .fontColor(Color.Green)
        .alignSelf(ItemAlign.Start)

      Divider()

      Text(this.statusInfo)
        .fontSize(12)
        .fontColor(Color.Orange)
        .width('100%')

      Text(this.stackInfo)
        .fontSize(12)
        .fontColor(Color.Blue)
        .width('100%')

      Divider()

      Button('步骤1：跳转到A页面')
        .id('btn_push_a')
        .width('90%')
        .margin({ top: 10 })
        .onClick(async () => {
          try {
            await router.pushUrl({
              url: 'testability/pages/scenario/ability_router/BasicabilityRouterpage/Routerpage008A',
              params: { from: '初始页面' }
            });
            this.statusInfo = '已跳转到A页面';
            await this.checkRouterState();
          } catch (error) {
            hilog.error(0x0000, TAG, `pushUrl to A error: ${JSON.stringify(error)}`);
          }
        })

      Button('查询当前状态')
        .id('btn_check')
        .width('90%')
        .backgroundColor('#FF9800')
        .onClick(async () => {
          await this.checkRouterState();
        })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('#F5F5F5')
  }

  async aboutToAppear(): Promise<void> {
    await this.checkRouterState();
  }
}

