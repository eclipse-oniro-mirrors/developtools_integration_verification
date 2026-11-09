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
struct UiComponentTextReverseAnalysis15 {
  @State testId: string = 'SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0310';
  @State textInputValue1: string = '';
  @State textInputValue2: string = '';
  @State textInputValue3: string = '';
  @State textAreaValue1: string = '';
  @State textAreaValue2: string = '';
  @State textAreaValue3: string = '';

  build() {
    Scroll() {
      Column({ space: 20 }) {
        Column({ space: 1 }) {
          Text('TextInput组件 modifier width测试:')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontColor('#4CAF50')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          Text('width = 200:')
            .fontSize(13)
            .fontColor('#666666')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          TextInput({ placeholder: 'width=200', text: this.textInputValue1 })
            .onChange((value: string) => {
              this.textInputValue1 = value;
            })
            .attributeModifier(new InputWidthModifier(200))
            .id('UiComponentTextReverseAnalysis15_01')

          Text('width = -100 (异常值):')
            .fontSize(13)
            .fontColor('#666666')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          TextInput({ placeholder: 'width=-100', text: this.textInputValue2 })
            .onChange((value: string) => {
              this.textInputValue2 = value;
            })
            .attributeModifier(new InputWidthModifier(-100))
            .id('UiComponentTextReverseAnalysis15_02')

          Text('width = "auto":')
            .fontSize(13)
            .fontColor('#666666')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          TextInput({ placeholder: 'width=auto', text: this.textInputValue3 })
            .onChange((value: string) => {
              this.textInputValue3 = value;
            })
            .attributeModifier(new InputWidthModifier('auto'))
            .id('UiComponentTextReverseAnalysis15_03')
        }
        .width('90%')
        .padding(15)
        .backgroundColor('#E8F5E9')
        .borderRadius(10)

        Column({ space: 1 }) {
          Text('TextArea组件 modifier width测试:')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontColor('#4CAF50')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          Text('width = 200:')
            .fontSize(13)
            .fontColor('#666666')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          TextArea({ placeholder: 'width=200', text: this.textAreaValue1 })
            .height(30)
            .onChange((value: string) => {
              this.textAreaValue1 = value;
            })
            .attributeModifier(new TextAreaWidthModifier(200))
            .id('UiComponentTextReverseAnalysis15_04')

          Text('width = -100 (异常值):')
            .fontSize(13)
            .fontColor('#666666')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          TextArea({ placeholder: 'width=-100', text: this.textAreaValue2 })
            .height(30)
            .onChange((value: string) => {
              this.textAreaValue2 = value;
            })
            .attributeModifier(new TextAreaWidthModifier(-100))
            .id('UiComponentTextReverseAnalysis15_05')

          Text('width = "auto":')
            .fontSize(13)
            .fontColor('#666666')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          TextArea({ placeholder: 'width=auto', text: this.textAreaValue3 })
            .height(30)
            .onChange((value: string) => {
              this.textAreaValue3 = value;
            })
            .attributeModifier(new TextAreaWidthModifier('auto'))
            .id('UiComponentTextReverseAnalysis15_06')
        }
        .width('90%')
        .padding(15)
        .backgroundColor('#E3F2FD')
        .borderRadius(10)

        Column({ space: 1 }) {
          Text('测试预期:')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FF5722')
            .width('100%')
            .textAlign(TextAlign.Center)
            .fontStyle(FontStyle.Italic)

          Text('1. width=200: 输入框宽度为200')
            .fontSize(13)
            .fontColor('#444444')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          Text('2. width=-100: 异常值时默认自适应窗口大小')
            .fontSize(13)
            .fontColor('#444444')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          Text('3. width="auto": 自适应文本宽度')
            .fontSize(13)
            .fontColor('#444444')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          Divider()
            .margin({ top: 5, bottom: 5 })

          Text('注意: TextInput/TextArea组件通过modifier方法设置width(200, -100, "auto")。')
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

          Text('• TextInput/TextArea组件modifier方法设置width(200, -100, "auto")')
            .fontSize(13)
            .fontColor('#666666')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          Text('• 查看输入框大小')
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

class InputWidthModifier implements AttributeModifier<TextInputAttribute> {
  widthValue: number | string;

  constructor(widthValue: number | string) {
    this.widthValue = widthValue;
  }

  applyNormalAttribute(instance: TextInputAttribute): void {
    instance.width(this.widthValue);
  }
}

class TextAreaWidthModifier implements AttributeModifier<TextAreaAttribute> {
  widthValue: number | string;

  constructor(widthValue: number | string) {
    this.widthValue = widthValue;
  }

  applyNormalAttribute(instance: TextAreaAttribute): void {
    instance.width(this.widthValue);
  }
}

