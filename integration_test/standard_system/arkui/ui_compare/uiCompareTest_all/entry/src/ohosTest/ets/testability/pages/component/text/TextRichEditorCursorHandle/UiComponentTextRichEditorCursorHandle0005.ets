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
struct UiComponentTextRichEditorCursorHandle0005 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  @State editorHeight: number = 300;
  @State editorPadding: number = 10;
  @State editorMargin: number = 5;
  @State editorAlign: Alignment = Alignment.TopStart;
  @State currentFontSize: number = 16;

  build() {
    Column({ space: 10 }) {
      Text('测试0005：内容区跟随光标滚动')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10 })

      Text(`当前状态 - 高度:${this.editorHeight} padding:${this.editorPadding} margin:${this.editorMargin} 字体:${this.currentFontSize}`)
        .fontSize(12)
        .fontColor(Color.Blue)

      // 操作按钮
      Row({ space: 10 }) {
        Button('改变样式')
          .id('btn_change_0005')
          .onClick(() => {
            // 一次性改变padding、align、margin
            this.editorPadding = this.editorPadding === 10 ? 30 : 10;
            this.editorMargin = this.editorMargin === 5 ? 20 : 5;
            this.editorAlign = this.editorAlign === Alignment.TopStart ? Alignment.Center : Alignment.TopStart;
            this.currentFontSize = this.currentFontSize === 16 ? 20 : 16;
            this.controller.updateSpanStyle({
              start: 0,
              end: -1,
              textStyle: {
                fontSize: this.currentFontSize
              }
            });
          })

      
      }

      // RichEditor组件
      RichEditor(this.options)
        .id('rich_editor_cursor_handle_0005')
        .width('90%')
        .height(this.editorHeight)
        .padding(this.editorPadding)
        .margin(this.editorMargin)
        .align(this.editorAlign)
        .border({ width: 1, color: Color.Gray })
        .backgroundColor(Color.White)
        .onReady(() => {
          // 添加大量内容以触发翻页（30行）
          for (let i = 0; i < 30; i++) {
            this.controller.addTextSpan(`第${i + 1}行：这是用于测试滚动的文本内容，需要足够长才能触发换行和滚动效果。\n`, {
              style: {
                fontColor: Color.Black,
                fontSize: this.currentFontSize
              }
            });
          }
        })

      Text('说明：动态改变布局并拖动光标，观察内容区是否跟随滚动保持光标底部可见')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ top: 5 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}

