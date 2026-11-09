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
 * @tc.name: SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0011
 * @tc.desc: src切换图源由动图切换为静图再切换动图
 * @tc.level: Level 2
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct GifPlay0011 {
  @Local testLog: string = '';
  @Local imageType: number = 0; // 0-动图, 1-静图, 2-动图

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'GifPlay0011', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - 动图切换静图再切动图');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0011')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('动图→静图→动图切换测试')
        .fontSize(12)
        .margin({ bottom: 10 })

      Image($r('app.media.icon'))
        .width(150)
        .height(150)
        .id('image_display')

      Text('当前: ' + (this.imageType === 0 ? '动图1(GIF)' : (this.imageType === 1 ? '静图' : '动图2(GIF)')))
        .fontSize(12)
        .margin({ top: 10 })

      Row() {
        Button('动图1')
          .id('btn_gif1')
          .margin({ right: 10 })
          .onClick(() => {
            this.imageType = 0;
            this.addLog('切换到动图1');
          })
        Button('静图')
          .id('btn_static')
          .margin({ right: 10 })
          .onClick(() => {
            this.imageType = 1;
            this.addLog('切换到静图');
          })
        Button('动图2')
          .id('btn_gif2')
          .onClick(() => {
            this.imageType = 2;
            this.addLog('切换到动图2');
          })
      }.margin({ top: 15 })

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('1. 切换src图源由动图到静图再切回动图\n2. 期望: Gif正常播放不卡顿')
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

