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
 * 用例ID: SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0060
 * 用例描述: 使用手柄触发FocusAxisEvent-axisMap
 * 测试条件: 创建button组件，绑定FocusAxisEvent事件
 * 测试步骤: 1、使按钮获焦 2、移动手柄的遥杆
 * 预期结果: 打印手柄的轴值
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct FocusAxisEvent0060 {
  @Local testLog: string[] = [];
  @Local absX: string = '-';
  @Local absY: string = '-';
  @Local absZ: string = '-';
  @Local absRz: string = '-';
  @Local absHat0X: string = '-';
  @Local absHat0Y: string = '-';
  @Local eventCount: number = 0;
  @Local eventTriggered: boolean = false;

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 30) {
      this.testLog = this.testLog.slice(0, 30);
    }
    hilog.info(0x0000, 'FocusAxisEvent0060', log);
  }

  build() {
    Column({ space: 6 }) {
      Text('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0060')
        .fontSize(9)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('使用手柄触发FocusAxisEvent-axisMap')
        .fontSize(13)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      // 轴值信息显示区域
      Column({ space: 4 }) {
        Text('AxisMap轴值信息:').fontSize(11).fontWeight(FontWeight.Bold)
        
        Row() {
          Column() {
            Text('左遥杆').fontSize(10).fontWeight(FontWeight.Bold)
            Text(`absX: ${this.absX}`).fontSize(10)
            Text(`absY: ${this.absY}`).fontSize(10)
          }.layoutWeight(1)
          
          Column() {
            Text('右遥杆').fontSize(10).fontWeight(FontWeight.Bold)
            Text(`absZ: ${this.absZ}`).fontSize(10)
            Text(`absRz: ${this.absRz}`).fontSize(10)
          }.layoutWeight(1)
          
          Column() {
            Text('十字键').fontSize(10).fontWeight(FontWeight.Bold)
            Text(`Hat0X: ${this.absHat0X}`).fontSize(10)
            Text(`Hat0Y: ${this.absHat0Y}`).fontSize(10)
          }.layoutWeight(1)
        }
        
        Text(`事件触发次数: ${this.eventCount}`)
          .fontSize(10)
          .fontColor(Color.Gray)
      }
      .width('95%')
      .padding(6)
      .backgroundColor('#E3F2FD')
      .borderRadius(4)

      // 测试按钮
      Button('测试按钮 - 使用手柄遥杆触发')
        .width('80%')
        .height(50)
        .fontSize(13)
        .backgroundColor(this.eventTriggered ? '#4CAF50' : '#2196F3')
        .id('FocusAxisEvent0060_Button')
        .focusable(true)
        .defaultFocus(true)
        .onFocusAxisEvent((event: FocusAxisEvent) => {
          this.eventTriggered = true;
          this.eventCount++;
          
          const axisMap = event.axisMap;
          if (axisMap) {
            // 获取各轴值 - 使用AxisModel枚举
            this.absX = axisMap.get(AxisModel.ABS_X)?.toFixed(3) ?? '-';
            this.absY = axisMap.get(AxisModel.ABS_Y)?.toFixed(3) ?? '-';
            this.absZ = axisMap.get(AxisModel.ABS_Z)?.toFixed(3) ?? '-';
            this.absRz = axisMap.get(AxisModel.ABS_RZ)?.toFixed(3) ?? '-';
            this.absHat0X = axisMap.get(AxisModel.ABS_HAT0X)?.toFixed(3) ?? '-';
            this.absHat0Y = axisMap.get(AxisModel.ABS_HAT0Y)?.toFixed(3) ?? '-';
            
            this.addLog(`左遥杆: X=${this.absX}, Y=${this.absY}`);
            this.addLog(`右遥杆: Z=${this.absZ}, Rz=${this.absRz}`);
            this.addLog(`十字键: Hat0X=${this.absHat0X}, Hat0Y=${this.absHat0Y}`);
          }
        })

      Divider().height(1).color('#EEEEEE')

      Text('操作说明：').fontSize(11).fontWeight(FontWeight.Bold).alignSelf(ItemAlign.Start)

      Text('1. 连接手柄 2. 按钮获焦 3. 移动遥杆/十字键')
        .fontSize(10)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Text('预期轴值范围:\n十字键: 上(-1)下(1)左(-1)右(1)\n遥杆: 范围[-1,1]')
        .fontSize(9)
        .fontColor('#4CAF50')

      Scroll() {
        Column() {
          ForEach(this.testLog, (log: string, index: number) => {
            Text(log)
              .fontSize(8)
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
    .padding(6)
    .backgroundColor('#F5F5F5')
  }
}

