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
struct UiComponentTextRichEditorCursorHandle0002 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  scroller: Scroller = new Scroller();

  build() {
    Column({ space: 10 }) {
      Text('测试0002：鼠标拖动滚动条后，回到文本编辑区')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10 })

      Text('操作说明：设备外接鼠标，鼠标上下拖动滚动条，再回到文本编辑区，多次重复操作')
        .fontSize(14)
        .fontColor(Color.Gray)
        .margin({ bottom: 10 })

      // 使用Scroll组件包裹RichEditor以自定义滚动条样式
      Scroll(this.scroller) {
        RichEditor(this.options)
          .id('rich_editor_cursor_handle_0002')
          .width('100%')
          .border({ width: 1, color: Color.Gray })
          .backgroundColor(Color.White)
          .onReady(() => {
            // 添加大量文本内容以显示滚动条
            for (let i = 0; i < 30; i++) {
              this.controller.addTextSpan('这是测试文本内容，用于测试滚动条功能\n', {
                style: {
                  fontColor: Color.Black,
                  fontSize: 16
                }
              });
              
            }
          })
      }
      .width('90%')
      .height('24.59%')
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.On)
      .scrollBarColor('#999999')
      .scrollBarWidth(16)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}

