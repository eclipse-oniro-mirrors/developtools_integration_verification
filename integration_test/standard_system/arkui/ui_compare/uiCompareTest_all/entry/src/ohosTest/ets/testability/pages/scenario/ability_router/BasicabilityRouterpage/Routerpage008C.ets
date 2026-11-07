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

const TAG = 'Routerpage008C';

@Entry
@ComponentV2
export struct Routerpage008C {
  @Local statusInfo: string = 'C页面';
  @Local stackInfo: string = '页面栈数量：？';
  @Local paramInfo: string = '参数：无';

  async checkRouterState(): Promise<void> {
    try {
      const state = router.getState();
      const length: string = router.getLength();
      this.stackInfo = `页面栈数量：${length}`;
      this.statusInfo = length === '1' ? '✅ C页面（数量正确）' : `❌ C页面（数量应为1，实际${length}）`;
      hilog.info(0x0000, TAG, `Router State: ${JSON.stringify(state)}, Length: ${length}`);
    } catch (error) {
      hilog.error(0x0000, TAG, `checkRouterState error: ${JSON.stringify(error)}`);
    }
  }

  build() {
    Column({ space: 10 }) {
      Text(`C页面`)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Green)

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

      Text(`测试完成！`)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Green)
        .margin({ top: 20 })

      Text(`✅ 步骤1：初始页面→A页面（栈数量2）`)
        .fontSize(12)
        .width('100%')

      Text(`✅ 步骤2：A页面→B页面（栈数量2）`)
        .fontSize(12)
        .width('100%')

      Text(`✅ 步骤3：清空后（栈数量1）`)
        .fontSize(12)
        .width('100%')

      Text(`✅ 步骤4：更新到C页面（栈数量1）`)
        .fontSize(12)
        .width('100%')
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('#E8F5E9')
  }

  async aboutToAppear(): Promise<void> {
    const params = router.getParams();
    this.paramInfo = `参数：${JSON.stringify(params)}`;
    await this.checkRouterState();
  }
}

