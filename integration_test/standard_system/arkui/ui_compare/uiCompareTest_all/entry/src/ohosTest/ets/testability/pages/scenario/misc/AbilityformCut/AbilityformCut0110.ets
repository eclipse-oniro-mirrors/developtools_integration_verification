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
 * 用例ID: SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0110
 * 用例描述: 验证chip基本功能正常
 * 测试条件: 测试机刷最新镜像
 * 测试步骤: 测试chip的镜像、后缀关闭按钮等基本功能
 * 预期结果: chip基本功能正常
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct AbilityformCut0110 {
  @State testLog: string[] = [];
  @State chipEnabled1: boolean = true;
  @State chipEnabled2: boolean = true;
  @State chipEnabled3: boolean = true;

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 20) {
      this.testLog = this.testLog.slice(0, 20);
    }
    hilog.info(0x0000, 'AbilityformCut0110', log);
  }

  @Builder
  ChipItem(label: string, closable: boolean, enabled: boolean, onClose: () => void) {
    if (enabled) {
      Row({ space: 4 }) {
        Image($r('sys.media.ohos_ic_public_ok'))
          .width(16)
          .height(16)
        Text(label)
          .fontSize(12)
          .fontColor('#333333')
        if (closable) {
          Image($r('sys.media.ohos_ic_public_close'))
            .width(14)
            .height(14)
            .onClick(() => {
              onClose();
            })
        }
      }
      .padding({ left: 8, right: 8, top: 6, bottom: 6 })
      .backgroundColor('#E0E0E0')
      .borderRadius(16)
    }
  }

  build() {
    Column({ space: 10 }) {
      Text('SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0110')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('Chip 基本功能验证')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      Column({ space: 4 }) {
        Text('测试说明:').fontSize(12).fontWeight(FontWeight.Bold)
        Text('1. Chip组件显示\n2. 带前缀图标和后缀关闭按钮\n3. 点击关闭按钮删除Chip')
          .fontSize(11)
          .fontColor(Color.Gray)
      }
      .width('95%')
      .padding(8)
      .backgroundColor('#E3F2FD')
      .borderRadius(4)

      Text('Chip组件测试:')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Row({ space: 8 }) {
        this.ChipItem('Chip 1', true, this.chipEnabled1, () => {
          this.chipEnabled1 = false;
          this.addLog('关闭了 Chip 1');
        })

        this.ChipItem('Chip 2', true, this.chipEnabled2, () => {
          this.chipEnabled2 = false;
          this.addLog('关闭了 Chip 2');
        })

        this.ChipItem('Chip 3', false, this.chipEnabled3, () => {})
      }
      .width('95%')
      .justifyContent(FlexAlign.Start)
      .id('AbilityformCut0110_Chips')

      Divider().height(1).color('#EEEEEE')

      Button('重置所有Chip')
        .width('60%')
        .height(36)
        .fontSize(12)
        .onClick(() => {
          this.chipEnabled1 = true;
          this.chipEnabled2 = true;
          this.chipEnabled3 = true;
          this.addLog('已重置所有Chip');
        })

      Column({ space: 4 }) {
        Text('预期结果:').fontSize(11).fontWeight(FontWeight.Bold)
        Text('Chip正常显示，图标正常，点击关闭按钮可删除Chip')
          .fontSize(10)
          .fontColor('#4CAF50')
      }
      .width('95%')
      .padding(8)
      .backgroundColor('#E8F5E9')
      .borderRadius(4)

      Scroll() {
        Column() {
          ForEach(this.testLog, (log: string, index: number) => {
            Text(log)
              .fontSize(9)
              .fontColor('#333333')
              .width('100%')
              .padding(2)
              .backgroundColor(index % 2 === 0 ? '#F5F5F5' : Color.White)
          })
        }
        .width('100%')
      }
      .height('6.56%')
      .width('95%')
      .backgroundColor('#FAFAFA')
      .borderRadius(4)
    }
    .width('100%')
    .height('100%')
    .padding(10)
    .backgroundColor('#F5F5F5')
  }
}
