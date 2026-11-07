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
 * @tc.name: SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0960
 * @tc.desc: TextInput文本超长，光标位置不同
 * @tc.level: Level 1
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct FadingedgeTv0960 {
  @Local inputValue: string = '这是一段非常长的文本内容用于测试TextInput组件光标位置不同时的渐隐效果';
  @Local testLog: string = '';

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'FadingedgeTv0960', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - TextInput超长文本光标位置渐隐测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0960')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 });

      Text('TextInput光标位置不同渐隐测试')
        .fontSize(12)
        .fontColor('#666666')
        .margin({ bottom: 15 });

      TextInput({ text: this.inputValue, placeholder: '请输入' })
        .id('textInputCursor')
        .width('90%')
        .height(48)
        .onChange((value: string) => {
          this.inputValue = value;
        })
        .margin({ bottom: 15 });

      Column() {
        Text('测试步骤:')
          .fontSize(11)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 });

        Text('1. 进入大屏，打开有TextInput组件的应用')
          .fontSize(10);
        Text('2. 将光标放置在超长文本的开头、中间、结尾处')
          .fontSize(10);
        Text('3. 查看文本的渐隐情况')
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

        Text('2.1 光标在开头：文本尾部超长字符渐隐')
          .fontSize(10)
          .fontColor('#4CAF50');
        Text('2.2 光标在中间：文本首尾超长字符渐隐')
          .fontSize(10)
          .fontColor('#4CAF50');
        Text('2.3 光标在结尾：文本前部分超长字符渐隐')
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

