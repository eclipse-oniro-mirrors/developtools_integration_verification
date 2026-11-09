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
 * @tc.name: SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0024
 * @tc.desc: 设置浮层
 * @tc.level: Level 2
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct GifPlay0024 {
  @Local testLog: string = '';
  @Local showOverlay: boolean = true;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'GifPlay0024', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - 浮层GIF测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0024')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('浮层GIF播放测试')
        .fontSize(12)
        .margin({ bottom: 10 })

      Stack() {
        Image($r('app.media.icon'))
          .width(150)
          .height(150)
          .id('gif_bottom')

        if (this.showOverlay) {
          Image($r('app.media.icon'))
            .width(80)
            .height(80)
            .id('gif_overlay')
            .opacity(0.8)
        }
      }

      Text('浮层: ' + (this.showOverlay ? '显示' : '隐藏'))
        .fontSize(12)
        .margin({ top: 10 })

      Row() {
        Button('显示浮层')
          .id('btn_show_overlay')
          .margin({ right: 10 })
          .onClick(() => {
            this.showOverlay = true;
            this.addLog('显示浮层GIF');
          })
        Button('隐藏浮层')
          .id('btn_hide_overlay')
          .onClick(() => {
            this.showOverlay = false;
            this.addLog('隐藏浮层GIF');
          })
      }.margin({ top: 15 })

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('1. 设置浮层在gif上，浮层也为gif\n2. 切换图源\n3. 期望: 上下两层动图播放互不影响')
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

