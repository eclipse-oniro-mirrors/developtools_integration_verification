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
struct UiComponentTextRichEditorCursorPosition0003 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  infoController: RichEditorController = new RichEditorController();
  infoOptions: RichEditorOptions = { controller: this.infoController };

  @State currentTextAlign: TextAlign = TextAlign.Start;
  @State currentMargin: number = 30;
  
  // 使用@State管理RichEditor组件布局
  @State editorWidth: string = '70%';
  @State editorHeight: number = 180;
  @State editorPadding: number = 8;
  @State editorBorderWidth: number = 2;
  @State editorBorderColor: Color = Color.Blue;
  
  // 使用@State管理ImageSpan样式
  @State imageSize: number = 50;
  @State imageMargin: number = 5;
  
  // 记录ImageSpan的位置
  private imageSpanStart: number = -1;

  aboutToAppear(): void {
    this.infoController.addTextSpan('点击RichEditor产生光标，然后点击按钮改变图文布局', {
      style: {
        fontSize: 14,
        fontColor: Color.Gray
      }
    });
  }

  // 改变图文布局并获取光标位置
  changeImageTextLayout() {
    try {
      // 1. 循环切换对齐方式、组件布局和ImageSpan样式
      if (this.currentTextAlign === TextAlign.Start) {
        // 切换到居中对齐 - 宽度变宽、margin变小
        this.currentTextAlign = TextAlign.Center;
        this.currentMargin = 15;
        this.editorWidth = '85%';
        this.editorHeight = 180;
        this.editorPadding = 12;
        this.editorBorderWidth = 4;
        this.editorBorderColor = Color.Green;
        this.imageSize = 70;
        this.imageMargin = 8;
        hilog.info(0x0000, 'TEST', '切换到居中对齐：85%宽、margin=15、绿边框');
      } else if (this.currentTextAlign === TextAlign.Center) {
        // 切换到右对齐 - 宽度最宽、margin最小
        this.currentTextAlign = TextAlign.End;
        this.currentMargin = 0;
        this.editorWidth = '100%';
        this.editorHeight = 180;
        this.editorPadding = 15;
        this.editorBorderWidth = 6;
        this.editorBorderColor = Color.Red;
        this.imageSize = 90;
        this.imageMargin = 12;
        hilog.info(0x0000, 'TEST', '切换到右对齐：100%宽、margin=0、红边框');
      } else {
        // 切换回左对齐 - 宽度最窄、margin最大
        this.currentTextAlign = TextAlign.Start;
        this.currentMargin = 30;
        this.editorWidth = '70%';
        this.editorHeight = 180;
        this.editorPadding = 8;
        this.editorBorderWidth = 2;
        this.editorBorderColor = Color.Blue;
        this.imageSize = 50;
        this.imageMargin = 5;
        hilog.info(0x0000, 'TEST', '切换回左对齐：70%宽、margin=30、蓝边框');
      }

      // 2. 删除第一段文本后的所有内容（从位置8开始）
      hilog.info(0x0000, 'TEST', '=== 开始删除重建ImageSpan ===');
      this.controller.deleteSpans({ start: 8, end: -1 });
      hilog.info(0x0000, 'TEST', '✓ 已删除旧的ImageSpan和后续文本');

      // 3. 重新添加ImageSpan（使用新的@State值）
      this.imageSpanStart = 8;
      this.controller.addImageSpan($r('sys.media.ohos_app_icon'), {
        imageStyle: {
          size: [this.imageSize, this.imageSize],
          layoutStyle: {
            margin: this.imageMargin
          }
        }
      });
      hilog.info(0x0000, 'TEST', `✓ 重新添加ImageSpan: size=${this.imageSize}x${this.imageSize}`);

      // 4. 重新添加后续文本
      this.controller.addTextSpan('\n点击产生光标，改变布局', {
        style: {
          fontSize: 16,
          fontColor: Color.Black
        }
      });
      hilog.info(0x0000, 'TEST', '✓ 重新添加后续文本');

      // 5. 获取光标位置并显示
      let caretRect = this.controller.getCaretRect();
      if (caretRect) {
        hilog.info(0x0000, 'TEST', `光标位置: x=${caretRect.x}, y=${caretRect.y}`);

        // 显示光标位置信息
        this.infoController.deleteSpans({ start: 0, end: -1 });
        let alignText = this.currentTextAlign === TextAlign.Start ? '左' :
          this.currentTextAlign === TextAlign.Center ? '中' : '右';
        let borderColorText = this.editorBorderColor === Color.Blue ? '蓝' :
          this.editorBorderColor === Color.Green ? '绿' : '红';
        this.infoController.addTextSpan(
          `对齐=${alignText} 宽=${this.editorWidth} margin=${this.currentMargin}\n边框${this.editorBorderWidth}px${borderColorText} 图=${this.imageSize}x${this.imageSize}\n光标: x=${caretRect.x}, y=${caretRect.y}`,
          {
            style: {
              fontSize: 11,
              fontColor: Color.Orange
            }
          }
        );
      }
    } catch (err) {
      hilog.error(0x0000, 'TEST', `改变布局失败: ${JSON.stringify(err)}`);
      // 显示错误信息
      this.infoController.deleteSpans({ start: 0, end: -1 });
      this.infoController.addTextSpan(
        `发生错误: ${err}`,
        {
          style: {
            fontSize: 12,
            fontColor: Color.Red
          }
        }
      );
    }
  }

  build() {
    Column({ space: 5 }) {
      Text('光标闪烁时改变图文布局')
        .fontSize(15)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 5, bottom: 5 })

      Button('改变图文布局并获取光标位置')
        .id('button_cursor_position_0003_change_layout')
        .width('90%')
        .onClick(() => {
          this.changeImageTextLayout();
        })
        .margin({ bottom: 5 })

      Text('光标位置信息')
        .fontSize(12)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      RichEditor(this.infoOptions)
        .id('rich_editor_cursor_position_0003_info')
        .width('100%')
        .height(55)
        .backgroundColor('#F0F0F0')
        .border({ width: 1, color: Color.Gray })
        .borderRadius(8)
        .padding(5)
        .margin({ bottom: 5 })

      Text('RichEditor组件（含图文混排）')
        .fontSize(12)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      RichEditor(this.options)
        .id('rich_editor_cursor_position_0003')
        .width(this.editorWidth)
        .height(this.editorHeight)
        .backgroundColor(Color.White)
        .border({ width: this.editorBorderWidth, color: this.editorBorderColor })
        .borderRadius(8)
        .padding(this.editorPadding)
        .copyOptions(CopyOptions.InApp)
        .margin(this.currentMargin)
        .alignSelf(this.currentTextAlign === TextAlign.Center ? ItemAlign.Center : 
                   this.currentTextAlign === TextAlign.End ? ItemAlign.End : ItemAlign.Start)
        .onReady(() => {
          // 添加第一段文本（0-7，共8个字符包含换行符）
          this.controller.addTextSpan('这是文本内容\n', {
            style: {
              fontSize: 16,
              fontColor: Color.Black
            }
          });
          
          // 添加ImageSpan（位置8，使用@State值）
          this.imageSpanStart = 8;
          this.controller.addImageSpan($r('sys.media.ohos_app_icon'), {
            imageStyle: {
              size: [this.imageSize, this.imageSize],
              layoutStyle: {
                margin: this.imageMargin
              }
            }
          });
          hilog.info(0x0000, 'TEST', `ImageSpan添加在位置: ${this.imageSpanStart}, size=${this.imageSize}x${this.imageSize}`);
          
          // 添加后续文本（位置9开始）
          this.controller.addTextSpan('\n点击产生光标，改变布局', {
            style: {
              fontSize: 16,
              fontColor: Color.Black
            }
          });
        })
    }
    .width('100%')
    .height('100%')
    .padding(10)
    .backgroundColor('#F6F7F9')
  }
}

