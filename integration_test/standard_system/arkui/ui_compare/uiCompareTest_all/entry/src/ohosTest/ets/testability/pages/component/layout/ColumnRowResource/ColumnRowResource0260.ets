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
 * @tc.name: SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0260
 * @tc.desc: DFX测试
 * @tc.level: Level 4
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct ColumnRowResource0260 {
  @Local testLog: string = '';

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'ColumnRowResource0260', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - DFX测试');
    this.addLog('验证arkui dump树中space字段');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_COLUMN_ROW_RESOURCE_0260')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('DFX测试-dump树验证')
        .fontSize(12)
        .margin({ bottom: 10 })

      Text('Row布局 space=20:')
        .fontSize(12)
        .alignSelf(ItemAlign.Start)

      Row({ space: 20 }) {
        Text('Item1').backgroundColor('#FFD700').padding(10)
        Text('Item2').backgroundColor('#FF6347').padding(10)
        Text('Item3').backgroundColor('#4682B4').padding(10)
      }
      .id('row_dfx')
      .margin({ bottom: 15 })

      Text('Column布局 space=15:')
        .fontSize(12)
        .alignSelf(ItemAlign.Start)

      Column({ space: 15 }) {
        Text('Row1').backgroundColor('#FFD700').padding(10).width(80)
        Text('Row2').backgroundColor('#FF6347').padding(10).width(80)
      }
      .id('column_dfx')

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('1. 打开demo页面\n2. 运行抓arkui dump树的脚本\n3. 查看当前页面dump树\n4. 查看space字段\n5. 期望: space接口字段为demo设置字段')
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

