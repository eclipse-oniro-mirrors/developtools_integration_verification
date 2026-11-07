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
 * 用例ID: SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0340
 * 用例描述: 验证高级组件popup的镜像功能正常
 * 测试条件: 测试机刷最新镜像
 * 测试步骤: 三个popup设置不同direction，在中文和维语环境对比
 * 预期结果: 布局和direction设置一致
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct AbilityformCut0340 {
  @State testLog: string[] = [];

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 20) {
      this.testLog = this.testLog.slice(0, 20);
    }
    hilog.info(0x0000, 'AbilityformCut0340', log);
  }

  @Builder
  DirectionBox(title: string, dir: Direction) {
    Column({ space: 6 }) {
      Text(title)
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Black)
      Text('这是一个测试文本内容')
        .fontSize(11)
        .fontColor(Color.Gray)
      Row({ space: 8 }) {
        Image($r('sys.media.ohos_ic_public_ok'))
          .width(16)
          .height(16)
        Text('图标在前')
          .fontSize(10)
        Blank()
        Text('文字在后')
          .fontSize(10)
        Image($r('sys.media.ohos_ic_public_more'))
          .width(16)
          .height(16)
      }
      .width('100%')
      Button('确认')
        .height(28)
        .fontSize(11)
        .width('100%')
        .onClick(() => {
          this.addLog(`${title} 确认按钮被点击`);
        })
    }
    .width('90%')
    .padding(12)
    .backgroundColor(Color.White)
    .borderRadius(8)
    .shadow({ radius: 4, color: '#22000000', offsetX: 0, offsetY: 1 })
    .direction(dir)
  }

  build() {
    Column({ space: 8 }) {
      Text('SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0340')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('Popup 镜像功能验证 (direction)')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      Column({ space: 4 }) {
        Text('测试说明:').fontSize(11).fontWeight(FontWeight.Bold)
        Text('三个组件设置不同direction:\nRTL/LTR/Auto\n在中文和维语环境下对比')
          .fontSize(10)
          .fontColor(Color.Gray)
      }
      .width('95%')
      .padding(6)
      .backgroundColor('#E3F2FD')
      .borderRadius(4)

      Text('Direction: RTL (从右到左)')
        .fontSize(11)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      this.DirectionBox('RTL 布局', Direction.Rtl)

      Text('Direction: LTR (从左到右)')
        .fontSize(11)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      this.DirectionBox('LTR 布局', Direction.Ltr)

      Text('Direction: Auto (自动)')
        .fontSize(11)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      this.DirectionBox('Auto 布局', Direction.Auto)

      Column({ space: 4 }) {
        Text('预期结果:').fontSize(10).fontWeight(FontWeight.Bold)
        Text('RTL: 从右到左\nLTR: 从左到右\nAuto: 随系统语言')
          .fontSize(9)
          .fontColor('#4CAF50')
      }
      .width('95%')
      .padding(6)
      .backgroundColor('#E8F5E9')
      .borderRadius(4)
      .id('AbilityformCut0340_Result')

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
      .height('4.1%')
      .width('95%')
      .backgroundColor('#FAFAFA')
      .borderRadius(4)
    }
    .width('100%')
    .height('100%')
    .padding(8)
    .backgroundColor('#F5F5F5')
  }
}
