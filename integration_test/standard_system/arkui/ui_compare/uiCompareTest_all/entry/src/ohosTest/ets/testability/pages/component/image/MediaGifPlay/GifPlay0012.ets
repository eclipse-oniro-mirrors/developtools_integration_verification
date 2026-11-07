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
 * @tc.name: SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0012
 * @tc.desc: src多单动图来回切换图源播放
 * @tc.level: Level 2
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct GifPlay0012 {
  @Local testLog: string = '';
  @Local gifIndex: number = 0;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'GifPlay0012', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - 动图来回切换');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0012')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('多单动图来回切换测试')
        .fontSize(12)
        .margin({ bottom: 10 })

      Image($r('app.media.icon'))
        .width(150)
        .height(150)
        .id('gif_display')

      Text('当前GIF: 动图' + (this.gifIndex + 1))
        .fontSize(12)
        .margin({ top: 10 })

      Row() {
        Button('GIF 1')
          .id('btn_gif1')
          .margin({ right: 10 })
          .onClick(() => {
            this.gifIndex = 0;
            this.addLog('切换到GIF 1');
          })
        Button('GIF 2')
          .id('btn_gif2')
          .margin({ right: 10 })
          .onClick(() => {
            this.gifIndex = 1;
            this.addLog('切换到GIF 2');
          })
        Button('GIF 3')
          .id('btn_gif3')
          .onClick(() => {
            this.gifIndex = 2;
            this.addLog('切换到GIF 3');
          })
      }.margin({ top: 15 })

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('1. 切换src图源由动图到动图\n2. 期望: Gif正常播放不卡顿')
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

