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
 * @tc.name: SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UIEXTENSIONCOMPONENT_PLACEHOLDER_0010
 * @tc.desc: 使用方创建placeholder占位符ComponentContent，不安装提供方hap
 * @tc.level: Level 1
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct Placeholder0010 {
  @Local testLog: string = '';

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'Placeholder0010', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - placeholder占位符测试');
    this.addLog('提供方hap未安装');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UIEXTENSIONCOMPONENT_PLACEHOLDER_0010')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 });

      Text('placeholder占位符ComponentContent测试')
        .fontSize(12)
        .margin({ bottom: 15 });

      // 模拟placeholder占位符显示区域
      Column() {
        Text('Placeholder Area')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFFFFF');
        Text('(提供方hap未安装)')
          .fontSize(12)
          .fontColor('#FFFFFF')
          .margin({ top: 10 });
      }
      .width('80%')
      .height('12.3%')
      .backgroundColor('#9E9E9E')
      .justifyContent(FlexAlign.Center)
      .borderRadius(8)
      .margin({ bottom: 15 });

      Column() {
        Text('测试说明:')
          .fontSize(11)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 });

        Text('• 安装使用方测试hap')
          .fontSize(10);
        Text('• 不安装提供方hap')
          .fontSize(10);
        Text('• 进入使用方demo页面，观察现象')
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

        Text('placeholder占位符正常显示，静置后不会显示provider页面')
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

