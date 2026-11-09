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

import { LengthMetrics } from '@kit.ArkUI';

@Entry
@Component
struct UiComponentTextReverseAnalysis27 {
  @State testId: string = 'SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0650';
  controller: TextController = new TextController();
  mutableStyledString: MutableStyledString = new MutableStyledString('测试文本', [
    {
      start: 0,
      length: 4,
      styledKey: StyledStringKey.FONT,
      styledValue: new TextStyle({ fontColor: Color.Blue, fontSize: LengthMetrics.vp(24) })
    },
    {
      start: 0,
      length: 4,
      styledKey: StyledStringKey.DECORATION,
      styledValue: new DecorationStyle({ type: TextDecorationType.Underline, color: Color.Red })
    }
  ]);

  async onPageShow() {
    this.controller.setStyledString(this.mutableStyledString);
  }

  build() {
    Scroll() {
      Column({ space: 20 }) {
        Text('测试用例: SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0650')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FF5722')
          .width('100%')
          .textAlign(TextAlign.Center)
          .margin({ top: 20 })
          .fontStyle(FontStyle.Italic)

        Column({ space: 15 }) {
          Text('相同内容不同styledKey的modifier验证:')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontColor('#4CAF50')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          Text(undefined, { controller: this.controller })
            .fontSize(16)
            .width('100%')
            .padding(10)
            .backgroundColor('#F5F5F5')
            .borderRadius(5)
            .copyOption(CopyOptions.InApp)
            .attributeModifier(new TextStyledModifier2())
            .id('UiComponentTextReverseAnalysis27_01')
            .fontStyle(FontStyle.Italic)
        }
        .width('90%')
        .padding(15)
        .backgroundColor('#E8F5E9')
        .borderRadius(10)

        Column({ space: 8 }) {
          Text('测试预期:')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FF5722')
            .width('100%')
            .fontStyle(FontStyle.Italic)
            .textAlign(TextAlign.Center)

          Text('1. 文本同时显示蓝色、字号24')
            .fontSize(13)
            .fontColor('#444444')
            .width('100%')
            .fontStyle(FontStyle.Italic)
            .textAlign(TextAlign.Start)

          Text('2. 文本同时显示红色下划线')
            .fontSize(13)
            .fontColor('#444444')
            .width('100%')
            .fontStyle(FontStyle.Italic)
            .textAlign(TextAlign.Start)

          Text('3. 多个样式叠加生效')
            .fontSize(13)
            .fontColor('#444444')
            .width('100%')
            .fontStyle(FontStyle.Italic)
            .textAlign(TextAlign.Start)

          Text('4. 显示与功能均正确有效')
            .fontSize(13)
            .fontColor('#444444')
            .width('100%')
            .fontStyle(FontStyle.Italic)
            .textAlign(TextAlign.Start)

          Divider()
            .margin({
              top: 5,
              bottom: 5
            })

          Text('注意: 使用modifier方法设置相同内容不同styledKey的属性字符串。')
            .fontSize(12)
            .fontColor('#FF5722')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)
            .fontWeight(FontWeight.Bold)
        }
        .width('90%')
        .padding(15)
        .backgroundColor('#FFF3E0')
        .borderRadius(10)

        Column({ space: 8 }) {
          Text('测试参数:')
            .fontSize(14)
            .fontStyle(FontStyle.Italic)
            .fontWeight(FontWeight.Bold)
            .fontColor('#607d7B')
            .width('100%')
            .textAlign(TextAlign.Start)

          Text('• 添加Text属性字符串')
            .fontSize(13)
            .fontColor('#666666')
            .width('100%')
            .fontStyle(FontStyle.Italic)
            .textAlign(TextAlign.Start)

          Text('• 使用modifier方法设置相同内容不同styledKey')
            .fontSize(13)
            .fontColor('#666666')
            .width('100%')
            .fontStyle(FontStyle.Italic)
            .textAlign(TextAlign.Start)

          Text('• 查看属性字符串功能及显示是否正确')
            .fontSize(13)
            .fontColor('#666666')
            .width('100%')
            .fontStyle(FontStyle.Italic)
            .textAlign(TextAlign.Start)
        }
        .width('90%')
        .padding(15)
        .backgroundColor('#ECEFF1')
        .borderRadius(10)
      }
      .width('100%')
      .padding({ bottom: 30 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FAFAFA')
  }
}

class TextStyledModifier2 implements AttributeModifier<TextAttribute> {
  applyNormalAttribute(instance: TextAttribute): void {
    instance.lineHeight(40);
  }
}

