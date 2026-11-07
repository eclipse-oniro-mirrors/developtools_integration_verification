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
struct UiComponentTextRichEditorCursorPosition0014 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  infoController: RichEditorController = new RichEditorController();
  infoOptions: RichEditorOptions = { controller: this.infoController };

  @State testCount: number = 0;

  aboutToAppear(): void {
    this.infoController.addTextSpan('点击按钮随机改变光标位置并验证', {
      style: {
        fontSize: 14,
        fontColor: Color.Gray
      }
    });
  }

  // 随机改变光标位置
  randomChangeCaretPosition() {
    try {
      this.testCount++;
      // 生成随机位置（0-50之间）
      let randomIndex = Math.floor(Math.random() * 50);
      this.controller.setSelection(randomIndex, randomIndex);

      // 获取光标位置
      let caretRect = this.controller.getCaretRect();
      if (caretRect) {
        hilog.info(0x0000, 'TEST', `第${this.testCount}次随机光标位置: x=${caretRect.x}, y=${caretRect.y}`);

        // 显示光标位置信息
        this.infoController.deleteSpans({ start: 0, end: -1 });
        this.infoController.addTextSpan(
          `第${this.testCount}次验证:\n设置index=${randomIndex}\nx=${caretRect.x}, y=${caretRect.y}`,
          {
            style: {
              fontSize: 14,
              fontColor: Color.Blue
            }
          }
        );
      }
    } catch (err) {
      hilog.error(0x0000, 'TEST', '改变光标失败');
    }
  }

  build() {
    Column({ space: 10 }) {
      Text('随机改变光标位置验证')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 10 })

      Text(`已验证 ${this.testCount} 次`)
        .fontSize(14)
        .fontColor(Color.Orange)

      Button('随机改变光标位置')
        .id('button_cursor_position_0014_random_caret')
        .width('90%')
        .onClick(() => {
          this.randomChangeCaretPosition();
        })
        .margin({ bottom: 10 })

      Text('光标位置信息')
        .fontSize(13)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      RichEditor(this.infoOptions)
        .id('rich_editor_cursor_position_0014_info')
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
        .id('rich_editor_cursor_position_0014')
        .width('100%')
        .height(150)
        .backgroundColor(Color.White)
        .border({ width: 2, color: Color.Blue })
        .borderRadius(8)
        .padding(8)
        .onReady(() => {
          this.controller.addTextSpan(
            '这是用于随机测试的长文本内容\n' +
            '第二行内容用于测试\n' +
            '第三行也是测试内容\n' +
            '继续添加更多内容用于随机定位',
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

