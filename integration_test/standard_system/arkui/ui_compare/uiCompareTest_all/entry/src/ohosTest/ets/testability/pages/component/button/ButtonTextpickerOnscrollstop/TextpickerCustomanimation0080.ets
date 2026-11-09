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

/**
 * @tc.name: SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_CUSTOMANIMATION_0080
 * @tc.desc: TextPicker单列range为Resource：自定义样式后动态切换样式
 * @tc.level: Level 1
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct TextpickerCustomanimation0080 {
  @Local selectedIndex: number = 1;
  @Local testLog: string = '';
  @Local useCustomStyle: boolean = false;
  private fruits: string[] = ['苹果', '香蕉', '橙子', '西瓜', '葡萄', '芒果', '草莓', '樱桃'];

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'TextpickerCustomanimation0080', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - 自定义样式动态切换测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_CUSTOMANIMATION_0080')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('TextPicker自定义样式动态切换')
        .fontSize(12)
        .margin({ bottom: 10 })

      Row() {
        Button('自定义_切换_Textpicker')
          .id('btn_switch_style')
          .fontSize(12)
          .onClick(() => {
            this.useCustomStyle = !this.useCustomStyle;
            this.addLog('切换样式: ' + (this.useCustomStyle ? '自定义' : '默认'));
          })
      }.margin({ bottom: 10 })

      Text('当前样式: ' + (this.useCustomStyle ? '自定义样式' : '默认样式'))
        .fontSize(12)
        .id('style_display')

      if (this.useCustomStyle) {
        TextPicker({ range: this.fruits, selected: this.selectedIndex })
          .id('text_picker_custom')
          .disappearTextStyle({ color: Color.Red, font: { size: 20, weight: FontWeight.Regular } })
          .textStyle({ color: Color.Green, font: { size: 12, weight: FontWeight.Regular } })
          .selectedTextStyle({ color: Color.Blue, font: { size: 16, weight: FontWeight.Bold } })
          .onChange((value: string | string[], index: number | number[]) => {
            if (typeof index === 'number') {
              this.selectedIndex = index;
              this.addLog('自定义样式选择: ' + value);
            }
          })
      } else {
        TextPicker({ range: this.fruits, selected: this.selectedIndex })
          .id('text_picker_default')
          .onChange((value: string | string[], index: number | number[]) => {
            if (typeof index === 'number') {
              this.selectedIndex = index;
              this.addLog('默认样式选择: ' + value);
            }
          })
      }

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('1. 点击按钮切换样式\n2. 正常滑动/快速抛滑\n3. 期望: 列表停在垂直居中位置')
        .fontSize(11)
        .fontColor('#666666')

      Scroll() {
        Text(this.testLog)
          .fontSize(10)
          .fontColor('#333333')
          .id('log_text')
      }
      .height('6.56%')
      .width('100%')
      .backgroundColor('#F5F5F5')
      .padding(5)
      .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}

