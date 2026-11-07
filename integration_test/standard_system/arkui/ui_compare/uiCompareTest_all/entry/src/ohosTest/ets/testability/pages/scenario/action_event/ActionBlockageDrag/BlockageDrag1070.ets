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
 * 用例ID: SUB_ACE_ACTION_BLOCKAGE_DRAG_1070
 * 用例描述: 父子组件，父组件阻塞
 * 测试条件: 更新最新版本镜像，打开demo
 * 测试步骤: 1、拖拽父组件 2、拖拽子组件
 * 预期结果: 1、父组件阻塞拖拽 2、子组件正常拖拽
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct BlockageDrag1070 {
  @Local testLog: string[] = [];
  @Local parentDragStatus: string = '未开始';
  @Local childDragStatus: string = '未开始';
  @Local parentDataReady: boolean = false;
  @Local childDataReady: boolean = true; // 子组件数据已就绪
  @Local prepareTime: number = 10000; // 父组件10S加载时间

  aboutToAppear(): void {
    // 模拟父组件数据准备（阻塞）
    setTimeout(() => {
      this.parentDataReady = true;
      this.addLog('父组件数据就绪');
    }, this.prepareTime);
  }

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 20) {
      this.testLog = this.testLog.slice(0, 20);
    }
    hilog.info(0x0000, 'BlockageDrag1070', log);
  }

  build() {
    Column({ space: 10 }) {
      Text('SUB_ACE_ACTION_BLOCKAGE_DRAG_1070')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('父子组件 - 父组件阻塞')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)

      Divider().height(2).color('#EEEEEE')

      Row({ space: 20 }) {
        Column() {
          Text('父组件状态:')
            .fontSize(12)
          Text(this.parentDragStatus)
            .fontSize(14)
            .fontColor(Color.Blue)
        }
        Column() {
          Text('子组件状态:')
            .fontSize(12)
          Text(this.childDragStatus)
            .fontSize(14)
            .fontColor(Color.Green)
        }
      }

      Text(`父组件数据: ${this.parentDataReady ? '已就绪' : '准备中(阻塞)'}`)
        .fontSize(13)
        .fontColor(this.parentDataReady ? Color.Green : Color.Orange)

      Text(`子组件数据: ${this.childDataReady ? '已就绪' : '准备中'}`)
        .fontSize(13)
        .fontColor(Color.Green)

      Divider()

      Column() {
        Text('父子组件结构：')
          .fontSize(14)
          .fontColor('#333333')
          .margin({ bottom: 10 })
          .alignSelf(ItemAlign.Start)

        // 父组件（阻塞）
        Column() {
          Text('父组件（阻塞）')
            .fontSize(14)
            .fontColor(Color.White)
            .margin({ bottom: 10 })

          // 子组件（正常）
          Column() {
            Text('子组件')
              .fontSize(14)
              .fontWeight(FontWeight.Bold)
              .fontColor(Color.White)
            Text('(正常拖拽)')
              .fontSize(12)
              .fontColor(Color.White)
          }
          .width('16.67%')
          .height('4.92%')
          .backgroundColor('#4CAF50')
          .borderRadius(8)
          .justifyContent(FlexAlign.Center)
          .draggable(true)
          .onDragStart(() => {
            this.addLog('子组件 onDragStart');
            this.childDragStatus = '拖拽中...';
          })
          .onDragEnd(() => {
            this.addLog('子组件 onDragEnd');
            this.childDragStatus = '拖拽结束';
          })
          .id('BlockageDrag1070_Child')
        }
        .width('27.78%')
        .height('12.3%')
        .backgroundColor('#F44336')
        .borderRadius(12)
        .justifyContent(FlexAlign.Center)
        .draggable(true)
        .onDragStart(() => {
          this.addLog('父组件 onDragStart');
          if (this.parentDataReady) {
            this.parentDragStatus = '拖拽中...';
          } else {
            this.parentDragStatus = '阻塞中(WAITING)';
            this.addLog('✓ 父组件阻塞拖拽');
          }
        })
        .onDragEnd(() => {
          this.addLog('父组件 onDragEnd');
          this.parentDragStatus = '拖拽结束';
        })
        .id('BlockageDrag1070_Parent')

        Text('拖拽红色父组件（阻塞）或绿色子组件（正常）')
          .fontSize(12)
          .fontColor(Color.Gray)
          .margin({ top: 10 })
      }
      .width('100%')
      .padding(15)
      .backgroundColor('#F0F0F0')
      .borderRadius(8)

      Divider().height(2).color('#EEEEEE')

      Text('预期结果：')
        .fontSize(14)
        .fontColor(Color.Green)
        .alignSelf(ItemAlign.Start)

      Text('• 拖拽父组件: 父组件阻塞拖拽\n• 拖拽子组件: 子组件正常拖拽')
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

