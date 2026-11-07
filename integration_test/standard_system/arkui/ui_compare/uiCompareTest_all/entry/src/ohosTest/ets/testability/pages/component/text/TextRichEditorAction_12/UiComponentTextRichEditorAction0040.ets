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
struct UiComponentTextRichEditorAction0040 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };

  build() {
    Column({ space: 10 }) {
      Text('双手柄位置互换')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 10 })

      RichEditor(this.options)
        .id('rich_editor_action_0040')
        .width('100%')
        .height(200)
        .backgroundColor(Color.White)
        .border({ width: 2, color: Color.Blue })
        .borderRadius(8)
        .padding(8)
        .onReady(() => {
          this.controller.addTextSpan(
            '==========双手柄位置互换==========\n'+
            '==========双手柄位置互换==========\n'+
            '==========双手柄位置互换==========\n'+
            '==========双手柄位置互换==========\n'+
            '==========双手柄位置互换==========\n'+
            '==========双手柄位置互换==========',{
              style: {
                fontSize: 16,
                fontColor: Color.Black
              }
            });
        })
    }
    .width('100%')
    .height('100%')
    .padding(15)
    .backgroundColor('#F6F7F9')
  }
}

