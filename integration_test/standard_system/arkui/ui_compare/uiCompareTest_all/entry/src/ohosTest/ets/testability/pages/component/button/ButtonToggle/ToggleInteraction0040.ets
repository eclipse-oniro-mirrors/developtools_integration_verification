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
 * @tc.name: SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERACTION_0040
 * @tc.desc: Toggle组件交互方式验证（键盘）
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct ToggleInteraction0040 {
  @Local checkboxOn: boolean = true;
  @Local switchOn: boolean = true;
  @Local buttonOn: boolean = true;
  @Local testLog: string = '';
  @Local focusedComponent: string = '';

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'ToggleInteraction0040', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - 键盘交互测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERACTION_0040')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('Toggle键盘交互验证')
        .fontSize(12)
        .margin({ bottom: 10 })

      Text('当前焦点: ' + (this.focusedComponent || '无'))
        .fontSize(12)
        .margin({ bottom: 10 })
        .id('focus_display')

      Row() {
        Text('Checkbox: ')
        Toggle({ type: ToggleType.Checkbox, isOn: this.checkboxOn })
          .id('toggle_checkbox')
          .focusable(true)
          .onFocus(() => {
            this.focusedComponent = 'Checkbox';
            this.addLog('Checkbox获得焦点');
          })
          .onBlur(() => {
            this.addLog('Checkbox失去焦点');
          })
          .onChange((isOn: boolean) => {
            this.checkboxOn = isOn;
            this.addLog('Checkbox: ' + isOn);
          })
      }.margin({ bottom: 10 })

      Row() {
        Text('Switch: ')
        Toggle({ type: ToggleType.Switch, isOn: this.switchOn })
          .id('toggle_switch')
          .focusable(true)
          .onFocus(() => {
            this.focusedComponent = 'Switch';
            this.addLog('Switch获得焦点');
          })
          .onBlur(() => {
            this.addLog('Switch失去焦点');
          })
          .onChange((isOn: boolean) => {
            this.switchOn = isOn;
            this.addLog('Switch: ' + isOn);
          })
      }.margin({ bottom: 10 })

      Row() {
        Text('Button: ')
        Toggle({ type: ToggleType.Button, isOn: this.buttonOn }) {
          Text('Toggle')
            .fontSize(12)
        }
        .id('toggle_button')
        .focusable(true)
        .onFocus(() => {
          this.focusedComponent = 'Button';
          this.addLog('Button获得焦点');
        })
        .onBlur(() => {
          this.addLog('Button失去焦点');
        })
        .onChange((isOn: boolean) => {
          this.buttonOn = isOn;
          this.addLog('Button: ' + isOn);
        })
      }

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('1. 使用键盘方向键/Tab键走焦\n2. 期望: 组件外框存在蓝色边线\n3. 可以在Toggle组件上正常走焦')
        .fontSize(11)
        .fontColor('#666666')

      Scroll() {
        Text(this.testLog)
          .fontSize(10)
          .fontColor('#333333')
          .id('log_text')
      }
      .height('8.2%')
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

