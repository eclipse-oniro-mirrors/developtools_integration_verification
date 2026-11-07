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
 * @tc.name: SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_MIRROR_0080
 * @tc.desc: toggle组件Switch、Button、Checkbox类型镜像（横竖屏场景）
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct ToggleMirror0080 {
  @Local switchOn: boolean = true;
  @Local buttonOn: boolean = true;
  @Local checkboxOn: boolean = true;
  @Local testLog: string = '';

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'ToggleMirror0080', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - 镜像测试（横竖屏场景）');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_BUTTON_TOGGLE_MIRROR_0080')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('Toggle镜像-横竖屏场景')
        .fontSize(12)
        .margin({ bottom: 15 })

      Text('toggle组件Switch类型:')
        .fontSize(12)
        .alignSelf(ItemAlign.Start)

      Toggle({ type: ToggleType.Switch, isOn: this.switchOn })
        .id('toggle_switch')
        .selectedColor('#007DFF')
        .switchPointColor('#FFFFFF')
        .margin({ top: 5, bottom: 10 })
        .onChange((isOn: boolean) => {
          this.switchOn = isOn;
          this.addLog('Switch: ' + isOn);
        })

      Text('toggle组件Button类型:')
        .fontSize(12)
        .alignSelf(ItemAlign.Start)

      Toggle({ type: ToggleType.Button, isOn: this.buttonOn }) {
        Text('Toggle Button')
          .fontSize(12)
      }
      .id('toggle_button')
      .selectedColor('#007DFF')
      .margin({ top: 5, bottom: 10 })
      .onChange((isOn: boolean) => {
        this.buttonOn = isOn;
        this.addLog('Button: ' + isOn);
      })

      Text('toggle组件Checkbox类型:')
        .fontSize(12)
        .alignSelf(ItemAlign.Start)

      Toggle({ type: ToggleType.Checkbox, isOn: this.checkboxOn })
        .id('toggle_checkbox')
        .selectedColor('#007DFF')
        .margin({ top: 5 })
        .onChange((isOn: boolean) => {
          this.checkboxOn = isOn;
          this.addLog('Checkbox: ' + isOn);
        })

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('1. 切换系统语言为维吾尔语\n2. 竖屏转横屏\n3. Switch开启状态圆形滑块在左侧\n4. Button无变化\n5. Checkbox切换正常')
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

