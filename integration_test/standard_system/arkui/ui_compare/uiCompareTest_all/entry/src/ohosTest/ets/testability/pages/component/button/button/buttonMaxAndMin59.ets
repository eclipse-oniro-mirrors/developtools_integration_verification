/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
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
 * ButtonMaxAndMin59 - Button组件minFontScale和maxFontScale测试页面
 * 
 * 测试用例编号：SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0590
 * 测试场景：minFontScale为0.5，maxFontScale为undefined的字体缩放测试
 * 
 * 功能说明：
 * - 测试Button组件在不同字体缩放比例下的表现
 * - 验证minFontScale和maxFontScale属性的正确性
 * - 通过change size按钮切换不同的字体缩放比例（1.75、2.0、3.2）
 */
@Entry
@Component
struct ButtonMaxAndMin59 {
  // 当前字体缩放索引，用于循环切换不同的缩放比例
  @State fontScaleIndex: number = 0;
  
  // 字体缩放比例数组，包含三个测试值：1.75倍、2.0倍、3.2倍
  private fontScales: number[] = [1.75, 2.0, 3.2];
  
  // 当前字体缩放比例显示文本
  @State currentScaleText: string = '当前缩放: 1.75x';

  /**
   * 切换字体缩放比例
   * 功能：循环切换字体缩放比例，并更新显示文本
   */
  changeFontScale() {
    // 计算下一个缩放索引（循环）
    this.fontScaleIndex = (this.fontScaleIndex + 1) % this.fontScales.length;
    
    // 获取新的缩放比例
    const newScale = this.fontScales[this.fontScaleIndex];
    
    // 更新显示文本
    this.currentScaleText = `当前缩放: ${newScale}x`;
    
    // 设置系统字体缩放比例
    uiAppearance.setFontScale(newScale);
    
    // 输出日志，便于调试
    console.info(`ButtonMaxAndMin59: Font scale changed to ${newScale}`);
  }

  /**
   * 构建UI界面
   */
  build() {
    Column({ space: 20 }) {
      // 用例编号标题
      Text('用例编号：SUB_ACE_UI_COMPONENT_BUTTON_MAXANDMIN_0590')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .fontColor('#333333')
        .margin({ bottom: 10 });

      // 配置信息说明
      Text('minFontScale: 0.5, maxFontScale: undefined')
        .fontSize(14)
        .fontColor('#666666')
        .margin({ bottom: 5 });

      // 当前缩放比例显示
      Text(this.currentScaleText)
        .fontSize(12)
        .fontColor('#999999')
        .margin({ bottom: 20 });

      // 说明文本
      Text('点击下方按钮可以切换不同的字体缩放比例，测试Button组件的字体缩放功能')
        .fontSize(12)
        .fontColor('#888888')
        .margin({ bottom: 20 })
        .padding({ left: 10, right: 10 })
        .textAlign(TextAlign.Center);

      // 字体缩放切换按钮
      Button('change size')
        .id('changeSizeButton_59')
        .fontSize(14)
        .fontWeight(FontWeight.Medium)
        .width(200)
        .height(40)
        .backgroundColor('#007DFF')
        .fontColor('#FFFFFF')
        .onClick(() => {
          this.changeFontScale();
        })
        .margin({ bottom: 30 });

      // 测试按钮 - 主要测试对象
      // 配置了minFontScale为0.5，maxFontScale为undefined（不设置）
      Button('测试按钮')
        .id('testButton_59')
        .fontSize(16)
        .fontWeight(FontWeight.Normal)
        .minFontScale(0.5)
        .width(200)
        .height(50)
        .backgroundColor('#F0F0F0')
        .fontColor('#000000')
        .margin({ top: 10 });

      // 底部说明文本
      Text('说明：此按钮设置了minFontScale=0.5，maxFontScale未设置，\n在不同字体缩放比例下，按钮字体大小会在限制范围内调整')
        .fontSize(11)
        .fontColor('#AAAAAA')
        .margin({ top: 20 })
        .padding({ left: 10, right: 10 })
        .textAlign(TextAlign.Center)
        .lineHeight(18);
    }
    .width('100%')
    .height('100%')
    .padding({ top: 30, bottom: 30, left: 20, right: 20 })
    .backgroundColor(0xFFFFFF)
    .justifyContent(FlexAlign.Start)
  }
}
