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
 * @tc.name: SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0130
 * @tc.desc: 设置imageAnimator组件ImageFrameInfo中src属性为heif格式，设置播放时长1000
 * @tc.level: Level 2
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct Heif0130 {
  @Local testLog: string = '';
  @Local animatorState: AnimationStatus = AnimationStatus.Running;
  @Local playCount: number = 0;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'Heif0130', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - ImageAnimator HEIF格式 1秒播放测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0130')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('ImageAnimator HEIF格式 播放时长1000ms测试')
        .fontSize(12)
        .margin({ bottom: 10 })

      ImageAnimator()
        .images([
          { src: $r('app.media.icon') },
          { src: $r('app.media.icon') },
          { src: $r('app.media.icon') }
        ])
        .width(150)
        .height(150)
        .state(this.animatorState)
        .duration(1000)
        .iterations(1)
        .id('heif_animator_1s')
        .onStart(() => {
          this.addLog('ImageAnimator onStart');
        })
        .onFinish(() => {
          this.playCount++;
          this.addLog('ImageAnimator onFinish - 播放完成次数: ' + this.playCount);
        })

      Text('播放完成次数: ' + this.playCount)
        .fontSize(12)
        .margin({ top: 10 })

      Row() {
        Button('重新播放')
          .id('btn_replay')
          .onClick(() => {
            this.animatorState = AnimationStatus.Stopped;
            setTimeout(() => {
              this.animatorState = AnimationStatus.Running;
              this.addLog('重新开始播放');
            }, 100);
          })
      }.margin({ top: 10 })

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10 })

      Text('1. 资源图片正常显示\n2. 网络图片显示正常\n3. 本地图片播放显示一秒，播放结束时执行onFinish')
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

