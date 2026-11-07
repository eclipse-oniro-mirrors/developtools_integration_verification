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
 * @tc.name: SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERACTION_0050
 * @tc.desc: Toggle组件交互方式验证（鼠标）
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct ToggleInteraction0050 {
  @Local checkboxOn: boolean = true;
  @Local switchOn: boolean = true;
  @Local buttonOn: boolean = true;
  @Local testLog: string = '';
  @Local hoverComponent: string = '';

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'ToggleInteraction0050', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - 鼠标交互测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_INTERACTION_0050')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('Toggle鼠标交互验证')
        .fontSize(12)
        .margin({ bottom: 10 })

      Text('Hover: ' + (this.hoverComponent || '无'))
        .fontSize(12)
        .margin({ bottom: 10 })
        .id('hover_display')

      Row() {
        Text('Checkbox: ')
        Toggle({ type: ToggleType.Checkbox, isOn: this.checkboxOn })
          .id('toggle_checkbox')
          .onHover((isHover: boolean) => {
            this.hoverComponent = isHover ? 'Checkbox' : '';
            this.addLog('Checkbox hover: ' + isHover);
          })
          .onChange((isOn: boolean) => {
            this.checkboxOn = isOn;
            this.addLog('Checkbox clicked: ' + isOn);
          })
      }.margin({ bottom: 10 })

      Row() {
        Text('Switch: ')
        Toggle({ type: ToggleType.Switch, isOn: this.switchOn })
          .id('toggle_switch')
          .onHover((isHover: boolean) => {
            this.hoverComponent = isHover ? 'Switch' : '';
            this.addLog('Switch hover: ' + isHover);
          })
          .onChange((isOn: boolean) => {
            this.switchOn = isOn;
            this.addLog('Switch clicked: ' + isOn);
          })
      }.margin({ bottom: 10 })

      Row() {
        Text('Button: ')
        Toggle({ type: ToggleType.Button, isOn: this.buttonOn }) {
          Text('Toggle')
            .fontSize(12)
        }
        .id('toggle_button')
        .onHover((isHover: boolean) => {
          this.hoverComponent = isHover ? 'Button' : '';
          this.addLog('Button hover: ' + isHover);
        })
        .onChange((isOn: boolean) => {
          this.buttonOn = isOn;
          this.addLog('Button clicked: ' + isOn);
        })
      }

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('1. 鼠标左键点击可切换状态\n2. 鼠标右键不触发切换\n3. hover时存在灰色蒙层')
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

