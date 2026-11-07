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
struct UiComponentTextRichEditorCursorPosition0011 {
  controller: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorStyledStringOptions = { controller: this.controller };
  infoController: RichEditorController = new RichEditorController();
  infoOptions: RichEditorOptions = { controller: this.infoController };

  textStyle: TextStyle = new TextStyle({
    fontColor: Color.Red,
    fontSize: LengthMetrics.vp(18)
  });

  mutableStyledString: MutableStyledString = new MutableStyledString(
    '这是属性字符串组件测试\n第二行内容\n第三行内容',
    [{
      start: 0,
      length: 30,
      styledKey: StyledStringKey.FONT,
      styledValue: this.textStyle
    }]
  );

  aboutToAppear(): void {
    this.controller.setStyledString(this.mutableStyledString);
    this.infoController.addTextSpan('点击按钮获取属性字符串组件的光标位置', {
      style: {
        fontSize: 14,
        fontColor: Color.Gray
      }
    });
  }

  // 获取光标位置
  getCaretPosition() {
    try {
      let caretRect = this.controller.getCaretRect();
      if (caretRect) {
        hilog.info(0x0000, 'TEST', `属性字符串光标位置: x=${caretRect.x}, y=${caretRect.y}`);

        this.infoController.deleteSpans({ start: 0, end: -1 });
        this.infoController.addTextSpan(
          `属性字符串光标位置:\nx=${caretRect.x}, y=${caretRect.y}`,
          {
            style: {
              fontSize: 14,
              fontColor: Color.Blue
            }
          }
        );
      }
    } catch (err) {
      hilog.error(0x0000, 'TEST', '获取光标失败');
    }
  }

  build() {
    Column({ space: 10 }) {
      Text('属性字符串组件获取光标相对位置')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 10 })

      Button('获取光标位置')
        .id('button_cursor_position_0011_get_caret')
        .width('90%')
        .onClick(() => {
          this.getCaretPosition();
        })
        .margin({ bottom: 10 })

      Text('光标位置信息')
        .fontSize(13)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      RichEditor(this.infoOptions)
        .id('rich_editor_cursor_position_0011_info')
        .width('100%')
        .height(80)
        .backgroundColor('#F0F0F0')
        .border({ width: 1, color: Color.Gray })
        .borderRadius(8)
        .padding(8)
        .margin({ bottom: 10 })

      Text('RichEditor组件（属性字符串）')
        .fontSize(13)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      RichEditor(this.options)
        .id('rich_editor_cursor_position_0011')
        .width('100%')
        .height(150)
        .backgroundColor(Color.White)
        .border({ width: 2, color: Color.Blue })
        .borderRadius(8)
        .padding(8)
    }
    .width('100%')
    .height('100%')
    .padding(15)
    .backgroundColor('#F6F7F9')
  }
}

