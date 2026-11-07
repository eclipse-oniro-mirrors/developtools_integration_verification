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
 * 用例ID: SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MULTISELECTDRAG-EFFECT_0540
 * 用例描述: 分屏模式下拖拽
 * 测试条件: 更新SDK及镜像
 * 测试步骤: 1、进入分屏模式 2、将测试demo分屏到下方后，使用手指和鼠标进行多选拖拽
 * 预期结果: 可发起拖拽，动效正常
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct MultiselectDrag0540 {
  @Local testLog: string[] = [];
  @Local selectedItems: number[] = [];
  @Local dragStatus: string = '等待拖拽';
  @Local gridData: number[] = this.generateGridData(12);

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
    hilog.info(0x0000, 'MultiselectDrag0540', log);
  }

  toggleSelection(item: number): void {
    const index = this.selectedItems.indexOf(item);
    if (index > -1) {
      this.selectedItems = this.selectedItems.filter((i: number) => i !== item);
    } else {
      this.selectedItems = [...this.selectedItems, item];
    }
    this.addLog(`已选择: [${this.selectedItems.join(', ')}]`);
  }

  isSelected(item: number): boolean {
    return this.selectedItems.includes(item);
  }

  build() {
    Column({ space: 8 }) {
      Text('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MULTISELECTDRAG-EFFECT_0540')
        .fontSize(8)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('分屏模式下多选拖拽')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      Row({ space: 20 }) {
        Column() {
          Text('已选择')
            .fontSize(11)
          Text(`${this.selectedItems.length}项`)
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.Blue)
        }
        Column() {
          Text('拖拽状态')
            .fontSize(11)
          Text(`${this.dragStatus}`)
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontColor(this.dragStatus === '拖拽中...' ? Color.Orange : Color.Green)
        }
      }

      Text('点击选择多个项目，然后拖拽：')
        .fontSize(12)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Grid() {
        ForEach(this.gridData, (item: number) => {
          GridItem() {
            Column() {
              Text(`${item}`)
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .fontColor(this.isSelected(item) ? Color.White : Color.Black)
            }
            .width('100%')
            .height('5.74%')
            .backgroundColor(this.isSelected(item) ? '#4CAF50' : '#E0E0E0')
            .borderRadius(8)
            .justifyContent(FlexAlign.Center)
            .onClick(() => {
              this.toggleSelection(item);
            })
          }
        })
      }
      .columnsTemplate('1fr 1fr 1fr 1fr')
      .rowsGap(8)
      .columnsGap(8)
      .width('100%')
      .height('14.75%')
      .draggable(true)
      .onDragStart(() => {
        this.dragStatus = '拖拽中...';
        this.addLog(`多选拖拽开始，已选 ${this.selectedItems.length} 项`);
      })
      .onDragEnd(() => {
        this.dragStatus = '拖拽结束';
        this.addLog('多选拖拽结束');
      })
      .id('MultiselectDrag0540_Grid')

      Divider().height(1).color('#EEEEEE')

      Text('操作说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text('1. 进入分屏模式\n2. 将demo分屏到下方\n3. 点击选择多个项目\n4. 使用手指或鼠标拖拽')
        .fontSize(11)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Text('预期: 可发起拖拽，动效正常')
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
      .height('6.56%')
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

