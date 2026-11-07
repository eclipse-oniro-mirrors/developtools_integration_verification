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
 * @tc.name: SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0220
 * @tc.desc: Select菜单底板模糊材质支持分层参数控制，对比手机和PC效果
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct SelectFuzzy0220 {
  @Local testLog: string = '';
  @Local selectedIndex: number = 0;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'SelectFuzzy0220', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_BUTTON_SELECT_FUZZY_0220')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('对比手机和PC效果')
        .fontSize(12)
        .margin({ bottom: 10 })

      Select([
        { value: '选项1' },
        { value: '选项2' },
        { value: '选项3' }
      ])
        .selected(this.selectedIndex)
        .value('请选择')
        .id('select_fuzzy_compare')
        .onSelect((index: number) => {
          this.selectedIndex = index;
          this.addLog('Selected index: ' + index);
        })

      Text('当前选中: ' + this.selectedIndex)
        .fontSize(12)
        .margin({ top: 15 })
        .id('selected_index')

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('1. 手机默认值为组件超厚材质模糊\n2. PC默认值为组件普通材质模糊')
        .fontSize(11)
        .fontColor('#666666')

      Text('日志:')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10 })

      Scroll() {
        Text(this.testLog)
          .fontSize(10)
          .fontColor('#333333')
          .id('log_text')
      }
      .height('8.2%')
      .width('100%')
      .backgroundColor('#F5F5F5')
      .padding(5)
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}

