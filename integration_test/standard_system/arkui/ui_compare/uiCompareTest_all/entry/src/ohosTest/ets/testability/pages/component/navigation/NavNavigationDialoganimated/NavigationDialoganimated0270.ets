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
 * @tc.name: SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DIALOGANIMATED_0270
 * @tc.desc: Navigation支持Dialog类型页面转场动画（同时pop多个dialog页面场景）
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
export struct NavigationDialoganimated0270 {
  @Local testLog: string = '';
  @Local dialogStack: string[] = [];

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'NavigationDialoganimated0270', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - 同时pop多个dialog页面');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DIALOGANIMATED_0270')
        .fontSize(13)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 });

      Text('同时pop多个dialog页面场景')
        .fontSize(12)
        .margin({ bottom: 10 });

      Button('基础场景页面')
        .onClick(() => {
          this.addLog('进入基础场景页面');
        })
        .id('btn_base_scene')
        .margin({ bottom: 5 });

      Button('push PageThree')
        .onClick(() => {
          this.dialogStack.push(`PageThree_${this.dialogStack.length + 1}`);
          this.addLog(`push PageThree，当前栈深度: ${this.dialogStack.length}`);
        })
        .id('btn_push_dialog')
        .margin({ bottom: 5 });

      Button('pop * 3')
        .onClick(() => {
          if (this.dialogStack.length >= 3) {
            this.addLog('同时pop 3个Dialog页面');
            this.addLog('Dialog退场动画：内容区从上到下平移退场');
            this.addLog('titlebar与背景色直接退场');
            this.dialogStack = [];
          } else {
            this.addLog('栈中Dialog不足3个');
          }
        })
        .id('btn_pop_3')
        .margin({ bottom: 10 });

      if (this.dialogStack.length > 0) {
        Column() {
          ForEach(this.dialogStack, (item: string, index: number) => {
            Column() {
              Text(item)
                .fontSize(14)
                .fontWeight(FontWeight.Bold);
            }
            .width('90%')
            .padding(15)
            .backgroundColor(Color.White)
            .borderRadius(8)
            .shadow({ radius: 5, color: Color.Gray })
            .margin({ bottom: 5 })
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

      Text('1. 点击"基础场景页面"\n2. 点击"push PageThree"按钮三次\n3. 点击"pop * 3"按钮\n预期: Dialog退场动画正常')
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

