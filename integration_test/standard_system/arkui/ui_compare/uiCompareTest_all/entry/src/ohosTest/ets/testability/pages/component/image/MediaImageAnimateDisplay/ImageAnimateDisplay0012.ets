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
 * @tc.name: SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ANIMATE_DISPLAY_0012
 * @tc.desc: 设置背景图为单静图显示
 * @tc.level: Level 2
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct ImageAnimateDisplay0012 {
  @Local testLog: string = '';
  @Local showDynamicReplacement: boolean = false;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'ImageAnimateDisplay0012', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - 单静图显示测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ANIMATE_DISPLAY_0012')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('单静图显示测试')
        .fontSize(12)
        .margin({ bottom: 10 })

      Column() {
        if (this.showDynamicReplacement) {
          // 动图替换
          Image($r('app.media.icon'))
            .width(200)
            .height(200)
            .id('dynamic_replacement')
            .onComplete(() => {
              this.addLog('动图加载完成');
            })
        } else {
          // 单静图背景
          Image($r('app.media.icon'))
            .width(200)
            .height(200)
            .id('static_single')
            .onComplete(() => {
              this.addLog('静图加载完成');
            })
        }
      }.margin({ bottom: 10 })

      Row() {
        Button('模拟返回重进')
          .id('btn_simulate_reenter')
          .onClick(() => {
            this.showDynamicReplacement = true;
            this.addLog('模拟返回后重新进入，页面被动图替换');
          })
        Button('重置')
          .id('btn_reset')
          .margin({ left: 10 })
          .onClick(() => {
            this.showDynamicReplacement = false;
            this.addLog('重置为单静图');
          })
      }.margin({ top: 10 })

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10 })

      Text('1. 设置背景为单静图\n2. 返回后重新进入页面，全页面被动图替换\n预期: 正常加载动画效果')
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

