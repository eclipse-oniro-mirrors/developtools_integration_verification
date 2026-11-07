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
struct UiComponentTextReverseAnalysis17 {
  @State testId: string = 'SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0330';
  @State textInputValue: string = '';
  @State textAreaValue: string = '';

  build() {
    Scroll() {
      Column({ space: 20 }) {
        Text('测试用例: SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0330')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FF5722')
          .width('100%')
          .textAlign(TextAlign.Center)
          .margin({ top: 20 })
          .fontStyle(FontStyle.Italic)

        Column({ space: 15 }) {
          Text('TextInput组件 modifier margin测试:')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontColor('#4CAF50')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          Text('margin: 10')
            .fontSize(13)
            .fontColor('#666666')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          Column() {
            TextInput({ placeholder: '请输入文本查看外边距效果', text: this.textInputValue })
              .width('100%')
              .backgroundColor('#F0F0F0')
              .onChange((value: string) => {
                this.textInputValue = value;
              })
              .attributeModifier(new InputMarginModifier())
              .id('UiComponentTextReverseAnalysis17_01')
          }
          .width('100%')
          .backgroundColor('#FFEBEE')
          .padding(5)
        }
        .width('90%')
        .padding(15)
        .backgroundColor('#E8F5E9')
        .borderRadius(10)

        Column({ space: 15 }) {
          Text('TextArea组件 modifier margin测试:')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontColor('#4CAF50')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          Text('margin: 10')
            .fontSize(13)
            .fontColor('#666666')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          Column() {
            TextArea({ placeholder: '请输入多行文本查看外边距效果', text: this.textAreaValue })
              .width('100%')
              .height(100)
              .backgroundColor('#FF0000')
              .onChange((value: string) => {
                this.textAreaValue = value;
              })
              .attributeModifier(new TextAreaMarginModifier())
              .id('UiComponentTextReverseAnalysis17_02')
          }
          .width('100%')
          .backgroundColor('#E3F2FD')
          .padding(5)
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

          Text('1. 组件外边距为10')
            .fontSize(13)
            .fontColor('#444444')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          Text('2. 输入文本后可以看到外边距效果')
            .fontSize(13)
            .fontColor('#444444')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          Text('3. 外边距区域显示为父容器的背景色')
            .fontSize(13)
            .fontColor('#444444')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          Divider()
            .margin({ top: 5, bottom: 5 })

          Text('注意: TextInput/TextArea组件通过modifier方法设置margin为10。')
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

          Text('• TextInput/TextArea组件modifier方法设置margin为10')
            .fontSize(13)
            .fontColor('#666666')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          Text('• 输入文本，查看外边距是否生效')
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

class InputMarginModifier implements AttributeModifier<TextInputAttribute> {
  applyNormalAttribute(instance: TextInputAttribute): void {
    instance.margin(10);
  }
}

class TextAreaMarginModifier implements AttributeModifier<TextAreaAttribute> {
  applyNormalAttribute(instance: TextAreaAttribute): void {
    instance.margin(10);
  }
}

