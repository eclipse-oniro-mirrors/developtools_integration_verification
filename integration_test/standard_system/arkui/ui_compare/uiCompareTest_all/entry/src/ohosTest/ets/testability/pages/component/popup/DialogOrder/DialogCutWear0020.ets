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

/**
 * @tc.name: SUB_ACE_UI_COMPONENT_DIALOG_CUT_WEAR_0020
 * @tc.desc: 打开/关闭ARKUI_WEARABLE裁剪开关可以正常编译
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct DialogCutWear0020 {
  @Local testLog: string = '';

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'DialogCutWear0020', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - ARKUI_WEARABLE裁剪开关测试');
    this.addLog('验证打开/关闭裁剪开关可以正常编译');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_DIALOG_CUT_WEAR_0020')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('ARKUI_WEARABLE裁剪开关测试')
        .fontSize(12)
        .margin({ bottom: 20 })

      Text('测试内容:')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Column() {
        Text('• 打开ARKUI_WEARABLE裁剪开关')
          .fontSize(11)
        Text('• 执行编译')
          .fontSize(11)
        Text('• 关闭ARKUI_WEARABLE裁剪开关')
          .fontSize(11)
        Text('• 执行编译')
          .fontSize(11)
      }
      .alignItems(HorizontalAlign.Start)
      .margin({ top: 10 })

      Text('此页面用于验证编译结果')
        .fontSize(14)
        .fontColor('#007DFF')
        .margin({ top: 20 })
        .id('compile_status')

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 30 })

      Text('1. 打开/关闭ARKUI_WEARABLE裁剪开关\n2. 可以正常编译\n3. 期望: 打开可以正常编译\n4. 关闭可以正常编译')
        .fontSize(11)
        .fontColor('#666666')

      Scroll() {
        Text(this.testLog)
          .fontSize(10)
          .fontColor('#333333')
          .id('log_text')
      }
      .height('6.56%')
      .width('100%')
      .backgroundColor('#F5F5F5')
      .padding(5)
      .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}

