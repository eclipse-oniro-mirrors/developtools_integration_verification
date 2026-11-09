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
 * 用例ID: SUB_ACE_UI_COMPONENT_BUTTON_CHECKBOXGROUP_SCENARIOS_0060_558
 * 用例描述: CheckboxGroup列表移除一项之后，观察全选按钮状态
 * 测试条件: 创建CheckboxGroup列表
 * 测试步骤: 勾选一项之后，删除当前checkbox_item节点，观察全选按钮状态
 * 预期结果: 全选按钮由选中变为未选状态
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

interface CheckboxItem {
  name: string;
  label: string;
  selected: boolean;
}

@Entry
@Component
struct CheckboxGroupScenarios0060558 {
  @State testLog: string[] = [];
  @State checkboxList: CheckboxItem[] = [
    { name: 'item1', label: '选项1', selected: false },
    { name: 'item2', label: '选项2', selected: false },
    { name: 'item3', label: '选项3', selected: false }
  ];

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 15) {
      this.testLog = this.testLog.slice(0, 15);
    }
    hilog.info(0x0000, 'CheckboxGroupScenarios0060558', log);
  }

  removeSelectedItem(): void {
    const selectedIndex = this.checkboxList.findIndex(item => item.selected);
    if (selectedIndex !== -1) {
      const removed = this.checkboxList.splice(selectedIndex, 1);
      this.addLog(`移除: ${removed[0].label}`);
    } else {
      this.addLog('没有选中的项目可移除');
    }
  }

  resetList(): void {
    this.checkboxList = [
      { name: 'item1', label: '选项1', selected: false },
      { name: 'item2', label: '选项2', selected: false },
      { name: 'item3', label: '选项3', selected: false }
    ];
    this.addLog('列表已重置');
  }

  build() {
    Column({ space: 6 }) {
      Text('SUB_ACE_UI_COMPONENT_BUTTON_CHECKBOXGROUP_SCENARIOS_0060_558')
        .fontSize(8)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('移除Checkbox后全选状态测试')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      Column({ space: 4 }) {
        Text('测试步骤:').fontSize(10).fontWeight(FontWeight.Bold)
        Text('1. 勾选一项\n2. 点击"移除选中项"\n3. 观察全选按钮状态')
          .fontSize(9)
          .fontColor(Color.Gray)
      }
      .width('95%')
      .padding(6)
      .backgroundColor('#E3F2FD')
      .borderRadius(4)

      // CheckboxGroup全选
      Row({ space: 8 }) {
        CheckboxGroup({ group: 'dynamicGroup' })
          .id('CheckboxGroupScenarios0060_558_Group')
          .onChange((event: CheckboxGroupResult) => {
            this.addLog(`全选状态: ${event.status}, 选中${event.name.length}项`);
          })
        Text('全选')
          .fontSize(14)
      }
      .alignSelf(ItemAlign.Start)
      .padding({ left: 10 })

      // 动态Checkbox列表
      Column({ space: 6 }) {
        ForEach(this.checkboxList, (item: CheckboxItem, index: number) => {
          Row({ space: 8 }) {
            Checkbox({ name: item.name, group: 'dynamicGroup' })
              .select(item.selected)
              .id(`CheckboxGroupScenarios0060_558_${index}`)
              .onChange((value: boolean) => {
                item.selected = value;
                this.addLog(`${item.label}: ${value}`);
              })
            Text(item.label).fontSize(14)
          }
        }, (item: CheckboxItem, index: number) => item.name + index)
      }
      .alignSelf(ItemAlign.Start)
      .padding({ left: 20 })

      // 操作按钮
      Row({ space: 15 }) {
        Button('移除选中项')
          .height(35)
          .id('CheckboxGroupScenarios0060_558_Remove')
          .onClick(() => {
            this.removeSelectedItem();
          })

        Button('重置列表')
          .height(35)
          .id('CheckboxGroupScenarios0060_558_Reset')
          .onClick(() => {
            this.resetList();
          })
      }

      Text(`当前项目数: ${this.checkboxList.length}`)
        .fontSize(11)
        .fontColor('#666666')

      Divider().height(1).color('#EEEEEE')

      Column({ space: 4 }) {
        Text('预期结果:').fontSize(10).fontWeight(FontWeight.Bold)
        Text('移除选中项后，全选按钮状态正确更新')
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
              .fontSize(8)
              .fontColor('#333333')
              .width('100%')
              .padding(2)
              .backgroundColor(index % 2 === 0 ? '#F5F5F5' : Color.White)
          })
        }
        .width('100%')
      }
      .height('5.74%')
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

