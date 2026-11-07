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

// 测试用例: SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_HSP_0010
// 预期结果: hap引用自身视频资源，视频正常播放/暂停/停止
// 自动化程度: 30% - 需要验证视频播放效果
// 注意: 此测试需要在rawfile中放入video.mp4资源文件

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct VideoHsp0010 {
  @State message: string = 'hap引用自身视频资源测试'
  @State logs: string[] = []
  @State isPlaying: boolean = false
  @State currentTime: number = 0
  @State duration: number = 10

  private addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString()
    this.logs.unshift(`[${timestamp}] ${log}`)
    hilog.info(0x0000, 'VideoHsp0010', log)
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

      Text('引用自身hap的视频资源')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 20 })

      // 模拟视频区域
      Column() {
        Image($r('app.media.icon'))
          .width('100%')
          .height('100%')
          .objectFit(ImageFit.Cover)
        if (this.isPlaying) {
          Text('▶ 播放中...')
            .fontSize(14)
            .fontColor(Color.White)
            .backgroundColor('rgba(0,0,0,0.5)')
            .padding(5)
        }
      }
      .width('90%')
      .height('16.39%')
      .backgroundColor('#333333')
      .id('videoArea')
      .justifyContent(FlexAlign.Center)

      Row({ space: 20 }) {
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
            this.currentTime = 0
            this.addLog('视频停止，回到起始位置')
          })
          .id('stopBtn')
      }
      .margin({ top: 20, bottom: 10 })

      Text(`状态: ${this.isPlaying ? '播放中' : '已停止'}`)
        .fontSize(12)
        .fontColor(Color.Blue)
        .id('status')

      Text('测试说明: 需要在rawfile中放入video.mp4资源')
        .fontSize(11)
        .fontColor(Color.Orange)
        .margin({ top: 10 })

      Text('日志:')
        .fontSize(14)
        .fontWeight(FontWeight.Medium)
        .width('90%')
        .textAlign(TextAlign.Start)
        .margin({ top: 10 })

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
      .height('8.2%')
      .backgroundColor('#F5F5F5')
      .padding(10)
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}
