/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct UiComponentTextRichEditorAction10 {
  controller: RichEditorController = new RichEditorController();
  @State cursorInfo: string = '点击编辑器查看光标高度或选择文本范围';
  @State lineHeight: number = 50;
  @State fontSize: number = 30;
  @State placeholderText: string = '请输入文本内容...（支持基础文本编辑）';
  @State presetStyle: string = '默认样式';
  private initialLineHeight: number = 50;
  private initialFontSize: number = 30;

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ACTION_0120_963_085')
        .fontSize(14)
        .fontColor(0x666666)
        .textAlign(TextAlign.Center)
        .width('90%');

      Text('预设文本行高字体大小placeholder光标高度测试')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)
        .width('90%');

      Text(this.cursorInfo)
        .fontSize(14)
        .fontColor(Color.Red)
        .backgroundColor(0xFFEBEE)
        .padding(12)
        .border({ width: 1, color: Color.Red, radius: 8 })
        .width('90%')
        .textAlign(TextAlign.Center)
        .maxLines(2)
        .textOverflow({ overflow: TextOverflow.Ellipsis });

      Column() {
        Row({ space: 15 }) {
          Text(`当前行高: ${this.lineHeight}px`)
            .fontSize(12)
            .fontColor(0x666666)
            .width(120)
            .textAlign(TextAlign.Center);

          Button('增加行高(+10)')
            .fontSize(10)
            .height(30)
            .width(110)
            .backgroundColor(0x4CAF50)
            .fontColor(Color.White)
            .onClick(() => {
              if (this.lineHeight < 100) {
                this.lineHeight += 10;
                this.cursorInfo = `行高已调整至 ${this.lineHeight}px，光标高度同步更新`;
              } else {
                this.cursorInfo = '行高已达最大值(100px)，无法继续增加';
              }
            });

          Button('减少行高(-10)')
            .fontSize(10)
            .height(30)
            .width(110)
            .backgroundColor(0xFF9800)
            .fontColor(Color.White)
            .onClick(() => {
              if (this.lineHeight > 20) {
                this.lineHeight -= 10;
                this.cursorInfo = `行高已调整至 ${this.lineHeight}px，光标高度同步更新`;
              } else {
                this.cursorInfo = '行高已达最小值(20px)，无法继续减少';
              }
            });
        }
        .justifyContent(FlexAlign.Center)
        .width('100%');

        Row({ space: 15 }) {
          Text(`当前字体: ${this.fontSize}px`)
            .fontSize(12)
            .fontColor(0x666666)
            .width(120)
            .textAlign(TextAlign.Center);

          Button('增加字体(+10)')
            .fontSize(10)
            .height(30)
            .width(110)
            .backgroundColor(0x2196F3)
            .fontColor(Color.White)
            .id('UiComponentTextRichEditorAction10_02')
            .onClick(() => {
              if (this.fontSize < 60) {
                this.fontSize += 10;
                this.cursorInfo = `字体大小已调整至 ${this.fontSize}px，占位符同步更新`;
              } else {
                this.cursorInfo = '字体已达最大值(60px)，无法继续增加';
              }
            });

          Button('减少字体(-5)')
            .fontSize(10)
            .height(30)
            .width(110)
            .backgroundColor(0x9C27B0)
            .fontColor(Color.White)
            .onClick(() => {
              if (this.fontSize > 12) {
                this.fontSize -= 5;
                this.cursorInfo = `字体大小已调整至 ${this.fontSize}px，占位符同步更新`;
              } else {
                this.cursorInfo = '字体已达最小值(12px)，无法继续减少';
              }
            });
        }
        .justifyContent(FlexAlign.Center)
        .width('100%');
      }
      .height('20%')
      .padding(12)
      .backgroundColor(0xF5F5F5)
      .borderRadius(8)
      .width('90%')

      RichEditor({ controller: this.controller })
        .id('UiComponentTextRichEditorAction10_01')
        .onFocus(() => {
          this.cursorInfo = `编辑器获得焦点 | 行高: ${this.lineHeight}px | 字体: ${this.fontSize}px`;
          console.log('RichEditor focused');
        })
        .onBlur(() => {
          this.cursorInfo = '编辑器失去焦点（点击可重新激活）';
          console.log('RichEditor blurred');
        })
        .onIMEInputComplete((value: RichEditorTextSpanResult) => {
          this.cursorInfo = `输入完成: "${value.value}", 光标高度适应当前样式`;
          console.log('Input completed, result:', value.value);
        })
        .placeholder(this.placeholderText, {
          fontColor: Color.Gray,
          font: {
            size: this.fontSize,
            weight: FontWeight.Normal,
            style: FontStyle.Normal,
            family: 'sans-serif'
          },
        })
        .borderWidth(2)
        .borderColor(Color.Blue)
        .borderRadius(8)
        .width('90%')
        .height(100)
        .padding(10)
        .backgroundColor(Color.White)

    }
    .width('100%')
    .height('100%')
    .padding(2)
    .justifyContent(FlexAlign.Start)
    .backgroundColor(0xF9F9F9);
  }
}