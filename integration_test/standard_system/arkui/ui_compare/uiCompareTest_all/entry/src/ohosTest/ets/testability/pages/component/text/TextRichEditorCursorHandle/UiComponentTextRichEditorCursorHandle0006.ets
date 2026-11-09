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
struct UiComponentTextRichEditorCursorHandle0006 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };

  build() {
    Column({ space: 10 }) {
      Text('测试0006：单击行尾文本下方非空白行的空白区域')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10 })

      Text('说明：单击短行文本下方的空白区域')
        .fontSize(14)
        .fontColor(Color.Gray)

      RichEditor(this.options)
        .id('rich_editor_cursor_handle_0006')
        .width('90%')
        .height(300)
        .border({ width: 1, color: Color.Gray })
        .backgroundColor(Color.White)
        .onReady(() => {
          this.controller.addTextSpan('这是一段测试文本', {
            style: {
              fontColor: Color.Black,
              fontSize: 16
            }
          });
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}

