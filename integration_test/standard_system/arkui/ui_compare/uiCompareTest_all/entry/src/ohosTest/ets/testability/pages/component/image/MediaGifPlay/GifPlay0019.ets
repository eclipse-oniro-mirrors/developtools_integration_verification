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
 * @tc.name: SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0019
 * @tc.desc: 设置privacySensitive增加隐私隐藏
 * @tc.level: Level 2
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct GifPlay0019 {
  @Local testLog: string = '';
  @Local isPrivate: boolean = true;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'GifPlay0019', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - 隐私隐藏测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0019')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('隐私隐藏GIF播放测试')
        .fontSize(12)
        .margin({ bottom: 10 })

      Image($r('app.media.icon'))
        .width(150)
        .height(150)
        .id('gif_privacy')
        .privacySensitive(this.isPrivate)

      Text('privacySensitive: ' + this.isPrivate)
        .fontSize(12)
        .margin({ top: 10 })

      Row() {
        Button('隐私模式')
          .id('btn_private')
          .margin({ right: 10 })
          .onClick(() => {
            this.isPrivate = true;
            this.addLog('开启隐私模式');
          })
        Button('正常模式')
          .id('btn_normal')
          .onClick(() => {
            this.isPrivate = false;
            this.addLog('关闭隐私模式');
          })
      }.margin({ top: 15 })

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('1. 设置privacySensitive为true\n2. 期望: 隐私隐藏生效\n3. gif播放正常，显示后重新播放')
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

