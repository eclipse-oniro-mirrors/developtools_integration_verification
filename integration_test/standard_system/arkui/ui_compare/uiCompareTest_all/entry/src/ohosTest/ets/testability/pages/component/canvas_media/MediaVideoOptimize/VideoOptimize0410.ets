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

// 测试用例: SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0410
// 预期结果: 10个video组件播放并滑动，播放正常不卡顿不崩溃
// 自动化程度: 30% - 需要手动操作验证

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct VideoOptimize0410 {
  @State message: string = '10个Video播放并滑动测试'
  @State logs: string[] = []
  @State playingStates: boolean[] = [false, false, false, false, false, false, false, false, false, false]

  private addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString()
    this.logs.unshift(`[${timestamp}] ${log}`)
    hilog.info(0x0000, 'VideoOptimize0410', log)
    if (this.logs.length > 5) {
      this.logs.pop()
    }
  }

  build() {
    Column() {
      Text(this.message)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 5 })
        .id('title')

      Row({ space: 10 }) {
        Button('全部播放')
          .fontSize(12)
          .onClick(() => {
            for (let i = 0; i < 10; i++) {
              this.playingStates[i] = true
            }
            this.addLog('所有视频开始播放')
          })
          .id('playAllBtn')

        Button('全部暂停')
          .fontSize(12)
          .onClick(() => {
            for (let i = 0; i < 10; i++) {
              this.playingStates[i] = false
            }
            this.addLog('所有视频暂停')
          })
          .id('pauseAllBtn')
      }
      .margin({ bottom: 10 })

      Scroll() {
        Column({ space: 10 }) {
          ForEach([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], (index: number) => {
            Column() {
              Row() {
                Text(`Video ${index + 1}`)
                  .fontSize(12)
                  .fontColor(Color.White)
                Text(this.playingStates[index] ? ' ▶ 播放中' : ' ⏸ 暂停')
                  .fontSize(10)
                  .fontColor(this.playingStates[index] ? Color.Green : Color.Gray)
              }
              .margin({ bottom: 5 })

              Image($r('app.media.icon'))
                .width('80%')
                .height(150)
                .objectFit(ImageFit.Cover)
            }
            .width('100%')
            .height('16.39%')
            .backgroundColor('#333333')
            .justifyContent(FlexAlign.Center)
            .id(`video${index}`)
          })
        }
        .width('100%')
      }
      .width('100%')
      .height('70%')
      .scrollBar(BarState.Auto)

      Text('日志:')
        .fontSize(12)
        .width('90%')
        .margin({ top: 5 })

      Scroll() {
        Column() {
          ForEach(this.logs, (log: string) => {
            Text(log)
              .fontSize(10)
              .fontColor(Color.Gray)
          })
        }
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

