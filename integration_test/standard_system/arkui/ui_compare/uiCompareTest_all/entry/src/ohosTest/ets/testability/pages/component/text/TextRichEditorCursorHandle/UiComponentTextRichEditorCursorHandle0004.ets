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
struct UiComponentTextRichEditorCursorHandle0004 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };

  build() {
    Column({ space: 10 }) {
      Text('测试0004：自动断行处光标跟手')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10 })

      Text('说明：在自动断行位置左右拖动光标，观察光标是否跟手')
        .fontSize(14)
        .fontColor(Color.Gray)

      // RichEditor组件 - 宽度较窄以产生自动断行
      RichEditor(this.options)
        .id('rich_editor_cursor_handle_0004')
        .width(200)  // 设置较窄宽度以触发自动断行
        .height(400)
        .border({ width: 1, color: Color.Gray })
        .backgroundColor(Color.White)
        .onReady(() => {
          // 添加长文本，触发自动断行
          this.controller.addTextSpan('这是一段很长的测试文本用于触发自动断行效果。', {
            style: {
              fontColor: Color.Black,
              fontSize: 16
            }
          });
          this.controller.addTextSpan('请在断行位置附近拖动光标，验证光标能够平滑跟手移动。', {
            style: {
              fontColor: Color.Black,
              fontSize: 16
            }
          });
          this.controller.addTextSpan('断行处理应该保持光标位置准确，不发生跳动或错位。', {
            style: {
              fontColor: Color.Black,
              fontSize: 16
            }
          });
        })

      Text('提示：长按并拖动文本区域，观察光标在自动断行处的跟手效果')
        .fontSize(12)
        .fontColor(Color.Red)
        .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}

