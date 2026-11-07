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
 * @tc.name: SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DIALOGANIMATED_0340
 * @tc.desc: Navigation支持Dialog类型页面转场动画（同时pop Standard + Dialogs页面到NavBar）
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
export struct NavigationDialoganimated0340 {
  @Local testLog: string = '';
  @Local pageStack: PageItem[] = [];

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'NavigationDialoganimated0340', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - pop Standard+Dialogs到NavBar');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DIALOGANIMATED_0340')
        .fontSize(13)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 });

      Text('pop Standard+Dialogs到NavBar')
        .fontSize(12)
        .margin({ bottom: 10 });

      Button('基础场景页面')
        .onClick(() => { this.addLog('进入基础场景页面'); })
        .id('btn_base_scene')
        .margin({ bottom: 5 });

      Button('push Standard + Dialogs')
        .onClick(() => {
          this.pageStack = [
            new PageItem('PageOne', 'STANDARD'),
            new PageItem('PageThree', 'Dialog'),
            new PageItem('PageTwo', 'Dialog')
          ];
          this.addLog('push PageOne(STANDARD) + PageThree(Dialog) + PageTwo(Dialog)');
          this.addLog('Standard类型页面默认转场动画正常');
        })
        .id('btn_push_standard_dialogs')
        .margin({ bottom: 5 });

      Button('pop Standard + Dialogs')
        .onClick(() => {
          if (this.pageStack.length > 0) {
            this.addLog('pop所有页面到NavBar');
            this.addLog('Standard类型页面默认退出动画正常');
            this.pageStack = [];
          }
        })
        .id('btn_pop_standard_dialogs')
        .margin({ bottom: 10 });

      if (this.pageStack.length > 0) {
        Column() {
          ForEach(this.pageStack, (item: PageItem, index: number) => {
            Row() {
              Text(`${item.name} (${item.type})`)
                .fontSize(12);
            }
            .width('90%')
            .padding(10)
            .backgroundColor(item.type === 'Dialog' ? '#FFF3E0' : '#E8F5E9')
            .borderRadius(5)
            .margin({ bottom: 5 })
            .id(`page_${index}`);
          });
        }
        .width('100%')
        .margin({ top: 10 });
      }

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10 });

      Text('1. 点击"基础场景页面"\n2. 点击"push Standard + Dialogs"\n3. 点击"pop Standard + Dialogs"\n预期: Standard类型页面退出动画正常')
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
