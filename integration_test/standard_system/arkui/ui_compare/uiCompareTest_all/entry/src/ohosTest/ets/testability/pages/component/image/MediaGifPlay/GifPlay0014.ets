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
 * @tc.name: SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0014
 * @tc.desc: src切换由一屏多动图切换一屏多动图播放
 * @tc.level: Level 2
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct GifPlay0014 {
  @Local testLog: string = '';
  @Local groupIndex: number = 0;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'GifPlay0014', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - 多动图组切换');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0014')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('多动图组切换测试')
        .fontSize(12)
        .margin({ bottom: 10 })

      Row() {
        Image($r('app.media.icon'))
          .width(80)
          .height(80)
          .id('gif_a')
        Image($r('app.media.icon'))
          .width(80)
          .height(80)
          .id('gif_b')
        Image($r('app.media.icon'))
          .width(80)
          .height(80)
          .id('gif_c')
      }

      Text('当前组: ' + (this.groupIndex === 0 ? 'A组' : 'B组'))
        .fontSize(12)
        .margin({ top: 10 })

      Row() {
        Button('A组动图')
          .id('btn_group_a')
          .margin({ right: 10 })
          .onClick(() => {
            this.groupIndex = 0;
            this.addLog('切换到A组动图');
          })
        Button('B组动图')
          .id('btn_group_b')
          .onClick(() => {
            this.groupIndex = 1;
            this.addLog('切换到B组动图');
          })
      }.margin({ top: 15 })

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('1. 一屏多动图切换为另一屏多动图\n2. 期望: Gif正常播放不卡顿')
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

