/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { SegmentButton, SegmentButtonOptions } from '@kit.ArkUI';

@Entry
@Component
struct SegmentButtonClick0030 {
  @State capsuleSelectedIndexes: number[] = [];
  @State clickLog: string[] = [];

  build() {
    Row() {
      Column() {
        Text('多选胶囊类分段按钮 - onItemClicked事件测试')
          .fontSize(20)
          .margin({ bottom: 10 })

        SegmentButton({
          options: SegmentButtonOptions.capsule({
            buttons: [
              { text: '年' },
              { text: '月' },
              { text: '日' }
            ],
            multiply: true
          }),
          selectedIndexes: this.capsuleSelectedIndexes,
          onItemClicked: (index: number) => {
            console.info(`SegmentButton onItemClicked index: ${index}`);
            this.clickLog.push(`点击索引: ${index}`);
          }
        })
          .id('segmentButtonClick0030')
          .width('100%')

        Text('点击日志：')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20, bottom: 10 })
          .width('100%')

        Scroll() {
          Column() {
            ForEach(this.clickLog, (log: string, index: number) => {
              Text(`${index + 1}. ${log}`)
                .fontSize(14)
                .margin({ bottom: 5 })
                .width('100%')
            }, (log: string, index: number) => `${index}_${log}`)
          }
          .width('100%')
        }
        .height('24.59%')
        .width('100%')
        .border({ width: 1, color: '#CCCCCC' })
        .borderRadius(5)
        .padding(10)

        Button('清空日志')
          .width('100%')
          .margin({ top: 10 })
          .onClick(() => {
            this.clickLog = [];
          })

        Text('测试说明：')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20, bottom: 5 })
          .width('100%')

        Text('• 类型：多选胶囊类分段按钮（multiply: true）')
          .fontSize(12)
          .margin({ left: 10, bottom: 3 })
          .width('100%')

        Text('• 点击第一个按钮"年"，每次点击都会触发onItemClicked事件并打印索引0')
          .fontSize(12)
          .margin({ left: 10, bottom: 3 })
          .width('100%')

        Text('• 点击第二个按钮"月"，每次点击都会触发onItemClicked事件并打印索引1')
          .fontSize(12)
          .margin({ left: 10, bottom: 3 })
          .width('100%')

        Text('• 点击第三个按钮"日"，每次点击都会触发onItemClicked事件并打印索引2')
          .fontSize(12)
          .margin({ left: 10, bottom: 3 })
          .width('100%')

        Text('• 即使连续点击同一个按钮，每次点击都会触发事件')
          .fontSize(12)
          .fontColor('#FF6600')
          .margin({ left: 10 })
          .width('100%')
      }
      .width('100%')
      .padding(16)
    }
    .height('100%')
  }
}






