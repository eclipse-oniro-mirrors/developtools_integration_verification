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
 * 用例ID: SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MULTISELECTDRAG-EFFECT_0560
 * 用例描述: 选中子组件后长按不松手，连续使用3次返回
 * 测试条件: 更新SDK及镜像
 * 测试步骤: 1、选中子组件后长按不松手，连续使用3次返回后松手 2、再次进入测试页面使用手指和鼠标进行多选拖拽
 * 预期结果: 返回后取消拖拽，再次进入页面拖拽效果正常
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct MultiselectDrag0560 {
  @Local testLog: string[] = [];
  @Local selectedItems: number[] = [1, 2, 3];
  @Local dragStatus: string = '等待操作';
  @Local backPressCount: number = 0;
  @Local dragTestCount: number = 0;
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
    hilog.info(0x0000, 'MultiselectDrag0560', log);
  }

  isSelected(item: number): boolean {
    return this.selectedItems.includes(item);
  }

  build() {
    Column({ space: 8 }) {
      Text('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MULTISELECTDRAG-EFFECT_0560')
        .fontSize(8)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('长按不松手 + 连续3次返回')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      Row({ space: 15 }) {
        Column() {
          Text('返回次数')
            .fontSize(11)
          Text(`${this.backPressCount}`)
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.Blue)
        }
        Column() {
          Text('拖拽测试')
            .fontSize(11)
          Text(`${this.dragTestCount}次`)
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.Green)
        }
        Column() {
          Text('状态')
            .fontSize(11)
          Text(`${this.dragStatus}`)
            .fontSize(12)
            .fontWeight(FontWeight.Bold)
            .fontColor(this.dragStatus.includes('取消') ? Color.Red : Color.Orange)
        }
      }

      Row({ space: 10 }) {
        Button('模拟返回')
          .onClick(() => {
            this.backPressCount++;
            this.addLog(`按下返回键 (第${this.backPressCount}次)`);
            if (this.backPressCount >= 3) {
              this.dragStatus = '拖拽已取消';
              this.addLog('连续3次返回，拖拽取消，请再次测试拖拽');
            }
          })
          .fontSize(11)
          .id('MultiselectDrag0560_BackBtn')

        Button('重置')
          .onClick(() => {
            this.backPressCount = 0;
            this.dragStatus = '等待操作';
            this.dragTestCount = 0;
            this.testLog = [];
            this.addLog('已重置，可重新测试');
          })
          .fontSize(11)
          .id('MultiselectDrag0560_ResetBtn')
      }

      Divider().height(1).color('#EEEEEE')

      Text('已预选项目 [1, 2, 3]：')
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
            .height('4.51%')
            .backgroundColor(this.isSelected(item) ? '#2196F3' : '#E0E0E0')
            .borderRadius(8)
            .justifyContent(FlexAlign.Center)
          }
        })
      }
      .columnsTemplate('1fr 1fr 1fr')
      .rowsGap(8)
      .columnsGap(8)
      .width('100%')
      .height('14.75%')
      .draggable(true)
      .onDragStart(() => {
        this.dragStatus = '拖拽中...';
        this.dragTestCount++;
        this.addLog(`拖拽开始 (第${this.dragTestCount}次)`);
      })
      .onDragEnd(() => {
        this.dragStatus = '拖拽正常';
        this.addLog('拖拽结束，效果正常');
      })
      .id('MultiselectDrag0560_Grid')

      Divider().height(1).color('#EEEEEE')

      Text('操作：1.长按不松手+3次返回 2.再次拖拽测试')
        .fontSize(11)
        .fontColor(Color.Gray)

      Text('预期: 返回后取消拖拽，再次进入页面拖拽效果正常')
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

