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

// 测试用例: SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_VOICE_0023
// 预期结果: 静音模式下无声音但有震动效果
// 自动化程度: 10% - 需要手动设置静音模式验证

@Entry
@Component
struct TimepickerVoice0023 {
  @State message: string = 'TimePickerDialog 静音场景测试'
  @State logs: string[] = []

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

      Text('手机静音场景，验证震动效果')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 10 })

      Text('预期: 无声音响动，但有震动效果')
        .fontSize(11)
        .fontColor(Color.Orange)
        .margin({ bottom: 20 })

      Text('⚠️ 请先将手机设置为静音模式')
        .fontSize(14)
        .fontColor(Color.Red)
        .fontWeight(FontWeight.Medium)
        .margin({ bottom: 20 })

      Button('打开TimePickerDialog')
        .onClick(() => {
          this.addLog('打开Dialog，静音模式下测试')
          TimePickerDialog.show({
            useMilitaryTime: true,
            enableHapticFeedback: true,
            onAccept: (value: TimePickerResult) => {
              this.addLog(`选择: ${value.hour}:${value.minute}`)
            },
            onChange: (value: TimePickerResult) => {
              this.addLog(`变化: ${value.hour}:${value.minute}`)
            }
          })
        })
        .margin({ bottom: 20 })
        .id('openDialogBtn')

      Text('测试步骤:')
        .fontSize(14)
        .fontWeight(FontWeight.Medium)
        .width('90%')
        .textAlign(TextAlign.Start)

      Text('1. 将手机设置为静音模式')
        .fontSize(11)
        .fontColor(Color.Gray)
        .width('90%')

      Text('2. 打开TimePickerDialog')
        .fontSize(11)
        .fontColor(Color.Gray)
        .width('90%')

      Text('3. 滑动选择器')
        .fontSize(11)
        .fontColor(Color.Gray)
        .width('90%')

      Text('4. 验证无声音但有震动反馈')
        .fontSize(11)
        .fontColor(Color.Gray)
        .width('90%')
        .margin({ bottom: 10 })

      Text('验证要点:')
        .fontSize(12)
        .fontWeight(FontWeight.Medium)
        .fontColor(Color.Blue)
        .width('90%')
        .textAlign(TextAlign.Start)

      Text('• 声音: 应该静音(无声)')
        .fontSize(11)
        .fontColor(Color.Gray)
        .width('90%')

      Text('• 震动: 应该有震动反馈')
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
      .height('6.56%')
      .backgroundColor('#F5F5F5')
      .padding(10)
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}
