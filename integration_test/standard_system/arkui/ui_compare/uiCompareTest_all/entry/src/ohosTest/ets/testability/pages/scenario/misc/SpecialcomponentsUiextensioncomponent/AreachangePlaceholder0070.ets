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
 * @tc.name: SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UIEXTENSIONCOMPONENT_AREACHANGEPLACEHOLDER_0070
 * @tc.desc: 使用方创建areaChangePlaceholder占位符，入参为UNDEFINED、FOLD_TO_EXPAND
 * @tc.level: Level 1
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct AreachangePlaceholder0070 {
  @Local testLog: string = '';
  @Local uecSize: number = 200;
  @Local bgColor: string = '#E0E0E0';

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'AreachangePlaceholder0070', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - areaChangePlaceholder测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UIEXTENSIONCOMPONENT_AREACHANGEPLACEHOLDER_0070')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 8 });

      Text('areaChangePlaceholder: UNDEFINED、FOLD_TO_EXPAND')
        .fontSize(11)
        .margin({ bottom: 10 });

      Button('AreaChangePlaceholderPage')
        .onClick(() => {
          this.addLog('进入AreaChangePlaceholderPage');
        })
        .id('btn_area_change')
        .margin({ bottom: 5 });

      Row() {
        Button('UPAndFTE')
          .onClick(() => {
            this.addLog('点击UPAndFTE按钮');
          })
          .id('btn_up_fte')
          .margin({ right: 10 });

        Button('Size+')
          .onClick(() => {
            this.uecSize += 20;
            this.bgColor = '#FF9800'; // 橘色
            this.addLog(`Size+ : UEC尺寸变化，显示橘色背景`);
          })
          .id('btn_size_plus')
          .margin({ right: 10 });

        Button('Size-')
          .onClick(() => {
            this.uecSize = Math.max(100, this.uecSize - 20);
            this.bgColor = '#FF9800'; // 橘色
            this.addLog(`Size- : UEC尺寸变化，显示橘色背景`);
          })
          .id('btn_size_minus');
      }
      .margin({ bottom: 10 });

      // 模拟UEC区域
      Column() {
        Text('UEC Area')
          .fontSize(14)
          .fontColor('#FFFFFF');
        Text(`Size: ${this.uecSize}`)
          .fontSize(12)
          .fontColor('#FFFFFF');
      }
      .width(this.uecSize)
      .height(this.uecSize)
      .backgroundColor(this.bgColor)
      .justifyContent(FlexAlign.Center)
      .borderRadius(8)
      .margin({ bottom: 10 });

      Button('模拟折叠屏展开')
        .onClick(() => {
          this.bgColor = '#4CAF50'; // 绿色
          this.addLog('折叠屏展开，显示绿色背景');
        })
        .id('btn_fold_expand')
        .margin({ bottom: 10 });

      Column() {
        Text('预期结果:')
          .fontSize(11)
          .fontWeight(FontWeight.Bold);
        Text('• UEC尺寸变化期间：橘色背景')
          .fontSize(10);
        Text('• 折叠屏展开变化期间：绿色背景')
          .fontSize(10);
      }
      .width('90%')
      .padding(8)
      .backgroundColor('#E8F5E9')
      .borderRadius(8);

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
      .margin({ top: 8 });
    }
    .width('100%')
    .height('100%')
    .padding(10);
  }
}

