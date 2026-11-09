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

// 测试用例: SUB_ACE_UI_COMPONENT_MEDIA_KEYBOARD_Event_0012
// 预期结果: LoadingProgress组件无获焦边框，通过onFocus日志确认获焦状态
// 自动化程度: 30% - 需要手动键盘操作验证

@Entry
@Component
struct KeyboardEvent0012 {
  @State message: string = 'LoadingProgress组件键盘操作事件'
  @State logs: string[] = []
  @State isFocused: boolean = false

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

      Text('测试: LoadingProgress无获焦边框，通过日志确认获焦')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 20 })

      Row({ space: 30 }) {
        Column() {
          Button('按钮1')
            .focusable(true)
            .id('btn1')
            .onFocus(() => {
              this.addLog('按钮1 获得焦点')
            })
          Text('Tab起点')
            .fontSize(10)
        }

        Column() {
          LoadingProgress()
            .width(80)
            .height(80)
            .color(Color.Blue)
            .focusable(true)
            .id('loadingProgressAlt')
            .onFocus(() => {
              this.isFocused = true
              this.addLog('LoadingProgress 获得焦点 (无边框样式)')
            })
            .onBlur(() => {
              this.isFocused = false
              this.addLog('LoadingProgress 失去焦点')
            })
            .onKeyEvent((event: KeyEvent) => {
              this.addLog(`LoadingProgress 按键: code=${event.keyCode}`)
            })
          Text('LoadingProgress')
            .fontSize(10)
        }

        Column() {
          Button('按钮2')
            .focusable(true)
            .id('btn2')
            .onFocus(() => {
              this.addLog('按钮2 获得焦点')
            })
          Text('Tab终点')
            .fontSize(10)
        }
      }
      .margin({ bottom: 20 })

      Text(`LoadingProgress焦点状态: ${this.isFocused ? '已获焦' : '未获焦'}`)
        .fontSize(14)
        .fontColor(this.isFocused ? Color.Green : Color.Gray)
        .fontWeight(FontWeight.Medium)
        .margin({ bottom: 10 })
        .id('focusStatus')

      Text('说明: LoadingProgress组件没有获焦边框样式')
        .fontSize(11)
        .fontColor(Color.Orange)
        .margin({ bottom: 10 })

      Text('日志 (验证获焦状态):')
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
      .height('12.3%')
      .backgroundColor('#F5F5F5')
      .padding(10)
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}
