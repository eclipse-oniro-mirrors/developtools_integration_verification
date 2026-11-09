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
 * @tc.name: SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ANIMATE_DISPLAY_0014
 * @tc.desc: 设置背景图为单动图显示
 * @tc.level: Level 2
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct ImageAnimateDisplay0014 {
  @Local testLog: string = '';
  @Local pageReentered: boolean = false;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'ImageAnimateDisplay0014', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - 单动图显示测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ANIMATE_DISPLAY_0014')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('单动图显示测试')
        .fontSize(12)
        .margin({ bottom: 10 })

      Column() {
        // 动图背景
        Image($r('app.media.icon'))
          .width(200)
          .height(200)
          .id('dynamic_single')
          .onComplete(() => {
            this.addLog('动图加载完成');
          })
      }
      .width('27.78%')
      .height('16.39%')
      .margin({ bottom: 10 })

      Text(this.pageReentered ? '页面已重进，动图替换' : '初始状态')
        .fontSize(11)
        .fontColor(this.pageReentered ? '#00AA00' : '#666666')

      Row() {
        Button('模拟返回重进')
          .id('btn_simulate_reenter')
          .onClick(() => {
            this.pageReentered = true;
            this.addLog('模拟返回后重新进入，全页面被动图替换');
          })
        Button('重置')
          .id('btn_reset')
          .margin({ left: 10 })
          .onClick(() => {
            this.pageReentered = false;
            this.addLog('重置状态');
          })
      }.margin({ top: 10 })

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10 })

      Text('1. 设置背景为单动图\n2. 返回后重新进入页面，全页面被动图替换\n预期: 正常加载动画效果')
        .fontSize(11)
        .fontColor('#666666')

      Scroll() {
        Text(this.testLog)
          .fontSize(10)
          .fontColor('#333333')
          .id('log_text')
      }
      .height('8.2%')
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

