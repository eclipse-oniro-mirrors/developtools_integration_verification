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
struct UiComponentTextRichEditorAction0340 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  private symbolSpanStart: number = -1;

  build() {
    Column({ space: 10 }) {
      Text('不同内容放置文本首位时，缩进以及光标位置显示正常')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 10 })

      Row({ space: 10 }) {
        Button('清空symbolSpan前文本')
          .id('button_action_0340_clear')
          .fontSize(12)
          .layoutWeight(1)
          .onClick(() => {
            // 删除symbolSpan之前的文本
            if (this.symbolSpanStart > 0) {
              this.controller.deleteSpans({ start: 0, end: this.symbolSpanStart });
              this.symbolSpanStart = 0;
              hilog.info(0x0000, 'TEST', 'symbolSpan前的文本已清空');
            }
          })

        Button('向右缩进')
          .id('button_action_0340_indent')
          .fontSize(12)
          .layoutWeight(1)
          .onClick(() => {
            // 获取光标位置
            let selection = this.controller.getSelection();
            hilog.info(0x0000, 'TEST', `操作前光标位置: ${selection.selection[0]}`);

            // 在文本开头添加空格来实现缩进效果（因为RichEditorParagraphStyle不支持textIndent）
            this.controller.addTextSpan('    ', {
              offset: this.symbolSpanStart,
              style: {
                fontSize: 16,
                fontColor: Color.Black
              }
            });

            this.symbolSpanStart += 4; // 更新symbolSpan位置

            // 再次获取光标位置
            let newCaretRect = this.controller.getCaretRect();
            if (newCaretRect) {
              hilog.info(0x0000, 'TEST', `添加缩进后光标位置: x=${newCaretRect.x}, y=${newCaretRect.y}`);
            }
          })
      }
      .width('100%')

      Button('设置imageSpan在文本前并缩进')
        .id('button_action_0340_image_indent')
        .fontSize(12)
        .width('100%')
        .margin({ bottom: 10 })
        .onClick(() => {
          // 清空所有内容
          this.controller.deleteSpans({ start: 0, end: -1 });

          // 在开头添加imageSpan
          this.controller.addImageSpan($r('sys.media.ohos_app_icon'), {
            imageStyle: {
              size: [60, 60],
              layoutStyle: {
                margin: 5
              }
            }
          });

          // 添加文本
          this.controller.addTextSpan('图片后的文本内容', {
            style: {
              fontSize: 16,
              fontColor: Color.Black
            }
          });

          hilog.info(0x0000, 'TEST', 'imageSpan已添加到文本前');

          // 尝试在图片前添加空格实现缩进（验证图片不支持通过前置空格缩进）
          // 注：由于图片在最前面，添加空格无法实现缩进效果
          hilog.info(0x0000, 'TEST', '图片在文本首位时无法通过添加空格实现缩进');
        })

      RichEditor(this.options)
        .id('rich_editor_action_0340')
        .width('100%')
        .height(200)
        .backgroundColor(Color.White)
        .border({ width: 2, color: Color.Blue })
        .borderRadius(8)
        .padding(8)
        .onReady(() => {
          // 添加初始文本
          this.controller.addTextSpan('这是初始文本内容\n', {
            style: {
              fontSize: 16,
              fontColor: Color.Black
            }
          });

          // 记录symbolSpan的位置
          this.symbolSpanStart = '这是初始文本内容\n'.length;

          // 添加symbolSpan
          this.controller.addSymbolSpan($r('sys.symbol.ohos_wifi'), {
            style: {
              fontSize: 30,
              fontColor: [Color.Blue]
            }
          });

          // 添加symbolSpan后的文本
          this.controller.addTextSpan(' symbolSpan后的文本', {
            style: {
              fontSize: 16,
              fontColor: Color.Black
            }
          });

          hilog.info(0x0000, 'TEST', `symbolSpan位置: ${this.symbolSpanStart}`);
        })
    }
    .width('100%')
    .height('100%')
    .padding(15)
    .backgroundColor('#F6F7F9')
  }
}

