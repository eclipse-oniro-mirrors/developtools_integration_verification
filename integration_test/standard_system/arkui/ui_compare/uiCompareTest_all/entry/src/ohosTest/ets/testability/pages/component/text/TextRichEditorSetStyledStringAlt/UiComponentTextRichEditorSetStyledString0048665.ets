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
struct UiComponentTextRichEditorSetStyledString0048665 {
  controller: RichEditorStyledStringController = new RichEditorStyledStringController();
  controller2: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorStyledStringOptions = { controller: this.controller };
  options2: RichEditorStyledStringOptions = { controller: this.controller2 };
  mutableStr: MutableStyledString = new MutableStyledString('这是第一行文本\n这是第二行文本\n这是第三行文本\n这是第四行文本\n这是第五行文本');
  mutableStr2: MutableStyledString = new MutableStyledString('');

  aboutToAppear() {
    // 设置属性字符串样式
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
    this.mutableStr2.appendStyledString(new StyledString('点击按钮获取行数信息'));
    
    let grayStyle = new TextStyle({ fontColor: Color.Gray, fontSize: LengthMetrics.vp(14) });
    this.mutableStr2.setStyle({ start: 0, length: this.mutableStr2.length, styledKey: StyledStringKey.FONT, styledValue: grayStyle });
    
    this.controller2.setStyledString(this.mutableStr2);
  }

  build() {
    Column({ space: 10 }) {
      Text('验证属性字符串构建的RichEditor组件支持getLayoutManager')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10 })

      RichEditor(this.options2)
        .id('rich_editor_setstyledstring_0048_665_info')
        .width('100%')
        .height(100)
        .backgroundColor('#FFF9E6')
        .border({ width: 1, color: Color.Orange })
        .borderRadius(8)
        .padding(8)

      Button('获取行数')
        .id('button_setstyledstring_0048_665_getlinecount')
        .fontSize(14)
        .width('90%')
        .onClick(() => {
          try {
            let layoutManager = this.controller.getLayoutManager();
            let lineCount = layoutManager.getLineCount();
            
            this.mutableStr2 = new MutableStyledString('');
            this.mutableStr2.appendStyledString(new StyledString('当前行数: ' + lineCount));
            
            let textStyle = new TextStyle({ fontColor: Color.Black, fontSize: LengthMetrics.vp(14) });
            this.mutableStr2.setStyle({ start: 0, length: this.mutableStr2.length, styledKey: StyledStringKey.FONT, styledValue: textStyle });
            
            this.controller2.setStyledString(this.mutableStr2);
          } catch (err) {
            this.mutableStr2 = new MutableStyledString('');
            this.mutableStr2.appendStyledString(new StyledString('获取行数失败: ' + JSON.stringify(err)));
            
            let textStyle = new TextStyle({ fontColor: Color.Black, fontSize: LengthMetrics.vp(14) });
            this.mutableStr2.setStyle({ start: 0, length: this.mutableStr2.length, styledKey: StyledStringKey.FONT, styledValue: textStyle });
            
            this.controller2.setStyledString(this.mutableStr2);
          }
        })

      RichEditor(this.options)
        .id('rich_editor_setstyledstring_0048_665')
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

