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

// 自定义CustomSpan类 - 绘制纯文本span
class MyCustomTextSpan extends CustomSpan {
  public word: string = 'CustomSpan';
  public width: number = 280;
  public height: number = 50;

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
      // 绘制浅蓝色背景矩形
      brush.setColor({ alpha: 255, red: 173, green: 216, blue: 230 });
      canvas.attachBrush(brush);
      canvas.drawRect({
        left: options.x + 3,
        right: options.x + gUIContext.vp2px(this.width) - 3,
        top: options.lineTop + 3,
        bottom: options.lineBottom - 3
      });

      // 绘制深蓝色文字
      const font = new drawing.Font();
      font.setSize(35);
      const textBlob = drawing.TextBlob.makeFromString(this.word, font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
      brush.setColor({ alpha: 255, red: 25, green: 25, blue: 112 });
      canvas.attachBrush(brush);
      canvas.drawTextBlob(textBlob, options.x + 15, options.lineBottom - 10);
      canvas.detachBrush();
    } catch (err) {
      hilog.error(0x0000, 'TEST', 'CustomSpan绘制失败');
    }
  }
}

@Entry
@Component
struct UiComponentTextRichEditorCustomspan0005 {
  controllerA: RichEditorStyledStringController = new RichEditorStyledStringController();
  optionsA: RichEditorStyledStringOptions = { controller: this.controllerA };

  // 创建自定义CustomSpan实例
  customSpan: MyCustomTextSpan = new MyCustomTextSpan('自定义绘制的纯文本Span', 280, 50);

  // 创建包含CustomSpan的MutableStyledString
  mutableStyledStringA: MutableStyledString = new MutableStyledString('前置文本内容 ');

  aboutToAppear(): void {
    gUIContext = this.getUIContext();
    
    // 添加CustomSpan
    this.mutableStyledStringA.appendStyledString(new MutableStyledString(this.customSpan));
    
    // 添加后续文本
    this.mutableStyledStringA.appendStyledString(new MutableStyledString(' 后续文本内容'));
    
    this.controllerA.setStyledString(this.mutableStyledStringA);
  }

  build() {
    Column({ space: 10 }) {
      Text('测试：自定义绘制纯文本span')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Text('使用CustomSpan的onDraw方法绘制纯文本span')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 10 })

      RichEditor(this.optionsA)
        .id('rich_editor_customspan_0005')
        .width('90%')
        .height(200)
        .backgroundColor(Color.White)
        .border({
          width: 2,
          color: $r('sys.color.brand')
        })
        .borderRadius(8)
        .padding(10)
        .margin(10)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#f5f5f5')
    .padding(20)
  }
}

