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
 * @tc.name: SUB_ACE_UI_COMPONENT_BUTTON_RADIO_LAYOUT_0010
 * @tc.desc: 通用属性内边距设置
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct RadioLayout0010 {
  @Local testLog: string = '';

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'RadioLayout0010', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_BUTTON_RADIO_LAYOUT_0010')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('Radio内边距设置 padding(10)')
        .fontSize(12)
        .margin({ bottom: 10 })

      Row() {
        Column() {
          Text('无padding:')
            .fontSize(11)
          Radio({ value: 'Radio1', group: 'group1' })
            .checked(true)
            .width(30)
            .height(30)
            .backgroundColor('#E0E0E0')
            .id('radio_no_padding')
        }
        .margin({ right: 30 })

        Column() {
          Text('padding(10):')
            .fontSize(11)
          Radio({ value: 'Radio2', group: 'group2' })
            .checked(true)
            .width(30)
            .height(30)
            .padding(10)
            .backgroundColor('#E0E0E0')
            .id('radio_with_padding')
        }
      }
      .justifyContent(FlexAlign.Center)
      .width('100%')
      .padding(20)

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('1. 左侧Radio无padding设置\n2. 右侧Radio设置padding(10)\n3. 观察两个Radio的内边距差异')
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

