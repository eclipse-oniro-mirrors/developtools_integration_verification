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
 * 用例ID: SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0200
 * 用例描述: 验证select组件的下拉按钮功能正常
 * 测试条件: 测试机刷最新的镜像
 * 测试步骤: 设置fontStyle为Italic，fontWeight为Bolder，fontSize为24vp，color为红色
 * 预期结果: select组件正常显示，下拉按钮字体24vp，红色，意大利斜体，加粗
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct AbilityformCut0200 {
  @Local testLog: string[] = [];
  @Local selectedIndex: number = 0;

  private selectOptions: SelectOption[] = [
    { value: '选项一' },
    { value: '选项二' },
    { value: '选项三' },
    { value: '选项四' }
  ];

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 20) {
      this.testLog = this.testLog.slice(0, 20);
    }
    hilog.info(0x0000, 'AbilityformCut0200', log);
  }

  build() {
    Column({ space: 10 }) {
      Text('SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0200')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('Select 下拉按钮样式验证')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      Column({ space: 4 }) {
        Text('测试说明:').fontSize(12).fontWeight(FontWeight.Bold)
        Text('fontStyle: Italic\nfontWeight: Bolder\nfontSize: 24vp\ncolor: 红色')
          .fontSize(11)
          .fontColor(Color.Gray)
      }
      .width('95%')
      .padding(8)
      .backgroundColor('#E3F2FD')
      .borderRadius(4)

      Text('Select组件:')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Select(this.selectOptions)
        .selected(this.selectedIndex)
        .value('请选择')
        .font({
          size: 24,
          weight: FontWeight.Bolder,
          style: FontStyle.Italic
        })
        .fontColor(Color.Red)
        .width('80%')
        .id('AbilityformCut0200_Select')
        .onSelect((index: number, value: string) => {
          this.selectedIndex = index;
          this.addLog(`选中: ${value} (索引: ${index})`);
        })

      Divider().height(1).color('#EEEEEE')

      Text(`当前选中: ${this.selectOptions[this.selectedIndex].value}`)
        .fontSize(12)
        .fontColor('#666666')

      Column({ space: 4 }) {
        Text('预期结果:').fontSize(11).fontWeight(FontWeight.Bold)
        Text('下拉按钮：字体24vp，红色，意大利斜体，加粗')
          .fontSize(10)
          .fontColor('#4CAF50')
      }
      .width('95%')
      .padding(8)
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
    .padding(10)
    .backgroundColor('#F5F5F5')
  }
}

