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
 * 用例ID: SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MULTISELECTDRAG-EFFECT_0550
 * 用例描述: 选中子组件后长按不松手，连续使用2次返回
 * 测试条件: 更新SDK及镜像
 * 测试步骤: 1、选中子组件后长按不松手，连续使用2次返回 2、观察现象
 * 预期结果: 返回后取消拖拽
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct MultiselectDrag0550 {
  @Local testLog: string[] = [];
  @Local selectedItems: number[] = [1, 2];
  @Local dragStatus: string = '等待操作';
  @Local backPressCount: number = 0;
  @Local gridData: number[] = this.generateGridData(9);

  private generateGridData(count: number): number[] {
    let result: number[] = [];
    for (let i: number = 1; i <= count; i++) {
      result.push(i);
    }
    return result;
  }

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 30) {
      this.testLog = this.testLog.slice(0, 30);
    }
    hilog.info(0x0000, 'MultiselectDrag0550', log);
  }

  isSelected(item: number): boolean {
    return this.selectedItems.includes(item);
  }

  build() {
    Column({ space: 8 }) {
      Text('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MULTISELECTDRAG-EFFECT_0550')
        .fontSize(8)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('长按不松手 + 连续2次返回')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      Row({ space: 20 }) {
        Column() {
          Text('返回次数')
            .fontSize(11)
          Text(`${this.backPressCount}`)
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.Blue)
        }
        Column() {
          Text('状态')
            .fontSize(11)
          Text(`${this.dragStatus}`)
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontColor(this.dragStatus.includes('取消') ? Color.Green : Color.Orange)
        }
      }

      Button('模拟返回键')
        .onClick(() => {
          this.backPressCount++;
          this.addLog(`按下返回键 (第${this.backPressCount}次)`);
          if (this.backPressCount >= 2) {
            this.dragStatus = '拖拽已取消';
            this.addLog('连续2次返回，拖拽应取消');
          }
        })
        .fontSize(12)
        .id('MultiselectDrag0550_BackBtn')

      Button('重置')
        .onClick(() => {
          this.backPressCount = 0;
          this.dragStatus = '等待操作';
          this.testLog = [];
          this.addLog('已重置');
        })
        .fontSize(12)
        .id('MultiselectDrag0550_ResetBtn')

      Divider().height(1).color('#EEEEEE')

      Text('已预选项目 [1, 2]，长按拖拽：')
        .fontSize(12)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Grid() {
        ForEach(this.gridData, (item: number) => {
          GridItem() {
            Column() {
              Text(`${item}`)
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .fontColor(this.isSelected(item) ? Color.White : Color.Black)
            }
            .width('100%')
            .height('4.92%')
            .backgroundColor(this.isSelected(item) ? '#FF5722' : '#E0E0E0')
            .borderRadius(8)
            .justifyContent(FlexAlign.Center)
          }
        })
      }
      .columnsTemplate('1fr 1fr 1fr')
      .rowsGap(8)
      .columnsGap(8)
      .width('100%')
      .height('16.39%')
      .draggable(true)
      .onDragStart(() => {
        this.dragStatus = '拖拽中...';
        this.addLog('拖拽开始');
      })
      .onDragEnd(() => {
        this.dragStatus = '拖拽结束';
        this.addLog('拖拽结束');
      })
      .id('MultiselectDrag0550_Grid')

      Divider().height(1).color('#EEEEEE')

      Text('操作说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text('1. 长按已选中项目（不松手）\n2. 连续按2次返回键\n3. 观察拖拽是否取消')
        .fontSize(11)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Text('预期: 返回后取消拖拽')
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
      .height('4.92%')
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

