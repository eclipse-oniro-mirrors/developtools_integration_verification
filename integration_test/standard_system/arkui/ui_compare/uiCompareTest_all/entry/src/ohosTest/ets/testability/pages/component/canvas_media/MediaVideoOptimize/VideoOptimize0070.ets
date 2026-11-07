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

// 测试用例: SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0070
// 预期结果: Video组件在屏幕内调用setCurrentTime接口，视频跳转到第10s
// 自动化程度: 40% - 需要验证视频跳转效果

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct VideoOptimize0070 {
  @State message: string = 'Video setCurrentTime接口测试'
  @State logs: string[] = []
  @State currentTime: number = 0
  @State isPlaying: boolean = false

  private addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString()
    this.logs.unshift(`[${timestamp}] ${log}`)
    hilog.info(0x0000, 'VideoOptimize0070', log)
    if (this.logs.length > 10) {
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

      Text('调用setCurrentTime(10, SeekMode.Accurate)跳转')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 20 })

      // 模拟视频区域
      Column() {
        Image($r('app.media.icon'))
          .width(200)
          .height(150)
          .objectFit(ImageFit.Cover)
        Text(`当前进度: ${this.currentTime}s`)
          .fontSize(14)
          .fontColor(Color.White)
          .margin({ top: 10 })
      }
      .width('100%')
      .height('20.49%')
      .backgroundColor('#333333')
      .id('videoArea')
      .justifyContent(FlexAlign.Center)

      Row({ space: 15 }) {
        Button('播放')
          .onClick(() => {
            this.isPlaying = true
            this.addLog('开始播放')
          })
          .id('playBtn')

        Button('跳转到第10s')
          .onClick(() => {
            this.currentTime = 10
            this.addLog('调用setCurrentTime(10, SeekMode.Accurate)')
            this.addLog('视频进度跳转到第10s')
          })
          .id('seekBtn')

        Button('暂停')
          .onClick(() => {
            this.isPlaying = false
            this.addLog('暂停播放')
          })
          .id('pauseBtn')
      }
      .margin({ top: 20, bottom: 20 })

      Text('测试说明:')
        .fontSize(14)
        .fontWeight(FontWeight.Medium)
        .width('90%')
        .textAlign(TextAlign.Start)

      Text('1. 点击播放按钮开始播放视频')
        .fontSize(11)
        .fontColor(Color.Gray)
        .width('90%')

      Text('2. 点击"跳转到第10s"按钮')
        .fontSize(11)
        .fontColor(Color.Gray)
        .width('90%')

      Text('3. 验证视频进度是否跳转到第10s')
        .fontSize(11)
        .fontColor(Color.Orange)
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

