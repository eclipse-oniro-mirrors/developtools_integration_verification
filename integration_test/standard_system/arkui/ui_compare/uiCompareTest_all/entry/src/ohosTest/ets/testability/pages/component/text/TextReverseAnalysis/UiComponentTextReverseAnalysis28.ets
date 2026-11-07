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
struct UiComponentTextReverseAnalysis28 {
  @State testId: string = 'SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0660';
  controller: TextController = new TextController();
  mutableStyledString: MutableStyledString = new MutableStyledString('运动45分钟运动45分钟运动45分钟运动45分钟', [
    {
      start: 0,
      length: 5,
      styledKey: StyledStringKey.GESTURE,
      styledValue: new GestureStyle({
        onClick: () => {
          console.info('clickGestureAttr object trigger click event');
        }
      })
    }
  ]);

  build() {
    Scroll() {
      Column({ space: 20 }) {
        Text('测试用例: SUB_ACE_UI_COMPONENT_TEXT_REVERSEANALYSIS_0660')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FF5722')
          .width('100%')
          .textAlign(TextAlign.Center)
          .margin({ top: 20 })
          .fontStyle(FontStyle.Italic)

        Column({ space: 15 }) {
          Text('属性字符串与applyNormalAttribute/applyPressedAttribute组合:')
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
            .attributeModifier(new TextAttributeModifier(this.controller, this.mutableStyledString))
            .id('UiComponentTextReverseAnalysis28_01')
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
            .fontStyle(FontStyle.Italic)
            .width('100%')
            .textAlign(TextAlign.Center)

          Text('1. 普通状态文本颜色为蓝色')
            .fontSize(13)
            .fontColor('#444444')
            .fontStyle(FontStyle.Italic)
            .width('100%')
            .textAlign(TextAlign.Start)

          Text('2. 按压状态文本颜色为红色')
            .fontSize(13)
            .fontColor('#444444')
            .fontStyle(FontStyle.Italic)
            .width('100%')
            .textAlign(TextAlign.Start)

          Text('3. 点击属性字符串触发点击事件')
            .fontSize(13)
            .fontColor('#444444')
            .fontStyle(FontStyle.Italic)
            .width('100%')
            .textAlign(TextAlign.Start)

          Text('4. 点击事件正常生效，且文本颜色发生改变')
            .fontSize(13)
            .fontColor('#444444')
            .fontStyle(FontStyle.Italic)
            .width('100%')
            .textAlign(TextAlign.Start)

          Divider()
            .margin({ top: 5, bottom: 5 })

          Text('注意: applyNormalAttribute、applyPressedAttribute同时将setStyledString与controller绑定。')
            .fontSize(12)
            .fontColor('#FF5722')
            .width('100%')
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
            .fontStyle(FontStyle.Italic)
            .width('100%')
            .textAlign(TextAlign.Start)

          Text('• 添加Text属性字符串')
            .fontSize(13)
            .fontColor('#666666')
            .width('100%')
            .fontStyle(FontStyle.Italic)
            .textAlign(TextAlign.Start)

          Text('• 点击属性字符串')
            .fontSize(13)
            .fontColor('#666666')
            .width('100%')
            .fontStyle(FontStyle.Italic)
            .textAlign(TextAlign.Start)

          Text('• 查看属性变更是否正确')
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

class TextAttributeModifier implements AttributeModifier<TextAttribute> {
  controller: TextController;
  mutableStyledString: MutableStyledString;

  constructor(controller: TextController, mutableStyledString: MutableStyledString) {
    this.controller = controller;
    this.mutableStyledString = mutableStyledString;
  }

  applyNormalAttribute(instance: TextAttribute): void {
    instance.fontColor(Color.Blue).copyOption(CopyOptions.InApp);
    this.controller.setStyledString(this.mutableStyledString);
  }

  applyPressedAttribute(instance: TextAttribute): void {
    instance.fontColor(Color.Red).copyOption(CopyOptions.InApp);
    this.controller.setStyledString(this.mutableStyledString);
  }
}

