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
 * 用例ID: SUB_ACE_UI_COMPONENT_BUTTON_CHECKBOXGROUP_Rtl_0010
 * 用例描述: 简体中文时，设置direction为Rtl，查看checkBox显示样式
 * 测试条件: 创建3个checkBox
 * 测试步骤: 点击checkBox
 * 预期结果: 页面显示3个checkbox，RTL布局
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct CheckboxGroupRtl0010 {
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
    hilog.info(0x0000, 'CheckboxGroupRtl0010', log);
  }

  build() {
    Column({ space: 8 }) {
      Text('SUB_ACE_UI_COMPONENT_BUTTON_CHECKBOXGROUP_Rtl_0010')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('CheckboxGroup RTL方向测试')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      Column({ space: 4 }) {
        Text('测试说明:').fontSize(11).fontWeight(FontWeight.Bold)
        Text('设置direction为Rtl\n查看checkbox在RTL布局下的显示')
          .fontSize(10)
          .fontColor(Color.Gray)
      }
      .width('95%')
      .padding(6)
      .backgroundColor('#E3F2FD')
      .borderRadius(4)

      Text('RTL布局的Checkbox:')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      // RTL布局的Checkbox
      Column({ space: 12 }) {
        Row({ space: 8 }) {
          Text('选项1').fontSize(14)
          Checkbox({ name: 'checkbox1' })
            .select(this.checkbox1)
            .id('CheckboxGroupRtl0010_1')
            .onChange((value: boolean) => {
              this.checkbox1 = value;
              this.addLog(`选项1: ${value}`);
            })
        }
        .direction(Direction.Rtl)
        .width('80%')

        Row({ space: 8 }) {
          Text('选项2').fontSize(14)
          Checkbox({ name: 'checkbox2' })
            .select(this.checkbox2)
            .id('CheckboxGroupRtl0010_2')
            .onChange((value: boolean) => {
              this.checkbox2 = value;
              this.addLog(`选项2: ${value}`);
            })
        }
        .direction(Direction.Rtl)
        .width('80%')

        Row({ space: 8 }) {
          Text('选项3').fontSize(14)
          Checkbox({ name: 'checkbox3' })
            .select(this.checkbox3)
            .id('CheckboxGroupRtl0010_3')
            .onChange((value: boolean) => {
              this.checkbox3 = value;
              this.addLog(`选项3: ${value}`);
            })
        }
        .direction(Direction.Rtl)
        .width('80%')
      }
      .width('95%')
      .padding(10)
      .backgroundColor(Color.White)
      .borderRadius(8)

      Divider().height(1).color('#EEEEEE')

      Column({ space: 4 }) {
        Text('预期结果:').fontSize(10).fontWeight(FontWeight.Bold)
        Text('Checkbox在RTL布局下正确显示，文本在左侧，checkbox在右侧')
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

