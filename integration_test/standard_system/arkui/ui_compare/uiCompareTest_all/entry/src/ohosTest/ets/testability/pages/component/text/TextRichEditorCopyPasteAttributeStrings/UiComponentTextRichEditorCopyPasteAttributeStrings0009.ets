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
struct UiComponentTextRichEditorCopyPasteAttributeStrings0009 {
  controllerA: RichEditorController = new RichEditorController();
  optionsA: RichEditorOptions = { controller: this.controllerA };
  controllerB: RichEditorController = new RichEditorController();
  optionsB: RichEditorOptions = { controller: this.controllerB };

  build() {
    Column({ space: 10 }) {
      Text('两个非属性字符串组件之间互相拖拽')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 10 })

      Text('组件A（从此处拖拽）')
        .fontSize(13)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      RichEditor(this.optionsA)
        .id('rich_editor_copy_paste_attribute_strings_0009_source')
        .width('100%')
        .height(120)
        .backgroundColor(Color.White)
        .border({ width: 2, color: Color.Blue })
        .borderRadius(8)
        .padding(8)
        .draggable(true)
        .onReady(() => {
          this.controllerA.addTextSpan('===== 组件A的拖拽内容 =====\n===== 组件A的拖拽内容 =====', {
            style: {
              fontSize: 30,
              fontColor: Color.Red
            }
          });
        })
        .margin({ bottom: 15 })

      Text('组件B（拖拽到此处）')
        .fontSize(13)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      RichEditor(this.optionsB)
        .id('rich_editor_copy_paste_attribute_strings_0009_target')
        .width('100%')
        .height(120)
        .backgroundColor(Color.White)
        .border({ width: 2, color: Color.Red })
        .borderRadius(8)
        .padding(8)
        .draggable(true)
        .onReady(() => {
          this.controllerB.addTextSpan('===== 组件B的初始内容 =====\n===== 组件B的初始内容 =====', {
            style: {
              fontSize: 30,
              fontColor: Color.Blue
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
