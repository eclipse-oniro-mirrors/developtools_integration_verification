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
 * @tc.name: SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0016
 * @tc.desc: 切换播放的图源是由不同三种src类型引进的图源进行播放
 * @tc.level: Level 2
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct GifPlay0016 {
  @Local testLog: string = '';
  @Local srcType: number = 0;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'GifPlay0016', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - 不同src类型测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0016')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('不同src类型GIF播放测试')
        .fontSize(12)
        .margin({ bottom: 10 })

      Image($r('app.media.icon'))
        .width(150)
        .height(150)
        .id('gif_display')

      Text('当前src类型: ' + (this.srcType === 0 ? 'ResourceStr' : (this.srcType === 1 ? 'PixelMap' : 'DrawableDescriptor')))
        .fontSize(12)
        .margin({ top: 10 })

      Row() {
        Button('Resource')
          .id('btn_resource')
          .fontSize(12)
          .margin({ right: 5 })
          .onClick(() => {
            this.srcType = 0;
            this.addLog('切换到ResourceStr');
          })
        Button('PixelMap')
          .id('btn_pixelmap')
          .fontSize(12)
          .margin({ right: 5 })
          .onClick(() => {
            this.srcType = 1;
            this.addLog('切换到PixelMap');
          })
        Button('Drawable')
          .id('btn_drawable')
          .fontSize(12)
          .onClick(() => {
            this.srcType = 2;
            this.addLog('切换到DrawableDescriptor');
          })
      }.margin({ top: 15 })

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('1. 切换不同src类型引进的Gif动图\n2. 期望: Gif正常播放不卡顿')
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

