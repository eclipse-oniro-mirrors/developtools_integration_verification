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
 * @tc.name: SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0021
 * @tc.desc: Gif固定播放次数
 * @tc.level: Level 2
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct GifPlay0021 {
  @Local testLog: string = '';
  @Local playCount: number = 3;
  @Local animatorState: AnimationStatus = AnimationStatus.Running;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'GifPlay0021', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - 固定播放次数测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0021')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('Gif固定播放次数测试')
        .fontSize(12)
        .margin({ bottom: 10 })

      ImageAnimator()
        .images([
          { src: $r('app.media.icon') }
        ])
        .duration(1000)
        .state(this.animatorState)
        .iterations(this.playCount)
        .width(150)
        .height(150)
        .id('image_animator')
        .onFinish(() => {
          this.addLog('播放完成，共播放' + this.playCount + '次');
        })

      Text('播放次数: ' + this.playCount)
        .fontSize(12)
        .margin({ top: 10 })

      Row() {
        Button('1次')
          .id('btn_1')
          .fontSize(12)
          .margin({ right: 5 })
          .onClick(() => {
            this.playCount = 1;
            this.animatorState = AnimationStatus.Running;
            this.addLog('设置播放1次');
          })
        Button('3次')
          .id('btn_3')
          .fontSize(12)
          .margin({ right: 5 })
          .onClick(() => {
            this.playCount = 3;
            this.animatorState = AnimationStatus.Running;
            this.addLog('设置播放3次');
          })
        Button('无限')
          .id('btn_infinite')
          .fontSize(12)
          .onClick(() => {
            this.playCount = -1;
            this.animatorState = AnimationStatus.Running;
            this.addLog('设置无限播放');
          })
      }.margin({ top: 15 })

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('1. 设置Gif图固定播放次数\n2. 期望: Gif正常播放不卡顿')
        .fontSize(11)
        .fontColor('#666666')

      Scroll() {
        Text(this.testLog)
          .fontSize(10)
          .fontColor('#333333')
          .id('log_text')
      }
      .height('4.92%')
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

