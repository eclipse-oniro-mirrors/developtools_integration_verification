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

// 测试用例: SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0400
// 预期结果: 50个video组件滑动，页面不卡顿不崩溃
// 自动化程度: 30% - 需要手动滑动验证性能

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct VideoOptimize0400 {
  @State message: string = '50个Video组件滑动测试'
  private videoCount: number[] = []

  aboutToAppear() {
    for (let i = 1; i <= 50; i++) {
      this.videoCount.push(i)
    }
    hilog.info(0x0000, 'VideoOptimize0400', '页面加载 - 50个Video组件')
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
        Column({ space: 5 }) {
          ForEach(this.videoCount, (index: number) => {
            Row({ space: 10 }) {
              Text(`${index}`)
                .fontSize(10)
                .fontColor(Color.White)
                .width(30)
              Image($r('app.media.icon'))
                .width(100)
                .height(60)
                .objectFit(ImageFit.Cover)
              Text(`Video ${index}/50`)
                .fontSize(10)
                .fontColor(Color.White)
            }
            .width('100%')
            .height('6.56%')
            .backgroundColor('#333333')
            .padding(10)
            .id(`video${index}`)
          })
        }
        .width('100%')
      }
      .width('100%')
      .height('85%')
      .scrollBar(BarState.Auto)

      Text(`共${this.videoCount.length}个视频组件`)
        .fontSize(12)
        .fontColor(Color.Blue)
        .margin({ top: 5 })
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}

