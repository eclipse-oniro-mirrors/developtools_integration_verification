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
struct UiComponentTextRichEditorCopyPasteAttributeStrings0020 {
  // 老框架：使用RichEditorController
  controllerOld: RichEditorController = new RichEditorController();
  optionsOld: RichEditorOptions = { controller: this.controllerOld };
  // 新框架：使用RichEditorStyledStringController
  controllerNew: RichEditorStyledStringController = new RichEditorStyledStringController();
  optionsNew: RichEditorStyledStringOptions = { controller: this.controllerNew };

  aboutToAppear(): void {
    let mutableStyledString = new MutableStyledString('新框架组件A初始内容');
    this.controllerNew.setStyledString(mutableStyledString);
  }

  build() {
    Column({ space: 10 }) {
      Text('老框架Symbol向新框架拖拽测试')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 10 })

      Text('组件A（新框架-属性字符串）')
        .fontSize(13)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      RichEditor(this.optionsNew)
        .id('rich_editor_copy_paste_attribute_strings_0020_target')
        .width('100%')
        .height(100)
        .backgroundColor(Color.White)
        .border({ width: 2, color: Color.Blue })
        .borderRadius(8)
        .padding(8)
        .draggable(true)
        .margin({ bottom: 15 })

      Text('组件B（老框架-含Symbol）')
        .fontSize(13)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      RichEditor(this.optionsOld)
        .id('rich_editor_copy_paste_attribute_strings_0020_source')
        .width('100%')
        .height(120)
        .backgroundColor(Color.White)
        .border({ width: 2, color: Color.Red })
        .borderRadius(8)
        .padding(8)
        .draggable(true)
        .onReady(() => {
          // 添加两排symbol，每排5个
          for (let i = 0; i < 2; i++) {
            for (let j = 0; j < 10; j++) {
              this.controllerOld.addSymbolSpan($r('sys.symbol.basketball_fill'), {
                style: {
                  fontSize: 40
                }
              });
            }
            if (i < 1) {
              this.controllerOld.addTextSpan('\n');
            }
          }
        })
    }
    .width('100%')
    .height('100%')
    .padding(15)
    .backgroundColor('#F6F7F9')
  }
}
