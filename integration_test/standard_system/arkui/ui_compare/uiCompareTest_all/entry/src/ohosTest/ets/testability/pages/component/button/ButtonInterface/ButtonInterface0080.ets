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
 * 用例ID: SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_INTERFACE_0080
 * 用例描述: Button组件的label形式验证
 * 测试条件: 创建button，设置type为ButtonType.Circle
 * 测试步骤: 在button中布局一个Text子组件
 * 预期结果: 编译报错，提示label形式下不能包含子组件（此用例展示正确用法对比）
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct ButtonInterface0080 {
  @State testLog: string[] = [];

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 20) {
      this.testLog = this.testLog.slice(0, 20);
    }
    hilog.info(0x0000, 'ButtonInterface0080', log);
  }

  build() {
    Column({ space: 10 }) {
      Text('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_INTERFACE_0080')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('Button组件label形式验证')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      Column({ space: 4 }) {
        Text('测试说明:').fontSize(12).fontWeight(FontWeight.Bold)
        Text('1. Label形式的Button不能包含子组件\n2. 以下展示正确的label形式用法')
          .fontSize(11)
          .fontColor(Color.Gray)
      }
      .width('95%')
      .padding(8)
      .backgroundColor('#E3F2FD')
      .borderRadius(4)

      Text('正确用法 - Label形式Button:')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      // 正确的label形式Button - Circle类型
      Button('Circle按钮', { type: ButtonType.Circle })
        .width(100)
        .height(100)
        .id('ButtonInterface0080_Circle')
        .onClick(() => {
          this.addLog('点击了Circle按钮');
        })

      // 正确的label形式Button - Capsule类型
      Button('Capsule按钮', { type: ButtonType.Capsule })
        .width(150)
        .height(50)
        .id('ButtonInterface0080_Capsule')
        .onClick(() => {
          this.addLog('点击了Capsule按钮');
        })

      // 正确的label形式Button - Normal类型
      Button('Normal按钮', { type: ButtonType.Normal })
        .width(150)
        .height(50)
        .borderRadius(8)
        .id('ButtonInterface0080_Normal')
        .onClick(() => {
          this.addLog('点击了Normal按钮');
        })

      Divider().height(1).color('#EEEEEE')

      Column({ space: 4 }) {
        Text('预期结果:').fontSize(11).fontWeight(FontWeight.Bold)
        Text('Label形式Button正确显示，不能包含子组件')
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

