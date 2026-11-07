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
struct UiComponentTextReverseAnalysis20 {
  @State testId: string = 'SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0370';
  @State textInputValue: string = '';
  @State textAreaValue: string = '';
  @State textInputClickCount: number = 0;
  @State textAreaClickCount: number = 0;

  build() {
    Scroll() {
      Column({ space: 20 }) {
        Text('测试用例: SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0370')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FF5722')
          .width('100%')
          .textAlign(TextAlign.Center)
          .margin({ top: 20 })
          .fontStyle(FontStyle.Italic)

        Column({ space: 15 }) {
          Text('TextInput组件 modifier onClick测试:')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontColor('#4CAF50')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          Text(`点击次数: ${this.textInputClickCount}`)
            .fontSize(14)
            .fontColor('#666666')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          TextInput({ placeholder: '点击输入框触发onClick事件', text: this.textInputValue })
            .width('100%')
            .onChange((value: string) => {
              this.textInputValue = value;
            })
            .attributeModifier(new InputClickModifier(() => {
              this.textInputClickCount++;
              console.info('TextInput clicked, count:', this.textInputClickCount);
            }))
            .id('UiComponentTextReverseAnalysis20_01')
        }
        .width('90%')
        .padding(15)
        .backgroundColor('#E8F5E9')
        .borderRadius(10)

        Column({ space: 15 }) {
          Text('TextArea组件 modifier onClick测试:')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontColor('#4CAF50')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          Text(`点击次数: ${this.textAreaClickCount}`)
            .fontSize(14)
            .fontColor('#666666')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          TextArea({ placeholder: '点击输入框触发onClick事件', text: this.textAreaValue })
            .width('100%')
            .height(100)
            .onChange((value: string) => {
              this.textAreaValue = value;
            })
            .attributeModifier(new TextAreaClickModifier(() => {
              this.textAreaClickCount++;
              console.info('TextArea clicked, count:', this.textAreaClickCount);
            }))
            .id('UiComponentTextReverseAnalysis20_02')
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

          Text('1. 点击TextInput输入框触发onClick事件')
            .fontSize(13)
            .fontColor('#444444')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          Text('2. 点击TextArea输入框触发onClick事件')
            .fontSize(13)
            .fontColor('#444444')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          Text('3. 点击次数会增加')
            .fontSize(13)
            .fontColor('#444444')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          Divider()
            .margin({ top: 5, bottom: 5 })

          Text('注意: TextInput/TextArea组件通过modifier方法设置onClick事件。')
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

          Text('• TextInput/TextArea组件modifier方法设置onClick')
            .fontSize(13)
            .fontColor('#666666')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          Text('• 点击输入框')
            .fontSize(13)
            .fontColor('#666666')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          Text('• 查看是否触发onClick事件')
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

class InputClickModifier implements AttributeModifier<TextInputAttribute> {
  onClickCallback: () => void;

  constructor(onClickCallback: () => void) {
    this.onClickCallback = onClickCallback;
  }

  applyNormalAttribute(instance: TextInputAttribute): void {
    instance.onClick(this.onClickCallback);
  }
}

class TextAreaClickModifier implements AttributeModifier<TextAreaAttribute> {
  onClickCallback: () => void;

  constructor(onClickCallback: () => void) {
    this.onClickCallback = onClickCallback;
  }

  applyNormalAttribute(instance: TextAreaAttribute): void {
    instance.onClick(this.onClickCallback);
  }
}

