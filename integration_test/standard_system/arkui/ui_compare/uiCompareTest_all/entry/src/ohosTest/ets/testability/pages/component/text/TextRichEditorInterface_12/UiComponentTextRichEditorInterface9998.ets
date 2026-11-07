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
struct UiComponentTextRichEditorInterface9998 {
  scroller: Scroller = new Scroller();
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  
  // 用于显示span信息的RichEditor
  displayController: RichEditorController = new RichEditorController();
  displayOptions: RichEditorOptions = { controller: this.displayController };

  build() {
    Column() {
      // 提示信息
      Text('在onDeleteComplete回调内使用getSpans，能准确获取到span信息')
        .width('100%')
        .fontSize(12)
        .fontColor(Color.Orange)
        .textAlign(TextAlign.Center)
        .margin(10)
      
      Text('Span信息显示区域：')
        .width('100%')
        .fontSize(14)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 5 })
      
      // 显示span信息的区域
      RichEditor(this.displayOptions)
        .id('displayRichEditor9998')
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
          .id('richEditor9998')
          .width('100%')
          .height(100)
          .border({ width: 1, color: Color.Gray })
          .borderRadius(8)
          .padding(8)
          .placeholder('请输入内容，然后删除测试onDeleteComplete回调...')
          .onDeleteComplete(() => {
            // 在onDeleteComplete回调内获取span信息
            const spans = JSON.stringify(this.controller.getSpans({ start: -1, end: -1 }))
            console.log('onDeleteComplete - spans信息:', spans)
            
            // 分析spans信息
            const spansArray = this.controller.getSpans({ start: -1, end: -1 })
            let spanAnalysis = `删除完成后spans数量: ${spansArray.length}\n`
            
            spansArray.forEach((span, index) => {
              const textSpan = span as RichEditorTextSpanResult
              const imageSpan = span as RichEditorImageSpanResult
              
              if (textSpan && textSpan.textStyle) {
                spanAnalysis += `Span${index + 1}: "${textSpan.value}" (字体大小:${textSpan.textStyle?.fontSize || '默认'})\n`
              } else if (imageSpan && imageSpan.imageStyle) {
                spanAnalysis += `Span${index + 1}: [图片] (尺寸:${imageSpan.imageStyle?.size || '默认'})\n`
              } else {
                spanAnalysis += `Span${index + 1}: [其他类型]\n`
              }
            })
            
            this.displayController.deleteSpans()
            this.displayController.addTextSpan('onDeleteComplete触发\nspan信息:\n' + spans + '\n\n分析:\n' + spanAnalysis, {
              style: {
                fontSize: 12,
                fontColor: Color.Red
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

      
      Button('添加多样化内容')
        .id('addContentBtn9998')
        .width('80%')
        .height(40)
        .margin(5)
        .onClick(() => {
          this.controller.addTextSpan('文本内容1', {
            style: {
              fontSize: 16,
              fontColor: Color.Black
            }
          })
          this.controller.addTextSpan('文本内容2', {
            style: {
              fontSize: 18,
              fontColor: Color.Blue
            }
          })
          this.controller.addImageSpan($r('app.media.icon'), {
            imageStyle: {
              size: [30, 30]
            }
          })
          this.controller.addTextSpan('文本内容3', {
            style: {
              fontSize: 14,
              fontColor: Color.Red
            }
          })
          
          this.displayController.deleteSpans()
          this.displayController.addTextSpan('已添加多样化内容\n包含不同样式的文本和图片\n请删除部分内容测试', {
            style: {
              fontSize: 12,
              fontColor: Color.Orange
            }
          })
        })
      
      Button('清空内容重新测试')
        .id('clearBtn9998')
        .width('80%')
        .height(40)
        .margin(5)
        .backgroundColor(Color.Gray)
        .onClick(() => {
          this.controller.deleteSpans()
          this.displayController.deleteSpans()
          this.displayController.addTextSpan("内容已清空\n请点击'添加多样化内容'开始测试", {
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
