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
 * 用例ID: SUB_ACE_ACTION_EVENT_COMMONEVENT_CLICK_0160
 * 用例描述: 4x4月视图卡片,鼠标点击前后切换月份
 * 测试条件: 1、已添加4*4月视图卡片至桌面 2、当前系统时间为2024年4月1日
 * 测试步骤: 1、PC上快速用鼠标或箭头点击向后切换月份 2、手机、pad、折叠屏等用手指点击向后切换月份
 * 预期结果: 1-2 切换过程中，上下都切换且一致。切换结束后，当前月份与切换次数一致
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct Click0160 {
  @Local testLog: string[] = [];
  @Local currentYear: number = 2024;
  @Local currentMonth: number = 4;
  @Local clickCount: number = 0;

  private months: string[] = ['一月', '二月', '三月', '四月', '五月', '六月', 
                               '七月', '八月', '九月', '十月', '十一月', '十二月'];

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 30) {
      this.testLog = this.testLog.slice(0, 30);
    }
    hilog.info(0x0000, 'Click0160', log);
  }

  prevMonth(): void {
    this.clickCount++;
    if (this.currentMonth === 1) {
      this.currentMonth = 12;
      this.currentYear--;
    } else {
      this.currentMonth--;
    }
    this.addLog(`← 向前切换: ${this.currentYear}年${this.months[this.currentMonth - 1]}`);
  }

  nextMonth(): void {
    this.clickCount++;
    if (this.currentMonth === 12) {
      this.currentMonth = 1;
      this.currentYear++;
    } else {
      this.currentMonth++;
    }
    this.addLog(`→ 向后切换: ${this.currentYear}年${this.months[this.currentMonth - 1]}`);
  }

  build() {
    Column({ space: 8 }) {
      Text('SUB_ACE_ACTION_EVENT_COMMONEVENT_CLICK_0160')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('4x4月视图卡片 - 鼠标点击切换月份')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      Text(`点击次数: ${this.clickCount}`)
        .fontSize(12)
        .fontColor(Color.Gray)

      // 模拟4x4月视图卡片
      Column({ space: 10 }) {
        // 月份切换头部
        Row() {
          Button('◀')
            .onClick(() => {
              this.prevMonth();
            })
            .fontSize(20)
            .width(50)
            .height(40)
            .id('Click0160_PrevBtn')

          Column() {
            Text(`${this.currentYear}年`)
              .fontSize(14)
              .fontColor(Color.Gray)
            Text(`${this.months[this.currentMonth - 1]}`)
              .fontSize(20)
              .fontWeight(FontWeight.Bold)
          }
          .width('20.83%')

          Button('▶')
            .onClick(() => {
              this.nextMonth();
            })
            .fontSize(20)
            .width(50)
            .height(40)
            .id('Click0160_NextBtn')
        }
        .justifyContent(FlexAlign.SpaceBetween)
        .width('100%')

        // 星期头部
        Row() {
          ForEach(['日', '一', '二', '三', '四', '五', '六'], (day: string) => {
            Text(day)
              .fontSize(12)
              .width(40)
              .textAlign(TextAlign.Center)
              .fontColor(day === '日' || day === '六' ? Color.Red : Color.Black)
          })
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceAround)

        // 日期网格 (4x4简化显示)
        Column({ space: 5 }) {
          ForEach([0, 1, 2, 3], (row: number) => {
            Row() {
              ForEach([0, 1, 2, 3, 4, 5, 6], (col: number) => {
                Text((row * 7 + col + 1) <= 28 ? `${row * 7 + col + 1}` : '')
                  .fontSize(14)
                  .width(40)
                  .height(35)
                  .textAlign(TextAlign.Center)
                  .backgroundColor((row * 7 + col + 1) === 1 ? '#E3F2FD' : Color.Transparent)
                  .borderRadius(4)
              })
            }
            .width('100%')
            .justifyContent(FlexAlign.SpaceAround)
          })
        }
      }
      .width('100%')
      .padding(15)
      .backgroundColor(Color.White)
      .borderRadius(12)
      .shadow({ radius: 5, color: '#00000020', offsetX: 0, offsetY: 2 })

      Divider().height(1).color('#EEEEEE')

      Text('操作说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text('1. PC: 快速用鼠标点击 ◀ ▶ 按钮切换月份\n2. 手机/Pad: 用手指快速点击切换\n3. 观察月份是否与点击次数一致')
        .fontSize(11)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Text('预期: 切换过程中上下一致，切换次数与月份变化一致')
        .fontSize(10)
        .fontColor('#4CAF50')

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

