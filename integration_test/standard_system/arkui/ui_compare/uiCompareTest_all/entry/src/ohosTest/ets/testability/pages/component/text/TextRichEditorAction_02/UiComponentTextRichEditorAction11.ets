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

@Entry
@Component
struct UiComponentTextRichEditorAction11 {
  controller1: RichEditorController = new RichEditorController();
  controller2: RichEditorController = new RichEditorController();

  @State selectionInfo: string = '点击任意编辑器进行鼠标选中测试'
  @State activeEditor: string = '无'
  @State selectionCount: number = 0

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ACTION_0440')
        .fontSize(14)
        .fontColor(0x666666)
        .textAlign(TextAlign.Center)
        .width('90%')

      Text('鼠标选中区唯一测试')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)
        .width('90%')
        .margin({ bottom: 15 })

      Text(this.selectionInfo)
        .fontSize(14)
        .fontColor(Color.Blue)
        .backgroundColor(0xE3F2FD)
        .padding(10)
        .border({ width: 1, color: Color.Blue, radius: 8 })
        .width('90%')
        .textAlign(TextAlign.Center)
        .maxLines(3)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .margin({ bottom: 10 })

      Row({ space: 20 }) {
        Text(`当前活跃编辑器: ${this.activeEditor}`)
          .fontSize(12)
          .fontColor(0x666666)
          .backgroundColor(0xF5F5F5)
          .padding(8)
          .borderRadius(4)

        Text(`选中次数: ${this.selectionCount}`)
          .fontSize(12)
          .fontColor(0x666666)
          .backgroundColor(0xF5F5F5)
          .padding(8)
          .borderRadius(4)
      }
      .justifyContent(FlexAlign.Center)
      .width('90%')
      .margin({ bottom: 15 })

      Column() {
        Text('编辑器1 - 主要测试区域')
          .fontSize(12)
          .fontColor(0x333333)
          .fontWeight(FontWeight.Medium)
          .margin({ bottom: 5 })

        RichEditor({ controller: this.controller1 })
          .id('UiComponentTextRichEditorAction11_01')
          .onReady(() => {
            this.controller1.addTextSpan('这是第一个编辑器的测试文本内容，用于验证鼠标选中区域的唯一性。请尝试选中这段文字的不同部分。', {
              style: {
                fontColor: Color.Black,
                fontSize: 16,
                lineHeight: 24
              }
            })
          })
          .onSelect((value: RichEditorSelection) => {
            this.activeEditor = '编辑器1'
            this.selectionCount++
            this.selectionInfo = `编辑器1选中: [${value.selection[0]}, ${value.selection[1]}] | 长度: ${value.selection[1] - value.selection[0]} | 时间: ${new Date().toLocaleTimeString()}`
            console.log('编辑器1选中:', value.selection)
          })
          .onFocus(() => {
            this.activeEditor = '编辑器1'
            console.log('编辑器1获得焦点')
          })
          .onIMEInputComplete((value: RichEditorTextSpanResult) => {
            console.log('---------------------- onIMEInputComplete ---------------------')
            console.log('spanIndex:' + value.spanPosition.spanIndex)
            console.log('spanRange:[' + value.spanPosition.spanRange[0] + ',' + value.spanPosition.spanRange[1] + ']')
            console.log('offsetInSpan:[' + value.offsetInSpan[0] + ',' + value.offsetInSpan[1] + ']')
            console.log('value:' + value.value)
          })
          .aboutToDelete((value: RichEditorDeleteValue) => {
            console.log('---------------------- aboutToDelete --------------------------')
            console.log('offset:' + value.offset)
            console.log('direction:' + value.direction)
            console.log('length:' + value.length)
            value.richEditorDeleteSpans.forEach(item => {
              console.log('---------------------- item --------------------------')
              console.log('spanIndex:' + item.spanPosition.spanIndex)
              console.log('spanRange:[' + item.spanPosition.spanRange[0] + ',' + item.spanPosition.spanRange[1] + ']')
              console.log('offsetInSpan:[' + item.offsetInSpan[0] + ',' + item.offsetInSpan[1] + ']')
              if (typeof(item as RichEditorImageSpanResult)['imageStyle'] != 'undefined') {
                console.log('image:' + (item as RichEditorImageSpanResult).valueResourceStr)
              } else {
                console.log('text:' + (item as RichEditorTextSpanResult).value)
              }
            })
            return true;
          })
          .onDeleteComplete(() => {
            console.log('---------------------- onDeleteComplete ------------------------')
          })
          .borderWidth(2)
          .borderColor(Color.Red)
          .borderRadius(8)
          .width('100%')
          .height(80)
          .padding(8)
          .backgroundColor(0xFFFAFA)
      }
      .width('90%')
      .margin({ bottom: 10 })

      Column() {
        Text('编辑器2 - 对比测试区域')
          .fontSize(12)
          .fontColor(0x333333)
          .fontWeight(FontWeight.Medium)
          .margin({ bottom: 5 })

        RichEditor({ controller: this.controller2 })
          .id('UiComponentTextRichEditorAction11_02')
          .onReady(() => {
            this.controller2.addTextSpan('这是第二个编辑器的内容，用于测试多个编辑器之间选中区域的独立性和唯一性。', {
              style: {
                fontColor: Color.Black,
                fontSize: 16,
                lineHeight: 24
              }
            })
          })
          .onSelect((value: RichEditorSelection) => {
            this.activeEditor = '编辑器2'
            this.selectionCount++
            this.selectionInfo = `编辑器2选中: [${value.selection[0]}, ${value.selection[1]}] | 长度: ${value.selection[1] - value.selection[0]} | 时间: ${new Date().toLocaleTimeString()}`
            console.log('编辑器2选中:', value.selection)
          })
          .onFocus(() => {
            this.activeEditor = '编辑器2'
            console.log('编辑器2获得焦点')
          })
          .borderWidth(2)
          .borderColor(Color.Green)
          .borderRadius(8)
          .width('100%')
          .height(80)
          .padding(8)
          .backgroundColor(0xF0FFF0)
      }
      .width('90%')
      .margin({ bottom: 10 })

      Row({ space: 15 }) {
        Button('重置统计')
          .fontSize(12)
          .backgroundColor(0x9C27B0)
          .fontColor(Color.White)
          .borderRadius(6)
          .height(35)
          .onClick(() => {
            this.resetStats()
          })
      }
      .justifyContent(FlexAlign.Center)
      .width('90%')
    }
    .width('100%')
    .height('100%')
    .padding(15)
    .justifyContent(FlexAlign.Start)
    .backgroundColor(0xFAFAFA)
  }

  private resetStats() {
    this.selectionCount = 0
    this.activeEditor = '无'
    this.selectionInfo = '统计已重置，请重新进行选中测试'
    console.log('统计信息已重置')
  }
}
