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

// 测试用例: SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_VOICE_0021
// 预期结果: 播放音乐场景下声震效果正常且不影响音乐播放
// 自动化程度: 10% - 需要手动播放音乐并测试

@Entry
@Component
struct TimepickerVoice0021 {
  @State message: string = 'TimePickerDialog 播放音乐场景测试'
  @State logs: string[] = []
  @State isMusicPlaying: boolean = false

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

      Text('播放音乐场景，验证声震不影响音乐播放')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 10 })

      Text('预期: 声震效果正常且不影响音乐播放')
        .fontSize(11)
        .fontColor(Color.Orange)
        .margin({ bottom: 20 })

      Row({ space: 20 }) {
        Button(this.isMusicPlaying ? '停止音乐(模拟)' : '播放音乐(模拟)')
          .onClick(() => {
            this.isMusicPlaying = !this.isMusicPlaying
            this.addLog(this.isMusicPlaying ? '开始播放音乐' : '停止播放音乐')
          })
          .id('musicBtn')

        Text(this.isMusicPlaying ? '🎵 播放中...' : '⏹ 已停止')
          .fontSize(14)
          .fontColor(this.isMusicPlaying ? Color.Green : Color.Gray)
      }
      .margin({ bottom: 20 })

      Button('打开TimePickerDialog')
        .onClick(() => {
          this.addLog('打开Dialog，测试音振与音乐共存')
          TimePickerDialog.show({
            useMilitaryTime: false,
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

      Text('1. 点击"播放音乐"按钮(或使用系统音乐播放器)')
        .fontSize(11)
        .fontColor(Color.Gray)
        .width('90%')

      Text('2. 打开TimePickerDialog')
        .fontSize(11)
        .fontColor(Color.Gray)
        .width('90%')

      Text('3. 滑动选择器，验证声震效果')
        .fontSize(11)
        .fontColor(Color.Gray)
        .width('90%')

      Text('4. 确认音乐播放不受影响')
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
      .height('8.2%')
      .backgroundColor('#F5F5F5')
      .padding(10)
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}
