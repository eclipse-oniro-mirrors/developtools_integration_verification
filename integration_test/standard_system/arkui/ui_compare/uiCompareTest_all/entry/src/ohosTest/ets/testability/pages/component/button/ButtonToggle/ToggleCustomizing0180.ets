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
 * @tc.name: SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_CUSTOMIZING_0180
 * @tc.desc: 在预览器上查看Toggle自定义样式，预览器显示正常
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct ToggleCustomizing0180 {
  @Local isOn: boolean = true;
  @Local isEnabled: boolean = true;
  @Local testLog: string = '';

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'ToggleCustomizing0180', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - Toggle自定义样式预览器测试');
    this.addLog('isOn: ' + this.isOn + ', isEnabled: ' + this.isEnabled);
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_CUSTOMIZING_0180')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('Toggle自定义样式-预览器测试')
        .fontSize(12)
        .margin({ bottom: 10 })

      Row() {
        Text('isOn: ' + this.isOn)
          .fontSize(14)
          .id('is_on_display')
        Text('  isEnabled: ' + this.isEnabled)
          .fontSize(14)
          .id('enabled_display')
      }.margin({ bottom: 10 })

      Toggle({ type: ToggleType.Switch, isOn: this.isOn })
        .id('toggle_switch')
        .selectedColor('#007DFF')
        .switchPointColor('#FFFFFF')
        .enabled(this.isEnabled)
        .onChange((isOn: boolean) => {
          this.isOn = isOn;
          this.addLog('Toggle状态变化: ' + isOn);
        })

      Text('Checkbox类型:')
        .fontSize(12)
        .margin({ top: 20 })

      Toggle({ type: ToggleType.Checkbox, isOn: this.isOn })
        .id('toggle_checkbox')
        .selectedColor('#007DFF')
        .enabled(this.isEnabled)
        .onChange((isOn: boolean) => {
          this.isOn = isOn;
          this.addLog('Checkbox状态变化: ' + isOn);
        })

      Text('Button类型:')
        .fontSize(12)
        .margin({ top: 20 })

      Toggle({ type: ToggleType.Button, isOn: this.isOn }) {
        Text('Toggle Button')
          .fontSize(12)
      }
      .id('toggle_button')
      .selectedColor('#007DFF')
      .enabled(this.isEnabled)
      .onChange((isOn: boolean) => {
        this.isOn = isOn;
        this.addLog('Button状态变化: ' + isOn);
      })

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('1. 预览器上toggle开启显示isOn:true\n2. 点击toggle关闭显示isOn:false')
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

