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
struct UiComponentTextRichEditorLineHeightAndLetterSpacing0027 {
  // 创建RichEditor控制器
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };

  build() {
    Column() {
      Row() {
        Column() {
          RichEditor(this.options)
            .onReady(() => {
              // 设置PixelMap图片内容的缩进，图片大小为40，行高lineHeight值为20，字体大小为30
              this.controller.addImageSpan($r('sys.media.ohos_app_icon'), {
                imageStyle: {
                  size: ['40px', '40px']
                }
              })
              // 添加文本内容，设置行高和字体大小
              this.controller.addTextSpan('测试文本内容', {
                style: {
                  fontSize: 30,
                  lineHeight: 20
                }
              })
            })
            .id('rich_editor_lineheight_letterspacing_0027')
            .width('80%')
            .height(200)
            .margin({ top: 100 })
        }
      }
      .width('100%')
      .height('32.79%')
    }
  }


}
