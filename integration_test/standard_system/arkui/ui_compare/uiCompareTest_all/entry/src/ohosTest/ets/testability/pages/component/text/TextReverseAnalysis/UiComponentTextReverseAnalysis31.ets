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
struct UiComponentTextReverseAnalysis31 {
  @State testId: string = 'SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0130';
  @State cancelButtonStyle: CancelButtonStyle = CancelButtonStyle.INVISIBLE;

  build() {
    Scroll() {
      Column({ space: 20 }) {
        Text('测试用例: SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0130')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FF5722')
          .width('100%')
          .textAlign(TextAlign.Center)
          .margin({ top: 20 })
          .fontStyle(FontStyle.Italic)

        Column({ space: 15 }) {
          Text('TextInput获焦改变cancelButton类型:')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontColor('#4CAF50')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          Text(`当前cancelButton样式: ${this.cancelButtonStyle === CancelButtonStyle.INVISIBLE ? 'INVISIBLE' : 'CONSTANT'}`)
            .fontSize(13)
            .fontColor('#666666')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          TextInput({ placeholder: '点击输入框获焦' })
            .width('100%')
            .placeholderColor(Color.Grey)
            .placeholderFont({ size: 14, weight: 400 })
            .caretColor(Color.Blue)
            .margin(20)
            .fontSize(14)
            .fontColor(Color.Black)
            .inputFilter('[a-z]', (e) => {
              console.info(JSON.stringify(e));
            })
            .cancelButton({
              style: this.cancelButtonStyle
            })
            .onFocus(() => {
              this.cancelButtonStyle = CancelButtonStyle.CONSTANT;
              console.info('TextInput focused, cancelButton changed to CONSTANT');
            })
            .id('UiComponentTextReverseAnalysis31_01')
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
            .textAlign(TextAlign.Center)
            .fontStyle(FontStyle.Italic)

          Text('1. 初始状态cancelButton为INVISIBLE，不显示删除按钮')
            .fontSize(13)
            .fontColor('#444444')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          Text('2. 点击输入框获焦后，cancelButton变为CONSTANT')
            .fontSize(13)
            .fontColor('#444444')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          Text('3. 出现删除按钮')
            .fontSize(13)
            .fontColor('#444444')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          Divider()
            .margin({ top: 5, bottom: 5 })

          Text('注意: TextInput组件添加cancelButton的style为INVISIBLE，设置获焦改变style为CONSTANT。')
            .fontSize(12)
            .fontColor('#FF5722')
            .width('100%')
            .fontWeight(500)
            .fontStyle(FontStyle.Italic)
            .textAlign(TextAlign.Start)
            .fontWeight(FontWeight.Bold)
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
            .fontWeight(500)
            .fontStyle(FontStyle.Italic)
            .textAlign(TextAlign.Start)

          Text('• TextInput组件添加cancelButton的style为INVISIBLE')
            .fontSize(13)
            .fontColor('#666666')
            .width('100%')
            .fontWeight(500)
            .fontStyle(FontStyle.Italic)
            .textAlign(TextAlign.Start)

          Text('• 设置获焦改变style为CONSTANT')
            .fontSize(13)
            .fontColor('#666666')
            .width('100%')
            .fontWeight(500)
            .fontStyle(FontStyle.Italic)
            .textAlign(TextAlign.Start)

          Text('• 点击输入框')
            .fontSize(13)
            .fontColor('#666666')
            .width('100%')
            .fontWeight(500)
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

