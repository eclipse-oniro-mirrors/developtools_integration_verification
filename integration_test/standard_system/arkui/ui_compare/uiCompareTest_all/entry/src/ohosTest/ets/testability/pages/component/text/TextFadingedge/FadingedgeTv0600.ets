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
 * @tc.name: SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0600
 * @tc.desc: TextInput文本超长，编辑文本内容
 * @tc.level: Level 1
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct FadingedgeTv0600 {
  @Local inputValue: string = '这是一段非常长的文本内容用于测试TextInput组件的渐隐效果';
  @Local testLog: string = '';

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'FadingedgeTv0600', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - TextInput超长文本编辑渐隐测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0600')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 });

      Text('TextInput超长文本编辑渐隐测试')
        .fontSize(12)
        .fontColor('#666666')
        .margin({ bottom: 15 });

      TextInput({ text: this.inputValue, placeholder: '请输入' })
        .id('textInputLong')
        .width('90%')
        .height(48)
        .onChange((value: string) => {
          this.inputValue = value;
          this.addLog(`文本变化: ${value.length}字符`);
        })
        .margin({ bottom: 15 });

      Column() {
        Text('测试步骤:')
          .fontSize(11)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 });

        Text('1. 进入大屏，打开有TextInput组件的应用')
          .fontSize(10);
        Text('2.1 复制超长文本内容，查看渐隐')
          .fontSize(10);
        Text('2.2 剪切文本使字符减少为未超长')
          .fontSize(10);
        Text('2.3 粘贴字符使文本由未超长增加为超长')
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

        Text('2.1 复制不影响超长文本渐隐效果')
          .fontSize(10)
          .fontColor('#4CAF50');
        Text('2.2 剪切后，由渐隐转为无渐隐')
          .fontSize(10)
          .fontColor('#4CAF50');
        Text('2.3 粘贴后，由无渐隐转为有渐隐')
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
      .height('4.92%')
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

