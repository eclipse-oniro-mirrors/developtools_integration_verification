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
 * 用例ID: SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0190
 * 用例描述: 验证chip适老化正常
 * 测试条件: 测试机刷最新镜像
 * 测试步骤: 调节字体大小到适老化字体大小，观察适老化情况
 * 预期结果: chip组件正常进行适老化
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct AbilityformCut0190 {
  @State testLog: string[] = [];

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 20) {
      this.testLog = this.testLog.slice(0, 20);
    }
    hilog.info(0x0000, 'AbilityformCut0190', log);
  }

  @Builder
  ChipItem(label: string, size: string) {
    Row({ space: 4 }) {
      Image($r('sys.media.ohos_ic_public_ok'))
        .width(size === 'NORMAL' ? 18 : 14)
        .height(size === 'NORMAL' ? 18 : 14)
      Text(label)
        .fontSize(size === 'NORMAL' ? 14 : 12)
        .fontColor('#333333')
    }
    .padding({ left: 10, right: 10, top: size === 'NORMAL' ? 8 : 6, bottom: size === 'NORMAL' ? 8 : 6 })
    .backgroundColor('#E0E0E0')
    .borderRadius(size === 'NORMAL' ? 18 : 14)
  }

  build() {
    Column({ space: 10 }) {
      Text('SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0190')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('Chip 适老化验证')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      Column({ space: 4 }) {
        Text('测试说明:').fontSize(12).fontWeight(FontWeight.Bold)
        Text('1. 在系统设置中调节字体大小\n2. 观察Chip组件字体随之缩放\n3. 验证适老化功能正常')
          .fontSize(11)
          .fontColor(Color.Gray)
      }
      .width('95%')
      .padding(8)
      .backgroundColor('#E3F2FD')
      .borderRadius(4)

      Text('Chip组件 (适老化测试):')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Column({ space: 12 }) {
        this.ChipItem('适老化测试Chip - NORMAL', 'NORMAL')
        this.ChipItem('适老化测试Chip - SMALL', 'SMALL')
      }
      .width('95%')
      .alignItems(HorizontalAlign.Start)
      .id('AbilityformCut0190_Chips')

      Divider().height(1).color('#EEEEEE')

      Column({ space: 4 }) {
        Text('预期结果:').fontSize(11).fontWeight(FontWeight.Bold)
        Text('Chip组件正常进行适老化，字体随系统设置缩放')
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
