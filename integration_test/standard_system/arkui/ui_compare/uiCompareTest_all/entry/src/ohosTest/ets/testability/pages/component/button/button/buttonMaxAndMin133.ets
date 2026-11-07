/**
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

import { uiAppearance } from '@kit.ArkUI';

/**
 * ButtonMaxAndMin133
 * 
 * 测试用例：SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1330
 * 测试目的：验证Button组件的minFontScale和maxFontScale属性
 * 测试场景：minFontScale为20，maxFontScale为3.2
 * 
 * 该测试用例用于验证当设置minFontScale为20（异常值），maxFontScale为3.2时，
 * Button组件在不同字体缩放比例下的字体大小限制行为。
 * 通过点击按钮切换字体缩放比例，观察Button文本的字体大小变化。
 */
@Entry
@Component
struct ButtonMaxAndMin133 {
  @State fontScaleIndex: number = 0;
  @State currentScaleText: string = '当前字体缩放: 1.75';
  private fontScales: number[] = [1.75, 2.0, 3.2];

  /**
   * 切换字体缩放比例
   * 循环切换预定义的字体缩放比例值
   */
  changeFontScale() {
    this.fontScaleIndex = (this.fontScaleIndex + 1) % this.fontScales.length;
    const newScale: number = this.fontScales[this.fontScaleIndex];
    uiAppearance.setFontScale(newScale);
    this.currentScaleText = `当前字体缩放: ${newScale}`;
    console.info(`ButtonMaxAndMin133: 字体缩放已切换为 ${newScale}`);
  }

  build() {
    Column({ space: 20 }) {
      // 测试用例标题
      Text('用例编号：SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_1330')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor('#1F1F1F')
        .textAlign(TextAlign.Center)
        .margin({ bottom: 10 });

      // 测试配置说明
      Text('minFontScale: 20, maxFontScale: 3.2')
        .fontSize(14)
        .fontColor('#666666')
        .textAlign(TextAlign.Center)
        .margin({ bottom: 10 });

      // 当前字体缩放显示
      Text(this.currentScaleText)
        .fontSize(14)
        .fontColor('#007DFF')
        .fontWeight(FontWeight.Medium)
        .textAlign(TextAlign.Center)
        .margin({ bottom: 20 });

      // 字体缩放切换按钮
      Button('切换字体缩放')
        .id('changeSizeButton_133')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .fontColor('#FFFFFF')
        .backgroundColor('#007DFF')
        .width(200)
        .height(50)
        .borderRadius(8)
        .onClick(() => {
          this.changeFontScale();
        })
        .margin({ bottom: 30 });

      // 测试按钮 - 应用minFontScale和maxFontScale
      Button('测试按钮文本内容')
        .id('testButton_133')
        .fontSize(16)
        .fontWeight(FontWeight.Normal)
        .fontColor('#1F1F1F')
        .minFontScale(20)
        .maxFontScale(3.2)
        .width(250)
        .height(60)
        .borderRadius(8)
        .backgroundColor('#F5F5F5')
        .margin({ top: 20 });
    }
    .width('100%')
    .height('100%')
    .padding({ top: 30, bottom: 30, left: 20, right: 20 })
    .backgroundColor('#FFFFFF')
    .justifyContent(FlexAlign.Start)
  }
}
