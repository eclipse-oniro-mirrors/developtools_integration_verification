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
struct UiComponentTextRichEditorSetStyledString0030 {
  controller: RichEditorStyledStringController = new RichEditorStyledStringController();
  controller2: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorStyledStringOptions = { controller: this.controller };
  options2: RichEditorStyledStringOptions = { controller: this.controller2 };
  mutableStr: MutableStyledString = new MutableStyledString('');
  mutableStr2: MutableStyledString = new MutableStyledString('');
  @State imagePixelMap: image.PixelMap | null = null;

  async aboutToAppear() {
    // 加载图片资源并转换为PixelMap
    await this.loadImage();
    
    // 创建包含图片和文本的属性字符串
    this.mutableStr.appendStyledString(new StyledString('文本内容'));
    
    // 添加真实图片
    if (this.imagePixelMap) {
      let imageAttachment = new ImageAttachment({
        value: this.imagePixelMap,
        size: { width: 50, height: 50 },
        layoutStyle: { borderRadius: LengthMetrics.vp(5) },
        verticalAlign: ImageSpanAlignment.BASELINE
      });
      this.mutableStr.appendStyledString(new StyledString(imageAttachment));
    }
    
    this.mutableStr.appendStyledString(new StyledString('更多文本'));

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
    this.mutableStr2.appendStyledString(new StyledString('点击按钮清空内容查看placeholder显示'));
    
    let grayStyle = new TextStyle({ fontColor: Color.Gray, fontSize: LengthMetrics.vp(14) });
    this.mutableStr2.setStyle({ start: 0, length: this.mutableStr2.length, styledKey: StyledStringKey.FONT, styledValue: grayStyle });
    
    this.controller2.setStyledString(this.mutableStr2);
  }

  async loadImage() {
    try {
      const context = getContext(this);
      const resourceMgr = context.resourceManager;
      // 获取图片资源的ArrayBuffer
      const imageData = await resourceMgr.getMediaContent($r('app.media.icon'));
      // 使用ArrayBuffer创建ImageSource
      const imageSource = image.createImageSource(imageData.buffer as ArrayBuffer);
      // 创建PixelMap
      this.imagePixelMap = await imageSource.createPixelMap();
    } catch (error) {
      console.error('加载图片失败:', error);
    }
  }

  async restoreContent() {
    // 确保图片已加载
    if (!this.imagePixelMap) {
      await this.loadImage();
    }
    
    this.mutableStr = new MutableStyledString('');
    this.mutableStr.appendStyledString(new StyledString('文本内容'));
    
    // 添加真实图片
    if (this.imagePixelMap) {
      let imageAttachment = new ImageAttachment({
        value: this.imagePixelMap,
        size: { width: 50, height: 50 },
        layoutStyle: { borderRadius: LengthMetrics.vp(5) },
        verticalAlign: ImageSpanAlignment.BASELINE
      });
      this.mutableStr.appendStyledString(new StyledString(imageAttachment));
    }
    
    this.mutableStr.appendStyledString(new StyledString('更多文本'));
    
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
    
    // 更新辅助说明的属性字符串
    this.mutableStr2 = new MutableStyledString('');
    this.mutableStr2.appendStyledString(new StyledString('内容已恢复\n'));
    this.mutableStr2.appendStyledString(new StyledString('placeholder已隐藏'));
    
    let greenStyle = new TextStyle({
      fontColor: Color.Green,
      fontSize: LengthMetrics.vp(14)
    });
    this.mutableStr2.setStyle({
      start: 0,
      length: 6,
      styledKey: StyledStringKey.FONT,
      styledValue: greenStyle
    });
    
    let blueStyle = new TextStyle({
      fontColor: Color.Blue,
      fontSize: LengthMetrics.vp(14)
    });
    this.mutableStr2.setStyle({
      start: 6,
      length: this.mutableStr2.length - 6,
      styledKey: StyledStringKey.FONT,
      styledValue: blueStyle
    });
    
    this.controller2.setStyledString(this.mutableStr2);
  }

  build() {
    Column({ space: 10 }) {
      Text('验证属性字符串支持placeholder属性')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10 })

      RichEditor(this.options2)
        .id('rich_editor_setstyledstring_0030_info')
        .width('100%')
        .height(80)
        .backgroundColor('#FFF9E6')
        .border({ width: 1, color: Color.Orange })
        .borderRadius(8)
        .padding(8)

      Button('清空内容(显示placeholder)')
        .id('button_setstyledstring_0030_clear')
        .fontSize(14)
        .width('90%')
        .onClick(() => {
          this.mutableStr = new MutableStyledString('');
          this.controller.setStyledString(this.mutableStr);
          
          // 更新辅助说明的属性字符串
          this.mutableStr2 = new MutableStyledString('');
          this.mutableStr2.appendStyledString(new StyledString('内容已清空\n'));
          this.mutableStr2.appendStyledString(new StyledString('下方应显示placeholder提示文本'));
          
          let greenStyle = new TextStyle({
            fontColor: Color.Green,
            fontSize: LengthMetrics.vp(14)
          });
          this.mutableStr2.setStyle({
            start: 0,
            length: 6,
            styledKey: StyledStringKey.FONT,
            styledValue: greenStyle
          });
          
          let blueStyle = new TextStyle({
            fontColor: Color.Blue,
            fontSize: LengthMetrics.vp(14)
          });
          this.mutableStr2.setStyle({
            start: 6,
            length: this.mutableStr2.length - 6,
            styledKey: StyledStringKey.FONT,
            styledValue: blueStyle
          });
          
          this.controller2.setStyledString(this.mutableStr2);
        })

      Button('恢复内容')
        .id('button_setstyledstring_0030_restore')
        .fontSize(14)
        .width('90%')
        .onClick(async () => {
          await this.restoreContent();
        })

      RichEditor(this.options)
        .id('rich_editor_setstyledstring_0030')
        .width('100%')
        .height(200)
        .backgroundColor(Color.White)
        .border({ width: 2, color: Color.Blue })
        .borderRadius(8)
        .padding(10)
        .placeholder('这是placeholder提示文本，请输入内容...')
    }
    .width('100%')
    .height('100%')
    .padding(15)
    .backgroundColor('#F6F7F9')
  }
}

