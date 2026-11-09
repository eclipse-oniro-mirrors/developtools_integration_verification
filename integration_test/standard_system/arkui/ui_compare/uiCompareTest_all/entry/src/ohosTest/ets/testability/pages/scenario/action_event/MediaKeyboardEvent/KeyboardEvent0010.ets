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

// 测试用例: SUB_ACE_UI_COMPONENT_MEDIA_KEYBOARD_Event_0010
// 预期结果: Image组件支持键盘操作，Tab键获焦，上下键切换焦点
// 自动化程度: 30% - 需要手动键盘操作验证

@Entry
@Component
struct KeyboardEvent0010 {
  @State message: string = 'Image组件键盘操作事件'
  @State logs: string[] = []
  @State focusedIndex: number = -1

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

      Text('测试步骤: Tab获焦 → 上下键切换 → Ctrl+C/V复制粘贴')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 20 })

      Row({ space: 20 }) {
        Column() {
          Image($r('app.media.icon'))
            .width(100)
            .height(100)
            .focusable(true)
            .id('image1')
            .border({ width: this.focusedIndex === 0 ? 3 : 1, color: this.focusedIndex === 0 ? Color.Blue : Color.Gray })
            .onFocus(() => {
              this.focusedIndex = 0
              this.addLog('Image1 获得焦点')
            })
            .onBlur(() => {
              if (this.focusedIndex === 0) {
                this.focusedIndex = -1
              }
              this.addLog('Image1 失去焦点')
            })
            .onKeyEvent((event: KeyEvent) => {
              this.addLog(`Image1 按键: ${event.keyCode}, type: ${event.type}`)
            })
          Text('Image 1')
            .fontSize(12)
        }

        Column() {
          Image($r('app.media.icon'))
            .width(100)
            .height(100)
            .focusable(true)
            .id('image2')
            .border({ width: this.focusedIndex === 1 ? 3 : 1, color: this.focusedIndex === 1 ? Color.Blue : Color.Gray })
            .onFocus(() => {
              this.focusedIndex = 1
              this.addLog('Image2 获得焦点')
            })
            .onBlur(() => {
              if (this.focusedIndex === 1) {
                this.focusedIndex = -1
              }
              this.addLog('Image2 失去焦点')
            })
            .onKeyEvent((event: KeyEvent) => {
              this.addLog(`Image2 按键: ${event.keyCode}, type: ${event.type}`)
            })
          Text('Image 2')
            .fontSize(12)
        }

        Column() {
          Image($r('app.media.icon'))
            .width(100)
            .height(100)
            .focusable(true)
            .id('image3')
            .border({ width: this.focusedIndex === 2 ? 3 : 1, color: this.focusedIndex === 2 ? Color.Blue : Color.Gray })
            .onFocus(() => {
              this.focusedIndex = 2
              this.addLog('Image3 获得焦点')
            })
            .onBlur(() => {
              if (this.focusedIndex === 2) {
                this.focusedIndex = -1
              }
              this.addLog('Image3 失去焦点')
            })
            .onKeyEvent((event: KeyEvent) => {
              this.addLog(`Image3 按键: ${event.keyCode}, type: ${event.type}`)
            })
          Text('Image 3')
            .fontSize(12)
        }
      }
      .margin({ bottom: 20 })

      Text(`当前焦点: ${this.focusedIndex >= 0 ? 'Image' + (this.focusedIndex + 1) : '无'}`)
        .fontSize(14)
        .fontColor(Color.Blue)
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
      .height('12.3%')
      .backgroundColor('#F5F5F5')
      .padding(10)
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}
