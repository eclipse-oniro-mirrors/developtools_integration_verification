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
 * @tc.name: SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0022
 * @tc.desc: 单张gif：总时长较短，动图数量较多
 * @tc.level: Level 2
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct GifPlay0022 {
  @Local testLog: string = '';

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'GifPlay0022', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - 高帧数短时长GIF测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0022')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('高帧数短时长GIF测试')
        .fontSize(12)
        .margin({ bottom: 10 })

      Image($r('app.media.icon'))
        .width(150)
        .height(150)
        .id('gif_high_fps')

      Text('高质量GIF: 帧数多，时长短')
        .fontSize(12)
        .margin({ top: 10 })

      Text('GIF特征：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)
        .margin({ top: 15 })

      Text('• 高帧率动画\n• 总时长较短\n• 动图数量较多')
        .fontSize(11)
        .fontColor('#007DFF')
        .alignSelf(ItemAlign.Start)

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('1. 图源为高质量单张gif\n2. 帧数较多，播放时长较短\n3. 期望: Gif正常播放不卡顿')
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

