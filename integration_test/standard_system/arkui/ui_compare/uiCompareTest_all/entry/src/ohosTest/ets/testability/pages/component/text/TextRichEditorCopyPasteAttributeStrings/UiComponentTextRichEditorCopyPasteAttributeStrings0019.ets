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
import { drawing } from '@kit.ArkGraphics2D';

let gUIContext: UIContext;

// 自定义CustomSpan类
class MyCustomSpan extends CustomSpan {
  public word: string = 'CustomSpan';
  public width: number = 300;
  public height: number = 60;

  constructor(word: string, width: number, height: number) {
    super();
    this.word = word;
    this.width = width;
    this.height = height;
  }

  onMeasure(measureInfo: CustomSpanMeasureInfo): CustomSpanMetrics {
    return { width: this.width, height: this.height };
  }

  onDraw(context: DrawContext, options: CustomSpanDrawInfo) {
    try {
      let canvas = context.canvas;

      const brush = new drawing.Brush();
      // 绘制橙色背景矩形
      brush.setColor({ alpha: 255, red: 255, green: 165, blue: 0 });
      canvas.attachBrush(brush);
      canvas.drawRect({
        left: options.x + 5,
        right: options.x + gUIContext.vp2px(this.width) - 5,
        top: options.lineTop + 5,
        bottom: options.lineBottom - 5
      });

      // 绘制白色文字
      const font = new drawing.Font();
      font.setSize(40);
      const textBlob = drawing.TextBlob.makeFromString(this.word, font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
      brush.setColor({ alpha: 255, red: 255, green: 255, blue: 255 });
      canvas.attachBrush(brush);
      canvas.drawTextBlob(textBlob, options.x + 20, options.lineBottom - 15);
      canvas.detachBrush();
    } catch (err) {
      hilog.error(0x0000, 'TEST', 'CustomSpan绘制失败');
    }
  }
}

@Entry
@Component
struct UiComponentTextRichEditorCopyPasteAttributeStrings0019 {
  controllerA: RichEditorStyledStringController = new RichEditorStyledStringController();
  optionsA: RichEditorStyledStringOptions = { controller: this.controllerA };
  controllerB: RichEditorStyledStringController = new RichEditorStyledStringController();
  optionsB: RichEditorStyledStringOptions = { controller: this.controllerB };

  // 创建自定义CustomSpan实例
  customSpan: MyCustomSpan = new MyCustomSpan('测试拖拽', 300, 60);

  // 组件A只包含一个CustomSpan
  mutableStyledStringA: MutableStyledString = new MutableStyledString(this.customSpan);

  // 组件B包含简单文本
  mutableStyledStringB: MutableStyledString = new MutableStyledString('组件B初始内容');

  aboutToAppear(): void {
    gUIContext = this.getUIContext();
    this.controllerA.setStyledString(this.mutableStyledStringA);
    this.controllerB.setStyledString(this.mutableStyledStringB);
  }

  build() {
    Column({ space: 10 }) {
      Text('CUSTOM_SPAN拖拽测试')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 10 })

      Text('组件A（橙色背景文字标签CustomSpan）')
        .fontSize(13)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      RichEditor(this.optionsA)
        .id('rich_editor_copy_paste_attribute_strings_0019_source')
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
        .id('rich_editor_copy_paste_attribute_strings_0019_target')
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
