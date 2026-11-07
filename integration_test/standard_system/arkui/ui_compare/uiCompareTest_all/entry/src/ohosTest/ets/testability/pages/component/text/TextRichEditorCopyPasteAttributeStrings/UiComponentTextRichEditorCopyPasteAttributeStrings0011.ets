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
struct UiComponentTextRichEditorCopyPasteAttributeStrings0011 {
  controllerA: RichEditorStyledStringController = new RichEditorStyledStringController();
  optionsA: RichEditorStyledStringOptions = { controller: this.controllerA };
  controllerB: RichEditorStyledStringController = new RichEditorStyledStringController();
  optionsB: RichEditorStyledStringOptions = { controller: this.controllerB };

  // 段落样式：居中对齐 + 段落间距
  paragraphStyleA: ParagraphStyle = new ParagraphStyle({
    textAlign: TextAlign.Center,
    paragraphSpacing: LengthMetrics.px(10)
  });

  // 段落样式：首行缩进
  paragraphStyleB: ParagraphStyle = new ParagraphStyle({
    textIndent: LengthMetrics.vp(15)
  });

  fontStyleA: TextStyle = new TextStyle({
    fontColor: Color.Red,
    fontSize: LengthMetrics.vp(20)
  });

  fontStyleB: TextStyle = new TextStyle({
    fontColor: Color.Blue,
    fontSize: LengthMetrics.vp(20)
  });

  mutableStyledStringA: MutableStyledString = new MutableStyledString(
    '组件A段落样式测试内容\n组件A段落样式测试内容\n',
    [
      {
        start: 0,
        length: 23,
        styledKey: StyledStringKey.PARAGRAPH_STYLE,
        styledValue: this.paragraphStyleA
      },
      {
        start: 0,
        length: 23,
        styledKey: StyledStringKey.FONT,
        styledValue: this.fontStyleA
      }
    ]
  );

  mutableStyledStringB: MutableStyledString = new MutableStyledString(
    '组件B段落样式测试内容\n组件B段落样式测试内容\n',
    [
      {
        start: 0,
        length: 23,
        styledKey: StyledStringKey.PARAGRAPH_STYLE,
        styledValue: this.paragraphStyleB
      },
      {
        start: 0,
        length: 23,
        styledKey: StyledStringKey.FONT,
        styledValue: this.fontStyleB
      }
    ]
  );

  aboutToAppear(): void {
    this.controllerA.setStyledString(this.mutableStyledStringA);
    this.controllerB.setStyledString(this.mutableStyledStringB);
  }

  build() {
    Column({ space: 10 }) {
      Text('属性字符串设置段落样式时拖拽')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 10 })

      Text('组件A（居中对齐+段落间距）')
        .fontSize(13)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      RichEditor(this.optionsA)
        .id('rich_editor_copy_paste_attribute_strings_0011_source')
        .width('100%')
        .height(120)
        .backgroundColor(Color.White)
        .border({ width: 2, color: Color.Blue })
        .borderRadius(8)
        .padding(8)
        .draggable(true)
        .margin({ bottom: 15 })

      Text('组件B（首行缩进）')
        .fontSize(13)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      RichEditor(this.optionsB)
        .id('rich_editor_copy_paste_attribute_strings_0011_target')
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
