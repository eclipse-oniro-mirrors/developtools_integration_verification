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

const TAG = 'Routerpage008A';

@Entry
@ComponentV2
export struct Routerpage008A {
  @Local statusInfo: string = 'A页面';
  @Local stackInfo: string = '页面栈数量：？';
  @Local paramInfo: string = '参数：无';

  async checkRouterState(): Promise<void> {
    try {
      const state = router.getState();
      const length: string = router.getLength();
      this.stackInfo = `页面栈数量：${length}`;
      this.statusInfo = length === '2' ? '✅ A页面（数量正确）' : `❌ A页面（数量应为2，实际${length}）`;
      hilog.info(0x0000, TAG, `Router State: ${JSON.stringify(state)}, Length: ${length}`);
    } catch (error) {
      hilog.error(0x0000, TAG, `checkRouterState error: ${JSON.stringify(error)}`);
    }
  }

  build() {
    Column({ space: 10 }) {
      Text(`A页面`)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Red)

      Divider()

      Text(this.statusInfo)
        .fontSize(12)
        .fontColor(Color.Orange)
        .width('100%')

      Text(this.stackInfo)
        .fontSize(12)
        .fontColor(Color.Blue)
        .width('100%')

      Text(this.paramInfo)
        .fontSize(12)
        .fontColor(Color.Gray)
        .width('100%')

      Divider()

      Button('步骤2：更新到B页面')
        .id('btn_replace_b')
        .width('90%')
        .margin({ top: 10 })
        .onClick(async () => {
          try {
            await router.replaceUrl({
              url: 'testability/pages/scenario/ability_router/BasicabilityRouterpage/Routerpage008B',
              params: { from: 'A页面' }
            });
          } catch (error) {
            hilog.error(0x0000, TAG, `replaceUrl to B error: ${JSON.stringify(error)}`);
          }
        })

      Button('返回')
        .id('btn_back')
        .width('90%')
        .backgroundColor('#757575')
        .onClick(() => {
          router.back();
        })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('#FFEBEE')
  }

  async aboutToAppear(): Promise<void> {
    const params = router.getParams();
    this.paramInfo = `参数：${JSON.stringify(params)}`;
    await this.checkRouterState();
  }
}

