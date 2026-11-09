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
 * @tc.name: SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0100
 * @tc.desc: Toggle入参type为必填值验证
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct ToggleInterface0100 {
  @Local testLog: string = '';
  @Local isOn: boolean = true;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'ToggleInterface0100', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - type必填值验证');
    this.addLog('此页面展示正确用法');
    this.addLog('不填type会导致IDE编译报错');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERFACE_0100')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('Toggle入参type必填值验证')
        .fontSize(12)
        .margin({ bottom: 10 })

      Text('正确用法示例:')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10 })

      Toggle({ type: ToggleType.Switch, isOn: this.isOn })
        .id('toggle_correct')
        .margin({ top: 10 })
        .onChange((isOn: boolean) => {
          this.isOn = isOn;
          this.addLog('Toggle状态: ' + isOn);
        })

      Text('预期错误信息：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text("Argument of type '{ isOn: boolean; }' is not assignable to parameter of type '{ type: ToggleType; isOn?: boolean; }'.")
        .fontSize(10)
        .fontColor(Color.Red)
        .margin({ top: 5 })

      Text("Property 'type' is missing in type '{ isOn: boolean; }' but required in type '{ type: ToggleType; isOn?: boolean; }'.")
        .fontSize(10)
        .fontColor(Color.Red)
        .margin({ top: 5 })

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('1. Toggle组件入参type不填写时\n2. 仅设置isOn为true\n3. 期望: IDE编译报错，页面标红')
        .fontSize(11)
        .fontColor('#666666')

      Scroll() {
        Text(this.testLog)
          .fontSize(10)
          .fontColor('#333333')
          .id('log_text')
      }
      .height('6.56%')
      .width('100%')
      .backgroundColor('#F5F5F5')
      .padding(5)
      .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}

