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
struct UiComponentTextRichEditorInterface0068 {
  scroller: Scroller = new Scroller();
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  
  // 用于显示操作结果的RichEditor
  displayController: RichEditorController = new RichEditorController();
  displayOptions: RichEditorOptions = { controller: this.displayController };

  // 状态变量
  @State hasContent: boolean = false;

  build() {
    Column() {
      // 提示信息
      Text('测试deleteSpans删除跨越emoji和symbol边界的内容')
        .width('100%')
        .fontSize(12)
        .fontColor(Color.Orange)
        .textAlign(TextAlign.Center)
        .margin(10)

      Row(){
        // 添加内容按钮
        Button('添加包含emoji和symbol的图文混合内容')
          .id('addContentBtn0068')
          .width('40%')
          .height(40)
          .margin(5)
          .onClick(() => {
            // 清空现有内容
            this.controller.deleteSpans()

            // 添加包含emoji和symbol的图文混合内容
            // 文本 + emoji + 文本 + symbol + 文本
            this.controller.addTextSpan('前置文本😀😃😄', {
              style: {
                fontSize: 16,
                fontColor: Color.Blue
              }
            })

            this.controller.addTextSpan('中间文本', {
              style: {
                fontSize: 16,
                fontColor: Color.Green
              }
            })

            // 添加symbol
            this.controller.addSymbolSpan($r('sys.symbol.ohos_star'), {
              style: {
                fontSize: 20,
                fontColor: [Color.Red]
              }
            })

            this.controller.addTextSpan('后置文本🎉🎊', {
              style: {
                fontSize: 16,
                fontColor: Color.Pink
              }
            })

            this.hasContent = true

            this.displayController.deleteSpans()
            this.displayController.addTextSpan('已添加包含emoji和symbol的图文混合内容', {
              style: {
                fontSize: 12,
                fontColor: Color.Green
              }
            })
          })

        // 执行deleteSpans边界测试按钮
        Button('执行deleteSpans边界测试')
          .id('deleteSpansBtn0068')
          .width('40%')
          .height(40)
          .margin(5)
          .enabled(this.hasContent)
          .onClick(() => {
            try {
              // 删除跨越emoji和symbol边界的内容
              // 从emoji中间到symbol中间的范围
              this.controller.deleteSpans({ start: 6, end: 12 })
              
              this.displayController.deleteSpans()
              this.displayController.addTextSpan('deleteSpans执行成功\n删除范围: 6-12 (跨越emoji和symbol边界)\n未发生crash现象', {
                style: {
                  fontSize: 12,
                  fontColor: Color.Red
                }
              })
            } catch (error) {
              this.displayController.deleteSpans()
              this.displayController.addTextSpan('deleteSpans执行失败\n错误信息: ' + error.message, {
                style: {
                  fontSize: 12,
                  fontColor: Color.Red
                }
              })
            }
          })
      }

      // 显示操作结果的区域
      Text('操作结果显示区域：')
        .width('100%')
        .fontSize(14)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 5 })
      
      RichEditor(this.displayOptions)
        .id('displayRichEditor0068')
        .width('100%')
        .height(80)
        .border({ width: 1, color: Color.Green })
        .borderRadius(8)
        .padding(8)
        .backgroundColor('#F0F8FF')
        .margin(10)
      
      // 主要测试区域标题
      Text('RichEditor测试区域：')
        .width('100%')
        .fontSize(14)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 5 })

      // 主要测试区域（包含emoji和symbol内容）
      Scroll(this.scroller) {
        RichEditor(this.options)
          .id('richEditor0068')
          .width('100%')
          .height(150)
          .border({ width: 1, color: Color.Gray })
          .borderRadius(8)
          .padding(8)
          .placeholder('这里将显示包含emoji和symbol的图文混合内容')
      }
      .width('100%')
      .height('16.39%')
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.On)
      .scrollBarColor('#999999')
      .scrollBarWidth(8)
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}
