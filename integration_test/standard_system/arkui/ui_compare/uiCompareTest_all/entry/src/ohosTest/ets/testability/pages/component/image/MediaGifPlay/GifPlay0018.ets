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
 * @tc.name: SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0018
 * @tc.desc: 组件区域可变设置
 * @tc.level: Level 2
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct GifPlay0018 {
  @Local testLog: string = '';
  @Local showMultiple: boolean = true;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'GifPlay0018', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - 组件区域可变测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0018')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('组件区域可变设置测试')
        .fontSize(12)
        .margin({ bottom: 10 })

      if (this.showMultiple) {
        Column() {
          Image($r('app.media.icon'))
            .width('100%')
            .height(80)
            .id('bg_static')
          Image($r('app.media.icon'))
            .width('100%')
            .height(80)
            .id('bg_gif')
        }
        .width('100%')
        .backgroundColor('#E8E8E8')
      } else {
        Image($r('app.media.icon'))
          .width('100%')
          .height(160)
          .id('single_gif')
      }

      Text('状态: ' + (this.showMultiple ? '静图+动图背景' : '单动图'))
        .fontSize(12)
        .margin({ top: 10 })

      Row() {
        Button('静图+动图')
          .id('btn_multiple')
          .margin({ right: 10 })
          .onClick(() => {
            this.showMultiple = true;
            this.addLog('切换到静图+动图');
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

      Text('1. 底部静图+动图展示\n2. 退出再进入替换为单动图\n3. 期望: 替换前后Gif均正常播放')
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

