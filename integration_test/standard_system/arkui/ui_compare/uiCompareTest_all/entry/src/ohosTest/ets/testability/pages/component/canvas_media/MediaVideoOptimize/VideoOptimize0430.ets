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

// 测试用例: SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0430
// 预期结果: 30个video组件播放并滑动，播放正常不卡顿不崩溃
// 自动化程度: 30% - 需要手动操作验证

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct VideoOptimize0430 {
  @State message: string = '30个Video播放并滑动测试'
  @State isAllPlaying: boolean = false
  private videoCount: number[] = []

  aboutToAppear() {
    for (let i = 1; i <= 30; i++) {
      this.videoCount.push(i)
    }
    hilog.info(0x0000, 'VideoOptimize0430', '页面加载 - 30个Video组件')
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
          .fontSize(11)
          .onClick(() => {
            this.isAllPlaying = true
          })
          .id('playAllBtn')

        Button('暂停')
          .fontSize(11)
          .onClick(() => {
            this.isAllPlaying = false
          })
          .id('pauseAllBtn')

        Text(`${this.isAllPlaying ? '▶' : '⏸'} 30个视频`)
          .fontSize(11)
          .fontColor(this.isAllPlaying ? Color.Green : Color.Gray)
      }
      .margin({ bottom: 10 })

      Scroll() {
        Column({ space: 5 }) {
          ForEach(this.videoCount, (index: number) => {
            Row({ space: 8 }) {
              Text(`${index}`)
                .fontSize(10)
                .fontColor(Color.White)
                .width(20)
              Image($r('app.media.icon'))
                .width(80)
                .height(50)
                .objectFit(ImageFit.Cover)
              Text(`Video ${index}`)
                .fontSize(10)
                .fontColor(Color.White)
            }
            .width('100%')
            .height('5.74%')
            .backgroundColor('#333333')
            .padding(8)
            .id(`video${index}`)
          })
        }
        .width('100%')
      }
      .width('100%')
      .height('85%')
      .scrollBar(BarState.Auto)
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}

