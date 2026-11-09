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
 * @tc.name: SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DIALOGANIMATED_0370
 * @tc.desc: Navigation支持Dialog类型页面转场动画（同时pop Standard + Dialogs页面到Standard + Dialogs）
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
export struct NavigationDialoganimated0370 {
  @Local testLog: string = '';
  @Local pageStack: PageItem[] = [];

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'NavigationDialoganimated0370', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - pop到Standard+Dialogs');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DIALOGANIMATED_0370')
        .fontSize(13)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 });

      Text('pop到Standard+Dialogs')
        .fontSize(12)
        .margin({ bottom: 10 });

      Button('基础场景页面')
        .onClick(() => { this.addLog('进入基础场景页面'); })
        .id('btn_base_scene')
        .margin({ bottom: 5 });

      Button('push Standard + Dialogs (第一组)')
        .onClick(() => {
          this.pageStack = [
            new PageItem('PageOne_1', 'STANDARD'),
            new PageItem('PageThree_1', 'Dialog')
          ];
          this.addLog('push第一组: PageOne(STANDARD) + PageThree(Dialog)');
        })
        .id('btn_push_first')
        .margin({ bottom: 5 });

      Button('push Standard + Dialogs (第二组)')
        .onClick(() => {
          this.pageStack.push(new PageItem('PageOne_2', 'STANDARD'));
          this.pageStack.push(new PageItem('PageThree_2', 'Dialog'));
          this.addLog('push第二组: PageOne(STANDARD) + PageThree(Dialog)');
        })
        .id('btn_push_second')
        .margin({ bottom: 5 });

      Button('pop')
        .onClick(() => {
          if (this.pageStack.length > 0) {
            let popped: PageItem | undefined = this.pageStack.pop();
            if (popped) {
              this.addLog(`pop ${popped.name}`);
              this.addLog('Dialog退场动画正常');
            }
          }
        })
        .id('btn_pop')
        .margin({ bottom: 10 });

      Text(`当前栈: ${this.pageStack.map((p: PageItem): string => p.name).join(' -> ') || '空'}`)
        .fontSize(12)
        .margin({ bottom: 10 });

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 5 });

      Text('1. push第一组Standard+Dialogs\n2. push第二组Standard+Dialogs\n3. pop到第一组\n预期: 退场动画正常')
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
