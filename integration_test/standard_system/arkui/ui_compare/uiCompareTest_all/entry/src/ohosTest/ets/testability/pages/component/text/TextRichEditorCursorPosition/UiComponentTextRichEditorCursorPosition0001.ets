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
struct UiComponentTextRichEditorCursorPosition0001 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  infoController: RichEditorController = new RichEditorController();
  infoOptions: RichEditorOptions = { controller: this.infoController };
  // 使用@State管理样式参数
  @State textFontSize: number = 16;
  @State textFontColor: Color = Color.Black;
  @State textFontWeight: FontWeight = FontWeight.Normal;
  @State imageSize: number = 60;
  @State imageBorderRadius: number = 0;
  @State imageMargin: number = 5;
  @State symbolFontSize: number = 30;
  @State symbolFontColor: Color = Color.Blue;
  // 记录span的位置
  private imageSpanStart: number = -1;
  private symbolSpanStart: number = -1;

  aboutToAppear(): void {
    // 初始化信息显示组件
    this.infoController.addTextSpan('点击RichEditor产生光标，然后点击按钮改变样式', {
      style: {
        fontSize: 14,
        fontColor: Color.Gray
      }
    });
  }

  // 同时改变文本、图片、符号样式并获取光标位置
  changeAllStyles() {
    try {
      // 1. 修改@State状态值（切换样式）
      if (this.textFontSize === 16) {
        // 切换到新样式
        this.textFontSize = 24;
        this.textFontColor = Color.Red;
        this.textFontWeight = FontWeight.Bold;

        this.imageSize = 300;
        this.imageBorderRadius = 20;
        this.imageMargin = 10;

        this.symbolFontSize = 60;
        this.symbolFontColor = Color.Red;

        hilog.info(0x0000, 'TEST', '切换到新样式');
      } else {
        // 切换回原始样式
        this.textFontSize = 16;
        this.textFontColor = Color.Black;
        this.textFontWeight = FontWeight.Normal;

        this.imageSize = 60;
        this.imageBorderRadius = 0;
        this.imageMargin = 5;

        this.symbolFontSize = 30;
        this.symbolFontColor = Color.Blue;

        hilog.info(0x0000, 'TEST', '切换回原始样式');
      }

      // 2. 更新文本样式（文本可以直接用updateSpanStyle）
      this.controller.updateSpanStyle({
        start: 0,
        end: 17,
        textStyle: {
          fontSize: this.textFontSize,
          fontColor: this.textFontColor,
          fontWeight: this.textFontWeight
        }
      });
      hilog.info(0x0000, 'TEST', `✓ 文本样式已更新: ${this.textFontSize}px`);

      // 3. 删除从第一个文本段之后的所有内容，然后重新添加
      hilog.info(0x0000, 'TEST', '=== 开始删除重建ImageSpan和SymbolSpan ===');
      
      // 删除从位置17（第一段文本结束）到末尾的所有内容
      this.controller.deleteSpans({ start: 17, end: -1 });
      hilog.info(0x0000, 'TEST', '✓ 已删除旧的ImageSpan、SymbolSpan和后续文本');

      // 4. 重新添加ImageSpan（使用@State中的新值）
      this.imageSpanStart = 17;
      this.controller.addImageSpan($r('sys.media.ohos_app_icon'), {
        imageStyle: {
          size: [this.imageSize, this.imageSize],
          layoutStyle: {
            borderRadius: this.imageBorderRadius,
            margin: this.imageMargin
          }
        }
      });
      hilog.info(0x0000, 'TEST', `✓ 重新添加ImageSpan: size=${this.imageSize}x${this.imageSize}`);

      // 5. 重新添加SymbolSpan（使用@State中的新值）
      this.symbolSpanStart = 18;
      this.controller.addSymbolSpan($r('sys.symbol.ohos_wifi'), {
        style: {
          fontSize: this.symbolFontSize,
          fontColor: [this.symbolFontColor],
          renderingStrategy: SymbolRenderingStrategy.SINGLE
        }
      });
      hilog.info(0x0000, 'TEST', `✓ 重新添加SymbolSpan: fontSize=${this.symbolFontSize}px`);

      // 6. 重新添加后续文本
      this.controller.addTextSpan('\n点击产生光标后改变样式', {
        style: {
          fontSize: 16,
          fontColor: Color.Black
        }
      });
      hilog.info(0x0000, 'TEST', '✓ 重新添加后续文本');

      // 7. 验证更新结果
      let afterSpans = this.controller.getSpans({ start: 0, end: -1 });
      hilog.info(0x0000, 'TEST', `=== 重建完成，总Span数: ${afterSpans.length} ===`);
      for (let i = 0; i < afterSpans.length; i++) {
        let span = afterSpans[i];
        let imageSpan = span as RichEditorImageSpanResult;
        if (imageSpan.imageStyle !== undefined) {
          let actualSize = imageSpan.imageStyle.size ? imageSpan.imageStyle.size[0] : 'undefined';
          hilog.info(0x0000, 'TEST', `验证ImageSpan: size=${actualSize}, 位置=[${span.offsetInSpan[0]}, ${span.offsetInSpan[1]}]`);
        }
      }

      // 8. 获取光标位置并显示
      let caretRect = this.controller.getCaretRect();
      if (caretRect) {
        hilog.info(0x0000, 'TEST', `改变所有样式后光标位置: x=${caretRect.x}, y=${caretRect.y}`);

        // 显示光标位置信息
        this.infoController.deleteSpans({ start: 0, end: -1 });
        this.infoController.addTextSpan(
          `样式已更新:\n文本:${this.textFontSize}px\n图片:${this.imageSize}x${this.imageSize} 圆角${this.imageBorderRadius}\n符号:${this.symbolFontSize}px\n光标: x=${caretRect.x}, y=${caretRect.y}`,
          {
            style: {
              fontSize: 12,
              fontColor: Color.Orange
            }
          }
        );
      }
    } catch (err) {
      hilog.error(0x0000, 'TEST', `改变样式失败: ${JSON.stringify(err)}`);
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
    Column({ space: 10 }) {
      Text('光标闪烁时改变图文样式信息')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 10 })

      Button('改变所有样式')
        .id('button_cursor_position_0001_change_style')
        .fontSize(14)
        .width('60%')
        .alignSelf(ItemAlign.Center)
        .margin({ bottom: 10 })
        .onClick(() => {
          this.changeAllStyles();
        })

      Text('光标位置信息')
        .fontSize(13)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      RichEditor(this.infoOptions)
        .id('rich_editor_cursor_position_0001_info')
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
        .id('rich_editor_cursor_position_0001')
        .width('100%')
        .height(150)
        .backgroundColor(Color.White)
        .border({ width: 2, color: Color.Blue })
        .borderRadius(8)
        .padding(8)
        .onReady(() => {
          // 添加文本（0-16，共17个字符包含换行符）
          this.controller.addTextSpan('这是初始文本内容，可以改变样式\n', {
            style: {
              fontSize: this.textFontSize,
              fontColor: this.textFontColor,
              fontWeight: this.textFontWeight
            }
          });

          // 添加图片（位置17）
          this.imageSpanStart = 17;
          this.controller.addImageSpan($r('sys.media.ohos_app_icon'), {
            imageStyle: {
              // size: [this.imageSize, this.imageSize],
              size: [this.imageSize, this.imageSize],
              layoutStyle: {
                borderRadius: this.imageBorderRadius,
                margin: this.imageMargin
              }
            }
          });
          hilog.info(0x0000, 'TEST', `ImageSpan添加在位置: ${this.imageSpanStart}`);

          // 添加符号（位置18）
          this.symbolSpanStart = 18;
          this.controller.addSymbolSpan($r('sys.symbol.ohos_wifi'), {
            style: {
              fontSize: this.symbolFontSize,
              fontColor: [this.symbolFontColor]
            }
          });
          hilog.info(0x0000, 'TEST', `SymbolSpan添加在位置: ${this.symbolSpanStart}`);

          // 添加更多文本（位置19开始）
          this.controller.addTextSpan('\n点击产生光标后改变样式', {
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

