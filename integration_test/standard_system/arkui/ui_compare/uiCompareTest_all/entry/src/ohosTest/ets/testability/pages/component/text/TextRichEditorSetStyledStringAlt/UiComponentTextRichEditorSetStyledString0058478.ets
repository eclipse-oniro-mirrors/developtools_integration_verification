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
struct UiComponentTextRichEditorSetStyledString0058478 {
  controller: RichEditorStyledStringController = new RichEditorStyledStringController();
  controller2: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorStyledStringOptions = { controller: this.controller };
  options2: RichEditorStyledStringOptions = { controller: this.controller2 };
  mutableStr: MutableStyledString = new MutableStyledString('');
  mutableStr2: MutableStyledString = new MutableStyledString('');
  @State currentBarState: BarState = BarState.Auto;
  @State barStateName: string = 'Auto';

  aboutToAppear() {
    // 创建足够长的内容以显示滚动条
    for (let i = 1; i <= 20; i++) {
      this.mutableStr.appendStyledString(new StyledString('这是第' + i + '行文本内容，用于测试滚动条显示效果\n'));
    }

    // 设置文本样式
    let textStyle = new TextStyle({
      fontColor: Color.Black,
      fontSize: LengthMetrics.vp(16)
    });
    this.mutableStr.setStyle({
      start: 0,
      length: this.mutableStr.length,
      styledKey: StyledStringKey.FONT,
      styledValue: textStyle
    });

    this.controller.setStyledString(this.mutableStr);

    // 创建辅助说明的属性字符串
    this.mutableStr2.appendStyledString(new StyledString('点击按钮切换滚动条显示模式'));
    
    let grayStyle = new TextStyle({ fontColor: Color.Gray, fontSize: LengthMetrics.vp(14) });
    this.mutableStr2.setStyle({ start: 0, length: this.mutableStr2.length, styledKey: StyledStringKey.FONT, styledValue: grayStyle });
    
    this.controller2.setStyledString(this.mutableStr2);
  }

  updateBarState(state: BarState, stateName: string) {
    this.currentBarState = state;
    this.barStateName = stateName;
    
    this.mutableStr2 = new MutableStyledString('');
    this.mutableStr2.appendStyledString(new StyledString('当前滚动条模式: ' + stateName));
    
    let textStyle = new TextStyle({ fontColor: Color.Black, fontSize: LengthMetrics.vp(14) });
    this.mutableStr2.setStyle({ start: 0, length: this.mutableStr2.length, styledKey: StyledStringKey.FONT, styledValue: textStyle });
    
    this.controller2.setStyledString(this.mutableStr2);
  }

  build() {
    Column({ space: 10 }) {
      Text('验证属性字符串构建的RichEditor组件支持barState')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10 })

      RichEditor(this.options2)
        .id('rich_editor_setstyledstring_0058_478_info')
        .width('100%')
        .height(100)
        .backgroundColor('#FFF9E6')
        .border({ width: 1, color: Color.Orange })
        .borderRadius(8)
        .padding(8)

      Row({ space: 10 }) {
        Button('Auto')
          .id('button_setstyledstring_0058_478_auto')
          .fontSize(14)
          .width('30%')
          .onClick(() => {
            this.updateBarState(BarState.Auto, 'Auto');
          })

        Button('On')
          .id('button_setstyledstring_0058_478_on')
          .fontSize(14)
          .width('30%')
          .onClick(() => {
            this.updateBarState(BarState.On, 'On');
          })

        Button('Off')
          .id('button_setstyledstring_0058_478_off')
          .fontSize(14)
          .width('30%')
          .onClick(() => {
            this.updateBarState(BarState.Off, 'Off');
          })
      }
      .width('100%')

      RichEditor(this.options)
        .id('rich_editor_setstyledstring_0058_478')
        .width('100%')
        .height(300)
        .backgroundColor(Color.White)
        .border({ width: 2, color: Color.Blue })
        .borderRadius(8)
        .padding(10)
        .barState(this.currentBarState)
    }
    .width('100%')
    .height('100%')
    .padding(15)
    .backgroundColor('#F6F7F9')
  }
}

