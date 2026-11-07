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
struct UiComponentTextRichEditorCopyPasteAttributeStrings0012 {
  controllerA: RichEditorStyledStringController = new RichEditorStyledStringController();
  optionsA: RichEditorStyledStringOptions = { controller: this.controllerA };
  controllerB: RichEditorStyledStringController = new RichEditorStyledStringController();
  optionsB: RichEditorStyledStringOptions = { controller: this.controllerB };

  // 文本样式A：红色 + 加粗 + 24号字体
  textStyleA: TextStyle = new TextStyle({
    fontColor: Color.Red,
    fontSize: LengthMetrics.vp(24),
    fontWeight: FontWeight.Bold
  });

  // 文本样式B：蓝色 + 斜体 + 20号字体
  textStyleB: TextStyle = new TextStyle({
    fontColor: Color.Blue,
    fontSize: LengthMetrics.vp(20),
    fontStyle: FontStyle.Italic
  });

  mutableStyledStringA: MutableStyledString = new MutableStyledString(
    '组件A文本样式测试内容\n组件A文本样式测试内容\n',
    [{
      start: 0,
      length: 23,
      styledKey: StyledStringKey.FONT,
      styledValue: this.textStyleA
    }]
  );

  mutableStyledStringB: MutableStyledString = new MutableStyledString(
    '组件B文本样式测试内容\n组件B文本样式测试内容\n',
    [{
      start: 0,
      length: 23,
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
      Text('属性字符串设置文本样式时拖拽')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 10 })

      Text('组件A（红色+加粗+24号字体）')
        .fontSize(13)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      RichEditor(this.optionsA)
        .id('rich_editor_copy_paste_attribute_strings_0012_source')
        .width('100%')
        .height(120)
        .backgroundColor(Color.White)
        .border({ width: 2, color: Color.Blue })
        .borderRadius(8)
        .padding(8)
        .draggable(true)
        .margin({ bottom: 15 })

      Text('组件B（蓝色+斜体+20号字体）')
        .fontSize(13)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      RichEditor(this.optionsB)
        .id('rich_editor_copy_paste_attribute_strings_0012_target')
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
