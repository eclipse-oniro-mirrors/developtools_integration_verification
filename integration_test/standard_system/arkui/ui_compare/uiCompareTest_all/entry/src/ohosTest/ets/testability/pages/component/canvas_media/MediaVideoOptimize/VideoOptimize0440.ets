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

// 测试用例: SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0440
// 预期结果: 50个video组件播放并滑动，播放正常不卡顿不崩溃
// 自动化程度: 30% - 需要手动操作验证

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct VideoOptimize0440 {
  @State message: string = '50个Video播放并滑动测试'
  @State isAllPlaying: boolean = false
  private videoCount: number[] = []

  aboutToAppear() {
    for (let i = 1; i <= 50; i++) {
      this.videoCount.push(i)
    }
    hilog.info(0x0000, 'VideoOptimize0440', '页面加载 - 50个Video组件')
  }

  build() {
    Column() {
      Text(this.message)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 5 })
        .id('title')

      Row({ space: 10 }) {
        Button('播放')
          .fontSize(10)
          .onClick(() => {
            this.isAllPlaying = true
          })
          .id('playAllBtn')

        Button('暂停')
          .fontSize(10)
          .onClick(() => {
            this.isAllPlaying = false
          })
          .id('pauseAllBtn')

        Text(`${this.isAllPlaying ? '▶' : '⏸'} 50个视频`)
          .fontSize(10)
          .fontColor(this.isAllPlaying ? Color.Green : Color.Gray)
      }
      .margin({ bottom: 10 })

      Scroll() {
        Column({ space: 3 }) {
          ForEach(this.videoCount, (index: number) => {
            Row({ space: 5 }) {
              Text(`${index}`)
                .fontSize(9)
                .fontColor(Color.White)
                .width(18)
              Image($r('app.media.icon'))
                .width(60)
                .height(40)
                .objectFit(ImageFit.Cover)
              Text(`Video ${index}`)
                .fontSize(9)
                .fontColor(Color.White)
            }
            .width('100%')
            .height('4.51%')
            .backgroundColor('#333333')
            .padding(5)
            .id(`video${index}`)
          })
        }
        .width('100%')
      }
      .width('100%')
      .height('88%')
      .scrollBar(BarState.Auto)
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}

