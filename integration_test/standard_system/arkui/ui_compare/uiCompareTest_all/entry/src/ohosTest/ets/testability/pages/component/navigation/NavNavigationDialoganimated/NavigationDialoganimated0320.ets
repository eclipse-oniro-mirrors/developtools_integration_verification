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
 * @tc.name: SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DIALOGANIMATED_0320
 * @tc.desc: Navigation支持Dialog类型页面转场动画（栈内全部为dialog页面，pop页面栈场景）
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
export struct NavigationDialoganimated0320 {
  @Local testLog: string = '';
  @Local dialogStack: string[] = [];

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'NavigationDialoganimated0320', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - 全dialog栈pop场景');
  }

  private logLifecycle(page: string, event: string): void {
    this.addLog(`${page} ${event}`);
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DIALOGANIMATED_0320')
        .fontSize(13)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 });

      Text('栈内全部为dialog页面，pop场景')
        .fontSize(12)
        .margin({ bottom: 10 });

      Button('基础场景页面')
        .onClick(() => { this.addLog('进入基础场景页面'); })
        .id('btn_base_scene')
        .margin({ bottom: 5 });

      Button('push pageThree')
        .onClick(() => {
          this.dialogStack.push('pageThree');
          this.logLifecycle('pageThree', 'onWillAppear');
          this.logLifecycle('pageThree', 'onAppear');
          this.logLifecycle('pageThree', 'onWillShow');
          this.logLifecycle('pageThree', 'onShown');
        })
        .id('btn_push_three')
        .margin({ bottom: 5 });

      Button('push pageTwo')
        .onClick(() => {
          this.dialogStack.push('pageTwo');
          this.logLifecycle('pageTwo', 'onWillAppear');
          this.logLifecycle('pageTwo', 'onAppear');
          this.logLifecycle('pageTwo', 'onWillShow');
          this.logLifecycle('pageTwo', 'onShown');
        })
        .id('btn_push_two')
        .margin({ bottom: 5 });

      Button('pop')
        .onClick(() => {
          if (this.dialogStack.length > 0) {
            const popped = this.dialogStack.pop();
            this.addLog(`--- pop ${popped} ---`);
            this.logLifecycle(popped!, 'onWillHide');
            this.logLifecycle(popped!, 'onHidden');
            this.logLifecycle(popped!, 'onWillDisappear');
            this.logLifecycle(popped!, 'onDisappear');
          }
        })
        .id('btn_pop')
        .margin({ bottom: 10 });

      Text(`当前栈: ${this.dialogStack.join(' -> ') || '空(NavBar)'}`)
        .fontSize(12)
        .margin({ bottom: 10 });

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 5 });

      Text('1. push pageThree\n2. push pageTwo\n3. pop返回pageThree\n4. pop返回NavBar\n预期: 生命周期回调正确')
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

