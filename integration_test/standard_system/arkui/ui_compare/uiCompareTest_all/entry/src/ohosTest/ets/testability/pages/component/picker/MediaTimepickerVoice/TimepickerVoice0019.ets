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

// 测试用例: SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_VOICE_0019
// 预期结果: 手指快速抛划时声震效果正常，明显大于滑动速率，有间隔
// 自动化程度: 20% - 需要手动快速滑动验证音振效果

@Entry
@Component
struct TimepickerVoice0019 {
  @State message: string = 'TimePickerDialog 快速抛划音振测试'
  @State logs: string[] = []
  @State selectedHour: number = 12
  @State selectedMinute: number = 30

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

      Text('快速抛划场景，enableHapticFeedback=true')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 10 })

      Text('预期: 声震效果正常，明显大于滑动速率，有间隔')
        .fontSize(11)
        .fontColor(Color.Orange)
        .margin({ bottom: 20 })

      Button('打开TimePickerDialog (启用音振)')
        .onClick(() => {
          this.addLog('打开Dialog，快速滑动测试')
          TimePickerDialog.show({
            useMilitaryTime: true,
            enableHapticFeedback: true,
            onAccept: (value: TimePickerResult) => {
              this.selectedHour = value.hour ?? 0
              this.selectedMinute = value.minute ?? 0
              this.addLog(`选择: ${this.selectedHour}:${this.selectedMinute}`)
            },
            onChange: (value: TimePickerResult) => {
              this.addLog(`变化: ${value.hour}:${value.minute}`)
            }
          })
        })
        .margin({ bottom: 20 })
        .id('openDialogBtn')

      Text(`当前时间: ${this.selectedHour}:${this.selectedMinute < 10 ? '0' + this.selectedMinute : this.selectedMinute}`)
        .fontSize(16)
        .fontColor(Color.Blue)
        .margin({ bottom: 10 })
        .id('timeDisplay')

      Text('测试步骤:')
        .fontSize(14)
        .fontWeight(FontWeight.Medium)
        .width('90%')
        .textAlign(TextAlign.Start)

      Text('1. 点击按钮打开Dialog')
        .fontSize(11)
        .fontColor(Color.Gray)
        .width('90%')

      Text('2. 手指快速向上或向下抛划')
        .fontSize(11)
        .fontColor(Color.Gray)
        .width('90%')

      Text('3. 观察音振效果是否正常')
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
