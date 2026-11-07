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
 * 用例ID: SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0040
 * 用例描述: 单选类分段按钮：模拟SegmentButton组件maxFontScale参数设置为2
 * 测试条件: maxFontScale参数设置为2
 * 测试步骤: 适老化档位依次设置标准档到大6档，观察字体大小和字体粗细
 * 预期结果: 各档位字体按照适老化规则缩放，最大2倍
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct AbilityformCut0040 {
  @State selectedIndex: number = 0;
  @State testLog: string[] = [];

  private options: string[] = ['选项一', '选项二', '选项三'];

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 20) {
      this.testLog = this.testLog.slice(0, 20);
    }
    hilog.info(0x0000, 'AbilityformCut0040', log);
  }

  build() {
    Column({ space: 10 }) {
      Text('SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0040')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('分段按钮 maxFontScale=2 适老化测试')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      Column({ space: 4 }) {
        Text('适老化缩放规则 (maxFontScale=2):').fontSize(11).fontWeight(FontWeight.Bold)
        Text('标准档: 1倍 | 大1档: 1.15倍 | 大2档: 1.3倍')
          .fontSize(9).fontColor(Color.Gray)
        Text('大3档: 1.45倍 | 大4档: 1.75倍 | 大5-6档: 2倍(上限)')
          .fontSize(9).fontColor(Color.Gray)
      }
      .width('95%')
      .padding(6)
      .backgroundColor('#FFF8E1')
      .borderRadius(4)

      Text('分段按钮 (maxFontScale=2):')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      // 模拟分段按钮
      Row() {
        ForEach(this.options, (option: string, index: number) => {
          Button(option)
            .fontSize(14)
            .maxFontScale(2)
            .fontColor(this.selectedIndex === index ? Color.White : Color.Black)
            .backgroundColor(this.selectedIndex === index ? '#007DFF' : '#E0E0E0')
            .borderRadius(index === 0 ? { topLeft: 20, bottomLeft: 20 } :
              (index === this.options.length - 1 ? { topRight: 20, bottomRight: 20 } : 0))
            .height(40)
            .layoutWeight(1)
            .onClick(() => {
              this.selectedIndex = index;
              this.addLog(`选中: ${option}`);
            })
        })
      }
      .width('90%')
      .id('AbilityformCut0040_SegmentButton')

      Divider().height(1).color('#EEEEEE')

      Text('当前选中: ' + this.options[this.selectedIndex])
        .fontSize(12)
        .fontColor('#666666')

      Column({ space: 4 }) {
        Text('预期结果:').fontSize(11).fontWeight(FontWeight.Bold)
        Text('字体随适老化档位缩放，大5-6档达到最大2倍后不再增大')
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
