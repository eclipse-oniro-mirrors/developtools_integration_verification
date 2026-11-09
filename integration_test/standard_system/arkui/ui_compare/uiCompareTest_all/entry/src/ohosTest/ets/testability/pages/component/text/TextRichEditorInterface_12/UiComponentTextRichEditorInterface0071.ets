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
struct UiComponentTextRichEditorInterface0071 {
  scroller: Scroller = new Scroller();
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  
  // 用于显示回调信息的RichEditor
  displayController: RichEditorController = new RichEditorController();
  displayOptions: RichEditorOptions = { controller: this.displayController };

  build() {
    Column() {
      // 提示信息
      Text('先输入文本内容，然后选中部分内容并输入新文本测试IME回调')
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
        .id('displayRichEditor0071')
        .width('100%')
        .height(50)
        .border({ width: 1, color: Color.Green })
        .borderRadius(8)
        .padding(8)
        .backgroundColor('#F0F8FF')
        .margin(10)
      
      // 主要输入区域
      Scroll(this.scroller) {
        RichEditor(this.options)
          .id('richEditor0071')
          .width('100%')
          .height(100)
          .border({ width: 1, color: Color.Gray })
          .borderRadius(8)
          .padding(8)
          .placeholder('请输入文本内容，然后选中部分内容输入新文本...')
          .aboutToIMEInput((value: RichEditorInsertValue) => {
            // aboutToIMEInput回调
            const insertInfo = JSON.stringify(value)
            console.log('aboutToIMEInput - 插入信息:', insertInfo)
            
            // 获取当前选择信息
            const selection = this.controller.getSelection()
            const selectionInfo = JSON.stringify(selection)
            
            this.displayController.deleteSpans()
            this.displayController.addTextSpan('aboutToIMEInput触发\n选择信息: ' + selectionInfo + '\n插入信息:\n' + insertInfo + '\n返回值: true', {
              style: {
                fontSize: 12,
                fontColor: Color.Blue
              }
            })
            
            return true // 返回值设置为true
          })
          .onIMEInputComplete((value: RichEditorTextSpanResult) => {
            // onIMEInputComplete回调
            const completeInfo = JSON.stringify(value)
            console.log('onIMEInputComplete - 输入完成信息:', completeInfo)
            
            // 获取输入完成后的spans信息
            const afterSpans = this.controller.getSpans({ start: -1, end: -1 })
            let spanAnalysis = `spans数量: ${afterSpans.length}\n`
            
            afterSpans.forEach((span, index) => {
              const textSpan = span as RichEditorTextSpanResult
              if (textSpan && textSpan.textStyle) {
                spanAnalysis += `Span${index + 1}: "${textSpan.value}"\n`
              }
            })
            
            this.displayController.addTextSpan('\n\nonIMEInputComplete触发\n输入完成信息:\n' + completeInfo + '\n\nSpan分析:\n' + spanAnalysis, {
              style: {
                fontSize: 12,
                fontColor: Color.Green
              }
            })
          })
          .onSelect((value: RichEditorSelection) => {
            // 选择回调，用于显示选择信息
            const selectionInfo = JSON.stringify(value)
            console.log('onSelect - 选择信息:', selectionInfo)
          })
      }
      .width('100%')
      .height('16.39%')
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.On)
      .scrollBarColor('#999999')
      .scrollBarWidth(8)

      
      Button('添加测试文本')
        .id('addTestTextBtn0071')
        .width('80%')
        .height(40)
        .margin(5)
        .onClick(() => {
          this.controller.addTextSpan('这是一段可以选择的测试文本内容', {
            style: {
              fontSize: 16,
              fontColor: Color.Black
            }
          })
          
          this.displayController.deleteSpans()
          this.displayController.addTextSpan('已添加测试文本\n请选中部分文本，然后输入新内容替换', {
            style: {
              fontSize: 12,
              fontColor: Color.Orange
            }
          })
        })
      
      Button('选中中间文本')
        .id('selectMiddleBtn0071')
        .width('80%')
        .height(40)
        .margin(5)
        .onClick(() => {
          // 选中中间部分文本
          this.controller.setSelection(4, 8)

          this.displayController.deleteSpans()
          this.displayController.addTextSpan('已选中中间部分文本\n现在请输入新文本替换选中内容', {
            style: {
              fontSize: 12,
              fontColor: Color.Pink
            }
          })
        })
      
      Button('清空内容重新测试')
        .id('clearBtn0071')
        .width('80%')
        .height(40)
        .margin(5)
        .backgroundColor(Color.Gray)
        .onClick(() => {
          this.controller.deleteSpans()
          this.displayController.deleteSpans()
          this.displayController.addTextSpan("内容已清空\n请点击'添加测试文本'开始测试", {
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
