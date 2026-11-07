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
 * 用例ID: SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0330
 * 用例描述: 验证高级组件popup的基本功能正常
 * 测试条件: 测试机刷最新镜像
 * 测试步骤: 使用高级组件popup的示例代码
 * 预期结果: 高级组件popup显示正常
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct AbilityformCut0330 {
  @State testLog: string[] = [];
  @State showPopup: boolean = false;

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 20) {
      this.testLog = this.testLog.slice(0, 20);
    }
    hilog.info(0x0000, 'AbilityformCut0330', log);
  }

  @Builder
  PopupContent() {
    Column({ space: 8 }) {
      Row({ space: 8 }) {
        Image($r('sys.media.ohos_ic_public_more'))
          .width(24)
          .height(24)
        Text('提示标题')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Black)
      }

      Text('这是一个高级Popup组件的示例消息内容。')
        .fontSize(14)
        .fontColor(Color.Gray)

      Row({ space: 12 }) {
        Button('取消')
          .height(32)
          .fontSize(12)
          .backgroundColor('#E0E0E0')
          .fontColor('#333333')
          .layoutWeight(1)
          .onClick(() => {
            this.showPopup = false;
            this.addLog('点击了取消按钮');
          })
        Button('确认')
          .height(32)
          .fontSize(12)
          .backgroundColor('#007DFF')
          .fontColor(Color.White)
          .layoutWeight(1)
          .onClick(() => {
            this.showPopup = false;
            this.addLog('点击了确认按钮');
          })
      }
      .width('100%')
    }
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(8)
    .shadow({ radius: 8, color: '#33000000', offsetX: 0, offsetY: 2 })
  }

  build() {
    Column({ space: 10 }) {
      Text('SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0330')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('高级组件 Popup 基本功能验证')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      Column({ space: 4 }) {
        Text('测试说明:').fontSize(12).fontWeight(FontWeight.Bold)
        Text('1. 点击按钮显示Popup\n2. 验证Popup正常显示\n3. 包含图标、文字、按钮')
          .fontSize(11)
          .fontColor(Color.Gray)
      }
      .width('95%')
      .padding(8)
      .backgroundColor('#E3F2FD')
      .borderRadius(4)

      Button('点击显示Popup')
        .width('80%')
        .height(50)
        .fontSize(14)
        .id('AbilityformCut0330_Button')
        .bindPopup(this.showPopup, {
          builder: this.PopupContent,
          placement: Placement.Bottom,
          onStateChange: (e) => {
            if (e.isVisible === false) {
              this.showPopup = false;
            }
          }
        })
        .onClick(() => {
          this.showPopup = !this.showPopup;
          this.addLog('显示Popup');
        })

      Divider().height(1).color('#EEEEEE')

      Column({ space: 4 }) {
        Text('预期结果:').fontSize(11).fontWeight(FontWeight.Bold)
        Text('Popup正常显示，包含图标、标题、消息和按钮')
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
      .height('8.2%')
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
