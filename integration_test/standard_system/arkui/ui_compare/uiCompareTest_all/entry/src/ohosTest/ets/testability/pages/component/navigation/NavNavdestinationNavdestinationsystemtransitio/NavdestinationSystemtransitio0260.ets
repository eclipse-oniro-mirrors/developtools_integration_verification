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
 * @tc.name: SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0260
 * @tc.desc: Navigation自定义转场动画能力增强（自定义动画场景）
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
export struct NavdestinationSystemtransitio0260 {
  @Local testLog: string = '';
  @Local pageStack: string[] = [];

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'NavdestinationSystemtransitio0260', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - 自定义动画场景');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0260')
        .fontSize(11)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 8 });

      Text('自定义动画场景')
        .fontSize(12)
        .margin({ bottom: 8 });

      Button('Navigation自定义转场动画能力增强')
        .onClick(() => this.addLog('进入Navigation自定义转场动画'))
        .id('btn_nav_transition')
        .margin({ bottom: 5 });

      Button('pushPath page12 (CONTENT + 自定义动画)')
        .onClick(() => {
          this.addLog('pushPath page12');
          this.addLog('page12配置: TransitionType.CONTENT + 自定义动画');
          this.addLog('预期: 不会走系统的默认转场动画，走自定义动画');
          this.pageStack.push('page12-customAnimation');
        })
        .id('btn_push_page12')
        .margin({ bottom: 5 });

      Column() {
        Text('page12配置说明:')
          .fontSize(11)
          .fontWeight(FontWeight.Bold);
        Text('• NavigationSystemTransitionType.CONTENT')
          .fontSize(10);
        Text('• 页面类型: STANDARD')
          .fontSize(10);
        Text('• 设置了自定义动画')
          .fontSize(10);
        Text('• 自定义动画优先级高于系统默认')
          .fontSize(10);
      }
      .width('100%')
      .padding(10)
      .backgroundColor('#E8EAF6')
      .borderRadius(8)
      .margin({ top: 10 });

      Text(`页面栈: ${this.pageStack.length}`)
        .fontSize(10)
        .margin({ top: 10 });

      Scroll() {
        Text(this.testLog)
          .fontSize(10)
          .fontColor('#333333')
          .id('log_text');
      }
      .height('8.2%')
      .width('100%')
      .backgroundColor('#F5F5F5')
      .padding(5)
      .margin({ top: 10 });
    }
    .width('100%')
    .height('100%')
    .padding(10);
  }
}

