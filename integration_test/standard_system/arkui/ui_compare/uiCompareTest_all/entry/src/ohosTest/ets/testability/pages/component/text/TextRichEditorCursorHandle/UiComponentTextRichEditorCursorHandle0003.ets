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
struct UiComponentTextRichEditorCursorHandle0003 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  @State currentFontSize: number = 16;
  @State currentLineHeight: number = 20;

  build() {
    Column({ space: 10 }) {
      Text('测试0003：光标高度跟随左侧文本')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10 })

      // 显示当前样式
      Text(`当前fontSize: ${this.currentFontSize}px, lineHeight: ${this.currentLineHeight}px`)
        .fontSize(14)
        .fontColor(Color.Blue)

      // 操作按钮
      Row({ space: 10 }) {
        Button('增大字体')
          .id('btn_increase_font_size_0003')
          .onClick(() => {
            this.currentFontSize += 8;
            this.controller.updateSpanStyle({
              start: 0,
              end: -1,
              textStyle: {
                fontSize: this.currentFontSize
              }
            });
          })

        Button('增大行高')
          .id('btn_increase_line_height_0003')
          .onClick(() => {
            this.currentLineHeight += 10;
            this.controller.updateSpanStyle({
              start: 0,
              end: -1,
              textStyle: {
                lineHeight: this.currentLineHeight
              }
            });
          })
      }

      // RichEditor组件
      RichEditor(this.options)
        .id('rich_editor_cursor_handle_0003')
        .width('90%')
        .height(300)
        .border({ width: 1, color: Color.Gray })
        .backgroundColor(Color.White)
        .onReady(() => {
          this.controller.addTextSpan('这是测试文本。', {
            style: {
              fontColor: Color.Black,
              fontSize: this.currentFontSize,
              lineHeight: this.currentLineHeight
            }
          });
          this.controller.addTextSpan('点击文本后观察光标高度。', {
            style: {
              fontColor: Color.Black,
              fontSize: this.currentFontSize,
              lineHeight: this.currentLineHeight
            }
          });
          this.controller.addTextSpan('使用上方按钮改变字体大小或行高，观察光标高度是否跟随左侧文本变化。', {
            style: {
              fontColor: Color.Black,
              fontSize: this.currentFontSize,
              lineHeight: this.currentLineHeight
            }
          });
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}

