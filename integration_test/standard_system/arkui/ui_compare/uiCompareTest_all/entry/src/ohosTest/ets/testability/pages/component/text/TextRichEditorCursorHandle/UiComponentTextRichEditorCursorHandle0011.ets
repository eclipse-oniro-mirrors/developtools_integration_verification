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
struct UiComponentTextRichEditorCursorHandle0011 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };

  build() {
    Column({ space: 15 }) {
      Text('空白行双击无选中效果')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      RichEditor(this.options)
        .id('rich_editor_cursor_handle_0011')
        .width('90%')
        .height(400)
        .border({ width: 1, color: Color.Gray })
        .backgroundColor(Color.White)
        .onReady(() => {
          this.controller.addTextSpan('这是第一行文本\n', {
            style: {
              fontColor: Color.Black,
              fontSize: 16
            }
          });
          for (let i = 0; i < 15; i++) {
            this.controller.addTextSpan('\n', {
              style: {
                fontColor: Color.Black,
                fontSize: 16
              }
            });
          }
          this.controller.addTextSpan('这是最后一行文本', {
            style: {
              fontColor: Color.Black,
              fontSize: 16
            }
          });
        })
    }
    .width('100%')
    .height('100%')
    .padding(10)
    .backgroundColor('#F5F5F5')
  }
}

