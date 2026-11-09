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
 * 用例ID: SUB_ACE_UI_COMPONENT_BUTTON_CHECKBOXGROUP_SCENARIOS_0060
 * 用例描述: 场景分析用例-群组名长度超过设备界面显示
 * 测试条件: 群组名取一个超长字符
 * 测试步骤: 编译hap并安装运行
 * 预期结果: 群组名在设备内显示完全
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct CheckboxGroupScenarios0060 {
  @State testLog: string[] = [];
  @State checkbox1: boolean = false;
  @State checkbox2: boolean = false;
  @State checkbox3: boolean = false;

  // 超长群组名
  private longGroupName: string = 'checkboxGroupWithVeryLongNameForTestingPurposeThatExceedsNormalLength';

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 20) {
      this.testLog = this.testLog.slice(0, 20);
    }
    hilog.info(0x0000, 'CheckboxGroupScenarios0060', log);
  }

  build() {
    Column({ space: 8 }) {
      Text('SUB_ACE_UI_COMPONENT_BUTTON_CHECKBOXGROUP_SCENARIOS_0060')
        .fontSize(9)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('超长群组名测试')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      Column({ space: 4 }) {
        Text('测试说明:').fontSize(11).fontWeight(FontWeight.Bold)
        Text('群组名使用超长字符串\n验证界面显示是否正常')
          .fontSize(10)
          .fontColor(Color.Gray)
      }
      .width('95%')
      .padding(6)
      .backgroundColor('#E3F2FD')
      .borderRadius(4)

      Text(`群组名: ${this.longGroupName}`)
        .fontSize(9)
        .fontColor('#666666')
        .width('95%')
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .maxLines(2)

      // CheckboxGroup with long name
      Row({ space: 8 }) {
        CheckboxGroup({ group: this.longGroupName })
          .id('CheckboxGroupScenarios0060_Group')
          .onChange((event: CheckboxGroupResult) => {
            this.addLog(`全选状态变更: ${event.status}`);
          })
        Text('全选')
          .fontSize(14)
      }
      .alignSelf(ItemAlign.Start)
      .padding({ left: 10 })

      // Checkboxes
      Column({ space: 8 }) {
        Row({ space: 8 }) {
          Checkbox({ name: 'cb1', group: this.longGroupName })
            .select(this.checkbox1)
            .id('CheckboxGroupScenarios0060_1')
            .onChange((value: boolean) => {
              this.checkbox1 = value;
              this.addLog(`选项1: ${value}`);
            })
          Text('选项1').fontSize(14)
        }

        Row({ space: 8 }) {
          Checkbox({ name: 'cb2', group: this.longGroupName })
            .select(this.checkbox2)
            .id('CheckboxGroupScenarios0060_2')
            .onChange((value: boolean) => {
              this.checkbox2 = value;
              this.addLog(`选项2: ${value}`);
            })
          Text('选项2').fontSize(14)
        }

        Row({ space: 8 }) {
          Checkbox({ name: 'cb3', group: this.longGroupName })
            .select(this.checkbox3)
            .id('CheckboxGroupScenarios0060_3')
            .onChange((value: boolean) => {
              this.checkbox3 = value;
              this.addLog(`选项3: ${value}`);
            })
          Text('选项3').fontSize(14)
        }
      }
      .alignSelf(ItemAlign.Start)
      .padding({ left: 20 })

      Divider().height(1).color('#EEEEEE')

      Column({ space: 4 }) {
        Text('预期结果:').fontSize(10).fontWeight(FontWeight.Bold)
        Text('群组功能正常，超长群组名不影响checkbox联动')
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

