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
 * 用例ID: SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_UX_005
 * 用例描述: 鼠标测试buttonStyle与多态样式结合
 * 测试条件: 安装测试demo
 * 测试步骤: 测试组件在EMPHASIZED/NORMAL/TEXTUAL样式下的各种状态
 * 预期结果: 组件各状态符合UX规范
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct ButtonUx005 {
  @State testLog: string[] = [];
  @State currentStyle: string = 'EMPHASIZED';
  @State buttonEnabled: boolean = true;

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 15) {
      this.testLog = this.testLog.slice(0, 15);
    }
    hilog.info(0x0000, 'ButtonUx005', log);
  }

  build() {
    Column({ space: 6 }) {
      Text('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_UX_005')
        .fontSize(9)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('buttonStyle与多态样式测试')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      // 样式切换按钮
      Row({ space: 8 }) {
        Button('EMPHASIZED')
          .height(30)
          .fontSize(10)
          .id('ButtonUx005_SetEmphasized')
          .onClick(() => {
            this.currentStyle = 'EMPHASIZED';
            this.addLog('设置buttonStyle为EMPHASIZED');
          })

        Button('NORMAL')
          .height(30)
          .fontSize(10)
          .id('ButtonUx005_SetNormal')
          .onClick(() => {
            this.currentStyle = 'NORMAL';
            this.addLog('设置buttonStyle为NORMAL');
          })

        Button('TEXTUAL')
          .height(30)
          .fontSize(10)
          .id('ButtonUx005_SetTextual')
          .onClick(() => {
            this.currentStyle = 'TEXTUAL';
            this.addLog('设置buttonStyle为TEXTUAL');
          })
      }

      // 启用/禁用切换
      Row({ space: 8 }) {
        Text('当前样式: ' + this.currentStyle)
          .fontSize(11)
          .fontColor('#666666')

        Button(this.buttonEnabled ? '禁用' : '启用')
          .height(28)
          .fontSize(10)
          .id('ButtonUx005_ToggleEnabled')
          .onClick(() => {
            this.buttonEnabled = !this.buttonEnabled;
            this.addLog(`按钮${this.buttonEnabled ? '启用' : '禁用'}`);
          })
      }

      Divider().height(1).color('#EEEEEE')

      Text('测试按钮 (鼠标悬浮/按压/获焦测试):')
        .fontSize(11)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      // 测试按钮 - 根据当前样式显示
      if (this.currentStyle === 'EMPHASIZED') {
        Button('EMPHASIZED样式按钮')
          .width(200)
          .height(50)
          .buttonStyle(ButtonStyleMode.EMPHASIZED)
          .enabled(this.buttonEnabled)
          .id('ButtonUx005_TestButton')
          .stateStyles({
            pressed: {
              .backgroundColor('#0050A0')
            },
            disabled: {
              .opacity(0.4)
            }
          })
          .onClick(() => {
            this.addLog('点击EMPHASIZED按钮');
          })
      } else if (this.currentStyle === 'NORMAL') {
        Button('NORMAL样式按钮')
          .width(200)
          .height(50)
          .buttonStyle(ButtonStyleMode.NORMAL)
          .enabled(this.buttonEnabled)
          .id('ButtonUx005_TestButton')
          .stateStyles({
            pressed: {
              .backgroundColor('#CCCCCC')
            },
            disabled: {
              .opacity(0.4)
            }
          })
          .onClick(() => {
            this.addLog('点击NORMAL按钮');
          })
      } else {
        Button('TEXTUAL样式按钮')
          .width(200)
          .height(50)
          .buttonStyle(ButtonStyleMode.TEXTUAL)
          .enabled(this.buttonEnabled)
          .id('ButtonUx005_TestButton')
          .stateStyles({
            pressed: {
              .fontColor('#0050A0')
            },
            disabled: {
              .opacity(0.4)
            }
          })
          .onClick(() => {
            this.addLog('点击TEXTUAL按钮');
          })
      }

      Column({ space: 3 }) {
        Text('测试步骤:').fontSize(10).fontWeight(FontWeight.Bold)
        Text('1. 鼠标悬浮观察悬浮态\n2. 鼠标点击观察按压态\n3. Tab键切换观察获焦态')
          .fontSize(9)
          .fontColor(Color.Gray)
      }
      .width('95%')
      .padding(6)
      .backgroundColor('#E3F2FD')
      .borderRadius(4)

      Scroll() {
        Column() {
          ForEach(this.testLog, (log: string, index: number) => {
            Text(log)
              .fontSize(8)
              .fontColor('#333333')
              .width('100%')
              .padding(2)
              .backgroundColor(index % 2 === 0 ? '#F5F5F5' : Color.White)
          })
        }
        .width('100%')
      }
      .height('6.56%')
      .width('95%')
      .backgroundColor('#FAFAFA')
      .borderRadius(4)
    }
    .width('100%')
    .height('100%')
    .padding(6)
    .backgroundColor('#F5F5F5')
  }
}

