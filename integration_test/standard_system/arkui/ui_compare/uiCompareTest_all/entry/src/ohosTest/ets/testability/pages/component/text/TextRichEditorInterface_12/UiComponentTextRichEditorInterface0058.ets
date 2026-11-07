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
struct UiComponentTextRichEditorInterface0058 {
  scroller: Scroller = new Scroller();
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  
  // 用于显示操作结果的RichEditor
  displayController: RichEditorController = new RichEditorController();
  displayOptions: RichEditorOptions = { controller: this.displayController };

  private operationCount: number = 0

  build() {
    Column() {
      // 提示信息
      Text('测试连续调用addTextSpan、updateSpanStyle和deleteSpans')
        .width('100%')
        .fontSize(12)
        .fontColor(Color.Orange)
        .textAlign(TextAlign.Center)
        .margin(10)
      
      Text('操作结果显示区域：')
        .width('100%')
        .fontSize(14)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 5 })
      
      // 显示操作结果的区域
      RichEditor(this.displayOptions)
        .id('displayRichEditor0058')
        .width('100%')
        .height(100)
        .border({ width: 1, color: Color.Green })
        .borderRadius(8)
        .padding(8)
        .backgroundColor('#F0F8FF')
        .margin(10)
      
      // 主要测试区域
      Scroll(this.scroller) {
        RichEditor(this.options)
          .id('richEditor0058')
          .width('100%')
          .height(100)
          .border({ width: 1, color: Color.Gray })
          .borderRadius(8)
          .padding(8)
      }
      .width('100%')
      .height('16.39%')
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.On)
      .scrollBarColor('#999999')
      .scrollBarWidth(8)

      
      // 测试按钮
      Button('执行addTextSpan操作')
        .id('addTextBtn0058')
        .width('80%')
        .height(40)
        .margin(5)
        .onClick(() => {
          try {
            this.controller.addTextSpan(`测试文本${++this.operationCount}`, {
              style: {
                fontSize: 16,
                fontColor: Color.Black
              }
            })
            
            this.displayController.deleteSpans()
            this.displayController.addTextSpan(`第${this.operationCount}次操作\naddTextSpan执行成功`, {
              style: {
                fontSize: 12,
                fontColor: Color.Green
              }
            })
          } catch (error) {
            this.displayController.deleteSpans()
            this.displayController.addTextSpan('addTextSpan执行失败\n错误信息: ' + error.toString(), {
              style: {
                fontSize: 12,
                fontColor: Color.Red
              }
            })
          }
        })
      
      Button('执行updateSpanStyle操作')
        .id('updateStyleBtn0058')
        .width('80%')
        .height(40)
        .margin(5)
        .onClick(() => {
          try {
            this.controller.updateSpanStyle({
              start: 0,
              end: -1,
              textStyle: {
                fontSize: 20,
                fontColor: Color.Blue
              }
            })
            
            this.displayController.deleteSpans()
            this.displayController.addTextSpan(`第${this.operationCount}次操作\nupdateSpanStyle执行成功\n样式已更新为蓝色20号字体`, {
              style: {
                fontSize: 12,
                fontColor: Color.Green
              }
            })
          } catch (error) {
            this.displayController.deleteSpans()
            this.displayController.addTextSpan('updateSpanStyle执行失败\n错误信息: ' + error.toString(), {
              style: {
                fontSize: 12,
                fontColor: Color.Red
              }
            })
          }
        })
      
      Button('执行deleteSpans操作')
        .id('deleteSpansBtn0058')
        .width('80%')
        .height(40)
        .margin(5)
        .onClick(() => {
          try {
            this.controller.deleteSpans()
            
            this.displayController.deleteSpans()
            this.displayController.addTextSpan(`第${this.operationCount}次操作\ndeleteSpans执行成功\n所有内容已删除`, {
              style: {
                fontSize: 12,
                fontColor: Color.Green
              }
            })
          } catch (error) {
            this.displayController.deleteSpans()
            this.displayController.addTextSpan('deleteSpans执行失败\n错误信息: ' + error.toString(), {
              style: {
                fontSize: 12,
                fontColor: Color.Red
              }
            })
          }
        })

    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}
