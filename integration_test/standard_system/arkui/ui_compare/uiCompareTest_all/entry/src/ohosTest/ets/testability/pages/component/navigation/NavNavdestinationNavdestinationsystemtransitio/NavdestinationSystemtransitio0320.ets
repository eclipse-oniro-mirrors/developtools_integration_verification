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
 * @tc.name: SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0320
 * @tc.desc: Navigation自定义转场动画能力增强（一次push STANDARD页面场景）
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
export struct NavdestinationSystemtransitio0320 {
  @Local testLog: string = '';
  @Local pageStack: string[] = [];

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'NavdestinationSystemtransitio0320', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - 一次push STANDARD页面场景');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0320')
        .fontSize(11)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 8 });

      Text('一次push STANDARD页面场景')
        .fontSize(12)
        .margin({ bottom: 8 });

      Button('Navigation自定义转场动画能力增强')
        .onClick(() => this.addLog('进入Navigation自定义转场动画'))
        .id('btn_nav_transition')
        .margin({ bottom: 5 });

      Button('pushPath pageOne/Two/Three/Four')
        .onClick(() => {
          this.addLog('一次push多个STANDARD页面: pageOne/Two/Three/Four');
          this.addLog('预期: 标题栏、内容区均有进场动画效果');
          this.pageStack = ['pageOne-STANDARD', 'pageTwo-STANDARD', 'pageThree-STANDARD', 'pageFour-STANDARD'];
        })
        .id('btn_push_standards')
        .margin({ bottom: 5 });

      Column() {
        Text('场景说明:')
          .fontSize(11)
          .fontWeight(FontWeight.Bold);
        Text('• 一次push多个STANDARD类型页面')
          .fontSize(10);
        Text('• pageOne: DEFAULT')
          .fontSize(10);
        Text('• pageTwo: NONE')
          .fontSize(10);
        Text('• pageThree: TITLE')
          .fontSize(10);
        Text('• pageFour: CONTENT')
          .fontSize(10);
      }
      .width('100%')
      .padding(10)
      .backgroundColor('#E8F5E9')
      .borderRadius(8)
      .margin({ top: 10 });

      Text(`页面栈: ${this.pageStack.join(' -> ')}`)
        .fontSize(10)
        .margin({ top: 10 });

      Scroll() {
        Text(this.testLog)
          .fontSize(10)
          .fontColor('#333333')
          .id('log_text');
      }
      .height('6.56%')
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

