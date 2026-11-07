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
 * 用例ID: SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0090
 * 用例描述: 验证chipgroup基本功能正常
 * 测试条件: 测试机刷最新镜像
 * 测试步骤: 测试chipgroup的基本功能
 * 预期结果: chipgroup基本功能正常
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct AbilityformCut0090 {
  @State testLog: string[] = [];
  @State selectedIndex: number = 0;

  private chipItems: string[] = ['芯片1', '芯片2', '芯片3', '芯片4', '芯片5'];

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 20) {
      this.testLog = this.testLog.slice(0, 20);
    }
    hilog.info(0x0000, 'AbilityformCut0090', log);
  }

  build() {
    Column({ space: 10 }) {
      Text('SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0090')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('ChipGroup 基本功能验证')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      Column({ space: 4 }) {
        Text('测试说明:').fontSize(12).fontWeight(FontWeight.Bold)
        Text('1. 模拟ChipGroup组件显示多个Chip\n2. 支持选择功能\n3. 点击Chip验证交互')
          .fontSize(11)
          .fontColor(Color.Gray)
      }
      .width('95%')
      .padding(8)
      .backgroundColor('#E3F2FD')
      .borderRadius(4)

      Text('ChipGroup组件:')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      // 模拟ChipGroup
      Flex({ wrap: FlexWrap.Wrap }) {
        ForEach(this.chipItems, (item: string, index: number) => {
          Button(item)
            .fontSize(12)
            .height(32)
            .padding({ left: 12, right: 12 })
            .margin(4)
            .borderRadius(16)
            .fontColor(this.selectedIndex === index ? Color.White : '#333333')
            .backgroundColor(this.selectedIndex === index ? '#007DFF' : '#E0E0E0')
            .onClick(() => {
              this.selectedIndex = index;
              this.addLog(`选中芯片: ${item}`);
            })
        })
      }
      .width('95%')
      .id('AbilityformCut0090_ChipGroup')

      Divider().height(1).color('#EEEEEE')

      Text('当前选中: ' + this.chipItems[this.selectedIndex])
        .fontSize(12)
        .fontColor('#666666')

      Column({ space: 4 }) {
        Text('预期结果:').fontSize(11).fontWeight(FontWeight.Bold)
        Text('ChipGroup正常显示，点击切换选中状态')
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
