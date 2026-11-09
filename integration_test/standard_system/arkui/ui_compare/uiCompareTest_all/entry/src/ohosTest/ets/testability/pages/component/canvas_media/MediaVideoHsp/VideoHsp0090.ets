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

// 测试用例: SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_HSP_0090
// 预期结果: 一个hap页面引用20个hsp视频资源，视频正常播放，性能稳定
// 自动化程度: 30% - 需要验证性能和多视频播放

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct VideoHsp0090 {
  @State message: string = '20个hsp视频资源测试'
  @State logs: string[] = []
  @State loadedCount: number = 0
  @State playingIndex: number = -1

  aboutToAppear() {
    this.loadedCount = 20
    this.addLog('初始化20个视频模拟')
  }

  private addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString()
    this.logs.unshift(`[${timestamp}] ${log}`)
    hilog.info(0x0000, 'VideoHsp0090', log)
    if (this.logs.length > 15) {
      this.logs.pop()
    }
  }

  build() {
    Column() {
      Text(this.message)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 5 })
        .id('title')

      Text('一个hap页面引用20个hsp视频资源')
        .fontSize(12)
        .fontColor(Color.Gray)

      Text(`模拟加载: ${this.loadedCount}/20 | 播放中: ${this.playingIndex >= 0 ? '视频' + (this.playingIndex + 1) : '无'}`)
        .fontSize(12)
        .fontColor(Color.Blue)
        .margin({ top: 5, bottom: 10 })
        .id('status')

      Scroll() {
        Column({ space: 5 }) {
          ForEach([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19], (index: number) => {
            Row({ space: 10 }) {
              Text(`视频${index + 1}`)
                .fontSize(12)
                .width(50)

              // 模拟视频区域
              Column() {
                Image($r('app.media.icon'))
                  .width('100%')
                  .height('100%')
                  .objectFit(ImageFit.Cover)
              }
              .width('13.89%')
              .height('4.92%')
              .backgroundColor('#333333')
              .id(`video${index}`)

              Button('播放')
                .fontSize(10)
                .height(30)
                .onClick(() => {
                  this.playingIndex = index
                  this.addLog(`播放视频${index + 1}`)
                })
            }
          })
        }
        .width('100%')
      }
      .width('100%')
      .height('28.69%')

      Text('日志:')
        .fontSize(12)
        .fontWeight(FontWeight.Medium)
        .width('90%')
        .textAlign(TextAlign.Start)
        .margin({ top: 5 })

      Scroll() {
        Column() {
          ForEach(this.logs, (log: string) => {
            Text(log)
              .fontSize(10)
              .fontColor(Color.Gray)
              .width('100%')
          })
        }
        .width('100%')
      }
      .width('90%')
      .height('4.92%')
      .backgroundColor('#F5F5F5')
      .padding(5)
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}
