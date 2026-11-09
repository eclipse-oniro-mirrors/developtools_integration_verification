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
struct UiComponentTextRichEditorSetStyledString0033 {
  controller: RichEditorStyledStringController = new RichEditorStyledStringController();
  controller2: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorStyledStringOptions = { controller: this.controller };
  options2: RichEditorStyledStringOptions = { controller: this.controller2 };
  mutableStr: MutableStyledString = new MutableStyledString('');
  mutableStr2: MutableStyledString = new MutableStyledString('');
  @State caretColor: Color | string = Color.Red;

  aboutToAppear() {
    // 创建包含文本内容的属性字符串（足够长以便点击定位光标）
    this.mutableStr.appendStyledString(new StyledString('这是一段测试文本，用于验证光标颜色设置功能。'));
    this.mutableStr.appendStyledString(new StyledString('\n请点击文本中任意位置，查看光标颜色。'));
    this.mutableStr.appendStyledString(new StyledString('\n光标颜色会根据按钮设置而改变。'));

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
    this.mutableStr2.appendStyledString(new StyledString('说明：测试caretColor光标颜色属性\n'));
    this.mutableStr2.appendStyledString(new StyledString('当前光标颜色：红色\n'));
    this.mutableStr2.appendStyledString(new StyledString('点击下方按钮可切换光标颜色\n'));
    this.mutableStr2.appendStyledString(new StyledString('光标仅在编辑器获焦时显示'));
    
    let grayStyle = new TextStyle({ fontColor: Color.Gray, fontSize: LengthMetrics.vp(14) });
    this.mutableStr2.setStyle({ start: 0, length: 21, styledKey: StyledStringKey.FONT, styledValue: grayStyle });
    
    let redStyle = new TextStyle({ fontColor: Color.Red, fontSize: LengthMetrics.vp(14), fontWeight: FontWeight.Bold });
    this.mutableStr2.setStyle({ start: 21, length: 10, styledKey: StyledStringKey.FONT, styledValue: redStyle });
    
    let blueStyle = new TextStyle({ fontColor: Color.Blue, fontSize: LengthMetrics.vp(14) });
    this.mutableStr2.setStyle({ start: 31, length: this.mutableStr2.length - 31, styledKey: StyledStringKey.FONT, styledValue: blueStyle });
    
    this.controller2.setStyledString(this.mutableStr2);
  }

  focusEditor() {
    // 通过控制器让编辑器获焦以显示光标
    this.controller.setSelection(0, 0);
  }

  build() {
    Column({ space: 10 }) {
      Text('验证属性字符串支持caretColor属性')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10 })

      RichEditor(this.options2)
        .id('rich_editor_setstyledstring_0033_info')
        .width('100%')
        .height(100)
        .backgroundColor('#FFF9E6')
        .border({ width: 1, color: Color.Orange })
        .borderRadius(8)
        .padding(8)

      Button('设置光标颜色为红色')
        .id('button_setstyledstring_0033_red')
        .fontSize(14)
        .width('90%')
        .onClick(() => {
          this.caretColor = Color.Red;
          
          this.mutableStr2 = new MutableStyledString('');
          this.mutableStr2.appendStyledString(new StyledString('✓ 光标颜色已设置为：红色\n'));
          this.mutableStr2.appendStyledString(new StyledString('编辑器已自动获焦，请查看光标颜色'));
          
          let redStyle = new TextStyle({ fontColor: Color.Red, fontSize: LengthMetrics.vp(14), fontWeight: FontWeight.Bold });
          this.mutableStr2.setStyle({ start: 0, length: 15, styledKey: StyledStringKey.FONT, styledValue: redStyle });
          
          let blueStyle = new TextStyle({ fontColor: Color.Blue, fontSize: LengthMetrics.vp(14) });
          this.mutableStr2.setStyle({ start: 15, length: this.mutableStr2.length - 15, styledKey: StyledStringKey.FONT, styledValue: blueStyle });
          
          this.controller2.setStyledString(this.mutableStr2);
          
          // 延迟让编辑器获焦以显示光标
          setTimeout(() => {
            this.focusEditor();
          }, 100);
        })

      Button('设置光标颜色为绿色')
        .id('button_setstyledstring_0033_green')
        .fontSize(14)
        .width('90%')
        .onClick(() => {
          this.caretColor = Color.Green;
          
          this.mutableStr2 = new MutableStyledString('');
          this.mutableStr2.appendStyledString(new StyledString('✓ 光标颜色已设置为：绿色\n'));
          this.mutableStr2.appendStyledString(new StyledString('编辑器已自动获焦，请查看光标颜色'));
          
          let greenStyle = new TextStyle({ fontColor: Color.Green, fontSize: LengthMetrics.vp(14), fontWeight: FontWeight.Bold });
          this.mutableStr2.setStyle({ start: 0, length: 15, styledKey: StyledStringKey.FONT, styledValue: greenStyle });
          
          let blueStyle = new TextStyle({ fontColor: Color.Blue, fontSize: LengthMetrics.vp(14) });
          this.mutableStr2.setStyle({ start: 15, length: this.mutableStr2.length - 15, styledKey: StyledStringKey.FONT, styledValue: blueStyle });
          
          this.controller2.setStyledString(this.mutableStr2);
          
          // 延迟让编辑器获焦以显示光标
          setTimeout(() => {
            this.focusEditor();
          }, 100);
        })

      Button('设置光标颜色为蓝色')
        .id('button_setstyledstring_0033_blue')
        .fontSize(14)
        .width('90%')
        .onClick(() => {
          this.caretColor = Color.Blue;
          
          this.mutableStr2 = new MutableStyledString('');
          this.mutableStr2.appendStyledString(new StyledString('✓ 光标颜色已设置为：蓝色\n'));
          this.mutableStr2.appendStyledString(new StyledString('编辑器已自动获焦，请查看光标颜色'));
          
          let blueStyle = new TextStyle({ fontColor: Color.Blue, fontSize: LengthMetrics.vp(14), fontWeight: FontWeight.Bold });
          this.mutableStr2.setStyle({ start: 0, length: 15, styledKey: StyledStringKey.FONT, styledValue: blueStyle });
          
          let blueSty2 = new TextStyle({ fontColor: Color.Gray, fontSize: LengthMetrics.vp(14) });
          this.mutableStr2.setStyle({ start: 15, length: this.mutableStr2.length - 15, styledKey: StyledStringKey.FONT, styledValue: blueSty2 });
          
          this.controller2.setStyledString(this.mutableStr2);
          
          // 延迟让编辑器获焦以显示光标
          setTimeout(() => {
            this.focusEditor();
          }, 100);
        })

      RichEditor(this.options)
        .id('rich_editor_setstyledstring_0033')
        .width('100%')
        .height(200)
        .backgroundColor(Color.White)
        .border({ width: 2, color: Color.Blue })
        .borderRadius(8)
        .padding(10)
        .caretColor(this.caretColor)
    }
    .width('100%')
    .height('100%')
    .padding(15)
    .backgroundColor('#F6F7F9')
  }
}

