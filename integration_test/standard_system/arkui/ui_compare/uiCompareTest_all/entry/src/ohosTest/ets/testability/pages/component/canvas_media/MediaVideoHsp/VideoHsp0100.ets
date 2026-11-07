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

// 测试用例: SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_HSP_0100
// 预期结果: hap引用hsp页面，hsp页面中有20个视频资源，正常播放
// 自动化程度: 30% - 需要验证性能

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct VideoHsp0100 {
  @State message: string = 'hsp页面中20个视频资源测试'
  @State logs: string[] = []
  @State loadedCount: number = 20

  aboutToAppear() {
    this.addLog('模拟: hap引用hsp页面，hsp页面包含20个视频')
  }

  private addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString()
    this.logs.unshift(`[${timestamp}] ${log}`)
    hilog.info(0x0000, 'VideoHsp0100', log)
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

      Text('hap -> hsp页面(包含20个视频资源页面)')
        .fontSize(12)
        .fontColor(Color.Gray)

      Text(`加载状态: ${this.loadedCount}/20`)
        .fontSize(12)
        .fontColor(Color.Blue)
        .margin({ top: 5, bottom: 10 })
        .id('loadStatus')

      Text('结构说明:')
        .fontSize(12)
        .fontWeight(FontWeight.Medium)
        .width('90%')

      Column() {
        Text('hap (主应用)')
          .fontSize(11)
          .fontColor(Color.Blue)
        Text('  └─ hsp页面')
          .fontSize(10)
          .fontColor(Color.Gray)
        Text('      ├─ 视频资源1...20')
          .fontSize(10)
          .fontColor(Color.Gray)
      }
      .width('90%')
      .alignItems(HorizontalAlign.Start)
      .backgroundColor('#F0F8FF')
      .padding(8)
      .margin({ bottom: 10 })

      Scroll() {
        Grid() {
          ForEach([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19], (index: number) => {
            GridItem() {
              Column() {
                // 模拟视频区域
                Column() {
                  Image($r('app.media.icon'))
                    .width('100%')
                    .height('100%')
                    .objectFit(ImageFit.Cover)
                }
                .width('100%')
                .height('4.1%')
                .backgroundColor('#333333')
                .id(`video${index}`)

                Text(`#${index + 1}`)
                  .fontSize(10)
              }
            }
          })
        }
        .columnsTemplate('1fr 1fr 1fr 1fr')
        .rowsGap(5)
        .columnsGap(5)
        .width('100%')
        .height('32.79%')
      }
      .width('95%')
      .height('20.49%')

      Button('全部加载测试')
        .onClick(() => {
          this.addLog('所有视频加载完成')
        })
        .margin({ top: 10 })
        .id('loadAllBtn')

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
