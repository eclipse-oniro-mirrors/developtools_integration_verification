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
 * @tc.name: SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UIEXTENSIONCOMPONENT_WINDOW_MODE_0006
 * @tc.desc: 嵌套UEC第一层UEC窗口Mode追随宿主、第二层不追随宿主
 * @tc.level: Level 4
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct WindowMode0006 {
  @Local testLog: string = '';
  @Local windowMode: number = 1;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'WindowMode0006', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - 嵌套UEC窗口Mode测试');
    this.addLog(`当前窗口Mode: ${this.windowMode}`);
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UIEXTENSIONCOMPONENT_WINDOW_MODE_0006')
        .fontSize(9)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 8 });

      Text('嵌套UEC窗口Mode追随宿主+不追随宿主')
        .fontSize(11)
        .margin({ bottom: 10 });

      Button('测试嵌套UEC窗口Mode追随宿主+不追随宿主')
        .onClick(() => {
          this.addLog('点击测试按钮');
        })
        .id('btn_test_window_mode')
        .margin({ bottom: 8 });

      Column() {
        Text('测试步骤:')
          .fontSize(10)
          .fontWeight(FontWeight.Bold);
        Text('1. hilog | grep -E "WindowMode|WMSUiext"')
          .fontSize(9);
        Text('2. 点击打开UEC应用')
          .fontSize(9);
        Text('3. 点击测试嵌套UEC按钮')
          .fontSize(9);
        Text('4. 长按应用推至左上角分屏')
          .fontSize(9);
        Text('5. 打开另一个应用')
          .fontSize(9);
        Text('6. 上推回到桌面')
          .fontSize(9);
        Text('7. 重新进入UEC应用')
          .fontSize(9);
      }
      .width('90%')
      .padding(8)
      .backgroundColor('#E3F2FD')
      .borderRadius(8)
      .alignItems(HorizontalAlign.Start);

      Column() {
        Text(`当前窗口Mode: ${this.windowMode}`)
          .fontSize(12)
          .fontWeight(FontWeight.Bold);
      }
      .width('90%')
      .padding(10)
      .backgroundColor('#FFF9C4')
      .borderRadius(8)
      .margin({ top: 8 });

      Row() {
        Button('Mode=1')
          .onClick(() => {
            this.windowMode = 1;
            this.addLog('窗口Mode: 1 - 传递给UEA2, UEA2不传给UEA');
          })
          .margin({ right: 10 });

        Button('Mode=100')
          .onClick(() => {
            this.windowMode = 100;
            this.addLog('分屏Mode: 100 - 传递给UEA2, UEA2不传给UEA');
          });
      }
      .margin({ top: 8 });

      Scroll() {
        Text(this.testLog)
          .fontSize(9)
          .fontColor('#333333')
          .id('log_text');
      }
      .height('6.56%')
      .width('90%')
      .backgroundColor('#F5F5F5')
      .padding(5)
      .margin({ top: 8 });
    }
    .width('100%')
    .height('100%')
    .padding(10);
  }
}

