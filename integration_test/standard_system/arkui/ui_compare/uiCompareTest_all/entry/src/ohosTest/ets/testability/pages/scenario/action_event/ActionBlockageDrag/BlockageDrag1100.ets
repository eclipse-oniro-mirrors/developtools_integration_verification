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
 * 用例ID: SUB_ACE_ACTION_BLOCKAGE_DRAG_1100
 * 用例描述: 不调用阻塞接口，拖拽功能正常
 * 测试条件: 更新最新版本镜像，打开demo
 * 测试步骤: 拖拽任意组件
 * 预期结果: 拖动功能正常，不会被阻塞
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct BlockageDrag1100 {
  @Local testLog: string[] = [];
  @Local dragStatus: string = '未开始';
  @Local dragCount: number = 0;
  @Local isBlocked: boolean = false;

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 20) {
      this.testLog = this.testLog.slice(0, 20);
    }
    hilog.info(0x0000, 'BlockageDrag1100', log);
  }

  build() {
    Column({ space: 10 }) {
      Text('SUB_ACE_ACTION_BLOCKAGE_DRAG_1100')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('不调用阻塞接口 - 正常拖拽')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)

      Divider().height(2).color('#EEEEEE')

      Text(`拖拽状态: ${this.dragStatus}`)
        .fontSize(14)
        .fontColor(Color.Blue)
        .fontWeight(FontWeight.Bold)

      Text(`拖拽次数: ${this.dragCount}`)
        .fontSize(14)
        .fontColor(Color.Orange)

      Text(`是否被阻塞: ${this.isBlocked ? '是' : '否 ✓'}`)
        .fontSize(14)
        .fontColor(this.isBlocked ? Color.Red : Color.Green)

      Divider()

      Column() {
        Text('可拖拽组件（无阻塞）：')
          .fontSize(14)
          .fontColor('#333333')
          .margin({ bottom: 10 })
          .alignSelf(ItemAlign.Start)

        Column() {
          Text('拖拽我')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.White)
          Text('(正常拖拽)')
            .fontSize(14)
            .fontColor(Color.White)
        }
        .width('27.78%')
        .height('8.2%')
        .backgroundColor('#00BCD4')
        .borderRadius(12)
        .justifyContent(FlexAlign.Center)
        .draggable(true)
        .onTouch((event: TouchEvent) => {
          if (event.type === TouchType.Down) {
            this.dragStatus = '按下中...';
            this.addLog('Touch Down');
          } else if (event.type === TouchType.Up) {
            this.addLog('Touch Up');
          }
        })
        .onDragStart(() => {
          this.addLog('onDragStart triggered - 正常拖拽');
          this.dragStatus = '拖拽中...';
          this.dragCount++;
          this.isBlocked = false;
          this.addLog('✓ 拖拽功能正常，未被阻塞');
        })
        .onDragEnd(() => {
          this.addLog('onDragEnd triggered');
          this.dragStatus = '拖拽结束';
        })
        .id('BlockageDrag1100_Component')

        Text('直接拖拽组件，验证拖拽功能正常')
          .fontSize(12)
          .fontColor(Color.Gray)
          .margin({ top: 10 })
      }
      .width('100%')
      .padding(15)
      .backgroundColor('#F0F0F0')
      .borderRadius(8)

      // 放置区域
      Column() {
        Text('放置区域')
          .fontSize(14)
          .fontColor('#666666')
      }
      .width('80%')
      .height('6.56%')
      .backgroundColor('#E0E0E0')
      .borderRadius(8)
      .justifyContent(FlexAlign.Center)
      .border({ width: 2, color: '#BDBDBD', style: BorderStyle.Dashed })

      Divider().height(2).color('#EEEEEE')

      Text('预期结果：')
        .fontSize(14)
        .fontColor(Color.Green)
        .alignSelf(ItemAlign.Start)

      Text('• 拖拽任意组件\n• 结果: 拖动功能正常，不会被阻塞')
        .fontSize(12)
        .fontColor('#4CAF50')
        .alignSelf(ItemAlign.Start)
        .padding({ left: 20 })

      Divider().height(2).color('#EEEEEE')

      Text('测试日志：')
        .fontSize(14)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Scroll() {
        Column() {
          ForEach(this.testLog, (log: string, index: number) => {
            Text(log)
              .fontSize(9)
              .fontColor('#333333')
              .width('100%')
              .padding(3)
              .backgroundColor(index % 2 === 0 ? '#F0F0F0' : Color.White)
          })
        }
        .width('100%')
      }
      .height('6.56%')
      .width('90%')
      .backgroundColor('#FAFAFA')
      .borderRadius(4)
      .padding(5)
    }
    .width('100%')
    .height('100%')
    .padding(10)
    .backgroundColor('#F5F5F5')
  }
}

