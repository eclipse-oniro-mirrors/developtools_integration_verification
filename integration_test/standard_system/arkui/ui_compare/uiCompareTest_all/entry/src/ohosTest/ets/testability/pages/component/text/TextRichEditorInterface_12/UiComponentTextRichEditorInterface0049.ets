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
struct UiComponentTextRichEditorInterface0049 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };

  build() {
    Column() {
      Text('连续调用addTextSpan和deleteSpans')
        .fontSize(14)
        .margin(10)

      RichEditor(this.options)
        .id('richEditor0049')
        .width('100%')
        .height(150)
        .border({ width: 1, color: Color.Gray })
        .margin(10)
      
      Row() {
        Button('添加文本')
          .id('addTextBtn0049')
          .width('45%')
          .height(40)
          .margin(5)
          .onClick(() => {
            this.controller.addTextSpan('测试文本内容', {
              style: {
                fontSize: 16
              }
            })
          })
        
        Button('删除内容')
          .id('deleteBtn0049')
          .width('45%')
          .height(40)
          .margin(5)
          .onClick(() => {
            const allSpans = this.controller.getSpans({ start: -1, end: -1 })
            if (allSpans.length > 0) {
              this.controller.deleteSpans({ start: 0, end: 6 })
            }
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}
