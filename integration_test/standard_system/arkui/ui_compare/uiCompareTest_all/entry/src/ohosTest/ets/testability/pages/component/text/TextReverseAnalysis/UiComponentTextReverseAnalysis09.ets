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
struct UiComponentTextReverseAnalysis09 {
  @State testId: string = 'SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0190';
  mutableStyledString: MutableStyledString = new MutableStyledString('哈🇨🇳哈', [{
    start: 0,
    length: 5,
    styledKey: StyledStringKey.FONT,
    styledValue: new TextStyle({ fontColor: Color.Blue, fontSize: LengthMetrics.vp(20) })
  }]);

  @State resultText: string = '';
  @State stylesInfo: string = '';
  @State operationLog: string = '';
  controller: TextController = new TextController();

  async onPageShow() {
    this.controller.setStyledString(this.mutableStyledString);
  }

  build() {
    Scroll() {
      Column({ space: 20 }) {
        Text('测试用例: SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0190')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FF5722')
          .width('100%')
          .textAlign(TextAlign.Center)
          .margin({ top: 20 })
          .fontStyle(FontStyle.Italic)

        Column({ space: 10 }) {
          Text('原始属性字符串:')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontColor('#4CAF50')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          Text(undefined, { controller: this.controller })
            .fontSize(24)
            .width('100%')
            .padding(10)
            .backgroundColor('#F5F5F5')
            .borderRadius(5)
            .copyOption(CopyOptions.InApp)
            .fontStyle(FontStyle.Italic)
        }
        .width('90%')
        .padding(15)
        .backgroundColor('#E8F5E9')
        .borderRadius(10)

        Button('执行 removeString(3, 1)')
          .onClick(() => {
            this.mutableStyledString.removeString(3, 1);
            this.resultText = this.mutableStyledString.getString();
            this.controller.setStyledString(this.mutableStyledString);
            this.operationLog = `执行 removeString(3, 1)\n`;
            this.operationLog += `原始字符串长度: ${this.mutableStyledString.length}\n`;
            this.operationLog += `移除位置: 3\n`;
            this.operationLog += `移除长度: 1\n`;
            this.operationLog += `结果字符串: ${this.resultText}`;
            console.info('StyledString after remove:', this.resultText);
            console.info('StyledString length:', this.mutableStyledString.length);
          })
          .id('UiComponentTextReverseAnalysis09_01')
          .width('80%')
          .fontSize(16)
          .backgroundColor('#2196F3')
          .type(ButtonType.Capsule)
          .labelStyle({ overflow: TextOverflow.Clip,
            maxLines: 1,
            minFontSize: 10,
            maxFontSize: 20,
            font: {
              size: 14,
              weight: FontWeight.Bolder,
              family: 'cursive',
              style: FontStyle.Italic
            }
          })

        Button('获取样式信息 (getStyles)')
          .onClick(() => {
            let styles = this.mutableStyledString.getStyles(0, this.mutableStyledString.length);
            let stylesText = '';
            if (styles.length !== 0) {
              for (let i = 0; i < styles.length; i++) {
                stylesText += `样式 ${i + 1}:\n`;
                stylesText += `  start: ${styles[i].start}\n`;
                stylesText += `  length: ${styles[i].length}\n`;
                stylesText += `  styledKey: ${styles[i].styledKey}\n`;
                if (styles[i].styledKey === StyledStringKey.FONT) {
                  let fontAttr = styles[i].styledValue as TextStyle;
                  stylesText += `  fontColor: ${fontAttr.fontColor}\n`;
                  stylesText += `  fontSize: ${fontAttr.fontSize}\n`;
                }
                stylesText += '\n';
                console.info('StyledString style object start:', styles[i].start);
                console.info('StyledString style object length:', styles[i].length);
                console.info('StyledString style object key:', styles[i].styledKey);
              }
              stylesText += '获取坐标正常';
            } else {
              stylesText = '未找到样式信息';
            }
            this.stylesInfo = stylesText;
            console.info('StyledString styles:', stylesText);
          })
          .id('UiComponentTextReverseAnalysis09_02')
          .width('80%')
          .fontSize(16)
          .backgroundColor('#4CAF50')
          .type(ButtonType.Capsule)
          .labelStyle({ overflow: TextOverflow.Clip,
            maxLines: 1,
            minFontSize: 10,
            maxFontSize: 20,
            font: {
              size: 14,
              weight: FontWeight.Bolder,
              family: 'cursive',
              style: FontStyle.Italic
            }
          })

        if (this.resultText !== '') {
          Column({ space: 10 }) {
            Text('移除后的字符串:')
              .fontSize(14)
              .fontWeight(FontWeight.Bold)
              .fontColor('#FF5722')
              .width('100%')
              .textAlign(TextAlign.Start)
              .fontStyle(FontStyle.Italic)

            Text(this.resultText)
              .fontSize(18)
              .fontColor('#333333')
              .width('100%')
              .padding(10)
              .backgroundColor('#FFF3E0')
              .borderRadius(5)
              .copyOption(CopyOptions.InApp)
              .fontStyle(FontStyle.Italic)
          }
          .width('90%')
          .padding(15)
          .backgroundColor('#FFF3E0')
          .borderRadius(10)
        }

        if (this.stylesInfo !== '') {
          Column({ space: 10 }) {
            Text('样式信息:')
              .fontSize(14)
              .fontWeight(FontWeight.Bold)
              .fontColor('#9C27B0')
              .width('100%')
              .textAlign(TextAlign.Start)
              .fontStyle(FontStyle.Italic)

            Text(this.stylesInfo)
              .fontSize(13)
              .fontColor('#333333')
              .width('100%')
              .padding(10)
              .backgroundColor('#F3E5F5')
              .borderRadius(5)
              .fontFamily('monospace')
              .fontStyle(FontStyle.Italic)
          }
          .width('90%')
          .padding(15)
          .backgroundColor('#F3E5F5')
          .borderRadius(10)
        }

        Column({ space: 8 }) {
          Text('测试预期:')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FF5722')
            .width('100%')
            .textAlign(TextAlign.Center)
            .fontStyle(FontStyle.Italic)

          Text('1. 哈(国旗图标)哈 变为 哈哈')
            .fontSize(13)
            .fontColor('#444444')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          Text('2. getStyles获取坐标正常')
            .fontSize(13)
            .fontColor('#444444')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          Divider()
            .margin({ top: 5, bottom: 5 })

          Text('注意: 属性字符串内容存在占位两个及以上字符且字符串位于文本中间时，移除指定范围字符串功能正常。')
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

          Text('• Text组件添加属性字符串: 哈🇨🇳哈')
            .fontSize(13)
            .fontColor('#666666')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          Text('• removeString(3, 1)')
            .fontSize(13)
            .fontColor('#666666')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          Text('• 查看文本显示')
            .fontSize(13)
            .fontColor('#666666')
            .width('100%')
            .textAlign(TextAlign.Start)
            .fontStyle(FontStyle.Italic)

          Text('• getStyles获取样式信息')
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

