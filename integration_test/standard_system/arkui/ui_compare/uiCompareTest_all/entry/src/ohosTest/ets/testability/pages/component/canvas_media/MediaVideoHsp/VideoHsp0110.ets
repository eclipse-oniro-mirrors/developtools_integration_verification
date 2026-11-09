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

// 测试用例: SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_HSP_0110
// 预期结果: hap引用20个hsp页面，每个hsp包含单个视频，正常播放
// 自动化程度: 30% - 需要验证性能

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct VideoHsp0110 {
  @State message: string = '20个hsp页面各含单个视频测试'
  @State logs: string[] = []
  @State loadedCount: number = 20
  @State playingIndex: number = -1

  aboutToAppear() {
    this.addLog('模拟: hap引用20个hsp页面，每个hsp包含1个视频')
  }

  private addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString()
    this.logs.unshift(`[${timestamp}] ${log}`)
    hilog.info(0x0000, 'VideoHsp0110', log)
    if (this.logs.length > 10) {
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

      Text('hap引用20个hsp页面，每个hsp放入单个视频资源')
        .fontSize(11)
        .fontColor(Color.Gray)

      Row({ space: 10 }) {
        Text(`加载: ${this.loadedCount}/20`)
          .fontSize(12)
          .fontColor(Color.Blue)
        Text(`播放: ${this.playingIndex >= 0 ? 'hsp' + (this.playingIndex + 1) : '无'}`)
          .fontSize(12)
          .fontColor(Color.Green)
      }
      .margin({ top: 5, bottom: 10 })
      .id('status')

      Text('结构说明:')
        .fontSize(12)
        .fontWeight(FontWeight.Medium)
        .width('90%')

      Column() {
        Text('hap (主应用)')
          .fontSize(11)
          .fontColor(Color.Blue)
        Row() {
          Text('├─ hsp1(视频1) ├─ hsp2(视频2) ... ├─ hsp20(视频20)')
            .fontSize(9)
            .fontColor(Color.Gray)
        }
      }
      .width('90%')
      .alignItems(HorizontalAlign.Start)
      .backgroundColor('#F0F8FF')
      .padding(8)
      .margin({ bottom: 10 })

      Scroll() {
        Column({ space: 3 }) {
          ForEach([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19], (index: number) => {
            Row({ space: 5 }) {
              Text(`hsp${index + 1}`)
                .fontSize(10)
                .width(35)

              // 模拟视频区域
              Column() {
                Image($r('app.media.icon'))
                  .width('100%')
                  .height('100%')
                  .objectFit(ImageFit.Cover)
              }
              .width('11.11%')
              .height('3.69%')
              .backgroundColor('#333333')
              .id(`video${index}`)

              Button('▶')
                .fontSize(10)
                .width(35)
                .height(25)
                .onClick(() => {
                  this.playingIndex = index
                  this.addLog(`播放hsp${index + 1}视频`)
                })
            }
          })
        }
        .width('100%')
      }
      .width('100%')
      .height('24.59%')

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
      .height('4.1%')
      .backgroundColor('#F5F5F5')
      .padding(5)
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}
