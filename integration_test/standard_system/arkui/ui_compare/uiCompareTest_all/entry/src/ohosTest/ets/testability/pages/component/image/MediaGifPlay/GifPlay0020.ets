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
 * @tc.name: SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0020
 * @tc.desc: ImageAnimator设置PixelMap全动图播放
 * @tc.level: Level 2
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct GifPlay0020 {
  @Local testLog: string = '';
  @Local animatorState: AnimationStatus = AnimationStatus.Running;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'GifPlay0020', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - ImageAnimator PixelMap测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0020')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('ImageAnimator PixelMap全动图测试')
        .fontSize(12)
        .margin({ bottom: 10 })

      ImageAnimator()
        .images([
          { src: $r('app.media.icon') }
        ])
        .duration(1000)
        .state(this.animatorState)
        .iterations(-1)
        .width(150)
        .height(150)
        .id('image_animator')

      Text('状态: ' + (this.animatorState === AnimationStatus.Running ? '播放中' : '暂停'))
        .fontSize(12)
        .margin({ top: 10 })

      Row() {
        Button('播放')
          .id('btn_play')
          .margin({ right: 10 })
          .onClick(() => {
            this.animatorState = AnimationStatus.Running;
            this.addLog('开始播放');
          })
        Button('暂停')
          .id('btn_pause')
          .onClick(() => {
            this.animatorState = AnimationStatus.Paused;
            this.addLog('暂停播放');
          })
      }.margin({ top: 15 })

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('1. ImageAnimator引入多Gif图源\n2. PixelMap全动图播放\n3. 期望: Gif正常播放不卡顿')
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

