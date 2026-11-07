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
 * 用例ID: SUB_ACE_UI_COMPONENT_BUTTON_CHECKBOX_DFX_0010
 * 用例描述: 事件-onChange(callback: (value: boolean) => void)
 * 测试条件: 创建一个Checkboxgroup，一个Checkbox，group值相同
 * 测试步骤: 设定onChange，观察回调触发
 * 预期结果: 当CheckBoxGroup全部选中时，未选中状态的CheckBox会触发onChange回调
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct CheckboxDfx0010 {
  @State testLog: string[] = [];
  @State checkbox1: boolean = false;
  @State checkbox2: boolean = false;
  @State checkbox3: boolean = false;

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 20) {
      this.testLog = this.testLog.slice(0, 20);
    }
    hilog.info(0x0000, 'CheckboxDfx0010', log);
  }

  build() {
    Column({ space: 8 }) {
      Text('SUB_ACE_UI_COMPONENT_BUTTON_CHECKBOX_DFX_0010')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('Checkbox onChange事件测试')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      Column({ space: 4 }) {
        Text('测试说明:').fontSize(11).fontWeight(FontWeight.Bold)
        Text('1. CheckboxGroup和Checkbox设置相同group\n2. 点击全选，观察onChange回调')
          .fontSize(10)
          .fontColor(Color.Gray)
      }
      .width('95%')
      .padding(6)
      .backgroundColor('#E3F2FD')
      .borderRadius(4)

      // CheckboxGroup
      Row({ space: 8 }) {
        CheckboxGroup({ group: 'testGroup' })
          .id('CheckboxDfx0010_Group')
          .onChange((event: CheckboxGroupResult) => {
            this.addLog(`CheckboxGroup onChange: 选中${event.name.length}项, status=${event.status}`);
          })
        Text('全选')
          .fontSize(14)
      }
      .alignSelf(ItemAlign.Start)
      .padding({ left: 10 })

      Divider().height(1).color('#EEEEEE')

      // Checkbox列表
      Column({ space: 8 }) {
        Row({ space: 8 }) {
          Checkbox({ name: 'checkbox1', group: 'testGroup' })
            .select(this.checkbox1)
            .id('CheckboxDfx0010_1')
            .onChange((value: boolean) => {
              this.checkbox1 = value;
              this.addLog(`Checkbox1 onChange: ${value}`);
            })
          Text('选项1').fontSize(14)
        }

        Row({ space: 8 }) {
          Checkbox({ name: 'checkbox2', group: 'testGroup' })
            .select(this.checkbox2)
            .id('CheckboxDfx0010_2')
            .onChange((value: boolean) => {
              this.checkbox2 = value;
              this.addLog(`Checkbox2 onChange: ${value}`);
            })
          Text('选项2').fontSize(14)
        }

        Row({ space: 8 }) {
          Checkbox({ name: 'checkbox3', group: 'testGroup' })
            .select(this.checkbox3)
            .id('CheckboxDfx0010_3')
            .onChange((value: boolean) => {
              this.checkbox3 = value;
              this.addLog(`Checkbox3 onChange: ${value}`);
            })
          Text('选项3').fontSize(14)
        }
      }
      .alignSelf(ItemAlign.Start)
      .padding({ left: 20 })

      Divider().height(1).color('#EEEEEE')

      Column({ space: 4 }) {
        Text('预期结果:').fontSize(10).fontWeight(FontWeight.Bold)
        Text('点击全选时，未选中的Checkbox会触发onChange回调')
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
      .height('8.2%')
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

