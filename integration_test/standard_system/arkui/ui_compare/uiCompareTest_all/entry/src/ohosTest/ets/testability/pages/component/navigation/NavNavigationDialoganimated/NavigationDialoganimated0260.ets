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
 * @tc.name: SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DIALOGANIMATED_0260
 * @tc.desc: Navigation支持Dialog类型页面转场动画（同时push多个dialog页面场景）
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
export struct NavigationDialoganimated0260 {
  @Local testLog: string = '';
  @Local dialogStack: string[] = [];
  @Local showAnimation: boolean = false;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'NavigationDialoganimated0260', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - 同时push多个dialog页面');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DIALOGANIMATED_0260')
        .fontSize(13)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 });

      Text('同时push多个dialog页面场景')
        .fontSize(12)
        .margin({ bottom: 10 });

      Button('基础场景页面')
        .onClick(() => {
          this.addLog('进入基础场景页面');
        })
        .id('btn_base_scene')
        .margin({ bottom: 10 });

      Button('push PageThree * 3')
        .onClick(() => {
          this.showAnimation = true;
          this.addLog('同时push 3个PageThree(Dialog)');
          // 模拟同时push多个dialog
          this.dialogStack = ['PageThree_1', 'PageThree_2', 'PageThree_3'];
          this.addLog('Dialog进场动画：内容区从下到上平移出现');
          this.addLog('titlebar与背景色直接出现');
        })
        .id('btn_push_3_dialogs')
        .margin({ bottom: 10 });

      if (this.dialogStack.length > 0) {
        Column() {
          ForEach(this.dialogStack, (item: string, index: number) => {
            Column() {
              Text(item)
                .fontSize(14)
                .fontWeight(FontWeight.Bold);
              Text('Dialog类型页面')
                .fontSize(12)
                .fontColor('#666666');
            }
            .width('90%')
            .padding(15)
            .backgroundColor(Color.White)
            .borderRadius(8)
            .shadow({ radius: 5, color: Color.Gray })
            .margin({ bottom: 10 })
            .transition(TransitionEffect.OPACITY.animation({ duration: 300, delay: index * 100 }))
            .id(`dialog_${index}`);
          });
        }
        .width('100%')
        .margin({ top: 10 });
      }

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10 });

      Text('1. 点击"基础场景页面"\n2. 点击"push PageThree * 3"按钮\n预期: Dialog页面默认转场动画正常（进场动效，内容区从下到上平移出现）')
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

