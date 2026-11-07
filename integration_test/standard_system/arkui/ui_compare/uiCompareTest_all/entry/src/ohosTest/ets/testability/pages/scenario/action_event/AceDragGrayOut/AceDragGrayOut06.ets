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

@Entry
@Component
struct AceDragGrayOut06 {
  @State testId: string = 'SUB_ACE_DRAG_GRAYOUT_0560';
  @State dragStatus: string = '准备就绪';
  @State dragCount: number = 0;
  @State dropCount: number = 0;
  @State lastDragTime: string = 'N/A';
  @State currentDragPosition: string = 'N/A';
  @State dragPreviewMode: string = 'DISABLE_SCALE, ENABLE_DEFAULT_RADIUS';
  @State isDragging: boolean = false;
  @State dragStartTime: number = 0;
  @State dragEndTime: number = 0;
  @State dragDuration: string = 'N/A';

  private getCurrentTime(): string {
    const date = new Date();
    return date.toTimeString().slice(0, 8);
  }

  build() {
    Scroll() {
      Column({ space: 25 }) {
        Column({ space: 10 }) {
          Text('拖拽灰显测试')
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FFFFFF')
            .backgroundColor('#FF6B35')
            .padding(20)
            .borderRadius(15)
            .width('90%')
            .textAlign(TextAlign.Center)

          Text(`测试编号: ${this.testId}`)
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .fontColor('#333333')
            .width('90%')
            .textAlign(TextAlign.Start)
        }
        .margin({ top: 10 })

        Text('拖拽源组件:')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .fontColor('#4CAF50')
          .width('90%')
          .textAlign(TextAlign.Start)
          .margin({ bottom: -15 })

        Column() {
          Image('/icon.png')
            .width(100)
            .height(100)
            .borderRadius(20)
            .margin({ bottom: 15 })
          Text('长按并拖拽我')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.White)
            .margin({ top: 10 })
          Text('(观察我是否会变灰)')
            .fontSize(12)
            .fontColor('#E0F2F1')
            .margin({ top: 5 })
        }
        .id('AceDragGrayOut06_01')
        .width('34.72%')
        .height('8.2%')
        .backgroundColor('#4CAF50')
        .borderRadius(20)
        .justifyContent(FlexAlign.Center)
        .shadow({ radius: 10, color: '#00000020', offsetX: 0, offsetY: 5 })
        .draggable(true)
        .dragPreviewOptions({
          mode: [DragPreviewMode.DISABLE_SCALE, DragPreviewMode.ENABLE_DEFAULT_RADIUS]
        })
        .onDragStart(() => {
          this.dragCount++;
          this.dragStatus = '正在拖拽...';
          this.isDragging = true;
          this.lastDragTime = this.getCurrentTime();
          this.dragStartTime = Date.now();
          this.dragDuration = '计算中...';
          console.info(`[${this.testId}] DragStart - 模式: ${this.dragPreviewMode}, 时间: ${this.lastDragTime}`);
        })
        .onDragEnd((event: DragEvent) => {
          this.dragStatus = '拖拽结束';
          this.isDragging = false;
          this.dragEndTime = Date.now();
          this.dragDuration = `${(this.dragEndTime - this.dragStartTime) / 1000} 秒`;
          this.currentDragPosition = 'N/A';
          console.info(`[${this.testId}] DragEnd - 结果: ${event.getResult()}, 时长: ${this.dragDuration}`);
        })
        .onAppear(() => {
          console.info(`[${this.testId}] 拖拽源组件已显示`);
        })

        Text('释放目标区域:')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .fontColor('#2196F3')
          .width('90%')
          .textAlign(TextAlign.Start)
          .margin({ bottom: -15 })

        Column() {
          Text('释放区域')
            .fontSize(22)
            .fontWeight(FontWeight.Bold)
            .fontColor('#2196F3')
          Text('(将拖拽的组件拖到这里)')
            .fontSize(14)
            .fontColor('#90CAF9')
            .margin({ top: 8 })
        }
        .id('AceDragGrayOut06_02')
        .width('85%')
        .height('8.2%')
        .backgroundColor('#E3F2FD')
        .borderRadius(20)
        .justifyContent(FlexAlign.Center)
        .border({ width: 3, color: '#2196F3', style: BorderStyle.Dashed })
        .onDrop(() => {
          this.dropCount++;
          this.dragStatus = '组件已释放到目标区域';
          console.info(`[${this.testId}] Drop - 释放成功, 累计释放次数: ${this.dropCount}`);
        })

        Column({ space: 5 }) {
          Text('实时状态信息:')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FF6B35')
            .width('100%')
            .textAlign(TextAlign.Center)
          Row({ space: 10 }) {
            Text('当前状态:')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .fontColor('#555555')
            Text(this.dragStatus)
              .fontSize(14)
              .fontColor(this.isDragging ? '#FF6B35' : '#4CAF50')
              .fontWeight(FontWeight.Bold)
          }
          .justifyContent(FlexAlign.Start)
          .width('100%')

          Row({ space: 5 }) {
            Text('拖拽次数:')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .fontColor('#555555')
            Text(`${this.dragCount} 次`)
              .fontSize(14)
              .fontColor('#FF6B35')
              .fontWeight(FontWeight.Bold)
          }
          .justifyContent(FlexAlign.Start)
          .width('100%')

          Row({ space: 10 }) {
            Text('释放次数:')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .fontColor('#555555')
            Text(`${this.dropCount} 次`)
              .fontSize(14)
              .fontColor('#2196F3')
              .fontWeight(FontWeight.Bold)
          }
          .justifyContent(FlexAlign.Start)
          .width('100%')

          Row({ space: 5 }) {
            Text('上次拖拽时间:')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .fontColor('#555555')
            Text(this.lastDragTime)
              .fontSize(14)
              .fontColor('#666666')
          }
          .justifyContent(FlexAlign.Start)
          .width('100%')

          Row({ space: 10 }) {
            Text('拖拽时长:')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .fontColor('#555555')
            Text(this.dragDuration)
              .fontSize(14)
              .fontColor('#666666')
          }
          .justifyContent(FlexAlign.Start)
          .width('100%')
        }
        .width('90%')
        .padding(20)
        .backgroundColor('#F8F8F8')
        .borderRadius(15)
        .shadow({ radius: 5, color: '#00000010', offsetX: 0, offsetY: 2 })

        Column({ space: 5 }) {
          Text('测试预期:')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FF5722')
            .width('100%')
            .textAlign(TextAlign.Center)

          Text('在整个拖拽过程中，绿色的"拖拽源组件"应保持其原始颜色，')
            .fontSize(14)
            .fontColor('#444444')
            .textAlign(TextAlign.Center)
            .lineHeight(22)

          Text('不应出现任何灰显 (grayed out) 的效果。')
            .fontSize(14)
            .fontColor('#444444')
            .textAlign(TextAlign.Center)
            .lineHeight(22)
        }
        .width('90%')
        .padding(15)
        .backgroundColor('#FFF3E0')
        .borderRadius(10)
        .margin({ bottom: 30 })

      }
      .width('100%')
      .backgroundColor('#FAFAFA')
    }
    .width('100%')
    .height('100%')
  }
}
