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

// 测试用例: SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_VOICE_0014
// 预期结果: enableHapticFeedback属性设置为string时编译报错
// 自动化程度: 10% - 需要手动验证编译错误

@Entry
@Component
struct TimepickerVoice0014 {
  @State message: string = 'TimePickerDialog enableHapticFeedback异常值测试'
  @State logs: string[] = []

  private addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString()
    this.logs.unshift(`[${timestamp}] ${log}`)
    if (this.logs.length > 10) {
      this.logs.pop()
    }
  }

  build() {
    Column() {
      Text(this.message)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .id('title')

      Text('预期: enableHapticFeedback设置为string时编译报错')
        .fontSize(12)
        .fontColor(Color.Red)
        .margin({ bottom: 10 })

      Text('正确用法: enableHapticFeedback: true/false (boolean)')
        .fontSize(11)
        .fontColor(Color.Gray)
        .margin({ bottom: 20 })

      Button('打开TimePickerDialog (正确用法)')
        .onClick(() => {
          this.addLog('打开正确配置的TimePickerDialog')
          TimePickerDialog.show({
            useMilitaryTime: true,
            enableHapticFeedback: true, // 正确: boolean类型
            onAccept: (value: TimePickerResult) => {
              this.addLog(`选择时间: ${value.hour}:${value.minute}`)
            }
          })
        })
        .margin({ bottom: 20 })
        .id('openDialogBtn')

      Text('说明:')
        .fontSize(14)
        .fontWeight(FontWeight.Medium)
        .width('90%')
        .textAlign(TextAlign.Start)

      Text('• enableHapticFeedback应为boolean类型')
        .fontSize(11)
        .fontColor(Color.Gray)
        .width('90%')

      Text('• 设置为string类型如"true"应编译报错')
        .fontSize(11)
        .fontColor(Color.Orange)
        .width('90%')

      Text('• 此页面使用正确配置作为参考')
        .fontSize(11)
        .fontColor(Color.Gray)
        .width('90%')
        .margin({ bottom: 20 })

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
      .height('8.2%')
      .backgroundColor('#F5F5F5')
      .padding(10)
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}
