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
struct UiComponentTextReverseAnalysis18 {
  @State testId: string = 'SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0340';
  @State textInputValue: string = '';
  @State textAreaValue: string = '';

  build() {
    Scroll() {
      Column({ space: 20 }) {
        Text('测试用例: SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0340')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FF5722')
          .width('100%')
          .textAlign(TextAlign.Center)
          .margin({ top: 20 })
          .fontStyle(FontStyle.Italic)

        Column({ space: 2 }) {
          Text('TextInput组件 modifier border测试:')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontColor('#4CAF50')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          Text('border: {width:2, color:red, radius:5, style:Dashed}')
            .fontSize(13)
            .fontColor('#666666')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          TextInput({ placeholder: '请输入文本', text: this.textInputValue })
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
            .attributeModifier(new InputBorderModifier())
            .id('UiComponentTextReverseAnalysis18_01')
        }
        .width('90%')
        .padding(15)
        .backgroundColor('#E8F5E9')
        .borderRadius(10)

        Column({ space: 2 }) {
          Text('TextArea组件 modifier border测试:')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontColor('#4CAF50')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          Text('border: {width:2, color:red, radius:5, style:Dashed}')
            .fontSize(13)
            .fontColor('#666666')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          TextArea({ placeholder: '请输入多行文本', text: this.textAreaValue })
            .width('100%')
            .height(100)
            .placeholderFont({ size: 16, weight: 400 })
            .margin(20)
            .fontSize(16)
            .fontColor('#182431')
            .onChange((value: string) => {
              this.textAreaValue = value;
            })
            .attributeModifier(new TextAreaBorderModifier())
            .id('UiComponentTextReverseAnalysis18_02')
        }
        .width('90%')
        .padding(15)
        .backgroundColor('#E3F2FD')
        .borderRadius(10)

        Column({ space: 2 }) {
          Text('测试预期:')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FF5722')
            .width('100%')
            .textAlign(TextAlign.Center)
            .fontStyle(FontStyle.Italic)

          Text('1. 边框宽度为2')
            .fontSize(13)
            .fontColor('#444444')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          Text('2. 边框颜色为红色')
            .fontSize(13)
            .fontColor('#444444')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          Text('3. 边框圆角为5')
            .fontSize(13)
            .fontColor('#444444')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          Text('4. 边框样式为虚线(Dashed)')
            .fontSize(13)
            .fontColor('#444444')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          Divider()
            .margin({ top: 5, bottom: 5 })

          Text('注意: TextInput/TextArea组件通过modifier方法设置border{width:2, color:red, radius:5, style:Dashed}。')
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

        Column({ space: 1 }) {
          Text('测试参数:')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontColor('#607d7B')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          Text('• TextInput/TextArea组件modifier方法设置border{width:2, color:red, radius:5, style:Dashed}')
            .fontSize(13)
            .fontColor('#666666')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          Text('• 查看输入框边框显示')
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

class InputBorderModifier implements AttributeModifier<TextInputAttribute> {
  applyNormalAttribute(instance: TextInputAttribute): void {
    instance.border({
      width: 2,
      color: Color.Red,
      radius: 5,
      style: BorderStyle.Dashed
    });
  }
}

class TextAreaBorderModifier implements AttributeModifier<TextAreaAttribute> {
  applyNormalAttribute(instance: TextAreaAttribute): void {
    instance.border({
      width: 2,
      color: Color.Red,
      radius: 5,
      style: BorderStyle.Dashed
    });
  }
}

