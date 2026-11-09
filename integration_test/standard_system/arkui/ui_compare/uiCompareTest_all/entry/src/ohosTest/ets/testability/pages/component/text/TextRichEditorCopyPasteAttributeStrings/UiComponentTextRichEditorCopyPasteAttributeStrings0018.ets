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
import { LengthMetrics } from '@kit.ArkUI';

@Entry
@Component
struct UiComponentTextRichEditorCopyPasteAttributeStrings0018 {
  controllerA: RichEditorController = new RichEditorController();
  optionsA: RichEditorOptions = { controller: this.controllerA };
  controllerB: RichEditorController = new RichEditorController();
  optionsB: RichEditorOptions = { controller: this.controllerB };

  build() {
    Column({ space: 10 }) {
      Text('属性字符串设置IMAGE时拖拽')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 10 })

      Text('组件A（含图片）')
        .fontSize(13)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      RichEditor(this.optionsA)
        .id('rich_editor_copy_paste_attribute_strings_0018_source')
        .width('100%')
        .height(150)
        .backgroundColor(Color.White)
        .border({ width: 2, color: Color.Blue })
        .borderRadius(8)
        .padding(8)
        .draggable(true)
        .onReady(() => {
          this.controllerA.addTextSpan('组件A文本内容\n', {
            style: {
              fontSize: 30,
              fontColor: Color.Red
            }
          });
          this.controllerA.addImageSpan($r('sys.media.ohos_app_icon'), {
            imageStyle: {
              size: [200, 50]
            }
          });
          this.controllerA.addTextSpan('\n更多文本内容', {
            style: {
              fontSize: 30,
              fontColor: Color.Red
            }
          });
        })
        .margin({ bottom: 15 })

      Text('组件B（含图片）')
        .fontSize(13)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      RichEditor(this.optionsB)
        .id('rich_editor_copy_paste_attribute_strings_0018_target')
        .width('100%')
        .height(150)
        .backgroundColor(Color.White)
        .border({ width: 2, color: Color.Red })
        .borderRadius(8)
        .padding(8)
        .draggable(true)
        .onReady(() => {
          this.controllerB.addTextSpan('组件B初始内容\n', {
            style: {
              fontSize: 16,
              fontColor: Color.Blue
            }
          });
          this.controllerB.addImageSpan($r('sys.media.ohos_app_icon'), {
            imageStyle: {
              size: [40, 40]
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
