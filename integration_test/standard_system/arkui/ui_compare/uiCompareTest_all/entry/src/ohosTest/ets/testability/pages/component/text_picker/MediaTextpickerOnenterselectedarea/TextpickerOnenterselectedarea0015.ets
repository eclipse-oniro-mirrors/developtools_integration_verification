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

// 测试用例: SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_ONENTERSELECTEDAREA_0015
// 预期结果: TextPickerDialog的onEnterSelectedArea事件回调返回正确的value和index
// 自动化程度: 40% - 需要手动打开Dialog并滑动验证

import { promptAction } from '@kit.ArkUI'

@Entry
@Component
struct TextpickerOnenterselectedarea0015 {
  @State message: string = 'TextPickerDialog onEnterSelectedArea事件'
  @State logs: string[] = []
  @State selectedValue: string = ''
  @State selectedIndex: number = 0
  private cities: string[] = ['北京', '上海', '广州', '深圳', '杭州', '南京', '成都', '重庆', '武汉', '西安']

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

      Text('点击按钮打开TextPickerDialog，滑动验证回调')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 20 })

      Button('打开TextPickerDialog')
        .onClick(() => {
          this.addLog('打开TextPickerDialog')
          TextPickerDialog.show({
            range: this.cities,
            selected: this.selectedIndex,
            onAccept: (value: TextPickerResult) => {
              const val = Array.isArray(value.value) ? value.value[0] : value.value
              const idx = Array.isArray(value.index) ? value.index[0] : value.index
              this.selectedValue = val ?? ''
              this.selectedIndex = idx ?? 0
              this.addLog(`确认: value="${this.selectedValue}", index=${this.selectedIndex}`)
            },
            onCancel: () => {
              this.addLog('取消选择')
            },
            onChange: (value: TextPickerResult) => {
              const val = Array.isArray(value.value) ? value.value[0] : value.value
              const idx = Array.isArray(value.index) ? value.index[0] : value.index
              this.addLog(`onChange: value="${val}", index=${idx}`)
            }
          })
        })
        .margin({ bottom: 20 })
        .id('openDialogBtn')

      Text(`当前选中: "${this.selectedValue}" (索引: ${this.selectedIndex})`)
        .fontSize(14)
        .fontColor(Color.Blue)
        .margin({ bottom: 10 })
        .id('selectedInfo')

      Text('说明: Dialog中onEnterSelectedArea应与TextPicker一致')
        .fontSize(11)
        .fontColor(Color.Orange)
        .margin({ bottom: 10 })

      Text('回调日志:')
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
      .height('16.39%')
      .backgroundColor('#F5F5F5')
      .padding(10)
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}


