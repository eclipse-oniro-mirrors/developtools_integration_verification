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
struct UiComponentTextRichEditorInterface0004 {
  scroller: Scroller = new Scroller();
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  
  // 用于显示回调信息的RichEditor
  displayController: RichEditorController = new RichEditorController();
  displayOptions: RichEditorOptions = { controller: this.displayController };

  build() {
    Column() {
      // 提示信息
      Text('检查aboutToDelete回调值准确性')
        .width('100%')
        .fontSize(12)
        .fontColor(Color.Orange)
        .textAlign(TextAlign.Center)
        .margin(10)

      Button('给RichEditor组件添加aboutToDelete回调')
        .id('addCallbackBtn0004')
        .width('80%')
        .height(40)
        .margin(10)
        .onClick(() => {
          this.displayController.deleteSpans()
          this.displayController.addTextSpan('aboutToDelete回调已添加\n回调内容: console.log(JSON.stringify(value))\n请添加内容后使用输入法删除', {
            style: {
              fontSize: 12,
              fontColor: Color.Orange
            }
          })
        })
      
      Text('回调信息显示区域：')
        .width('100%')
        .fontSize(14)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 5 })
      
      // 显示回调信息的区域
      RichEditor(this.displayOptions)
        .id('displayRichEditor0004')
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
          .id('richEditor0004')
          .width('100%')
          .height(100)
          .border({ width: 1, color: Color.Gray })
          .borderRadius(8)
          .padding(8)
          .placeholder('请先添加内容，然后使用输入法删除内容测试回调...')
          .aboutToDelete((value: RichEditorDeleteValue) => {
            // aboutToDelete回调 - 设置console.log(JSON.stringify(value))
            console.log(JSON.stringify(value))
            
            this.displayController.deleteSpans()
            this.displayController.addTextSpan('aboutToDelete回调成功\n', {
              style: {
                fontSize: 14,
                fontColor: Color.Red,
                fontWeight: FontWeight.Bold
              }
            })
            
            // 显示控制台打印的删除文本Span信息
            this.displayController.addTextSpan('控制台已打印删除文本Span信息:\n' + JSON.stringify(value), {
              style: {
                fontSize: 12,
                fontColor: Color.Red
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

      Button('添加测试内容')
        .id('addContentBtn0004')
        .width('80%')
        .height(40)
        .margin(5)
        .onClick(() => {
          this.controller.addTextSpan('这是第一段文本。', {
            style: {
              fontSize: 16,
              fontColor: Color.Black
            }
          })
          this.controller.addTextSpan('这是第二段文本。', {
            style: {
              fontSize: 16,
              fontColor: Color.Blue
            }
          })
          this.controller.addTextSpan('这是第三段文本。', {
            style: {
              fontSize: 16,
              fontColor: Color.Red
            }
          })
          
          this.displayController.deleteSpans()
          this.displayController.addTextSpan('已添加测试内容\n请使用输入法删除部分内容\n观察aboutToDelete回调信息', {
            style: {
              fontSize: 12,
              fontColor: Color.Orange
            }
          })
        })
      
      Button('清空内容重新测试')
        .id('clearBtn0004')
        .width('80%')
        .height(40)
        .margin(5)
        .backgroundColor(Color.Gray)
        .onClick(() => {
          this.controller.deleteSpans()
          this.displayController.deleteSpans()
          this.displayController.addTextSpan("内容已清空\n请点击'添加测试内容'开始测试", {
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
