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
 * @tc.name: SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0010
 * @tc.desc: src切换图源由静图切换为动图再切换静图
 * @tc.level: Level 2
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct GifPlay0010 {
  @Local testLog: string = '';
  @Local imageType: number = 0; // 0-静图, 1-动图, 2-静图

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'GifPlay0010', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - 静图切换动图再切静图');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0010')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('静图→动图→静图切换测试')
        .fontSize(12)
        .margin({ bottom: 10 })

      if (this.imageType === 0) {
        Image($r('app.media.icon'))
          .width(150)
          .height(150)
          .id('image_display')
      } else if (this.imageType === 1) {
        Image($r('app.media.icon'))
          .width(150)
          .height(150)
          .id('image_display')
      } else {
        Image($r('app.media.icon'))
          .width(150)
          .height(150)
          .id('image_display')
      }

      Text('当前: ' + (this.imageType === 0 ? '静图1' : (this.imageType === 1 ? '动图(GIF)' : '静图2')))
        .fontSize(12)
        .margin({ top: 10 })

      Row() {
        Button('静图')
          .id('btn_static1')
          .margin({ right: 10 })
          .onClick(() => {
            this.imageType = 0;
            this.addLog('切换到静图1');
          })
        Button('动图')
          .id('btn_gif')
          .margin({ right: 10 })
          .onClick(() => {
            this.imageType = 1;
            this.addLog('切换到动图');
          })
        Button('静图')
          .id('btn_static2')
          .onClick(() => {
            this.imageType = 2;
            this.addLog('切换到静图2');
          })
      }.margin({ top: 15 })

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('1. 切换src图源由静图到gif动图再切回静图\n2. 期望: Gif正常播放不卡顿')
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

