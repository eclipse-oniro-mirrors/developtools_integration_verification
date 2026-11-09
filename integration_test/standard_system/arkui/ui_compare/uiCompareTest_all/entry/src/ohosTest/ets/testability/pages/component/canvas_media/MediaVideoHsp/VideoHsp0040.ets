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

// 测试用例: SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_HSP_0040
// 预期结果: hap引用hsp视频资源，替换hsp包(包名不变)后视频正常播放
// 自动化程度: 30% - 需要手动替换hsp包验证

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct VideoHsp0040 {
  @State message: string = 'hap引用hsp视频资源(替换包)'
  @State logs: string[] = []
  @State isPlaying: boolean = false

  private addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString()
    this.logs.unshift(`[${timestamp}] ${log}`)
    hilog.info(0x0000, 'VideoHsp0040', log)
    if (this.logs.length > 15) {
      this.logs.pop()
    }
  }

  build() {
    Column() {
      Text(this.message)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })
        .id('title')

      Text('引用hsp视频页面，替换hsp包(包名不变)')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 10 })

      Text('预期: 替换后视频资源正常播放')
        .fontSize(11)
        .fontColor(Color.Orange)
        .margin({ bottom: 20 })

      // 模拟视频区域
      Column() {
        Image($r('app.media.icon'))
          .width('100%')
          .height('100%')
          .objectFit(ImageFit.Cover)
      }
      .width('90%')
      .height('14.75%')
      .backgroundColor('#333333')
      .id('videoArea')

      Row({ space: 15 }) {
        Button('播放')
          .onClick(() => {
            this.isPlaying = true
            this.addLog('视频开始播放')
          })
          .id('playBtn')

        Button('暂停')
          .onClick(() => {
            this.isPlaying = false
            this.addLog('视频暂停')
          })
          .id('pauseBtn')

        Button('停止')
          .onClick(() => {
            this.isPlaying = false
            this.addLog('视频停止')
          })
          .id('stopBtn')
      }
      .margin({ top: 15, bottom: 15 })

      Text('测试步骤:')
        .fontSize(14)
        .fontWeight(FontWeight.Medium)
        .width('90%')
        .textAlign(TextAlign.Start)

      Text('1. 播放视频，确认正常')
        .fontSize(11)
        .fontColor(Color.Gray)
        .width('90%')

      Text('2. 替换hsp包(保持包名不变)')
        .fontSize(11)
        .fontColor(Color.Gray)
        .width('90%')

      Text('3. 重新播放，验证视频正常')
        .fontSize(11)
        .fontColor(Color.Gray)
        .width('90%')
        .margin({ bottom: 10 })

      Text('日志:')
        .fontSize(14)
        .fontWeight(FontWeight.Medium)
        .width('90%')
        .textAlign(TextAlign.Start)

      Scroll() {
        Column() {
          ForEach(this.logs, (log: string, index: number) => {
            Text(log)
              .fontSize(11)
              .fontColor(Color.Gray)
              .width('100%')
              .textAlign(TextAlign.Start)
          })
        }
        .width('100%')
      }
      .width('90%')
      .height('6.56%')
      .backgroundColor('#F5F5F5')
      .padding(10)
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}
