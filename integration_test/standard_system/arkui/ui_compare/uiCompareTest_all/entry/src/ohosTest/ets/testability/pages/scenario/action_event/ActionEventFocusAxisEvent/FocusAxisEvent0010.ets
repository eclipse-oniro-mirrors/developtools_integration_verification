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
 * 用例ID: SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0010
 * 用例描述: 使用手柄触发FocusAxisEvent-target
 * 测试条件: 创建button组件，绑定FocusAxisEvent事件
 * 测试步骤: 1、使按钮获焦 2、移动手柄的遥杆
 * 预期结果: 打印控件信息，组件的长和宽，目标元素左上角相对父元素和相对页面左上角的位置
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct FocusAxisEvent0010 {
  @Local testLog: string[] = [];
  @Local targetWidth: string = '-';
  @Local targetHeight: string = '-';
  @Local targetPositionX: string = '-';
  @Local targetPositionY: string = '-';
  @Local targetGlobalPositionX: string = '-';
  @Local targetGlobalPositionY: string = '-';
  @Local eventTriggered: boolean = false;

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 30) {
      this.testLog = this.testLog.slice(0, 30);
    }
    hilog.info(0x0000, 'FocusAxisEvent0010', log);
  }

  build() {
    Column({ space: 8 }) {
      Text('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0010')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('使用手柄触发FocusAxisEvent-target')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      // 目标信息显示区域
      Column({ space: 4 }) {
        Text('Target信息:').fontSize(12).fontWeight(FontWeight.Bold)
        Row() {
          Text(`宽度: ${this.targetWidth}`).fontSize(11).layoutWeight(1)
          Text(`高度: ${this.targetHeight}`).fontSize(11).layoutWeight(1)
        }
        Row() {
          Text(`position.x: ${this.targetPositionX}`).fontSize(11).layoutWeight(1)
          Text(`position.y: ${this.targetPositionY}`).fontSize(11).layoutWeight(1)
        }
        Row() {
          Text(`globalPos.x: ${this.targetGlobalPositionX}`).fontSize(11).layoutWeight(1)
          Text(`globalPos.y: ${this.targetGlobalPositionY}`).fontSize(11).layoutWeight(1)
        }
      }
      .width('95%')
      .padding(8)
      .backgroundColor('#E3F2FD')
      .borderRadius(4)

      Divider().height(1).color('#EEEEEE')

      // 测试按钮
      Button('测试按钮 - 使用手柄遥杆触发')
        .width('80%')
        .height(60)
        .fontSize(14)
        .backgroundColor(this.eventTriggered ? '#4CAF50' : '#2196F3')
        .id('FocusAxisEvent0010_Button')
        .focusable(true)
        .defaultFocus(true)
        .onFocusAxisEvent((event: FocusAxisEvent) => {
          this.eventTriggered = true;
          const target = event.target;
          const area = target.area;
          
          this.targetWidth = `${area.width}`;
          this.targetHeight = `${area.height}`;
          this.targetPositionX = `${JSON.stringify(area.position.x)}`;
          this.targetPositionY = `${JSON.stringify(area.position.y)}`;
          this.targetGlobalPositionX = `${JSON.stringify(area.globalPosition.x)}`;
          this.targetGlobalPositionY = `${JSON.stringify(area.globalPosition.y)}`;
          
          this.addLog(`target.width: ${area.width}`);
          this.addLog(`target.height: ${area.height}`);
          this.addLog(`position: (${JSON.stringify(area.position.x)}, ${JSON.stringify(area.position.y)})`);
          this.addLog(`globalPosition: (${JSON.stringify(area.globalPosition.x)}, ${JSON.stringify(area.globalPosition.y)})`);
        })

      Divider().height(1).color('#EEEEEE')

      Text('操作说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text('1. 连接手柄设备\n2. 确保按钮已获焦（默认获焦）\n3. 移动手柄的遥杆\n4. 观察target信息显示')
        .fontSize(11)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Text('预期: 打印组件的长、宽、相对父元素和页面的位置')
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
      .height('9.84%')
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

