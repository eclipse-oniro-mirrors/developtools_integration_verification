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
struct UiComponentTextRichEditorLongPress0019 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };

  build() {
    Column() {
      Text('预览态下长按尺寸比较大的图片')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 16 })

      RichEditor(this.options)
        .onReady(() => {
          // 先输入文本内容，再输入尺寸为300vp的图片
          this.controller.addTextSpan('300vp图文长按测试', {
            style: {
              fontSize: 16,
              fontColor: Color.Black
            }
          })


          this.controller.addImageSpan($r('sys.media.ohos_app_icon'), {
            imageStyle: {
              size: ['300vp', '300vp']
            }
          })
        })
        .id('rich_editor_longpress_0019')
        .width('100%')
        .height(200)
        .backgroundColor(Color.White)
        .border({ width: 1, color: Color.Blue })
        .borderRadius(8)
        .padding(8)
        .margin({ bottom: 12 })
    }
    .width('100%').height('100%').padding(16).backgroundColor('#F6F7F9')
  }
}
