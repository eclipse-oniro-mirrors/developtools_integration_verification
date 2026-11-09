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
 * @tc.name: SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UIEXTENSIONCOMPONENT_DPI_0040
 * @tc.desc: 不设置DPI跟随策略，验证宿主端页面会跟随系统DPI调整而变化
 * @tc.level: Level 1
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct Dpi0040 {
  @Local testLog: string = '';

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'Dpi0040', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - 不设置DPI跟随策略测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UIEXTENSIONCOMPONENT_DPI_0040')
        .fontSize(11)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 });

      Text('不设置DPI跟随策略')
        .fontSize(12)
        .margin({ bottom: 15 });

      Column() {
        Text('测试步骤:')
          .fontSize(11)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 });

        Text('1. 进入demo页面')
          .fontSize(10);
        Text('2. 调整系统DPI')
          .fontSize(10);
        Text('   手机: 设置-显示亮度-字体大小和界面缩放')
          .fontSize(9)
          .fontColor('#666666');
        Text('   PC: 设置-显示亮度-显示大小')
          .fontSize(9)
          .fontColor('#666666');
        Text('3. 应用退出重启后查看日志')
          .fontSize(10);
        Text('   hilog | grep WMSUiext')
          .fontSize(9)
          .fontColor('#666666');
      }
      .width('90%')
      .padding(10)
      .backgroundColor('#FFF3E0')
      .borderRadius(8)
      .alignItems(HorizontalAlign.Start);

      Column() {
        Text('预期结果:')
          .fontSize(11)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 });

        Text('调整系统DPI后，宿主端页面及Ability侧页面跟随变化')
          .fontSize(10)
          .fontColor('#4CAF50');
      }
      .width('90%')
      .padding(10)
      .backgroundColor('#E8F5E9')
      .borderRadius(8)
      .alignItems(HorizontalAlign.Start)
      .margin({ top: 15 });

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
      .margin({ top: 15 });
    }
    .width('100%')
    .height('100%')
    .padding(15);
  }
}

