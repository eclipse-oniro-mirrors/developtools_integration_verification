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
 * @tc.name: SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0290
 * @tc.desc: Navigation自定义转场动画能力增强（跳转HAR场景）
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
export struct NavdestinationSystemtransitio0290 {
  @Local testLog: string = '';
  @Local pageStack: string[] = [];

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'NavdestinationSystemtransitio0290', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - 跳转HAR场景');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0290')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 4 });

      Text('跳转HAR场景')
        .fontSize(11)
        .margin({ bottom: 4 });

      Button('test6页面')
        .onClick(() => this.addLog('进入test6页面'))
        .id('btn_test6')
        .margin({ bottom: 2 });

      Button('pushHarPageOne')
        .onClick(() => {
          this.addLog('pushHarPageOne - 进入HAR页面');
          this.pageStack.push('HarPageOne');
        })
        .id('btn_push_har')
        .margin({ bottom: 2 });

      Scroll() {
        Column() {
          ForEach(['HarPage01', 'HarPage02', 'HarPage03', 'HarPage04', 'HarPage05', 'HarPage06', 'HarPage07', 'HarPage8'], (page: string, index: number) => {
            Button(`pushPath ${page}`)
              .onClick(() => {
                this.addLog(`pushPath ${page}`);
                this.addLog(this.getHarExpected(index));
                this.pageStack.push(page);
              })
              .id(`btn_push_${page}`)
              .margin({ bottom: 2 });
          });
        }
      }
      .height('16.39%');

      Text(`页面栈: ${this.pageStack.length}`)
        .fontSize(9);

      Scroll() {
        Text(this.testLog)
          .fontSize(9)
          .fontColor('#333333')
          .id('log_text');
      }
      .height('6.56%')
      .width('100%')
      .backgroundColor('#F5F5F5')
      .padding(5)
      .margin({ top: 2 });
    }
    .width('100%')
    .height('100%')
    .padding(10);
  }

  private getHarExpected(index: number): string {
    let expectations: string[] = [
      '预期: 标题栏、内容区均有进场动画',
      '预期: 均无进场动画',
      '预期: 标题栏有进场动画',
      '预期: 内容区有进场动画',
      '预期: 内容区有动画效果',
      '预期: 均无动画效果',
      '预期: 标题栏无动画效果',
      '预期: 内容区有动画效果'
    ];
    return expectations[index];
  }
}

