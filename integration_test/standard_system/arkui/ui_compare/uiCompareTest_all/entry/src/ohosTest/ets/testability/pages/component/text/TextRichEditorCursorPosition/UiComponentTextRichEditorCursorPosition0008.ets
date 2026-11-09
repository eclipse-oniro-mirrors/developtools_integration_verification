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
struct UiComponentTextRichEditorCursorPosition0008 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  infoController: RichEditorController = new RichEditorController();
  infoOptions: RichEditorOptions = { controller: this.infoController };

  @State clickCount: number = 0;

  aboutToAppear(): void {
    this.infoController.addTextSpan('测试将在不同位置点击RichEditor，查看光标位置变化', {
      style: {
        fontSize: 14,
        fontColor: Color.Gray
      }
    });
  }

  // 获取并显示光标位置
  getCaretPosition() {
    try {
      this.clickCount++;
      let caretRect = this.controller.getCaretRect();
      if (caretRect) {
        hilog.info(0x0000, 'TEST', `第${this.clickCount}次点击光标位置: x=${caretRect.x}, y=${caretRect.y}`);

        this.infoController.deleteSpans({ start: 0, end: -1 });
        this.infoController.addTextSpan(
          `第${this.clickCount}次点击:\nx=${caretRect.x}, y=${caretRect.y}`,
          {
            style: {
              fontSize: 14,
              fontColor: Color.Blue
            }
          }
        );
      }
    } catch (err) {
      hilog.error(0x0000, 'TEST', `获取光标失败: ${err}`);
    }
  }

  build() {
    Column({ space: 10 }) {
      Text('多次触摸改变光标位置')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 10 })

      Button('获取光标位置')
        .id('button_cursor_position_0008_get_caret')
        .width('90%')
        .onClick(() => {
          this.getCaretPosition();
        })
        .margin({ bottom: 10 })

      Text('光标位置信息')
        .fontSize(13)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      RichEditor(this.infoOptions)
        .id('rich_editor_cursor_position_0008_info')
        .width('100%')
        .height(100)
        .backgroundColor('#F0F0F0')
        .border({ width: 1, color: Color.Gray })
        .borderRadius(8)
        .padding(8)
        .margin({ bottom: 10 })

      Text('RichEditor组件（测试将点击不同位置）')
        .fontSize(13)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      RichEditor(this.options)
        .id('rich_editor_cursor_position_0008')
        .width('100%')
        .height(200)
        .backgroundColor(Color.White)
        .border({ width: 2, color: Color.Blue })
        .borderRadius(8)
        .padding(8)
        .onReady(() => {
          this.controller.addTextSpan(
            '第一行：左上角区域\n' +
            '第二行：中间区域内容测试\n' +
            '第三行：右侧区域内容\n' +
            '第四行：底部区域测试内容\n' +
            '第五行：多次点击获取光标位置',
            {
              style: {
                fontSize: 16,
                fontColor: Color.Black
              }
            }
          );
        })
    }
    .width('100%')
    .height('100%')
    .padding(15)
    .backgroundColor('#F6F7F9')
  }
}

