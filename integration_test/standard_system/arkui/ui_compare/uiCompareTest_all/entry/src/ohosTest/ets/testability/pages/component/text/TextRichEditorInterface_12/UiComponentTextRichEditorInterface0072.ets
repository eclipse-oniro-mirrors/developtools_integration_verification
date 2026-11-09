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
struct UiComponentTextRichEditorInterface0072 {
  scroller: Scroller = new Scroller();
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  
  // 用于显示回调信息的RichEditor
  displayController: RichEditorController = new RichEditorController();
  displayOptions: RichEditorOptions = { controller: this.displayController };

  build() {
    Column() {
      // 提示信息
      Text('先输入文本内容，然后在span之间换行测试IME回调')
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
        .id('displayRichEditor0072')
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
          .id('richEditor0072')
          .width('100%')
          .height(100)
          .border({ width: 1, color: Color.Gray })
          .borderRadius(8)
          .padding(8)
          .placeholder('请输入文本内容，然后在中间换行...')
          .aboutToIMEInput((value: RichEditorInsertValue) => {
            // aboutToIMEInput回调
            console.log('aboutToIMEInput回调触发')
            
            // 获取当前光标位置和spans信息
            const caretOffset = this.controller.getCaretOffset()
            const currentSpans = this.controller.getSpans({ start: -1, end: -1 })
            
            this.displayController.deleteSpans()
            this.displayController.addTextSpan('aboutToIMEInput回调成功\n', {
              style: {
                fontSize: 14,
                fontColor: Color.Blue,
                fontWeight: FontWeight.Bold
              }
            })
            
            // 显示具体信息
            const insertInfo = JSON.stringify(value)
            this.displayController.addTextSpan(`光标位置: ${caretOffset} (span2中间往前2格)\n当前spans数量: ${currentSpans.length}\n插入内容: ${value.insertValue}\n返回值: true`, {
              style: {
                fontSize: 12,
                fontColor: Color.Blue
              }
            })
            
            return true // 返回值设置为true
          })
          .onIMEInputComplete((value: RichEditorTextSpanResult) => {
            // onIMEInputComplete回调
            console.log('onIMEInputComplete回调触发')
            
            this.displayController.addTextSpan('\n\nonIMEInputComplete回调成功\n', {
              style: {
                fontSize: 14,
                fontColor: Color.Green,
                fontWeight: FontWeight.Bold
              }
            })
            
            // 获取输入完成后的spans信息，分析span分割效果
            const afterSpans = this.controller.getSpans({ start: -1, end: -1 })
            let spanAnalysis = `换行后spans分析:\n数量: ${afterSpans.length}\n`
            
            afterSpans.forEach((span, index) => {
              const textSpan = span as RichEditorTextSpanResult
              if (textSpan && textSpan.textStyle) {
                const hasLineBreak = textSpan.value?.includes('\n') ? '是' : '否'
                const color = textSpan.textStyle.fontColor === Color.Black ? '黑色' : '蓝色'
                spanAnalysis += `Span${index + 1}: "${textSpan.value}" (颜色:${color}, 换行符:${hasLineBreak})\n`
              }
            })
            
            const completeInfo = JSON.stringify(value)
            this.displayController.addTextSpan(`${spanAnalysis}\n输入完成详情:\n${completeInfo}`, {
              style: {
                fontSize: 12,
                fontColor: Color.Green
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

      
      Button('添加测试文本')
        .id('addTestTextBtn0072')
        .width('80%')
        .height(40)
        .margin(5)
        .onClick(() => {
          // 添加第一个span
          this.controller.addTextSpan('这是第一个span', {
            style: {
              fontSize: 16,
              fontColor: Color.Black
            }
          })
          
          // 添加第二个span
          this.controller.addTextSpan('这是第二个span内容', {
            style: {
              fontSize: 16,
              fontColor: Color.Blue
            }
          })
          
          // 计算span2中间位置：第一个span长度 + 第二个span中间位置 - 2（往前移两格）
          // 第一个span: "这是第一个span" = 7个字符
          // 第二个span: "这是第二个span内容" = 9个字符，中间位置约为4-5个字符
          // 所以设置光标位置为：7 + 4 - 2 = 9
          const span1Length = 7
          const span2MiddleOffset = 4
          const moveBackward = 2
          const targetOffset = span1Length + span2MiddleOffset - moveBackward
          
          this.controller.setCaretOffset(targetOffset)
          
          this.displayController.deleteSpans()
          this.displayController.addTextSpan(`已添加两个span\nSpan1: "这是第一个span" (7字符)\nSpan2: "这是第二个span内容" (9字符)\n光标已定位到span2中间往前2格位置 (偏移量: ${targetOffset})\n现在请按回车键换行`, {
            style: {
              fontSize: 12,
              fontColor: Color.Orange
            }
          })
        })
      
      Button('清空内容重新测试')
        .id('clearBtn0072')
        .width('80%')
        .height(40)
        .margin(5)
        .backgroundColor(Color.Gray)
        .onClick(() => {
          this.controller.deleteSpans()
          this.displayController.deleteSpans()
          this.displayController.addTextSpan("内容已清空\n请点击'添加测试文本'或直接输入文本开始测试", {
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
