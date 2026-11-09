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
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct UiComponentTextRichEditorCopyPasteAttributeStrings0007 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };

  build() {
    Column() {
      Text('单个非属性字符串组件内拖拽')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      RichEditor(this.options)
        .id('rich_editor_copy_paste_attribute_strings_0007')
        .width('90%')
        .height(250)
        .backgroundColor(Color.White)
        .border({ width: 2, color: Color.Blue })
        .borderRadius(8)
        .padding(10)
        .draggable(true)
        .onReady(() => {
          this.controller.addTextSpan(
            '===== 拖拽测试内容 =====\n'+
            '===== 拖拽对照内容 =====\n', {
            style: {
              fontSize: 20,
              fontColor: Color.Green
            }
          });
        })

        .onDragStart((event: DragEvent) => {
          hilog.info(0x0000, 'TEST', '开始拖拽非属性字符串内容');
        })
        .onDrop((event: DragEvent) => {
          hilog.info(0x0000, 'TEST', '非属性字符串拖拽完成');
        })

      Button('选择第一段文本')
        .id('btn_copy_paste_attribute_strings_0007_select_first')
        .onClick(() => {
          this.controller.setSelection(0, 31);
        })
        .margin({ top: 10 })
        .width('100%')
        .height(40)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F6F7F9')
  }
}
