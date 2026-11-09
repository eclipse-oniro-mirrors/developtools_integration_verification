/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct UiComponentTextRichEditorInterface0003 {
  scroller: Scroller = new Scroller();
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  
  // 用于显示回调信息的RichEditor
  displayController: RichEditorController = new RichEditorController();
  displayOptions: RichEditorOptions = { controller: this.displayController };

  build() {
    Column() {
      // 提示信息
      Text('aboutToIMEInput回调值准确性检查')
        .width('100%')
        .fontSize(12)
        .fontColor(Color.Orange)
        .textAlign(TextAlign.Center)
        .margin(10)
      
      Text('回调信息显示区域：')
        .width('100%')
        .fontSize(14)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 5 })
      
      // 显示回调信息的区域
      RichEditor(this.displayOptions)
        .id('displayRichEditor0003')
        .width('100%')
        .height(100)
        .border({ width: 1, color: Color.Green })
        .borderRadius(8)
        .padding(8)
        .backgroundColor('#F0F8FF')
        .margin(10)
      
      // 主要输入区域
      Scroll(this.scroller) {
        RichEditor(this.options)
          .id('richEditor0003')
          .width('100%')
          .height(100)
          .border({ width: 1, color: Color.Gray })
          .borderRadius(8)
          .padding(8)
          .placeholder('请通过输入法输入内容测试aboutToIMEInput回调...')
          .aboutToIMEInput((value: RichEditorInsertValue) => {
            // aboutToIMEInput回调值准确性检查
            const insertInfo = JSON.stringify(value)
            console.log('aboutToIMEInput回调值:', insertInfo)
            
            // 获取当前状态信息
            const caretOffset = this.controller.getCaretOffset()
            const currentSpans = this.controller.getSpans({ start: -1, end: -1 })
            
            // 详细分析插入值
            let analysisInfo = `回调触发时间: ${new Date().toLocaleTimeString()}\n`
            analysisInfo += `光标位置: ${caretOffset}\n`
            analysisInfo += `当前spans数量: ${currentSpans.length}\n`
            analysisInfo += `插入值详情:\n${insertInfo}\n\n`
            
            // 分析插入值的各个属性
            if (value.insertValue) {
              analysisInfo += `插入文本: "${value.insertValue}"\n`
            }
            if (value.insertOffset !== undefined) {
              analysisInfo += `插入位置: ${value.insertOffset}\n`
            }
            
            this.displayController.deleteSpans()
            this.displayController.addTextSpan('aboutToIMEInput触发\n' + analysisInfo + '返回值: true', {
              style: {
                fontSize: 12,
                fontColor: Color.Blue
              }
            })
            
            return true
          })
      }
      .width('100%')
      .height('16.39%')
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.On)
      .scrollBarColor('#999999')
      .scrollBarWidth(8)
      .margin(10)
      
      Button('添加预置内容')
        .id('addPresetBtn0003')
        .width('80%')
        .height(40)
        .margin(5)
        .onClick(() => {
          this.controller.addTextSpan('预置文本内容', {
            style: {
              fontSize: 16,
              fontColor: Color.Black
            }
          })
          
          this.displayController.deleteSpans()
          this.displayController.addTextSpan('已添加预置内容\n请在不同位置输入文本\n观察aboutToIMEInput回调值的准确性', {
            style: {
              fontSize: 12,
              fontColor: Color.Orange
            }
          })
        })
      
      Button('清空内容重新测试')
        .id('clearBtn0003')
        .width('80%')
        .height(40)
        .margin(5)
        .backgroundColor(Color.Gray)
        .onClick(() => {
          this.controller.deleteSpans()
          this.displayController.deleteSpans()
          this.displayController.addTextSpan('内容已清空\n请通过输入法输入内容\n观察回调值信息', {
            style: {
              fontSize: 12,
              fontColor: Color.Gray
            }
          })
        })
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}
