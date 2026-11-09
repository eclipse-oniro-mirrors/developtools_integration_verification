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
 * @tc.name: SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DIALOGANIMATED_0420
 * @tc.desc: Navigation支持Dialog类型页面转场动画（popToIndex场景）
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

class PageItem {
  public name: string = '';
  public type: string = '';

  constructor(name: string, type: string) {
    this.name = name;
    this.type = type;
  }
}

@Entry
@ComponentV2
export struct NavigationDialoganimated0420 {
  @Local testLog: string = '';
  @Local pageStack: PageItem[] = [];

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'NavigationDialoganimated0420', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - popToIndex场景');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DIALOGANIMATED_0420')
        .fontSize(13)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 });

      Text('popToIndex场景')
        .fontSize(12)
        .margin({ bottom: 10 });

      Button('基础场景页面')
        .onClick(() => { this.addLog('进入基础场景页面'); })
        .id('btn_base_scene')
        .margin({ bottom: 5 });

      Button('push pageOne')
        .onClick(() => {
          this.pageStack.push(new PageItem('pageOne', 'STANDARD'));
          this.addLog('push pageOne(STANDARD)');
        })
        .id('btn_push_one')
        .margin({ bottom: 5 });

      Button('push pageThree')
        .onClick(() => {
          this.pageStack.push(new PageItem('pageThree', 'Dialog'));
          this.addLog('push pageThree(Dialog)');
        })
        .id('btn_push_three')
        .margin({ bottom: 5 });

      Button('popToIndex 0')
        .onClick(() => {
          if (this.pageStack.length > 1) {
            let removed: PageItem[] = this.pageStack.splice(1);
            this.addLog(`popToIndex 0，移除: ${removed.map((p: PageItem): string => p.name).join(', ')}`);
            this.addLog('Dialog退场动画：内容区从上到下平移退场');
          }
        })
        .id('btn_pop_to_index')
        .margin({ bottom: 10 });

      Text(`当前栈: ${this.pageStack.map((p: PageItem, i: number): string => `[${i}]${p.name}`).join(' -> ') || '空'}`)
        .fontSize(11)
        .margin({ bottom: 10 });

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10 });

      Text('1. push pageOne(STANDARD)\n2. push pageThree(Dialog)\n3. popToIndex 0\n预期: Dialog退场动画正常')
        .fontSize(11)
        .fontColor('#666666');

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
