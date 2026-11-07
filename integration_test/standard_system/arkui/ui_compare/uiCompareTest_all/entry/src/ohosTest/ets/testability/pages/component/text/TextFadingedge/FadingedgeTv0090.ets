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
 * @tc.name: SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0090
 * @tc.desc: Search预置输入文本超长
 * @tc.level: Level 1
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct FadingedgeTv0090 {
  @Local searchValue: string = '预置搜索文本内容超长展示也受渐隐效果影响';
  @Local testLog: string = '';

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'FadingedgeTv0090', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - Search预置文本超长渐隐测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0090')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 });

      Text('Search预置输入文本超长渐隐测试')
        .fontSize(12)
        .fontColor('#666666')
        .margin({ bottom: 15 });

      Search({ value: this.searchValue, placeholder: '搜索' })
        .id('searchLongText')
        .width('90%')
        .height(48)
        .onChange((value: string) => {
          this.searchValue = value;
          this.addLog(`输入内容变化: ${value.length}字符`);
        })
        .margin({ bottom: 15 });

      Column() {
        Text('测试步骤:')
          .fontSize(11)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 });

        Text('1. 进入大屏，打开有Search组件的应用')
          .fontSize(10);
        Text('2. 选中Search输入框，进入输入状态')
          .fontSize(10);
        Text('3. 查看输入状态下文本渐隐情况')
          .fontSize(10);
        Text('4. 取消选中，查看非输入状态下渐隐情况')
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

        Text('输入状态: 预置输入文本未展示完整一侧渐隐')
          .fontSize(10)
          .fontColor('#4CAF50');
        Text('未输入状态: 预置输入文本未展示完整一侧渐隐')
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

