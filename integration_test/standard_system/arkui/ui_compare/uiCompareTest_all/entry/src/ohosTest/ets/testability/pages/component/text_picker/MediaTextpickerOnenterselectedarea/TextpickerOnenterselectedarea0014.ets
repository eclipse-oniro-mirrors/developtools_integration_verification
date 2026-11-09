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

// 测试用例: SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_ONENTERSELECTEDAREA_0014
// 预期结果: onEnterSelectedArea事件回调返回正确的value和index
// 自动化程度: 50% - 需要手动滑动验证回调

@Entry
@Component
struct TextpickerOnenterselectedarea0014 {
  @State message: string = 'TextPicker onEnterSelectedArea事件'
  @State logs: string[] = []
  @State selectedIndex: number = 0
  @State selectedValue: string = ''
  private fruits: string[] = ['苹果', '香蕉', '橙子', '葡萄', '西瓜', '草莓', '芒果', '猕猴桃', '樱桃', '蓝莓']

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

      Text('滑动TextPicker验证onEnterSelectedArea回调')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 20 })

      TextPicker({ range: this.fruits, selected: this.selectedIndex })
        .width('80%')
        .height(200)
        .id('textPicker')
        .onChange((value: string | string[], index: number | number[]) => {
          const val = Array.isArray(value) ? value[0] : value
          const idx = Array.isArray(index) ? index[0] : index
          this.selectedValue = val
          this.selectedIndex = idx
          this.addLog(`onChange: value="${val}", index=${idx}`)
        })

      Text(`当前选中: "${this.selectedValue}" (索引: ${this.selectedIndex})`)
        .fontSize(14)
        .fontColor(Color.Blue)
        .margin({ top: 20 })
        .id('selectedInfo')

      Text('说明: onEnterSelectedArea事件应返回进入选中区域的项')
        .fontSize(11)
        .fontColor(Color.Orange)
        .margin({ top: 10, bottom: 10 })

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
      .height('12.3%')
      .backgroundColor('#F5F5F5')
      .padding(10)
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}
