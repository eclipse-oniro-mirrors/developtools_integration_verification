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
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct UiComponentTextRichEditorCursorPosition0004 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  infoController: RichEditorController = new RichEditorController();
  infoOptions: RichEditorOptions = { controller: this.infoController };

  aboutToAppear(): void {
    this.infoController.addTextSpan('点击按钮将光标移动到空行/行首/行尾', {
      style: {
        fontSize: 14,
        fontColor: Color.Gray
      }
    });
  }

  // 设置光标到空行
  setCaretToEmptyLine() {
    try {
      // 使用setCaretOffset设置光标到空行（第2行）
      // "这是第一行文本内容\n" = 10个字符（包括换行符）
      let position = 10;
      this.controller.setCaretOffset(position);
      hilog.info(0x0000, 'TEST', `设置光标到空行，位置: ${position}`);
      
      // 获取光标位置信息
      let caretRect = this.controller.getCaretRect();
      if (caretRect) {
        hilog.info(0x0000, 'TEST', `空行光标位置: x=${caretRect.x}, y=${caretRect.y}`);
        this.showCaretInfo('空行', caretRect);
      }
    } catch (err) {
      hilog.error(0x0000, 'TEST', `设置光标到空行失败: ${err}`);
    }
  }

  // 设置光标到行首
  setCaretToLineStart() {
    try {
      // 使用setCaretOffset设置光标到第1行行首
      let position = 0;
      this.controller.setCaretOffset(position);
      hilog.info(0x0000, 'TEST', `设置光标到行首，位置: ${position}`);
      
      // 获取光标位置信息
      let caretRect = this.controller.getCaretRect();
      if (caretRect) {
        hilog.info(0x0000, 'TEST', `行首光标位置: x=${caretRect.x}, y=${caretRect.y}`);
        this.showCaretInfo('行首', caretRect);
      }
    } catch (err) {
      hilog.error(0x0000, 'TEST', `设置光标到行首失败: ${err}`);
    }
  }

  // 设置光标到行尾
  setCaretToLineEnd() {
    try {
      // 使用setCaretOffset设置光标到第1行行尾
      // "这是第一行文本内容" = 9个字符，换行符前
      let position = 9;
      this.controller.setCaretOffset(position);
      hilog.info(0x0000, 'TEST', `设置光标到行尾，位置: ${position}`);
      
      // 获取光标位置信息
      let caretRect = this.controller.getCaretRect();
      if (caretRect) {
        hilog.info(0x0000, 'TEST', `行尾光标位置: x=${caretRect.x}, y=${caretRect.y}`);
        this.showCaretInfo('行尾', caretRect);
      }
    } catch (err) {
      hilog.error(0x0000, 'TEST', `设置光标到行尾失败: ${err}`);
    }
  }

  showCaretInfo(position: string, caretRect: RectResult) {
    this.infoController.deleteSpans({ start: 0, end: -1 });
    this.infoController.addTextSpan(
      `光标位置:${position}\nx=${caretRect.x}, y=${caretRect.y}`,
      {
        style: {
          fontSize: 14,
          fontColor: Color.Blue
        }
      }
    );
  }

  build() {
    Column({ space: 10 }) {
      Text('改变光标位置到空行/行首/行尾')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 10 })

      Row({ space: 10 }) {
        Button('光标到空行')
          .id('button_cursor_position_0004_empty_line')
          .onClick(() => {
            this.setCaretToEmptyLine();
          })

        Button('光标到行首')
          .id('button_cursor_position_0004_line_start')
          .onClick(() => {
            this.setCaretToLineStart();
          })

        Button('光标到行尾')
          .id('button_cursor_position_0004_line_end')
          .onClick(() => {
            this.setCaretToLineEnd();
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceAround)

      Text('光标位置信息')
        .fontSize(13)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)
        .margin({ top: 10 })

      RichEditor(this.infoOptions)
        .id('rich_editor_cursor_position_0004_info')
        .width('100%')
        .height(80)
        .backgroundColor('#F0F0F0')
        .border({ width: 1, color: Color.Gray })
        .borderRadius(8)
        .padding(8)
        .margin({ bottom: 10 })

      Text('RichEditor组件')
        .fontSize(13)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      RichEditor(this.options)
        .id('rich_editor_cursor_position_0004')
        .width('100%')
        .height(150)
        .backgroundColor(Color.White)
        .border({ width: 2, color: Color.Blue })
        .borderRadius(8)
        .padding(8)
        .onReady(() => {
          this.controller.addTextSpan('这是第一行文本内容\n\n这是第三行文本内容\n这是第四行文本内容', {
            style: {
              fontSize: 16,
              fontColor: Color.Black
            }
          });
        })
    }
    .width('100%')
    .height('100%')
    .padding(15)
    .backgroundColor('#F6F7F9')
  }
}

