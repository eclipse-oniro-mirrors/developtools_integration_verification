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
 * 用例ID: SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_INTERFACE_0620
 * 用例描述: 笔记APP输入文本内容，点击撤销按钮直至无内容可撤销，点击恢复按钮直至无内容可恢复
 * 测试条件: 打开笔记APP
 * 测试步骤: 输入文本，点击撤销/恢复按钮
 * 预期结果: 撤销/恢复按钮点击效果正常显示
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct ButtonInterface0620 {
  @State testLog: string[] = [];
  @State textContent: string = '';
  @State history: string[] = [''];
  @State historyIndex: number = 0;
  @State canUndo: boolean = false;
  @State canRedo: boolean = false;

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 20) {
      this.testLog = this.testLog.slice(0, 20);
    }
    hilog.info(0x0000, 'ButtonInterface0620', log);
  }

  updateButtonState(): void {
    this.canUndo = this.historyIndex > 0;
    this.canRedo = this.historyIndex < this.history.length - 1;
  }

  saveToHistory(text: string): void {
    // 删除当前位置之后的历史
    this.history = this.history.slice(0, this.historyIndex + 1);
    this.history.push(text);
    this.historyIndex = this.history.length - 1;
    this.updateButtonState();
  }

  undo(): void {
    if (this.historyIndex > 0) {
      this.historyIndex--;
      this.textContent = this.history[this.historyIndex];
      this.updateButtonState();
      this.addLog(`撤销: "${this.textContent}"`);
    } else {
      this.addLog('无内容可撤销');
    }
  }

  redo(): void {
    if (this.historyIndex < this.history.length - 1) {
      this.historyIndex++;
      this.textContent = this.history[this.historyIndex];
      this.updateButtonState();
      this.addLog(`恢复: "${this.textContent}"`);
    } else {
      this.addLog('无内容可恢复');
    }
  }

  build() {
    Column({ space: 8 }) {
      Text('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_INTERFACE_0620')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('撤销/恢复按钮测试')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      Column({ space: 4 }) {
        Text('测试说明:').fontSize(11).fontWeight(FontWeight.Bold)
        Text('1. 输入文本内容\n2. 点击撤销直至无内容\n3. 点击恢复直至无内容')
          .fontSize(10)
          .fontColor(Color.Gray)
      }
      .width('95%')
      .padding(6)
      .backgroundColor('#E3F2FD')
      .borderRadius(4)

      // 文本输入框
      TextInput({ placeholder: '请输入文本...', text: this.textContent })
        .width('90%')
        .height(50)
        .id('ButtonInterface0620_Input')
        .onChange((value: string) => {
          this.textContent = value;
          this.saveToHistory(value);
        })

      // 撤销/恢复按钮
      Row({ space: 20 }) {
        Button('撤销')
          .width(100)
          .height(40)
          .enabled(this.canUndo)
          .opacity(this.canUndo ? 1 : 0.5)
          .id('ButtonInterface0620_Undo')
          .onClick(() => {
            this.undo();
          })

        Button('恢复')
          .width(100)
          .height(40)
          .enabled(this.canRedo)
          .opacity(this.canRedo ? 1 : 0.5)
          .id('ButtonInterface0620_Redo')
          .onClick(() => {
            this.redo();
          })
      }

      Text(`历史记录: ${this.historyIndex + 1}/${this.history.length}`)
        .fontSize(11)
        .fontColor(Color.Gray)

      Divider().height(1).color('#EEEEEE')

      Column({ space: 4 }) {
        Text('预期结果:').fontSize(10).fontWeight(FontWeight.Bold)
        Text('撤销/恢复按钮点击效果正常，禁用时显示半透明')
          .fontSize(9)
          .fontColor('#4CAF50')
      }
      .width('95%')
      .padding(6)
      .backgroundColor('#E8F5E9')
      .borderRadius(4)

      Scroll() {
        Column() {
          ForEach(this.testLog, (log: string, index: number) => {
            Text(log)
              .fontSize(9)
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
    .padding(8)
    .backgroundColor('#F5F5F5')
  }
}

