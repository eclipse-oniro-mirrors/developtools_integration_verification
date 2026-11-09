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
 * @tc.name: SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0023
 * @tc.desc: Gif播放设置挂载卸载事件
 * @tc.level: Level 2
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct GifPlay0023 {
  @Local testLog: string = '';
  @Local showGif: boolean = true;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'GifPlay0023', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - 挂载卸载事件测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0023')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('挂载卸载事件测试')
        .fontSize(12)
        .margin({ bottom: 10 })

      if (this.showGif) {
        Image($r('app.media.icon'))
          .width(150)
          .height(150)
          .id('gif_mount')
          .onAppear(() => {
            this.addLog('GIF组件已挂载');
          })
          .onDisAppear(() => {
            this.addLog('GIF组件已卸载');
          })
      } else {
        Column() {
          Text('组件已卸载')
            .fontSize(14)
            .fontColor('#999999')
        }
        .width('20.83%')
        .height('12.3%')
        .backgroundColor('#F0F0F0')
        .justifyContent(FlexAlign.Center)
        .id('placeholder')
      }

      Text('状态: ' + (this.showGif ? '已挂载' : '已卸载'))
        .fontSize(12)
        .margin({ top: 10 })

      Row() {
        Button('卸载组件')
          .id('btn_unmount')
          .margin({ right: 10 })
          .onClick(() => {
            this.showGif = false;
            this.addLog('卸载组件');
          })
        Button('挂载组件')
          .id('btn_mount')
          .onClick(() => {
            this.showGif = true;
            this.addLog('挂载组件');
          })
      }.margin({ top: 15 })

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('1. 播放过程中卸载组件\n2. 再挂载组件\n3. 期望: Gif正常播放不卡顿')
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

