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
 * @tc.name: SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0010
 * @tc.desc: disable态未超长 - Search组件
 * @tc.level: Level 1
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct FadingedgeTv0010 {
  @Local searchValue: string = '短文本';
  @Local testLog: string = '';

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'FadingedgeTv0010', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - Search disable态未超长渐隐测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0010')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 });

      Text('Search disable态未超长渐隐测试')
        .fontSize(12)
        .fontColor('#666666')
        .margin({ bottom: 15 });

      Search({ value: this.searchValue, placeholder: '搜索' })
        .id('searchDisabled')
        .width('90%')
        .height(48)
        .enabled(false)
        .margin({ bottom: 15 });

      Column() {
        Text('测试条件:')
          .fontSize(11)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 });

        Text('1. 大屏存在Search组件的应用')
          .fontSize(10);
        Text('2. Search组件文字未超长')
          .fontSize(10);
        Text('3. 设置组件.enabled(false)')
          .fontSize(10);
      }
      .width('90%')
      .padding(10)
      .backgroundColor('#E3F2FD')
      .borderRadius(8)
      .alignItems(HorizontalAlign.Start);

      Column() {
        Text('预期结果:')
          .fontSize(11)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 });

        Text('渐隐效果符合UX设计')
          .fontSize(10)
          .fontColor('#4CAF50');
      }
      .width('90%')
      .padding(10)
      .backgroundColor('#E8F5E9')
      .borderRadius(8)
      .alignItems(HorizontalAlign.Start)
      .margin({ top: 10 });

      Scroll() {
        Text(this.testLog)
          .fontSize(9)
          .fontColor('#333333')
          .id('log_text');
      }
      .height('6.56%')
      .width('90%')
      .backgroundColor('#F5F5F5')
      .padding(5)
      .margin({ top: 10 });
    }
    .width('100%')
    .height('100%')
    .padding(15);
  }
}

