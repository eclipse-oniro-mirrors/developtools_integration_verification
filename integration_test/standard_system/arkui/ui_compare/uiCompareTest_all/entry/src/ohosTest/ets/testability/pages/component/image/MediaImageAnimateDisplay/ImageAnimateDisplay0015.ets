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
 * @tc.name: SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ANIMATE_DISPLAY_0015
 * @tc.desc: 设置背景图为单动图适配横竖屏显示
 * @tc.level: Level 2
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct ImageAnimateDisplay0015 {
  @Local testLog: string = '';
  @Local orientation: string = '竖屏';
  @Local afterScreenOff: boolean = false;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'ImageAnimateDisplay0015', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - 单动图适配横竖屏测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ANIMATE_DISPLAY_0015')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('单动图适配横竖屏显示测试')
        .fontSize(12)
        .margin({ bottom: 5 })

      Text('当前方向: ' + this.orientation)
        .fontSize(11)
        .fontColor('#666666')
        .margin({ bottom: 10 })

      Column() {
        Image($r('app.media.icon'))
          .width(180)
          .height(180)
          .id('dynamic_single')
          .onComplete(() => {
            this.addLog('动图加载完成');
          })
      }.margin({ bottom: 10 })

      Text(this.afterScreenOff ? '息屏恢复后，被动图替换' : '初始状态')
        .fontSize(11)
        .fontColor(this.afterScreenOff ? '#00AA00' : '#666666')

      Row() {
        Button('模拟息屏恢复')
          .id('btn_simulate')
          .fontSize(12)
          .onClick(() => {
            this.afterScreenOff = true;
            this.addLog('模拟息屏后进入，被动图替换');
          })
      }

      Row() {
        Button('横屏')
          .id('btn_landscape')
          .margin({ right: 10 })
          .onClick(() => {
            this.orientation = '横屏';
            this.addLog('切换到横屏');
          })
        Button('竖屏')
          .id('btn_portrait')
          .margin({ right: 10 })
          .onClick(() => {
            this.orientation = '竖屏';
            this.addLog('切换到竖屏');
          })
        Button('重置')
          .id('btn_reset')
          .onClick(() => {
            this.afterScreenOff = false;
            this.addLog('重置状态');
          })
      }.margin({ top: 10 })

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10 })

      Text('1. 底层为单动图\n2. 适配横竖屏、息屏后进入被动图替换\n预期: 正常加载动画效果')
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

