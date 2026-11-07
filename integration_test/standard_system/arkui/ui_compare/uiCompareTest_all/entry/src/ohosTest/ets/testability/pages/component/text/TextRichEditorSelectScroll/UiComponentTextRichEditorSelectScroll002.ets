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
struct UiComponentTextRichEditorSelectScroll002 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };

  build() {
    Column() {
      // 1.测试组件
      RichEditor(this.options)
        .id('rich_editor_selectscroll_002')
        .width('100%')
        .height(200)
        .border({ width: 1, color: Color.Gray })
        .borderRadius(8)
        .onReady(() => {
          for (let i = 0; i < 30; i++) {
            // 添加测试图片
            this.controller.addImageSpan($r('sys.media.ohos_app_icon'), {
              imageStyle: {
                size: ['50px', '50px']
              }
            })
            // 添加测试文字
            this.controller.addTextSpan('=============== 滚动测试' + i + ' ===============\n', {
              style: {
                fontSize: 16
              }
            })

          }
        })
      // 2.部分选择按钮
      Button('选中图文')
        .id('btn_selectscroll_002_selectAll')
        .onClick(() => {
          this.controller.setSelection(0, 100)
        })
        .margin(10)
        .width('100%')
        .height(40)
    }
    .width('100%')
    .height('100%')
    .padding(16)
    .backgroundColor('#F6F7F9')
  }
}

