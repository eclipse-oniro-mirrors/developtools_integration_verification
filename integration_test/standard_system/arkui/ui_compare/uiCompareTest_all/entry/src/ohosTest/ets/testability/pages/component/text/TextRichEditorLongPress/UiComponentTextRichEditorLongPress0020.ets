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
struct UiComponentTextRichEditorLongPress0020 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };

  build() {
    Column() {
      Text('预览态下长按并拖动手柄选中松手后，长按选中内容浮起')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 16 })

      RichEditor(this.options)
        .onReady(() => {
          // 添加文本内容
          this.controller.addTextSpan(
            '这是测试文本内容，用于长按浮起测试' +
              '这是测试文本内容，用于长按浮起测试' +
              '这是测试文本内容，用于长按浮起测试' +
              '这是测试文本内容，用于长按浮起测试'
            , {
            style: {
              fontSize: 25,
              fontColor: Color.Black
            }
          })
        })
        .id('rich_editor_longpress_0020')
        .width('100%')
        .height(150)
        .backgroundColor(Color.White)
        .border({ width: 1, color: Color.Blue })
        .borderRadius(8)
        .padding(8)
        .margin({ bottom: 12 })
        .draggable(true)
    }
    .width('100%').height('100%').padding(16).backgroundColor('#F6F7F9')
  }
}
