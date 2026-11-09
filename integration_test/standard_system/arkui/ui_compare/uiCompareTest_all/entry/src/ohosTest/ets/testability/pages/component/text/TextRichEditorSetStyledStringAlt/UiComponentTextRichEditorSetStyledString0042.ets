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

import { LengthMetrics } from '@kit.ArkUI';
import { image } from '@kit.ImageKit';

@Entry
@Component
struct UiComponentTextRichEditorSetStyledString0042 {
  controller: RichEditorStyledStringController = new RichEditorStyledStringController();
  controller2: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorStyledStringOptions = { controller: this.controller };
  options2: RichEditorStyledStringOptions = { controller: this.controller2 };
  mutableStr: MutableStyledString = new MutableStyledString('');
  mutableStr2: MutableStyledString = new MutableStyledString('');
  @State imagePixelMap: image.PixelMap | null = null;

  async loadImage() {
    try {
      const context = getContext(this);
      const resourceMgr = context.resourceManager;
      const imageData = await resourceMgr.getMediaContent($r('app.media.icon'));
      const imageSource = image.createImageSource(imageData.buffer as ArrayBuffer);
      this.imagePixelMap = await imageSource.createPixelMap();
    } catch (error) {
      console.error('加载图片失败:', error);
    }
  }

  async aboutToAppear() {
    await this.loadImage();
    
    // 创建包含图片和文本的属性字符串
    this.mutableStr.appendStyledString(new StyledString('前面的文本'));
    
    // 添加图片
    if (this.imagePixelMap) {
      let imageAttachment = new ImageAttachment({
        value: this.imagePixelMap,
        size: { width: 50, height: 50 },
        layoutStyle: { borderRadius: LengthMetrics.vp(5) },
        verticalAlign: ImageSpanAlignment.BASELINE
      });
      this.mutableStr.appendStyledString(new StyledString(imageAttachment));
    }
    
    this.mutableStr.appendStyledString(new StyledString('后面的文本'));

    // 设置文本样式
    let textStyle = new TextStyle({
      fontColor: Color.Black,
      fontSize: LengthMetrics.vp(18)
    });
    this.mutableStr.setStyle({
      start: 0,
      length: this.mutableStr.length,
      styledKey: StyledStringKey.FONT,
      styledValue: textStyle
    });

    this.controller.setStyledString(this.mutableStr);

    // 创建辅助说明的属性字符串
    this.mutableStr2.appendStyledString(new StyledString('点击编辑器定位光标，然后点击按钮获取位置'));
    
    let grayStyle = new TextStyle({ fontColor: Color.Gray, fontSize: LengthMetrics.vp(14) });
    this.mutableStr2.setStyle({ start: 0, length: this.mutableStr2.length, styledKey: StyledStringKey.FONT, styledValue: grayStyle });
    
    this.controller2.setStyledString(this.mutableStr2);
  }

  build() {
    Column({ space: 10 }) {
      Text('验证属性字符串支持getCaretOffset')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10 })

      RichEditor(this.options2)
        .id('rich_editor_setstyledstring_0042_info')
        .width('100%')
        .height(100)
        .backgroundColor('#FFF9E6')
        .border({ width: 1, color: Color.Orange })
        .borderRadius(8)
        .padding(8)

      Button('获取光标位置')
        .id('button_setstyledstring_0042_getoffset')
        .fontSize(14)
        .width('90%')
        .onClick(() => {
          let caretOffset = this.controller.getCaretOffset();
          
          this.mutableStr2 = new MutableStyledString('');
          this.mutableStr2.appendStyledString(new StyledString('当前光标位置: ' + caretOffset));
          
          let textStyle = new TextStyle({ fontColor: Color.Black, fontSize: LengthMetrics.vp(14) });
          this.mutableStr2.setStyle({ start: 0, length: this.mutableStr2.length, styledKey: StyledStringKey.FONT, styledValue: textStyle });
          
          this.controller2.setStyledString(this.mutableStr2);
        })

      RichEditor(this.options)
        .id('rich_editor_setstyledstring_0042')
        .width('100%')
        .height(200)
        .backgroundColor(Color.White)
        .border({ width: 2, color: Color.Blue })
        .borderRadius(8)
        .padding(10)
    }
    .width('100%')
    .height('100%')
    .padding(15)
    .backgroundColor('#F6F7F9')
  }
}

