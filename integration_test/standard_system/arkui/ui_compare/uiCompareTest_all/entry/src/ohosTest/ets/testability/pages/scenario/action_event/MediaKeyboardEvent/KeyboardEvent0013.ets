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

// 测试用例: SUB_ACE_UI_COMPONENT_MEDIA_KEYBOARD_Event_0013
// 预期结果: 胶囊样式Progress组件可正常获焦
// 自动化程度: 30% - 需要手动键盘操作验证

@Entry
@Component
struct KeyboardEvent0013 {
  @State message: string = 'Progress组件键盘操作事件'
  @State logs: string[] = []
  @State focusedIndex: number = -1
  @State progressValue: number = 50

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

      Text('测试: Tab键和上下左右键，胶囊样式Progress组件获焦')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 20 })

      Column({ space: 20 }) {
        Row({ space: 10 }) {
          Text('按钮1')
          Button('起点')
            .focusable(true)
            .id('btn1')
            .onFocus(() => {
              this.focusedIndex = 0
              this.addLog('按钮1 获得焦点')
            })
        }

        Row({ space: 10 }) {
          Text('胶囊Progress')
          Progress({ value: this.progressValue, total: 100, type: ProgressType.Capsule })
            .width(200)
            .height(30)
            .focusable(true)
            .id('progressCapsule')
            .border({ width: this.focusedIndex === 1 ? 2 : 0, color: Color.Blue })
            .onFocus(() => {
              this.focusedIndex = 1
              this.addLog('胶囊Progress 获得焦点')
            })
            .onBlur(() => {
              if (this.focusedIndex === 1) {
                this.focusedIndex = -1
              }
              this.addLog('胶囊Progress 失去焦点')
            })
            .onKeyEvent((event: KeyEvent) => {
              if (event.type === KeyType.Down) {
                // 左右键调整进度
                if (event.keyCode === 2014) { // Left
                  this.progressValue = Math.max(0, this.progressValue - 10)
                  this.addLog(`左键: 进度减少到 ${this.progressValue}`)
                } else if (event.keyCode === 2015) { // Right
                  this.progressValue = Math.min(100, this.progressValue + 10)
                  this.addLog(`右键: 进度增加到 ${this.progressValue}`)
                } else {
                  this.addLog(`按键: code=${event.keyCode}`)
                }
              }
            })
        }

        Row({ space: 10 }) {
          Text('线性Progress')
          Progress({ value: this.progressValue, total: 100, type: ProgressType.Linear })
            .width(200)
            .height(20)
            .focusable(true)
            .id('progressLinear')
            .border({ width: this.focusedIndex === 2 ? 2 : 0, color: Color.Blue })
            .onFocus(() => {
              this.focusedIndex = 2
              this.addLog('线性Progress 获得焦点')
            })
            .onBlur(() => {
              if (this.focusedIndex === 2) {
                this.focusedIndex = -1
              }
              this.addLog('线性Progress 失去焦点')
            })
        }

        Row({ space: 10 }) {
          Text('按钮2')
          Button('终点')
            .focusable(true)
            .id('btn2')
            .onFocus(() => {
              this.focusedIndex = 3
              this.addLog('按钮2 获得焦点')
            })
        }
      }
      .margin({ bottom: 20 })

      Text(`当前进度: ${this.progressValue}%`)
        .fontSize(14)
        .fontColor(Color.Blue)
        .id('progressStatus')

      Text('日志:')
        .fontSize(14)
        .fontWeight(FontWeight.Medium)
        .width('90%')
        .textAlign(TextAlign.Start)
        .margin({ top: 10 })

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
