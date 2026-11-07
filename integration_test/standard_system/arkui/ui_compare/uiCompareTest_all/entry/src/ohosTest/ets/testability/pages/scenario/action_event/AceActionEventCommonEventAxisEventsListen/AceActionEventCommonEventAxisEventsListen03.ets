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
import { router } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct AceActionEventCommonEventAxisEventsListen03 {
  @State operationLog: string[] = [];
  @State inputText: string = '请在此输入框上滚动鼠标';
  @State actionValue: string = '等待鼠标滚动...';
  @State actionValueColor: Color = Color.Grey;
  @State scrollEventCount: number = 0;
  @State updateEventCount: number = 0;

  aboutToAppear() {
    hilog.info(0x0000, 'testTag', '=== AceActionEventCommonEventAxisEventsListen03 页面加载 ===');
    this.addLog('页面已加载');
    this.addLog('准备监听鼠标滚动 UPDATE 事件');
  }

  addLog(message: string) {
    const timestamp = new Date().toLocaleTimeString();
    const log = `[${timestamp}] ${message}`;
    this.operationLog.unshift(log);
    if (this.operationLog.length > 15) {
      this.operationLog.pop();
    }
    hilog.info(0x0000, 'testTag', log);
  }

  build() {
    Column({ space: 12 }) {
      // 标题区域
      Column({ space: 4 }) {
        Text('鼠标滚动轴事件监听测试 - UPDATE')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFFFFF')
          .width('100%')
          .textAlign(TextAlign.Center)

        Text('SUB_ACE_ACTION_EVENT_COMMONEVENT_AXIS_EVENTS_LISTEN_003')
          .fontSize(9)
          .fontColor('#FFD700')
          .fontFamily('Courier')
          .width('100%')
          .textAlign(TextAlign.Center)
      }
      .width('100%')
      .padding(15)
      .backgroundColor('#FF9800')

      Scroll() {
        Column({ space: 12 }) {
          // 当前页面标识
          Column({ space: 5 }) {
            Text('📄 测试页面')
              .fontSize(12)
              .fontWeight(FontWeight.Bold)
              .fontColor('#182431')

            Text('验证鼠标滚动过程中触发 UPDATE')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .fontColor('#FFFFFF')
              .width('100%')
              .padding(12)
              .backgroundColor('#FF9800')
              .borderRadius(8)
              .textAlign(TextAlign.Center)
          }
          .width('94%')
          .alignItems(HorizontalAlign.Start)

          // 测试按钮区域
          Column({ space: 5 }) {
            Text('🖱️ 测试区域（在按钮上滚动鼠标）')
              .fontSize(12)
              .fontWeight(FontWeight.Bold)
              .fontColor('#182431')

            Button('AxisEvent 测试按钮\n请在此按钮上滚动鼠标')
              .width('100%')
              .height(100)
              .fontSize(16)
              .backgroundColor('#FF9800')
              .fontColor('#FFFFFF')
              .id('AceActionEventCommonEventAxisEventsListen03')
              .fontWeight(FontWeight.Bold)
              .onAxisEvent((event?: AxisEvent) => {
                if (event) {
                  const action = event.action;
                  let actionName = '';
                  switch (action) {
                    case 1:
                      actionName = 'BEGIN';
                      this.actionValue = `actionValue = ${action} (BEGIN)`;
                      this.actionValueColor = Color.Green;
                      this.addLog(`[按钮] 轴事件开始 BEGIN: actionValue = ${action}`);
                      hilog.info(0x0000, 'testTag', `轴事件开始: actionValue = ${action}`);
                      break;
                    case 2:
                      actionName = 'UPDATE';
                      this.actionValue = `actionValue = ${action} (UPDATE) ✓`;
                      this.actionValueColor = Color.Orange;
                      this.updateEventCount++;
                      this.addLog(`✓✓✓ [按钮] 捕获到 UPDATE 事件，actionValue = ${action}`);
                      hilog.info(0x0000, 'testTag', `[关键字actionValue] 轴事件更新 UPDATE: actionValue = ${action}`);
                      break;
                    case 3:
                      actionName = 'END';
                      this.actionValue = `actionValue = ${action} (END)`;
                      this.actionValueColor = Color.Blue;
                      this.addLog(`[按钮] 轴事件结束 END: actionValue = ${action}`);
                      hilog.info(0x0000, 'testTag', `轴事件结束: actionValue = ${action}`);
                      break;
                    case 4:
                      actionName = 'CANCEL';
                      this.actionValue = `actionValue = ${action} (CANCEL)`;
                      this.actionValueColor = Color.Red;
                      this.addLog(`[按钮] 轴事件取消 CANCEL: actionValue = ${action}`);
                      hilog.info(0x0000, 'testTag', `轴事件取消: actionValue = ${action}`);
                      break;
                    default:
                      actionName = `UNKNOWN(${action})`;
                      this.actionValue = `actionValue = ${action}`;
                      this.actionValueColor = Color.Grey;
                      this.addLog(`[按钮] 未知轴事件: actionValue = ${action}`);
                      break;
                  }
                  const verticalValue = event.getVerticalAxisValue();
                  const horizontalValue = event.getHorizontalAxisValue();
                  this.scrollEventCount++;
                  const detailLog = `[按钮] AxisEvent: action=${action}(${actionName}), ` +
                    `x=${event.x}, y=${event.y}, ` +
                    `windowX=${event.windowX}, windowY=${event.windowY}, ` +
                    `displayX=${event.displayX}, displayY=${event.displayY}, ` +
                    `verticalAxis=${verticalValue}, horizontalAxis=${horizontalValue}`;
                  hilog.info(0x0000, 'testTag', detailLog);
                  if (action === 2) {
                    this.addLog(`[按钮] 坐标: (${event.x.toFixed(2)}, ${event.y.toFixed(2)})`);
                    this.addLog(`[按钮] 垂直轴值: ${verticalValue.toFixed(2)}, 水平轴值: ${horizontalValue.toFixed(2)}`);
                  }
                }
              })
          }
          .width('94%')
          .alignItems(HorizontalAlign.Start)

          Column({ space: 5 }) {
            Text('⚡ ActionValue 状态')
              .fontSize(12)
              .fontWeight(FontWeight.Bold)
              .fontColor('#182431')

            Text(this.actionValue)
              .fontSize(16)
              .fontColor(this.actionValueColor)
              .fontWeight(FontWeight.Bold)
              .width('100%')
              .padding(15)
              .backgroundColor('#FFF9C4')
              .borderRadius(8)
              .textAlign(TextAlign.Center)
              .border({ width: 3, color: this.actionValueColor })
          }
          .width('94%')
          .alignItems(HorizontalAlign.Start)

          // 事件统计
          Column({ space: 5 }) {
            Text('📊 事件统计')
              .fontSize(12)
              .fontWeight(FontWeight.Bold)
              .fontColor('#182431')

            Column({ space: 8 }) {
              Row({ space: 10 }) {
                Text('UPDATE 事件次数:')
                  .fontSize(13)
                  .fontColor('#666666')
                Text(`${this.updateEventCount}`)
                  .fontSize(16)
                  .fontColor('#FF9800')
                  .fontWeight(FontWeight.Bold)
              }
              .width('100%')
              .justifyContent(FlexAlign.SpaceBetween)

              Row({ space: 10 }) {
                Text('总滚动事件次数:')
                  .fontSize(13)
                  .fontColor('#666666')
                Text(`${this.scrollEventCount}`)
                  .fontSize(16)
                  .fontColor('#FF9800')
                  .fontWeight(FontWeight.Bold)
              }
              .width('100%')
              .justifyContent(FlexAlign.SpaceBetween)
            }
            .width('100%')
            .padding(12)
            .backgroundColor('#FFF3E0')
            .borderRadius(8)
          }
          .width('94%')
          .alignItems(HorizontalAlign.Start)

          // 操作日志
          Column({ space: 5 }) {
            Text('📋 事件日志')
              .fontSize(12)
              .fontWeight(FontWeight.Bold)
              .fontColor('#182431')

            Scroll() {
              Column({ space: 2 }) {
                if (this.operationLog.length > 0) {
                  ForEach(this.operationLog, (log: string, index: number) => {
                    Text(log)
                      .fontSize(10)
                      .fontColor(log.includes('✓') ? '#FF9800' :
                        log.includes('UPDATE') ? '#F57C00' : '#666666')
                      .fontFamily('Courier')
                      .width('100%')
                      .padding(5)
                      .backgroundColor(index % 2 === 0 ? '#F5F5F5' : '#FFFFFF')
                  }, (log: string, index: number) => `${index}_${log}`)
                } else {
                  Text('暂无事件日志')
                    .fontSize(10)
                    .fontColor('#999999')
                    .width('100%')
                    .textAlign(TextAlign.Center)
                    .padding(8)
                }
              }
              .width('100%')
            }
            .width('100%')
            .height('20.49%')
            .backgroundColor('#FAFAFA')
            .borderRadius(6)
            .border({ width: 1, color: '#E0E0E0' })
            .scrollBar(BarState.Auto)
          }
          .width('94%')
          .alignItems(HorizontalAlign.Start)

          // 测试说明
          Column({ space: 5 }) {
            Text('📝 测试说明与预期结果')
              .fontSize(12)
              .fontWeight(FontWeight.Bold)
              .fontColor('#182431')

            Column({ space: 4 }) {
              Text('🎯 测试步骤：')
                .fontSize(11)
                .fontColor('#FF9800')
                .fontWeight(FontWeight.Bold)
                .width('100%')

              Text('1️⃣ 在按钮上使用鼠标滚轮滚动')
                .fontSize(11)
                .fontColor('#666666')
                .width('100%')
                .margin({ left: 10 })

              Text('2️⃣ 观察 ActionValue 状态显示')
                .fontSize(11)
                .fontColor('#666666')
                .width('100%')
                .margin({ left: 10 })

              Text('3️⃣ 查看事件日志中的关键字 actionValue')
                .fontSize(11)
                .fontColor('#666666')
                .width('100%')
                .margin({ left: 10 })

              Divider().margin({ top: 5, bottom: 5 })

              Text('✅ 预期结果：')
                .fontSize(11)
                .fontColor('#FF9800')
                .fontWeight(FontWeight.Bold)
                .width('100%')

              Text('• 轴事件滚动中时返回 UPDATE')
                .fontSize(11)
                .fontColor('#FF9800')
                .fontWeight(FontWeight.Bold)
                .width('100%')
                .margin({ left: 10 })

              Text('• 日志中返回数字 2')
                .fontSize(11)
                .fontColor('#FF9800')
                .fontWeight(FontWeight.Bold)
                .width('100%')
                .margin({ left: 10 })

              Text('• hilog 包含 [关键字actionValue]')
                .fontSize(11)
                .fontColor('#FF9800')
                .fontWeight(FontWeight.Bold)
                .width('100%')
                .margin({ left: 10 })

              Divider().margin({ top: 5, bottom: 5 })

              Text('📌 AxisAction 枚举值：')
                .fontSize(10)
                .fontColor('#666666')
                .fontWeight(FontWeight.Bold)
                .width('100%')

              Text('  BEGIN = 1   (轴事件开始)')
                .fontSize(10)
                .fontColor('#4CAF50')
                .fontFamily('Courier')
                .width('100%')
                .margin({ left: 5 })

              Text('  UPDATE = 2  (轴事件更新) ✓')
                .fontSize(10)
                .fontColor('#FF9800')
                .fontFamily('Courier')
                .fontWeight(FontWeight.Bold)
                .width('100%')
                .margin({ left: 5 })

              Text('  END = 3     (轴事件结束)')
                .fontSize(10)
                .fontColor('#2196F3')
                .fontFamily('Courier')
                .width('100%')
                .margin({ left: 5 })

              Text('  CANCEL = 4  (轴事件取消)')
                .fontSize(10)
                .fontColor('#F44336')
                .fontFamily('Courier')
                .width('100%')
                .margin({ left: 5 })

              Divider().margin({ top: 5, bottom: 5 })

              Text('💡 提示：UPDATE 事件通常会触发多次')
                .fontSize(10)
                .fontColor('#666666')
                .fontStyle(FontStyle.Italic)
                .width('100%')
                .margin({ left: 10 })
            }
            .width('100%')
            .padding(10)
            .backgroundColor('#FFF3E0')
            .borderRadius(6)
            .alignItems(HorizontalAlign.Start)
          }
          .width('94%')
          .alignItems(HorizontalAlign.Start)

        }
        .width('100%')
        .padding({ left: 10, right: 10, bottom: 10 })
      }
      .layoutWeight(1)
      .scrollBar(BarState.Auto)

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FAFAFA')
  }
}

