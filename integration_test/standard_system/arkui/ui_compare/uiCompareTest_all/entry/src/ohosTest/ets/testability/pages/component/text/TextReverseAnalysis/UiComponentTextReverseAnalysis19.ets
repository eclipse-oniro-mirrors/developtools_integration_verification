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

@Entry
@Component
struct UiComponentTextReverseAnalysis19 {
  @State testId: string = 'SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0360';
  @State textInputValue: string = 'aaa';
  @State textAreaValue: string = 'aaa';

  build() {
    Scroll() {
      Column({ space: 10 }) {
        Text('测试用例: SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0360')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FF5722')
          .width('100%')
          .textAlign(TextAlign.Center)
          .margin({ top: 20 })
          .fontStyle(FontStyle.Italic)

        Column({ space: 15 }) {
          Text('TextInput组件 modifier foregroundColor测试:')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontColor('#4CAF50')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          Text('foregroundColor: red')
            .fontSize(13)
            .fontColor('#666666')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          TextInput({ placeholder: '请输入文本查看前景色效果', text: this.textInputValue })
            .width('100%')
            .placeholderColor(Color.Grey)
            .placeholderFont({ size: 14, weight: 400 })
            .caretColor(Color.Blue)
            .height(40)
            .maxLines(3)
            .margin(20)
            .fontSize(14)
            .inputFilter('[a-z]', (e) => {
              console.info(JSON.stringify(e));
            })
            .onChange((value: string) => {
              this.textInputValue = value;
            })
            .attributeModifier(new InputForegroundModifier())
            .id('UiComponentTextReverseAnalysis19_01')
        }
        .width('90%')
        .padding(15)
        .backgroundColor('#E8F5E9')
        .borderRadius(10)

        Column({ space: 15 }) {
          Text('TextArea组件 modifier foregroundColor测试:')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontColor('#4CAF50')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          Text('foregroundColor: red')
            .fontSize(13)
            .fontColor('#666666')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          TextArea({ placeholder: '请输入多行文本查看前景色效果', text: this.textAreaValue })
            .width('100%')
            .height(100)
            .placeholderFont({ size: 16, weight: 400 })
            .margin(20)
            .fontSize(16)
            .onChange((value: string) => {
              this.textAreaValue = value;
            })
            .attributeModifier(new TextAreaForegroundModifier())
            .id('UiComponentTextReverseAnalysis19_02')
        }
        .width('90%')
        .padding(15)
        .backgroundColor('#E3F2FD')
        .borderRadius(10)

        Column({ space: 8 }) {
          Text('测试预期:')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FF5722')
            .width('100%')
            .textAlign(TextAlign.Center)
            .fontStyle(FontStyle.Italic)

          Text('1. 输入文本后文本显示为红色')
            .fontSize(13)
            .fontColor('#444444')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          Text('2. TextInput和TextArea的文本颜色都为红色')
            .fontSize(13)
            .fontColor('#444444')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          Divider()
            .margin({ top: 5, bottom: 5 })

          Text('注意: TextInput/TextArea组件通过modifier方法设置foregroundColor为red。')
            .fontSize(12)
            .fontColor('#FF5722')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontWeight(FontWeight.Bold)
            .fontStyle(FontStyle.Italic)
        }
        .width('90%')
        .padding(15)
        .backgroundColor('#FFF3E0')
        .borderRadius(10)

        Column({ space: 8 }) {
          Text('测试参数:')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontColor('#607d7B')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          Text('• TextInput/TextArea组件modifier方法设置foregroundColor为red')
            .fontSize(13)
            .fontColor('#666666')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          Text('• 输入文本')
            .fontSize(13)
            .fontColor('#666666')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          Text('• 查看文本颜色')
            .fontSize(13)
            .fontColor('#666666')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)
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

class InputForegroundModifier implements AttributeModifier<TextInputAttribute> {
  applyNormalAttribute(instance: TextInputAttribute): void {
    instance.foregroundColor(Color.Red);
  }
}

class TextAreaForegroundModifier implements AttributeModifier<TextAreaAttribute> {
  applyNormalAttribute(instance: TextAreaAttribute): void {
    instance.foregroundColor(Color.Red);
  }
}

