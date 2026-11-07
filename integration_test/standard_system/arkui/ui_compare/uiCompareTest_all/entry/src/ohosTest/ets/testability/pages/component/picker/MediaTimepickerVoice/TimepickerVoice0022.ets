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

// 测试用例: SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_VOICE_0022
// 预期结果: 多指滑动无效
// 自动化程度: 20% - 需要手动多指操作验证

@Entry
@Component
struct TimepickerVoice0022 {
  @State message: string = 'TimePickerDialog 多指滑动测试'
  @State logs: string[] = []
  @State changeCount: number = 0

  private addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString()
    this.logs.unshift(`[${timestamp}] ${log}`)
    if (this.logs.length > 15) {
      this.logs.pop()
    }
  }

  build() {
    Column() {
      Text(this.message)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })
        .id('title')

      Text('多指滑动场景（一指向上，一指向下）')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 10 })

      Text('预期: 多指滑动无效')
        .fontSize(11)
        .fontColor(Color.Orange)
        .margin({ bottom: 20 })

      Button('打开TimePickerDialog')
        .onClick(() => {
          this.changeCount = 0
          this.addLog('打开Dialog，尝试多指滑动')
          TimePickerDialog.show({
            useMilitaryTime: true,
            enableHapticFeedback: true,
            onAccept: (value: TimePickerResult) => {
              this.addLog(`确认: ${value.hour}:${value.minute}`)
              this.addLog(`多指滑动期间onChange触发次数: ${this.changeCount}`)
            },
            onChange: (value: TimePickerResult) => {
              this.changeCount++
              this.addLog(`onChange #${this.changeCount}: ${value.hour}:${value.minute}`)
            }
          })
        })
        .margin({ bottom: 20 })
        .id('openDialogBtn')

      Text(`onChange触发次数: ${this.changeCount}`)
        .fontSize(14)
        .fontColor(Color.Blue)
        .margin({ bottom: 10 })
        .id('changeCount')

      Text('测试步骤:')
        .fontSize(14)
        .fontWeight(FontWeight.Medium)
        .width('90%')
        .textAlign(TextAlign.Start)

      Text('1. 打开TimePickerDialog')
        .fontSize(11)
        .fontColor(Color.Gray)
        .width('90%')

      Text('2. 用两个手指同时触摸选择器')
        .fontSize(11)
        .fontColor(Color.Gray)
        .width('90%')

      Text('3. 一指向上滑动，另一指向下滑动')
        .fontSize(11)
        .fontColor(Color.Gray)
        .width('90%')

      Text('4. 验证滑动是否无效')
        .fontSize(11)
        .fontColor(Color.Gray)
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
      .height('9.84%')
      .backgroundColor('#F5F5F5')
      .padding(10)
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}
