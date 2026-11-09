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
struct UiComponentTextRichEditorCursorHandle0008 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  @State isSelected: boolean = false;

  build() {
    Column({ space: 15 }) {
      Text('调用updateSpanStyle保持菜单显示')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      RichEditor(this.options)
        .id('rich_editor_cursor_handle_0008')
        .width('90%')
        .height(350)
        .border({ width: 1, color: Color.Gray })
        .backgroundColor(Color.White)
        .onSelect((value: RichEditorSelection) => {
          // 监听选中事件，控制按钮状态
          if (value.selection[0] !== value.selection[1]) {
            this.isSelected = true;
          } else {
            this.isSelected = false;
          }
        })
        .onReady(() => {
          this.controller.addTextSpan('这是用于测试的文本内容。请选中任意文本，然后点击下方按钮调用updateSpanStyle接口。', {
            style: {
              fontColor: Color.Black,
              fontSize: 16
            }
          });
          this.controller.addTextSpan('观察编辑菜单是否保持显示不关闭，这是测试的关键点。', {
            style: {
              fontColor: Color.Black,
              fontSize: 16
            }
          });
        })

      Button('调用updateSpanStyle')
        .id('btn_update_span_style_0008')
        .enabled(this.isSelected)
        .type(ButtonType.Normal)
        .borderRadius(8)
        .width(180)
        .height(40)
        .margin({ top: 10 })
        .onClick(() => {
          // 调用updateSpanStyle改变选中文本的样式
          this.controller.updateSpanStyle({
            start: -1,
            end: -1,
            textStyle: {
              fontColor: Color.Red,
              fontWeight: FontWeight.Bold
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

