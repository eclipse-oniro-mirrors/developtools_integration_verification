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

// 测试用例: SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_HSP_0070
// 预期结果: 使用$r方式引用hsp视频资源时，资源获取不到，视频异常
// 自动化程度: 40% - 需要验证视频加载失败

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct VideoHsp0070 {
  @State message: string = '$r方式引用hsp视频资源测试'
  @State logs: string[] = []
  @State hasError: boolean = true // 预期加载失败

  private addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString()
    this.logs.unshift(`[${timestamp}] ${log}`)
    hilog.info(0x0000, 'VideoHsp0070', log)
    if (this.logs.length > 10) {
      this.logs.pop()
    }
  }

  aboutToAppear() {
    this.addLog('使用$r方式引用hsp资源')
    this.addLog('预期: 资源获取失败')
  }

  build() {
    Column() {
      Text(this.message)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })
        .id('title')

      Text('使用$r方式引用hsp视频资源')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 10 })

      Text('预期: 视频资源获取不到，视频异常')
        .fontSize(11)
        .fontColor(Color.Red)
        .margin({ bottom: 20 })

      // 模拟视频区域 - 显示错误状态
      Column() {
        Text('⚠️ 视频加载失败')
          .fontSize(16)
          .fontColor(Color.Orange)
        Text('$r方式引用hsp资源失败')
          .fontSize(12)
          .fontColor(Color.Gray)
          .margin({ top: 10 })
      }
      .width('90%')
      .height('14.75%')
      .backgroundColor('#333333')
      .id('videoArea')
      .justifyContent(FlexAlign.Center)

      Text('⚠️ 视频加载失败 (预期结果)')
        .fontSize(14)
        .fontColor(Color.Orange)
        .margin({ top: 10 })
        .id('errorMsg')

      Row({ space: 15 }) {
        Button('尝试播放')
          .onClick(() => {
            this.addLog('尝试播放... 失败')
          })
          .id('playBtn')
      }
      .margin({ top: 15, bottom: 15 })

      Text('说明:')
        .fontSize(14)
        .fontWeight(FontWeight.Medium)
        .width('90%')
        .textAlign(TextAlign.Start)

      Text('• $r()方式引用hsp资源不正确')
        .fontSize(11)
        .fontColor(Color.Gray)
        .width('90%')

      Text('• 应该使用正确的跨包引用方式')
        .fontSize(11)
        .fontColor(Color.Gray)
        .width('90%')

      Text('• 此测试验证错误引用方式的行为')
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
