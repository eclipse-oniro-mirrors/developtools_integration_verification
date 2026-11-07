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
struct UiComponentTextRichEditorLongPress006 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  @State leftMargin: number = 0;
  private readonly Indentation = 40;

  build() {
    Column() {
      Text('预览态下长按存在缩进的文本内容的行首')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 16 })

      RichEditor(this.options)
        .onReady(() => {
          // 添加多行文本用于测试缩进效果
          this.controller.addTextSpan('第一行：用于测试的缩进文本\n第二行：更多测试内容\n第三行：长按测试文本', {
            style: {
              fontSize: 30,
              fontColor: Color.Black
            }
          })
          this.controller.addImageSpan($r('sys.media.ohos_app_icon'), {
            imageStyle: {
              size: ['60px', '60px']
            }
          })
          this.controller.addTextSpan('更多用于测试的缩进文本=====', {
            style: {
              fontSize: 30,
              fontColor: Color.Blue
            }
          })
        })
        .id('rich_editor_longpress_006')
        .width('100%')
        .height(200)
        .backgroundColor(Color.White)
        .border({ width: 1, color: Color.Blue })
        .borderRadius(8)
        .padding(8)
        .margin({ bottom: 12 })

      Button('增加两格缩进')
        .id('increase_indent_btn_006')
        .width('100%')
        .height(40)
        .backgroundColor('#4CAF50')
        .onClick(() => {
          this.leftMargin += this.Indentation * 2; // 增加两格缩进
          this.updateParagraphIndent();
        })
        .margin({ bottom: 8 })
    }
    .width('100%').height('100%').padding(16).backgroundColor('#F6F7F9')
  }

  private updateParagraphIndent() {
    this.controller.updateParagraphStyle({
      start: -1,
      end: -1,
      style: {
        leadingMargin: this.leftMargin
      }
    })
  }
}
