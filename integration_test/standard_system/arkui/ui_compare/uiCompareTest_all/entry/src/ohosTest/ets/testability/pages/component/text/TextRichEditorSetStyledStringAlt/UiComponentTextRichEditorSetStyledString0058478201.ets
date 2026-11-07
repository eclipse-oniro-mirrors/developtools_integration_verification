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
struct UiComponentTextRichEditorSetStyledString0058478201 {
  controller: RichEditorStyledStringController = new RichEditorStyledStringController();
  controller2: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorStyledStringOptions = { controller: this.controller };
  options2: RichEditorStyledStringOptions = { controller: this.controller2 };
  mutableStr: MutableStyledString = new MutableStyledString('请输入内容测试');
  mutableStr2: MutableStyledString = new MutableStyledString('');
  @State inputCount: number = 0;

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
    this.mutableStr2.appendStyledString(new StyledString('输入内容测试onDidIMEInput回调\n属性字符串构建的RichEditor预期不触发此回调'));
    
    let grayStyle = new TextStyle({ fontColor: Color.Gray, fontSize: LengthMetrics.vp(14) });
    this.mutableStr2.setStyle({ start: 0, length: this.mutableStr2.length, styledKey: StyledStringKey.FONT, styledValue: grayStyle });
    
    this.controller2.setStyledString(this.mutableStr2);
  }

  build() {
    Column({ space: 10 }) {
      Text('验证属性字符串构建的RichEditor组件不支持onDidIMEInput')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10 })

      RichEditor(this.options2)
        .id('rich_editor_setstyledstring_0058_478_201_info')
        .width('100%')
        .height(120)
        .backgroundColor('#FFF9E6')
        .border({ width: 1, color: Color.Orange })
        .borderRadius(8)
        .padding(8)

      Button('重置计数')
        .id('button_setstyledstring_0058_478_201_reset')
        .fontSize(14)
        .width('90%')
        .onClick(() => {
          this.inputCount = 0;
          this.mutableStr2 = new MutableStyledString('');
          this.mutableStr2.appendStyledString(new StyledString('计数已重置，当前触发次数: ' + this.inputCount));
          
          let textStyle = new TextStyle({ fontColor: Color.Black, fontSize: LengthMetrics.vp(14) });
          this.mutableStr2.setStyle({ start: 0, length: this.mutableStr2.length, styledKey: StyledStringKey.FONT, styledValue: textStyle });
          
          this.controller2.setStyledString(this.mutableStr2);
        })

      RichEditor(this.options)
        .id('rich_editor_setstyledstring_0058_478_201')
        .width('100%')
        .height(200)
        .backgroundColor(Color.White)
        .border({ width: 2, color: Color.Blue })
        .borderRadius(8)
        .padding(10)
        .onDidIMEInput((textRange: TextRange) => {
          // 属性字符串构建的RichEditor不应该触发此回调
          this.inputCount++;
          this.mutableStr2 = new MutableStyledString('');
          this.mutableStr2.appendStyledString(new StyledString('警告：onDidIMEInput被触发了!\n'));
          this.mutableStr2.appendStyledString(new StyledString('触发次数: ' + this.inputCount + '\n'));
          this.mutableStr2.appendStyledString(new StyledString('这不符合预期（应该不触发）'));
          
          let redStyle1 = new TextStyle({ fontColor: Color.Red, fontSize: LengthMetrics.vp(16), fontWeight: FontWeight.Bold });
          this.mutableStr2.setStyle({ start: 0, length: 20, styledKey: StyledStringKey.FONT, styledValue: redStyle1 });
          
          let countText = '触发次数: ' + this.inputCount + '\n';
          let redStyle2 = new TextStyle({ fontColor: Color.Red, fontSize: LengthMetrics.vp(14) });
          this.mutableStr2.setStyle({ start: 20, length: countText.length, styledKey: StyledStringKey.FONT, styledValue: redStyle2 });
          
          let orangeStyle = new TextStyle({ fontColor: Color.Orange, fontSize: LengthMetrics.vp(14) });
          this.mutableStr2.setStyle({ start: 20 + countText.length, length: this.mutableStr2.length - 20 - countText.length, styledKey: StyledStringKey.FONT, styledValue: orangeStyle });
          
          this.controller2.setStyledString(this.mutableStr2);
        })
    }
    .width('100%')
    .height('100%')
    .padding(15)
    .backgroundColor('#F6F7F9')
  }
}

