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

// 测试用例: SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_ONENTERSELECTEDAREA_0016
// 预期结果: 跨格点击未选中项时，事件触发次数与跨格数一致
// 自动化程度: 40% - 需要手动点击验证触发次数

@Entry
@Component
struct TextpickerOnenterselectedarea0016 {
  @State message: string = 'TextPicker点击未选中项测试'
  @State logs: string[] = []
  @State selectedIndex: number = 0
  @State triggerCount: number = 0
  private items: string[] = ['项目1', '项目2', '项目3', '项目4', '项目5', '项目6', '项目7', '项目8', '项目9', '项目10']

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

      Text('跨格点击未选中项，验证事件触发次数')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 10 })

      Text('预期: 跨N格触发N次事件')
        .fontSize(11)
        .fontColor(Color.Orange)
        .margin({ bottom: 20 })

      TextPicker({ range: this.items, selected: this.selectedIndex })
        .width('80%')
        .height(200)
        .id('textPicker')
        .onChange((value: string | string[], index: number | number[]) => {
          const idx = Array.isArray(index) ? index[0] : index
          const oldIndex = this.selectedIndex
          const crossCount = Math.abs(idx - oldIndex)
          this.selectedIndex = idx
          this.triggerCount++
          this.addLog(`触发#${this.triggerCount}: 从${oldIndex}到${idx}, 跨${crossCount}格`)
        })

      Row({ space: 20 }) {
        Text(`当前索引: ${this.selectedIndex}`)
          .fontSize(14)
          .fontColor(Color.Blue)
        Text(`触发次数: ${this.triggerCount}`)
          .fontSize(14)
          .fontColor(Color.Green)
          .id('triggerCount')
      }
      .margin({ top: 20, bottom: 10 })

      Button('重置计数')
        .onClick(() => {
          this.triggerCount = 0
          this.logs = []
          this.addLog('计数已重置')
        })
        .margin({ bottom: 10 })
        .id('resetBtn')

      Text('事件日志:')
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
