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
struct UiComponentTextRichEditorCursorPosition0002 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  infoController: RichEditorController = new RichEditorController();
  infoOptions: RichEditorOptions = { controller: this.infoController };

  @State currentPadding: number = 8;
  @State currentMargin: number = 0;

  aboutToAppear(): void {
    this.infoController.addTextSpan('点击RichEditor产生光标，然后点击按钮改变布局', {
      style: {
        fontSize: 14,
        fontColor: Color.Gray
      }
    });
  }

  // 改变组件布局并获取光标位置
  changeLayout() {
    try {
      // 改变padding和margin
      this.currentPadding = this.currentPadding === 8 ? 20 : 8;
      this.currentMargin = this.currentMargin === 0 ? 10 : 0;

      // 获取光标位置
      let caretRect = this.controller.getCaretRect();
      if (caretRect) {
        hilog.info(0x0000, 'TEST', `光标位置: x=${caretRect.x}, y=${caretRect.y}`);

        // 显示光标位置信息
        this.infoController.deleteSpans({ start: 0, end: -1 });
        this.infoController.addTextSpan(
          `布局改变后光标位置:\nx=${caretRect.x}, y=${caretRect.y}\npadding=${this.currentPadding}, margin=${this.currentMargin}`,
          {
            style: {
              fontSize: 14,
              fontColor: Color.Blue
            }
          }
        );
      }
    } catch (err) {
      hilog.error(0x0000, 'TEST', '改变布局失败');
    }
  }

  build() {
    Column({ space: 10 }) {
      Text('光标闪烁时改变组件布局')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 10 })

      Button('改变组件布局并获取光标位置')
        .id('button_cursor_position_0002_change_layout')
        .width('90%')
        .onClick(() => {
          this.changeLayout();
        })
        .margin({ bottom: 10 })

      Text('光标位置信息')
        .fontSize(13)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      RichEditor(this.infoOptions)
        .id('rich_editor_cursor_position_0002_info')
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
        .id('rich_editor_cursor_position_0002')
        .width('100%')
        .height(150)
        .backgroundColor(Color.White)
        .border({ width: 2, color: Color.Blue })
        .borderRadius(8)
        .padding(this.currentPadding)
        .margin(this.currentMargin)
        .onReady(() => {
          this.controller.addTextSpan('这是测试文本内容\n点击任意位置产生光标\n然后点击按钮改变布局', {
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

