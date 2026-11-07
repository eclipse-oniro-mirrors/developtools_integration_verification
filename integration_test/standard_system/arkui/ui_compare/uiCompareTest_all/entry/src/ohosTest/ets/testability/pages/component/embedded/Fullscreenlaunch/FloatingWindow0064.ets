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
 * @tc.name: SUB_ACE_UI_COMPONENT_FLOATING_WINDOW_0064
 * @tc.desc: 应用分屏使用
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct FloatingWindow0064 {
  @Local testLog: string = '';

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'FloatingWindow0064', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - 应用分屏测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_FLOATING_WINDOW_0064')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('应用分屏使用测试')
        .fontSize(12)
        .margin({ bottom: 20 })

      Text('测试应用A')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Column() {
        Text('应用A内容区域')
          .fontSize(14)
        Button('操作按钮')
          .id('btn_app_a')
          .margin({ top: 10 })
          .onClick(() => {
            this.addLog('应用A按钮被点击');
          })
      }
      .width('100%')
      .height('12.3%')
      .backgroundColor('#E3F2FD')
      .justifyContent(FlexAlign.Center)
      .borderRadius(10)

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 30 })

      Text('1. 分别点击不同应用\n2. 进行应用分屏\n3. 期望: 应用互不影响\n4. 均可正常使用')
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

