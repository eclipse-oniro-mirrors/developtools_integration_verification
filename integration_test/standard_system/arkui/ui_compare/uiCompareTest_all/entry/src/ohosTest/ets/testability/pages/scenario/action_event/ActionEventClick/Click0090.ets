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
 * 用例ID: SUB_ACE_ACTION_EVENT_COMMONEVENT_CLICK_0090
 * 用例描述: 两根手指分别按在不同组件内
 * 测试条件: 安装demo
 * 测试步骤: 打开demo，先一根手指触摸蓝色区域不抬起再另外一根手指触摸黄色区域，查看对应日志
 * 预期结果: 收到Down事件前finger2的类型为undefine，之后变成对应类型，在收到Up事件后再度变成undefine
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct Click0090 {
  @Local testLog: string[] = [];
  @Local blueFingerStatus: string = 'undefined';
  @Local yellowFingerStatus: string = 'undefined';
  @Local blueTouchType: string = '等待触摸';
  @Local yellowTouchType: string = '等待触摸';

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 30) {
      this.testLog = this.testLog.slice(0, 30);
    }
    hilog.info(0x0000, 'Click0090', log);
  }

  getTouchTypeName(type: TouchType): string {
    switch (type) {
      case TouchType.Down:
        return 'Down';
      case TouchType.Up:
        return 'Up';
      case TouchType.Move:
        return 'Move';
      case TouchType.Cancel:
        return 'Cancel';
      default:
        return 'Unknown';
    }
  }

  build() {
    Column({ space: 8 }) {
      Text('SUB_ACE_ACTION_EVENT_COMMONEVENT_CLICK_0090')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('两根手指分别按在不同组件内')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      Row({ space: 20 }) {
        Column() {
          Text('蓝色区域')
            .fontSize(11)
          Text(`${this.blueTouchType}`)
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.Blue)
          Text(`finger: ${this.blueFingerStatus}`)
            .fontSize(11)
            .fontColor(Color.Gray)
        }
        Column() {
          Text('黄色区域')
            .fontSize(11)
          Text(`${this.yellowTouchType}`)
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FFC107')
          Text(`finger: ${this.yellowFingerStatus}`)
            .fontSize(11)
            .fontColor(Color.Gray)
        }
      }

      Divider().height(1).color('#EEEEEE')

      Row({ space: 20 }) {
        // 蓝色区域
        Column() {
          Text('蓝色区域')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.White)
          Text('手指1')
            .fontSize(14)
            .fontColor(Color.White)
        }
        .width('20.83%')
        .height('12.3%')
        .backgroundColor('#2196F3')
        .justifyContent(FlexAlign.Center)
        .borderRadius(8)
        .onTouch((event: TouchEvent) => {
          const touchType = this.getTouchTypeName(event.type);
          this.blueTouchType = touchType;
          
          if (event.type === TouchType.Down) {
            this.blueFingerStatus = 'finger1';
            this.addLog(`蓝色区域: Down - finger变为finger1`);
          } else if (event.type === TouchType.Up) {
            this.blueFingerStatus = 'undefined';
            this.blueTouchType = '等待触摸';
            this.addLog(`蓝色区域: Up - finger变为undefined`);
          } else if (event.type === TouchType.Move) {
            this.addLog(`蓝色区域: Move`);
          }
        })
        .id('Click0090_Blue')

        // 黄色区域
        Column() {
          Text('黄色区域')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .fontColor('#333333')
          Text('手指2')
            .fontSize(14)
            .fontColor('#333333')
        }
        .width('20.83%')
        .height('12.3%')
        .backgroundColor('#FFC107')
        .justifyContent(FlexAlign.Center)
        .borderRadius(8)
        .onTouch((event: TouchEvent) => {
          const touchType = this.getTouchTypeName(event.type);
          this.yellowTouchType = touchType;
          
          if (event.type === TouchType.Down) {
            this.yellowFingerStatus = 'finger2';
            this.addLog(`黄色区域: Down - finger变为finger2`);
          } else if (event.type === TouchType.Up) {
            this.yellowFingerStatus = 'undefined';
            this.yellowTouchType = '等待触摸';
            this.addLog(`黄色区域: Up - finger变为undefined`);
          } else if (event.type === TouchType.Move) {
            this.addLog(`黄色区域: Move`);
          }
        })
        .id('Click0090_Yellow')
      }

      Divider().height(1).color('#EEEEEE')

      Text('操作说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text('1. 先用一根手指按住蓝色区域（不抬起）\n2. 再用另一根手指按住黄色区域\n3. 观察日志中finger状态变化')
        .fontSize(11)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Divider().height(1).color('#EEEEEE')

      Text('预期: Down前finger为undefined，Down后变成对应类型，Up后变回undefined')
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

