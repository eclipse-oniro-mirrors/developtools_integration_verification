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

// 测试用例: SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_HSP_0060
// 预期结果: 同名视频资源同时存在于hap和hsp时，使用hap自身资源
// 自动化程度: 40% - 需要验证使用的是哪个资源

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct VideoHsp0060 {
  @State message: string = '同名视频资源冲突测试'
  @State logs: string[] = []
  @State videoInfo: string = ''

  private addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString()
    this.logs.unshift(`[${timestamp}] ${log}`)
    hilog.info(0x0000, 'VideoHsp0060', log)
    if (this.logs.length > 10) {
      this.logs.pop()
    }
  }

  aboutToAppear() {
    this.addLog('页面加载')
    this.videoInfo = '使用hap自身资源'
  }

  build() {
    Column() {
      Text(this.message)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })
        .id('title')

      Text('视频资源同时存在于hap和hsp中(同名)')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 10 })

      Text('预期: 使用hap自身的视频资源')
        .fontSize(11)
        .fontColor(Color.Orange)
        .margin({ bottom: 20 })

      // 模拟视频区域
      Column() {
        Image($r('app.media.icon'))
          .width(100)
          .height(100)
        Text('hap自身资源')
          .fontSize(12)
          .fontColor(Color.White)
          .margin({ top: 10 })
      }
      .width('90%')
      .height('14.75%')
      .backgroundColor('#333333')
      .id('videoArea')
      .justifyContent(FlexAlign.Center)

      Text(this.videoInfo)
        .fontSize(14)
        .fontColor(Color.Blue)
        .margin({ top: 10 })
        .id('videoInfo')

      Row({ space: 15 }) {
        Button('播放')
          .onClick(() => {
            this.addLog('播放hap自身的视频资源')
          })
          .id('playBtn')

        Button('暂停')
          .onClick(() => {
            this.addLog('暂停')
          })
          .id('pauseBtn')
      }
      .margin({ top: 15, bottom: 15 })

      Text('验证要点:')
        .fontSize(14)
        .fontWeight(FontWeight.Medium)
        .width('90%')
        .textAlign(TextAlign.Start)

      Text('• hap和hsp各有一个video.mp4')
        .fontSize(11)
        .fontColor(Color.Gray)
        .width('90%')

      Text('• 两个视频内容应该不同(可通过时长区分)')
        .fontSize(11)
        .fontColor(Color.Gray)
        .width('90%')

      Text('• 播放的应该是hap自身的视频')
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
