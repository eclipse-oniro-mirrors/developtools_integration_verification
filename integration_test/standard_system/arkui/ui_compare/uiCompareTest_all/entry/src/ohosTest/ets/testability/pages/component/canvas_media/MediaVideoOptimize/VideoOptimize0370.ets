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

// 测试用例: SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0370
// 预期结果: 10个video组件滑动，页面不卡顿不崩溃
// 自动化程度: 30% - 需要手动滑动验证性能

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct VideoOptimize0370 {
  @State message: string = '10个Video组件滑动测试'
  @State logs: string[] = []

  private addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString()
    this.logs.unshift(`[${timestamp}] ${log}`)
    hilog.info(0x0000, 'VideoOptimize0370', log)
    if (this.logs.length > 5) {
      this.logs.pop()
    }
  }

  aboutToAppear() {
    this.addLog('页面加载 - 10个Video组件')
  }

  build() {
    Column() {
      Text(this.message)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 5 })
        .id('title')

      Text('预期: 滑动到底部，页面不卡顿不崩溃')
        .fontSize(11)
        .fontColor(Color.Orange)
        .margin({ bottom: 10 })

      Scroll() {
        Column({ space: 10 }) {
          ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], (index: number) => {
            Column() {
              Text(`Video ${index}`)
                .fontSize(12)
                .fontColor(Color.White)
                .margin({ bottom: 5 })
              // 模拟视频区域
              Image($r('app.media.icon'))
                .width('100%')
                .height(200)
                .objectFit(ImageFit.Cover)
            }
            .width('100%')
            .height('20.49%')
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
        .fontWeight(FontWeight.Medium)
        .width('90%')
        .margin({ top: 10 })

      Scroll() {
        Column() {
          ForEach(this.logs, (log: string) => {
            Text(log)
              .fontSize(10)
              .fontColor(Color.Gray)
              .width('100%')
          })
        }
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

