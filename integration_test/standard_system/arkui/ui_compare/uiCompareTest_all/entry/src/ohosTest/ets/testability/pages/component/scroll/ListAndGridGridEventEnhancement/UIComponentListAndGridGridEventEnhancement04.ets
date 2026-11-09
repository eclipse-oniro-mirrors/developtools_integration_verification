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
struct UIComponentListAndGridGridEventEnhancement04 {
  @State scrollFrameBeginCount: number = 0;
  @State statusMessage: string = '等待操作';
  @State statusColor: Color = Color.Grey;
  @State statusMsgs: string[] = [];
  @State currentScrollPosition: string = '顶部';
  @State lastOffset: number = 0;
  private dataSource: number[] = [];
  private scroller: Scroller = new Scroller();

  aboutToAppear(): void {
    console.info('Index: Grid onScrollFrameBegin 测试页面加载');
    // 初始化数据源：1 到 100（足够多的数据以便滚动）
    for (let i = 1; i <= 20; i++) {
      this.dataSource.push(i);
    }
  }

  addLog(message: string) {
    const timestamp = new Date().toLocaleTimeString();
    const logMessage = `[${timestamp}] ${message}`;
    this.statusMsgs.unshift(logMessage);
    if (this.statusMsgs.length > 10) {
      this.statusMsgs.pop();
    }
    console.info(logMessage);
  }

  build() {
    Column({ space: 4 }) {
      Column({ space: 2 }) {
        Text('Grid onScrollFrameBegin 事件测试')
          .fontSize(13)
          .fontWeight(FontWeight.Bold)
          .fontColor('#182431')

        Text('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_EVENTENHANCEMENT_0260_461')
          .fontSize(7)
          .fontColor('#99182431')
          .fontFamily('Courier')

        Divider().strokeWidth(1).color('#E5E5E5')
      }
      .width('100%')
      .padding(4)
      .backgroundColor('#FAFAFA')

      Scroll() {
        Column({ space: 4 }) {
          // 测试说明
          Column({ space: 2 }) {
            Text('✦ 测试场景')
              .fontSize(10)
              .fontWeight(FontWeight.Medium)
              .fontColor('#182431')
              .width('100%')

            Text('验证手指滑动Grid触发onScrollFrameBegin事件')
              .fontSize(8)
              .fontColor('#666666')
              .width('100%')
              .lineHeight(12)
              .padding(3)
              .backgroundColor('#FFF8E1')
              .borderRadius(3)
              .border({ width: 1, color: '#FFE082' })
          }
          .width('96%')
          .alignItems(HorizontalAlign.Start)

          // 状态显示
          Column({ space: 2 }) {
            Text('✦ 当前状态')
              .fontSize(10)
              .fontWeight(FontWeight.Medium)
              .fontColor('#182431')
              .width('100%')

            Row({ space: 6 }) {
              Column({ space: 1 }) {
                Text('当前位置')
                  .fontSize(8)
                  .fontColor('#666666')
                Text(this.currentScrollPosition)
                  .fontSize(11)
                  .fontWeight(FontWeight.Bold)
                  .fontColor('#007DFF')
              }

              Column({ space: 1 }) {
                Text('帧开始触发')
                  .fontSize(8)
                  .fontColor('#666666')
                Text(`${this.scrollFrameBeginCount}`)
                  .fontSize(11)
                  .fontWeight(FontWeight.Bold)
                  .fontColor(this.scrollFrameBeginCount > 0 ? '#FF6B6B' : '#999999')
              }

              Column({ space: 1 }) {
                Text('偏移量')
                  .fontSize(8)
                  .fontColor('#666666')
                Text(`${this.lastOffset.toFixed(1)}`)
                  .fontSize(11)
                  .fontWeight(FontWeight.Bold)
                  .fontColor('#9C27B0')
              }
            }
            .width('100%')
            .padding(5)
            .backgroundColor('#E3F2FD')
            .borderRadius(3)
            .justifyContent(FlexAlign.SpaceAround)

            Text(this.statusMessage)
              .fontSize(8)
              .fontWeight(FontWeight.Bold)
              .fontColor(this.statusColor)
              .width('100%')
              .padding(4)
              .backgroundColor('#F5F5F5')
              .borderRadius(3)
              .border({ width: 1, color: '#E0E0E0' })
          }
          .width('96%')
          .alignItems(HorizontalAlign.Start)

          // Grid 展示区
          Column({ space: 2 }) {
            Text('✦ Grid 组件展示（100项数据）')
              .fontSize(10)
              .fontWeight(FontWeight.Medium)
              .fontColor('#182431')
              .width('100%')

            Text('👉 请用手指滑动 Grid 组件')
              .fontSize(8)
              .fontColor('#FF6D00')
              .fontWeight(FontWeight.Bold)
              .width('100%')

            // Grid 组件
            Grid(this.scroller) {
              ForEach(this.dataSource, (item: number) => {
                GridItem() {
                  Text(`${item}`)
                    .fontSize(12)
                    .fontWeight(FontWeight.Medium)
                    .fontColor('#FFFFFF')
                    .width('100%')
                    .height('100%')
                    .textAlign(TextAlign.Center)
                    .backgroundColor(item % 2 === 0 ? '#4CAF50' : '#2196F3')
                    .borderRadius(4)
                }
                .width('100%')
                .height('3.69%')
              }, (item: number) => item.toString())
            }
            .id('UIComponentListAndGridGridEventEnhancement04')
            .columnsTemplate('1fr 1fr 1fr')
            .columnsGap(6)
            .rowsGap(6)
            .width('100%')
            .height('20.49%')
            .backgroundColor('#F0F0F0')
            .borderRadius(4)
            .border({ width: 2, color: '#FF6B6B', style: BorderStyle.Solid })
            .onScrollFrameBegin((offset: number) => {
              this.scrollFrameBeginCount++;
              this.lastOffset = offset;
              // 监控滚动方向
              if (offset < 0) {
                this.currentScrollPosition = '向上滚动...';
              } else if (offset > 0) {
                this.currentScrollPosition = '向下滚动...';
              }
              this.statusMessage = `✓ onScrollFrameBegin 触发！偏移量: ${offset.toFixed(1)}`;
              this.statusColor = Color.Red;
              this.addLog(`✓ onScrollFrameBegin 触发 (第 ${this.scrollFrameBeginCount} 次, offset: ${offset.toFixed(1)})`);
              return { offsetRemain: offset };
            })
          }
          .width('96%')
          .alignItems(HorizontalAlign.Start)

          // 操作按钮区
          Column({ space: 3 }) {
            Text('✦ 操作按钮')
              .fontSize(10)
              .fontWeight(FontWeight.Medium)
              .fontColor('#182431')
              .width('100%')

            Row({ space: 5 }) {
              Button('滚到顶部')
                .id('Index_01')
                .fontSize(9)
                .layoutWeight(1)
                .height(32)
                .backgroundColor('#00BCD4')
                .fontColor('#FFFFFF')
                .borderRadius(4)
                .onClick(() => {
                  console.info('Grid: 点击滚动到顶部按钮');
                  this.scroller.scrollEdge(Edge.Top);
                  this.statusMessage = '✓ 滚动到顶部';
                  this.statusColor = Color.Blue;
                  this.addLog('编程式滚动到顶部');
                })

              Button('滚到底部')
                .id('Index_02')
                .fontSize(9)
                .layoutWeight(1)
                .height(32)
                .backgroundColor('#FF5722')
                .fontColor('#FFFFFF')
                .borderRadius(4)
                .onClick(() => {
                  console.info('Grid: 点击滚动到底部按钮');
                  this.scroller.scrollEdge(Edge.Bottom);
                  this.statusMessage = '✓ 滚动到底部';
                  this.statusColor = Color.Orange;
                  this.addLog('编程式滚动到底部');
                })
            }
            .width('100%')

            Button('清除日志')
              .id('Index_03')
              .fontSize(9)
              .width('100%')
              .height(28)
              .backgroundColor('#607d7B')
              .fontColor('#FFFFFF')
              .borderRadius(4)
              .onClick(() => {
                console.info('Grid: 点击清除日志按钮');
                this.scrollFrameBeginCount = 0;
                this.lastOffset = 0;
                this.statusMsgs = [];
                this.currentScrollPosition = '顶部';
                this.statusMessage = '已清除所有日志';
                this.statusColor = Color.Grey;
              })
          }
          .width('96%')
          .alignItems(HorizontalAlign.Start)

          // 事件日志
          Column({ space: 2 }) {
            Text('✦ 事件日志（最近10条）')
              .fontSize(10)
              .fontWeight(FontWeight.Medium)
              .fontColor('#182431')
              .width('100%')

            if (this.statusMsgs.length > 0) {
              Column({ space: 1 }) {
                ForEach(this.statusMsgs, (log: string, index: number) => {
                  Text(log)
                    .fontSize(7)
                    .fontColor(log.includes('onScrollFrameBegin') ? '#FF6B6B' : '#666666')
                    .fontFamily('Courier')
                    .width('100%')
                    .padding(2)
                    .backgroundColor(index % 2 === 0 ? '#F5F5F5' : '#FFFFFF')
                }, (log: string, index: number) => `${index}_${log}`)
              }
              .width('100%')
              .backgroundColor('#FAFAFA')
              .borderRadius(3)
              .border({ width: 1, color: '#E0E0E0' })
            } else {
              Text('暂无日志')
                .fontSize(8)
                .fontColor('#999999')
                .width('100%')
                .textAlign(TextAlign.Center)
                .padding(6)
                .backgroundColor('#FAFAFA')
                .borderRadius(3)
                .border({ width: 1, color: '#E0E0E0' })
            }
          }
          .width('96%')
          .alignItems(HorizontalAlign.Start)

          // 操作步骤
          Column({ space: 2 }) {
            Text('✦ 操作步骤')
              .fontSize(10)
              .fontWeight(FontWeight.Medium)
              .fontColor('#182431')
              .width('100%')

            Column({ space: 1 }) {
              Text('【手势滚动方式】')
                .fontSize(8)
                .fontColor('#FF6D00')
                .fontWeight(FontWeight.Bold)
                .width('100%')
              Text('1. 手指在 Grid 上滑动（向上或向下均可）')
                .fontSize(8)
                .fontColor('#666666')
                .width('100%')
              Text('2. 观察 onScrollFrameBegin 事件持续触发')
                .fontSize(8)
                .fontColor('#666666')
                .width('100%')
              Text('3. 查看偏移量变化（负数=向上，正数=向下）')
                .fontSize(8)
                .fontColor('#666666')
                .width('100%')
              Text('【按钮滚动方式】')
                .fontSize(8)
                .fontColor('#00BCD4')
                .fontWeight(FontWeight.Bold)
                .width('100%')
              Text('4. 点击"滚到底部"或"滚到顶部"按钮也会触发')
                .fontSize(8)
                .fontColor('#666666')
                .width('100%')
              Text('5. 重复步骤验证多次触发')
                .fontSize(8)
                .fontColor('#666666')
                .width('100%')
            }
            .width('100%')
            .padding(3)
            .backgroundColor('#E3F2FD')
            .borderRadius(3)
            .border({ width: 1, color: '#90CAF9' })
          }
          .width('96%')
          .alignItems(HorizontalAlign.Start)

          // 预期结果
          Column({ space: 2 }) {
            Text('✦ 预期结果')
              .fontSize(10)
              .fontWeight(FontWeight.Medium)
              .fontColor('#182431')
              .width('100%')

            Column({ space: 1 }) {
              Text('• 手指滑动时每帧开始触发 onScrollFrameBegin')
                .fontSize(8)
                .fontColor('#4CAF50')
                .width('100%')
              Text('• 事件持续触发，次数快速累计')
                .fontSize(8)
                .fontColor('#4CAF50')
                .width('100%')
              Text('• 偏移量实时更新显示')
                .fontSize(8)
                .fontColor('#4CAF50')
                .width('100%')
              Text('• 日志显示红色标识 onScrollFrameBegin')
                .fontSize(8)
                .fontColor('#4CAF50')
                .width('100%')
              Text('• 当前位置实时更新显示')
                .fontSize(8)
                .fontColor('#4CAF50')
                .width('100%')
              Text('• 所有操作无崩溃正常响应')
                .fontSize(8)
                .fontColor('#4CAF50')
                .fontWeight(FontWeight.Bold)
                .width('100%')
            }
            .width('100%')
            .padding(3)
            .backgroundColor('#E8F5E9')
            .borderRadius(3)
            .border({ width: 1, color: '#A5D6A7' })
          }
          .width('96%')
          .alignItems(HorizontalAlign.Start)
        }
        .width('100%')
        .padding({ left: 4, right: 4, bottom: 4 })
      }
      .layoutWeight(1)
      .scrollBar(BarState.Auto)

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
