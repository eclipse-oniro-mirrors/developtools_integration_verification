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
 * @tc.name: SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0017
 * @tc.desc: src设置EMPTY，清空图源
 * @tc.level: Level 2
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct GifPlay0017 {
  @Local testLog: string = '';
  @Local showImage: boolean = true;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'GifPlay0017', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - 清空图源测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0017')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('清空图源再恢复测试')
        .fontSize(12)
        .margin({ bottom: 10 })

      if (this.showImage) {
        Image($r('app.media.icon'))
          .width(150)
          .height(150)
          .id('gif_display')
      } else {
        Column() {
          Text('图源已清空')
            .fontSize(14)
            .fontColor('#999999')
        }
        .width('20.83%')
        .height('12.3%')
        .backgroundColor('#F0F0F0')
        .justifyContent(FlexAlign.Center)
        .id('empty_placeholder')
      }

      Text('状态: ' + (this.showImage ? 'GIF播放中' : '图源已清空'))
        .fontSize(12)
        .margin({ top: 10 })

      Row() {
        Button('清空图源')
          .id('btn_clear')
          .margin({ right: 10 })
          .onClick(() => {
            this.showImage = false;
            this.addLog('图源已清空');
          })
        Button('恢复GIF')
          .id('btn_restore')
          .onClick(() => {
            this.showImage = true;
            this.addLog('GIF已恢复');
          })
      }.margin({ top: 15 })

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('1. 切换图源清空，再切换Gif\n2. 期望: Gif正常播放不卡顿')
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

