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
struct UiComponentTextRichEditorCopyPasteAttributeStrings0025 {
  controllerA: RichEditorStyledStringController = new RichEditorStyledStringController();
  optionsA: RichEditorStyledStringOptions = { controller: this.controllerA };
  controllerB: RichEditorStyledStringController = new RichEditorStyledStringController();
  optionsB: RichEditorStyledStringOptions = { controller: this.controllerB };

  textStyleA: TextStyle = new TextStyle({
    fontColor: Color.Red,
    fontSize: LengthMetrics.vp(20),
    fontWeight: FontWeight.Bold
  });

  textStyleB: TextStyle = new TextStyle({
    fontColor: Color.Blue,
    fontSize: LengthMetrics.vp(18)
  });

  mutableStyledStringA: MutableStyledString = new MutableStyledString(
    '拖拽源内容：这是要拖拽的属性字符串',
    [{
      start: 0,
      length: 19,
      styledKey: StyledStringKey.FONT,
      styledValue: this.textStyleA
    }]
  );

  mutableStyledStringB: MutableStyledString = new MutableStyledString(
    '目标组件前置内容\n\n目标组件后置内容',
    [{
      start: 0,
      length: 20,
      styledKey: StyledStringKey.FONT,
      styledValue: this.textStyleB
    }]
  );

  aboutToAppear(): void {
    this.controllerA.setStyledString(this.mutableStyledStringA);
    this.controllerB.setStyledString(this.mutableStyledStringB);
  }

  build() {
    Column({ space: 10 }) {
      Text('拖拽属性字符串在光标处松手')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 10 })

      Text('组件A（拖拽源）')
        .fontSize(13)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      RichEditor(this.optionsA)
        .id('rich_editor_copy_paste_attribute_strings_0025_source')
        .width('100%')
        .height(100)
        .backgroundColor(Color.White)
        .border({ width: 2, color: Color.Blue })
        .borderRadius(8)
        .padding(8)
        .draggable(true)
        .margin({ bottom: 15 })

      Text('组件B（在中间位置松手）')
        .fontSize(13)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      RichEditor(this.optionsB)
        .id('rich_editor_copy_paste_attribute_strings_0025_target')
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
