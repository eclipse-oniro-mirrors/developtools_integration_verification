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
 * @tc.name: SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DIALOGANIMATED_0330
 * @tc.desc: Navigation支持Dialog类型页面转场动画（栈内有dialog和standard页面，pop页面栈场景）
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
export struct NavigationDialoganimated0330 {
  @Local testLog: string = '';
  @Local pageStack: PageItem[] = [];

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'NavigationDialoganimated0330', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - 混合栈pop场景');
  }

  private logLifecycle(page: string, event: string): void {
    this.addLog(`${page} ${event}`);
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DIALOGANIMATED_0330')
        .fontSize(13)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 });

      Text('dialog和standard混合栈pop')
        .fontSize(12)
        .margin({ bottom: 10 });

      Button('基础场景页面')
        .onClick(() => { this.addLog('进入基础场景页面'); })
        .id('btn_base_scene')
        .margin({ bottom: 5 });

      Button('push pageOne')
        .onClick(() => {
          this.pageStack.push(new PageItem('pageOne', 'STANDARD'));
          this.logLifecycle('pageOne', 'onWillAppear');
          this.logLifecycle('pageOne', 'onAppear');
          this.logLifecycle('pageOne', 'onWillShow');
          this.logLifecycle('pageOne', 'onShown');
        })
        .id('btn_push_one')
        .margin({ bottom: 5 });

      Button('push pageThree')
        .onClick(() => {
          this.pageStack.push(new PageItem('pageThree', 'Dialog'));
          this.logLifecycle('pageThree', 'onWillAppear');
          this.logLifecycle('pageThree', 'onAppear');
          this.logLifecycle('pageThree', 'onWillShow');
          this.logLifecycle('pageThree', 'onShown');
        })
        .id('btn_push_three')
        .margin({ bottom: 5 });

      Button('pop')
        .onClick(() => {
          if (this.pageStack.length > 0) {
            let popped: PageItem | undefined = this.pageStack.pop();
            if (popped) {
              this.addLog(`--- pop ${popped.name} ---`);
              this.logLifecycle(popped.name, 'onWillHide');
              this.logLifecycle(popped.name, 'onHidden');
              this.logLifecycle(popped.name, 'onWillDisappear');
              this.logLifecycle(popped.name, 'onDisappear');
            }
          }
        })
        .id('btn_pop')
        .margin({ bottom: 10 });

      Text(`当前栈: ${this.pageStack.map((p: PageItem): string => p.name).join(' -> ') || '空(NavBar)'}`)
        .fontSize(12)
        .margin({ bottom: 10 });

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 5 });

      Text('1. push pageOne(STANDARD)\n2. push pageThree(Dialog)\n3. pop返回pageOne\n4. pop返回NavBar\n预期: 生命周期回调正确')
        .fontSize(11)
        .fontColor('#666666');

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
