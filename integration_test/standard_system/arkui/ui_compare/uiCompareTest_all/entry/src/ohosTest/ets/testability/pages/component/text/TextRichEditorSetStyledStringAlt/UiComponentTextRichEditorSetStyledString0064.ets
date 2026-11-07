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

@Entry
@Component
struct UiComponentTextRichEditorSetStyledString0064 {
  controller: RichEditorStyledStringController = new RichEditorStyledStringController();
  controller2: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorStyledStringOptions = { controller: this.controller };
  options2: RichEditorStyledStringOptions = { controller: this.controller2 };
  mutableStr: MutableStyledString = new MutableStyledString('');
  mutableStr2: MutableStyledString = new MutableStyledString('');

  aboutToAppear() {
    // 创建包含中英文、emoji和换行符的属性字符串
    this.mutableStr.appendStyledString(new StyledString('中文文本Hello'));
    
    // 添加emoji和换行符
    this.mutableStr.appendStyledString(new StyledString('😀😊👍\n下一行文本'));

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
    this.mutableStr2.appendStyledString(new StyledString('在编辑器中按删除键测试删除操作'));
    
    let grayStyle = new TextStyle({ fontColor: Color.Gray, fontSize: LengthMetrics.vp(14) });
    this.mutableStr2.setStyle({ start: 0, length: this.mutableStr2.length, styledKey: StyledStringKey.FONT, styledValue: grayStyle });
    
    this.controller2.setStyledString(this.mutableStr2);
  }

  resetContent() {
    this.mutableStr = new MutableStyledString('');
    this.mutableStr.appendStyledString(new StyledString('中文文本Hello'));
    this.mutableStr.appendStyledString(new StyledString('😀😊👍\n下一行文本'));
    
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
    
    this.mutableStr2 = new MutableStyledString('');
    this.mutableStr2.appendStyledString(new StyledString('内容已重置'));
    
    let blackStyle = new TextStyle({ fontColor: Color.Black, fontSize: LengthMetrics.vp(14) });
    this.mutableStr2.setStyle({ start: 0, length: this.mutableStr2.length, styledKey: StyledStringKey.FONT, styledValue: blackStyle });
    
    this.controller2.setStyledString(this.mutableStr2);
  }

  build() {
    Column({ space: 10 }) {
      Text('验证属性字符串的删除操作')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10 })

      RichEditor(this.options2)
        .id('rich_editor_setstyledstring_0064_info')
        .width('100%')
        .height(100)
        .backgroundColor('#FFF9E6')
        .border({ width: 1, color: Color.Orange })
        .borderRadius(8)
        .padding(8)

      Button('重置内容')
        .id('button_setstyledstring_0064_reset')
        .fontSize(14)
        .width('90%')
        .onClick(() => {
          this.resetContent();
        })

      RichEditor(this.options)
        .id('rich_editor_setstyledstring_0064')
        .width('100%')
        .height(250)
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

