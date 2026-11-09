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

// 测试用例: SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_HSP_0080
// 预期结果: hsp多层嵌套引用视频页面，视频正常播放
// 自动化程度: 40% - 需要验证多层嵌套场景

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct VideoHsp0080 {
  @State message: string = 'hsp多层嵌套视频引用测试'
  @State logs: string[] = []

  private addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString()
    this.logs.unshift(`[${timestamp}] ${log}`)
    hilog.info(0x0000, 'VideoHsp0080', log)
    if (this.logs.length > 10) {
      this.logs.pop()
    }
  }

  aboutToAppear() {
    this.addLog('多层嵌套视频引用测试')
  }

  build() {
    Column() {
      Text(this.message)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })
        .id('title')

      Text('hsp1 -> hsp2 -> ... -> hspN -> hspN+1')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 10 })

      Text('预期: 多层嵌套后视频资源正常获取和播放')
        .fontSize(11)
        .fontColor(Color.Orange)
        .margin({ bottom: 20 })

      // 模拟视频区域
      Column() {
        Image($r('app.media.icon'))
          .width(100)
          .height(100)
        Text('多层嵌套视频')
          .fontSize(12)
          .fontColor(Color.White)
          .margin({ top: 10 })
      }
      .width('90%')
      .height('14.75%')
      .backgroundColor('#333333')
      .id('videoArea')
      .justifyContent(FlexAlign.Center)

      Row({ space: 15 }) {
        Button('播放')
          .onClick(() => {
            this.addLog('播放多层嵌套视频')
          })
          .id('playBtn')

        Button('暂停')
          .onClick(() => {
            this.addLog('暂停')
          })
          .id('pauseBtn')
      }
      .margin({ top: 15, bottom: 15 })

      Text('嵌套层级示意:')
        .fontSize(14)
        .fontWeight(FontWeight.Medium)
        .width('90%')
        .textAlign(TextAlign.Start)

      Column() {
        Text('hap')
          .fontSize(12)
          .fontColor(Color.Blue)
        Text('  └─ hsp1 (视频页面)')
          .fontSize(11)
          .fontColor(Color.Gray)
        Text('      └─ hsp2')
          .fontSize(11)
          .fontColor(Color.Gray)
        Text('          └─ hsp3')
          .fontSize(11)
          .fontColor(Color.Gray)
        Text('              └─ ... (多层嵌套)')
          .fontSize(11)
          .fontColor(Color.Gray)
      }
      .width('90%')
      .alignItems(HorizontalAlign.Start)
      .backgroundColor('#F0F8FF')
      .padding(10)
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
      .height('4.92%')
      .backgroundColor('#F5F5F5')
      .padding(10)
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}
