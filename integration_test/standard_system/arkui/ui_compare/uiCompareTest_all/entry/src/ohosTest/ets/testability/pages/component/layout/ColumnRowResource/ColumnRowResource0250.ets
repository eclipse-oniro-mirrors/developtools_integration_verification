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
 * @tc.name: SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0250
 * @tc.desc: 文档资料测试
 * @tc.level: Level 4
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct ColumnRowResource0250 {
  @Local testLog: string = '';

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'ColumnRowResource0250', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - 文档资料测试');
    this.addLog('验证row/column/flex布局容器space能力支持Resource');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0250')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('文档资料测试-space支持Resource')
        .fontSize(12)
        .margin({ bottom: 10 })

      Text('Row布局 space=10:')
        .fontSize(12)
        .alignSelf(ItemAlign.Start)

      Row({ space: 10 }) {
        Text('A').backgroundColor('#FFB6C1').padding(10)
        Text('B').backgroundColor('#ADd7E6').padding(10)
        Text('C').backgroundColor('#90EE90').padding(10)
      }
      .id('row_space')
      .margin({ bottom: 15 })

      Text('Column布局 space=10:')
        .fontSize(12)
        .alignSelf(ItemAlign.Start)

      Column({ space: 10 }) {
        Text('1').backgroundColor('#FFB6C1').padding(10).width(50)
        Text('2').backgroundColor('#ADd7E6').padding(10).width(50)
        Text('3').backgroundColor('#90EE90').padding(10).width(50)
      }
      .id('column_space')
      .margin({ bottom: 15 })

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10 })

      Text('1. 查看文档资料\n2. 期望: 文档中增加row/column/flex\n   布局容器space能力支持Resource的规格说明')
        .fontSize(11)
        .fontColor('#666666')

      Scroll() {
        Text(this.testLog)
          .fontSize(10)
          .fontColor('#333333')
          .id('log_text')
      }
      .height('4.92%')
      .width('100%')
      .backgroundColor('#F5F5F5')
      .padding(5)
      .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}

