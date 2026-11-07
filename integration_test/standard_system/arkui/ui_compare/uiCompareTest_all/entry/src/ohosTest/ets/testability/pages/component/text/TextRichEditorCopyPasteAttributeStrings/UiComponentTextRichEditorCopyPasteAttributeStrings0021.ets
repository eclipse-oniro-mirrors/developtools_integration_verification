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
struct UiComponentTextRichEditorCopyPasteAttributeStrings0021 {
  controllerA: RichEditorController = new RichEditorController();
  optionsA: RichEditorOptions = { controller: this.controllerA };
  controllerB: RichEditorController = new RichEditorController();
  optionsB: RichEditorOptions = { controller: this.controllerB };

  build() {
    Column({ space: 10 }) {
      Text('属性字符串图文混排拖拽')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 10 })

      Text('组件A（图文混排内容）')
        .fontSize(13)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      RichEditor(this.optionsA)
        .id('rich_editor_copy_paste_attribute_strings_0021_source')
        .width('100%')
        .height(180)
        .backgroundColor(Color.White)
        .border({ width: 2, color: Color.Blue })
        .borderRadius(8)
        .padding(8)
        .draggable(true)
        .onReady(() => {
          this.controllerA.addTextSpan('文本开始 ', {
            style: {
              fontSize: 18,
              fontColor: Color.Red
            }
          });
          this.controllerA.addImageSpan($r('sys.media.ohos_app_icon'), {
            imageStyle: {
              size: [40, 40]
            }
          });
          this.controllerA.addTextSpan(' 中间文本 ', {
            style: {
              fontSize: 16,
              fontColor: Color.Orange
            }
          });
          this.controllerA.addImageSpan($r('sys.media.ohos_app_icon'), {
            imageStyle: {
              size: [50, 50]
            }
          });
          this.controllerA.addTextSpan(' 文本结束', {
            style: {
              fontSize: 18,
              fontColor: Color.Red,
              fontWeight: FontWeight.Bold
            }
          });
        })
        .margin({ bottom: 15 })

      Text('组件B（目标组件）')
        .fontSize(13)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      RichEditor(this.optionsB)
        .id('rich_editor_copy_paste_attribute_strings_0021_target')
        .width('100%')
        .height(150)
        .backgroundColor(Color.White)
        .border({ width: 2, color: Color.Red })
        .borderRadius(8)
        .padding(8)
        .draggable(true)
    }
    .width('100%')
    .height('100%')
    .padding(15)
    .backgroundColor('#F6F7F9')
  }
}
