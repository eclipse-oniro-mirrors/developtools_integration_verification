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
struct UiComponentTextRichEditorLongPress005 {
  controller_01: RichEditorController = new RichEditorController();
  options_01: RichEditorOptions = { controller: this.controller_01 };
  controller_02: RichEditorController = new RichEditorController();
  options_02: RichEditorOptions = { controller: this.controller_02 };

  build() {
    Column() {
      Text('预览态下长按高度大于组件高度的字体')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 16 })

      RichEditor(this.options_01)
        .onReady(() => {
          // 添加高度大于组件高度的字符
          this.controller_01.addTextSpan('字体高度超出测试1', {
            style: {
              fontSize: 80,
              fontColor: Color.Black
            }
          })
        })
        .id('rich_editor_longpress_005_01')
        .width('100%')
        .height(80)
        .backgroundColor(Color.White)
        .border({ width: 1, color: Color.Blue })
        .borderRadius(8)
        .padding(8)
        .margin({ bottom: 12 })

      RichEditor(this.options_02)
        .onReady(() => {
          // 添加高度大于组件高度的字符
          this.controller_02.addTextSpan('字体高度超出测试2', {
            style: {
              fontSize: 100,
              fontColor: Color.Black
            }
          })
        })
        .id('rich_editor_longpress_005_02')
        .width('100%')
        .height(80)
        .backgroundColor(Color.White)
        .border({ width: 1, color: Color.Red })
        .borderRadius(8)
        .padding(8)
        .margin({ bottom: 12 })

    }
    .width('100%')
    .height('100%')
    .padding(16)
    .backgroundColor('#F6F7F9')
  }
}
