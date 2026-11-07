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
 * @tc.name: SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0013
 * @tc.desc: src切换图源一屏多动图切换为单动图再切回多动图
 * @tc.level: Level 2
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct GifPlay0013 {
  @Local testLog: string = '';
  @Local showMultiple: boolean = true;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'GifPlay0013', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - 一屏多动图切换');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0013')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('多动图↔单动图切换测试')
        .fontSize(12)
        .margin({ bottom: 10 })

      if (this.showMultiple) {
        Row() {
          Image($r('app.media.icon'))
            .width(80)
            .height(80)
            .id('gif_1')
          Image($r('app.media.icon'))
            .width(80)
            .height(80)
            .id('gif_2')
          Image($r('app.media.icon'))
            .width(80)
            .height(80)
            .id('gif_3')
        }
      } else {
        Image($r('app.media.icon'))
          .width(150)
          .height(150)
          .id('gif_single')
      }

      Text('当前: ' + (this.showMultiple ? '多动图模式' : '单动图模式'))
        .fontSize(12)
        .margin({ top: 10 })

      Row() {
        Button('多动图')
          .id('btn_multiple')
          .margin({ right: 10 })
          .onClick(() => {
            this.showMultiple = true;
            this.addLog('切换到多动图');
          })
        Button('单动图')
          .id('btn_single')
          .onClick(() => {
            this.showMultiple = false;
            this.addLog('切换到单动图');
          })
      }.margin({ top: 15 })

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('1. 一屏多动图切换为单动图再切回多动图\n2. 期望: Gif正常播放不卡顿')
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

