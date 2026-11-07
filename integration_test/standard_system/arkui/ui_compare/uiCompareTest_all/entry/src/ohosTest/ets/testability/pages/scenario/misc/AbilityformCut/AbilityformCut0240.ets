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
 * 用例ID: SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0240
 * 用例描述: 验证select组件的自定义菜单选项功能正常
 * 测试条件: 测试机刷最新的镜像
 * 测试步骤: 设置选中项和未选中项的字体样式
 * 预期结果: 选中项黑色粗体斜体24vp，未选中项粉色默认样式12vp
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct AbilityformCut0240 {
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
    hilog.info(0x0000, 'AbilityformCut0240', log);
  }

  build() {
    Column({ space: 10 }) {
      Text('SUB_ACE_UI_COMPONENT_ABILITYFORM_CUT_0240')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('Select 自定义菜单选项验证')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      Column({ space: 4 }) {
        Text('测试说明:').fontSize(12).fontWeight(FontWeight.Bold)
        Text('选中项: 黑色 粗体 斜体 24vp\n未选中项: 粉色 默认样式 12vp')
          .fontSize(11)
          .fontColor(Color.Gray)
      }
      .width('95%')
      .padding(8)
      .backgroundColor('#E3F2FD')
      .borderRadius(4)

      Text('Select组件 (点击展开查看样式):')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Select(this.selectOptions)
        .selected(this.selectedIndex)
        .value('请选择')
        .width('80%')
        .selectedOptionFont({
          size: 24,
          weight: FontWeight.Bolder,
          style: FontStyle.Italic
        })
        .selectedOptionFontColor(Color.Black)
        .optionFont({
          size: 12
        })
        .optionFontColor(Color.Pink)
        .id('AbilityformCut0240_Select')
        .onSelect((index: number, value: string) => {
          this.selectedIndex = index;
          this.addLog(`选中: ${value}`);
        })

      Divider().height(1).color('#EEEEEE')

      Text(`当前选中: ${this.selectOptions[this.selectedIndex].value}`)
        .fontSize(12)
        .fontColor('#666666')

      Column({ space: 4 }) {
        Text('预期结果:').fontSize(11).fontWeight(FontWeight.Bold)
        Text('选中项：黑色粗体斜体24vp\n未选中项：粉色默认样式12vp')
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

