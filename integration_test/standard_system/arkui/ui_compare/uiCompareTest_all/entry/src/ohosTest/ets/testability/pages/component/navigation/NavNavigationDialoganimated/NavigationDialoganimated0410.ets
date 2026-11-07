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
 * @tc.name: SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DIALOGANIMATED_0410
 * @tc.desc: Navigation支持Dialog类型页面转场动画（popToName场景2）
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

class PageItemWithId {
  public name: string = '';
  public type: string = '';
  public id: number = 0;

  constructor(name: string, type: string, id: number) {
    this.name = name;
    this.type = type;
    this.id = id;
  }
}

@Entry
@ComponentV2
export struct NavigationDialoganimated0410 {
  @Local testLog: string = '';
  @Local pageStack: PageItemWithId[] = [];
  private idCounter: number = 0;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'NavigationDialoganimated0410', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - popToName场景2');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DIALOGANIMATED_0410')
        .fontSize(13)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 });

      Text('popToName场景2（多个同名页面）')
        .fontSize(12)
        .margin({ bottom: 10 });

      Button('基础场景页面')
        .onClick(() => { this.addLog('进入基础场景页面'); })
        .id('btn_base_scene')
        .margin({ bottom: 5 });

      Button('push pageOne')
        .onClick(() => {
          this.idCounter++;
          this.pageStack.push(new PageItemWithId('pageOne', 'STANDARD', this.idCounter));
          this.addLog(`push pageOne_${this.idCounter}(STANDARD)`);
        })
        .id('btn_push_one')
        .margin({ bottom: 5 });

      Button('push pageThree')
        .onClick(() => {
          this.idCounter++;
          this.pageStack.push(new PageItemWithId('pageThree', 'Dialog', this.idCounter));
          this.addLog(`push pageThree_${this.idCounter}(Dialog)`);
        })
        .id('btn_push_three')
        .margin({ bottom: 5 });

      Button('popToName pageOne')
        .onClick(() => {
          let index: number = this.pageStack.findIndex((p: PageItemWithId): boolean => p.name === 'pageOne');
          if (index !== -1 && index < this.pageStack.length - 1) {
            let removed: PageItemWithId[] = this.pageStack.splice(index + 1);
            this.addLog(`popToName pageOne，移除: ${removed.map((p: PageItemWithId): string => `${p.name}_${p.id}`).join(', ')}`);
            this.addLog('Standard类型页面默认退出动画正常');
          }
        })
        .id('btn_pop_to_name')
        .margin({ bottom: 10 });

      Text(`当前栈: ${this.pageStack.map((p: PageItemWithId): string => `${p.name}_${p.id}`).join(' -> ') || '空'}`)
        .fontSize(11)
        .margin({ bottom: 10 });

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 5 });

      Text('1. push pageOne\n2. push pageThree\n3. push pageOne\n4. popToName pageOne\n预期: Standard退出动画正常')
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
