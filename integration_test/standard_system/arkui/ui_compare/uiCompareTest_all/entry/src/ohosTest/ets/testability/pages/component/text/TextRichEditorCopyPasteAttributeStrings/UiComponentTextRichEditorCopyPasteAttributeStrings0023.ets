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
struct UiComponentTextRichEditorCopyPasteAttributeStrings0023 {
  controllerA: RichEditorStyledStringController = new RichEditorStyledStringController();
  optionsA: RichEditorStyledStringOptions = { controller: this.controllerA };
  controllerB: RichEditorStyledStringController = new RichEditorStyledStringController();
  optionsB: RichEditorStyledStringOptions = { controller: this.controllerB };
  textStyleA: TextStyle = new TextStyle({
    fontColor: Color.Red,
    fontSize: LengthMetrics.vp(18)
  });
  // 包含换行符的内容
  mutableStyledStringA: MutableStyledString = new MutableStyledString(
    '\n   \n======== 正常输入内容第三行 ========\n======== 更多内容第四行 ========',
    [{
      start: 0,
      length: 28,
      styledKey: StyledStringKey.FONT,
      styledValue: this.textStyleA
    }]
  );
  aboutToAppear(): void {
    this.controllerA.setStyledString(this.mutableStyledStringA);
  }

  build() {
    Column({ space: 10 }) {
      Text('包含换行符内容的拖拽/粘贴')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 10 })

      Text('组件A（首行空行+第二行只有空格）')
        .fontSize(13)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      RichEditor(this.optionsA)
        .id('rich_editor_copy_paste_attribute_strings_0023_source')
        .width('100%')
        .height(150)
        .backgroundColor(Color.White)
        .border({ width: 2, color: Color.Blue })
        .borderRadius(8)
        .padding(8)
        .draggable(true)
        .margin({ bottom: 15 })

      Text('组件B（目标组件）')
        .fontSize(13)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      RichEditor(this.optionsB)
        .id('rich_editor_copy_paste_attribute_strings_0023_target')
        .width('100%')
        .height(120)
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
