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

// 测试用例: SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_ONENTERSELECTEDAREA_0017
// 预期结果: TextPickerDialog跨格点击时，事件触发次数与跨格数一致
// 自动化程度: 40% - 需要手动打开Dialog并点击验证

@Entry
@Component
struct TextpickerOnenterselectedarea0017 {
  @State message: string = 'TextPickerDialog点击未选中项测试'
  @State logs: string[] = []
  @State selectedIndex: number = 0
  @State triggerCount: number = 0
  @State lastIndex: number = 0
  private items: string[] = ['选项A', '选项B', '选项C', '选项D', '选项E', '选项F', '选项G', '选项H', '选项I', '选项J']

  private addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString()
    this.logs.unshift(`[${timestamp}] ${log}`)
    if (this.logs.length > 20) {
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

      Text('在Dialog中跨格点击，验证事件触发次数')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 20 })

      Button('打开TextPickerDialog')
        .onClick(() => {
          this.lastIndex = this.selectedIndex
          this.addLog(`打开Dialog, 当前索引: ${this.selectedIndex}`)
          TextPickerDialog.show({
            range: this.items,
            selected: this.selectedIndex,
            onAccept: (value: TextPickerResult) => {
              const idx = Array.isArray(value.index) ? value.index[0] : value.index
              this.selectedIndex = idx ?? 0
              this.addLog(`确认选择: 索引=${this.selectedIndex}`)
            },
            onCancel: () => {
              this.addLog('取消选择')
            },
            onChange: (value: TextPickerResult) => {
              const idx = Array.isArray(value.index) ? value.index[0] : value.index
              const crossCount = Math.abs((idx ?? 0) - this.lastIndex)
              this.triggerCount++
              this.addLog(`触发#${this.triggerCount}: ${this.lastIndex}→${idx}, 跨${crossCount}格`)
              this.lastIndex = idx ?? 0
            }
          })
        })
        .margin({ bottom: 20 })
        .id('openDialogBtn')

      Row({ space: 20 }) {
        Text(`当前索引: ${this.selectedIndex}`)
          .fontSize(14)
          .fontColor(Color.Blue)
          .id('currentIndex')
        Text(`触发次数: ${this.triggerCount}`)
          .fontSize(14)
          .fontColor(Color.Green)
          .id('triggerCount')
      }
      .margin({ bottom: 10 })

      Button('重置计数')
        .onClick(() => {
          this.triggerCount = 0
          this.logs = []
          this.addLog('计数已重置')
        })
        .id('resetBtn')

      Text('事件日志:')
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
      .height('12.3%')
      .backgroundColor('#F5F5F5')
      .padding(10)
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}
