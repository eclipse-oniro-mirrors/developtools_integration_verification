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
struct UiComponentTextRichEditorInterface0029 {
  scroller: Scroller = new Scroller();
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  
  // 用于显示光标位置信息的RichEditor
  displayController: RichEditorController = new RichEditorController();
  displayOptions: RichEditorOptions = { controller: this.displayController };

  build() {
    Column() {
      // 提示信息
      Text('在onCut回调内使用getCaretOffset，能准确获取文本剪切前光标位置')
        .width('100%')
        .fontSize(12)
        .fontColor(Color.Orange)
        .textAlign(TextAlign.Center)
        .margin(10)
      
      Text('光标位置信息显示区域：')
        .width('100%')
        .fontSize(14)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 5 })
      
      // 显示光标位置信息的区域
      RichEditor(this.displayOptions)
        .id('displayRichEditor0029')
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
          .id('richEditor0029')
          .width('100%')
          .height(100)
          .border({ width: 1, color: Color.Gray })
          .borderRadius(8)
          .padding(8)
          .placeholder('请输入内容，然后选中部分文本进行剪切...')
          .onCut(() => {
            // 在RichEditor组件onCut回调中：console.log(JSON.stringify(this.controller.getCaretOffset()))
            console.log(JSON.stringify(this.controller.getCaretOffset()))
            
            // 在回调显示的richeditor中显示剪切前光标的位置
            const caretOffset = this.controller.getCaretOffset()
            this.displayController.deleteSpans()
            this.displayController.addTextSpan('剪切前光标位置: ' + JSON.stringify(caretOffset), {
              style: {
                fontSize: 14,
                fontColor: Color.Red,
                fontWeight: FontWeight.Bold
              }
            })
          })
      }
      .width('100%')
      .height('16.39%')
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.On)
      .scrollBarColor('#999999')
      .scrollBarWidth(8)

      
      Button('添加测试内容')
        .id('addContentBtn0029')
        .width('80%')
        .height(40)
        .margin(10)
        .onClick(() => {
          this.controller.addTextSpan('这是提供给剪切测试的文本内容', {
            style: {
              fontSize: 16,
              fontColor: Color.Black
            }
          })
          
          this.displayController.deleteSpans()
          this.displayController.addTextSpan('已添加测试内容\n请选中部分文本进行剪切操作', {
            style: {
              fontSize: 12,
              fontColor: Color.Orange
            }
          })
        })
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}
