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
import { router, FrameNode, ComponentContent } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';


@Builder
function buildContent() {
  Column() {
    Text('ComponentContent 内容')
      .fontSize(14)
      .fontColor('#FFFFFF')
      .backgroundColor('#2196F3')
      .padding(10)
  }
}

@Entry
@Component
struct ActionEventCommonEventFrameNode12 {
  @State operationLog: string[] = [];
  @State frameNodeInfo: string = '未创建 FrameNode';
  @State addContentStatus: string = '未调用';
  private frameNode: FrameNode | null = null;
  private componentContent: ComponentContent<Object> | null = null;
  private isDisposed: boolean = false;

  aboutToAppear() {
    hilog.info(0x0000, 'testTag', '=== Index 页面加载 ===');
    this.addLog('Index 页面已加载');
    this.addLog('准备测试 FrameNode dispose 后调用 addComponentContent');
  }

  addLog(message: string) {
    const timestamp = new Date().toLocaleTimeString();
    const log = `[${timestamp}] ${message}`;
    this.operationLog.unshift(log);
    if (this.operationLog.length > 20) {
      this.operationLog.pop();
    }
    hilog.info(0x0000, 'sally', log);
  }

  build() {
    Column({ space: 8 }) {
      // 标题区域
      Column({ space: 2 }) {
        Text('FrameNode 基础方法测试')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFFFFF')
          .width('100%')
          .textAlign(TextAlign.Center)

        Text('SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_4291')
          .fontSize(8)
          .fontColor('#FFD700')
          .fontFamily('Courier')
          .width('100%')
          .textAlign(TextAlign.Center)
      }
      .width('100%')
      .padding(10)
      .backgroundColor('#4CAF50')

      Scroll() {
        Column({ space: 8 }) {
          // 当前页面标识
          Column({ space: 3 }) {
            Text('📄 测试页面')
              .fontSize(11)
              .fontWeight(FontWeight.Bold)
              .fontColor('#182431')

            Text('FrameNode在dispose后，调用addComponentContent接口，不会crash')
              .fontSize(14)
              .fontWeight(FontWeight.Bold)
              .fontColor('#FFFFFF')
              .width('100%')
              .padding(8)
              .backgroundColor('#4CAF50')
              .borderRadius(6)
              .textAlign(TextAlign.Center)
          }
          .width('96%')
          .alignItems(HorizontalAlign.Start)

          // FrameNode 状态显示
          Column({ space: 3 }) {
            Text('🔍 FrameNode 状态')
              .fontSize(11)
              .fontWeight(FontWeight.Bold)
              .fontColor('#182431')

            Text(this.frameNodeInfo)
              .fontSize(13)
              .fontColor('#4CAF50')
              .fontWeight(FontWeight.Bold)
              .width('100%')
              .padding(10)
              .backgroundColor('#E8F5E9')
              .borderRadius(6)
              .textAlign(TextAlign.Center)
              .border({ width: 2, color: '#4CAF50' })
          }
          .width('96%')
          .alignItems(HorizontalAlign.Start)

          // addComponentContent 状态显示
          Column({ space: 3 }) {
            Text('📊 addComponentContent 状态')
              .fontSize(11)
              .fontWeight(FontWeight.Bold)
              .fontColor('#182431')

            Text(this.addContentStatus)
              .fontSize(13)
              .fontColor('#FF5722')
              .fontWeight(FontWeight.Bold)
              .width('100%')
              .padding(10)
              .backgroundColor('#FFEBEE')
              .borderRadius(6)
              .textAlign(TextAlign.Center)
              .border({ width: 2, color: '#FF5722' })
          }
          .width('96%')
          .alignItems(HorizontalAlign.Start)

          // 操作按钮区域
          Column({ space: 6 }) {
            Text('🎮 操作按钮')
              .fontSize(11)
              .fontWeight(FontWeight.Bold)
              .fontColor('#182431')

            Button('230 基础方法补充')
              .id('ActionEventCommonEventFrameNode12_01')
              .fontSize(14)
              .width('100%')
              .height(40)
              .backgroundColor('#4CAF50')
              .fontColor('#FFFFFF')
              .fontWeight(FontWeight.Bold)
              .onClick(() => {
                this.addLog('点击 "230 基础方法补充" 按钮');
                this.addLog('准备创建 FrameNode 并测试 addComponentContent');
              })

            Button('addComponentContent')
              .id('ActionEventCommonEventFrameNode12_02')
              .fontSize(14)
              .width('100%')
              .height(40)
              .backgroundColor('#2196F3')
              .fontColor('#FFFFFF')
              .fontWeight(FontWeight.Bold)
              .onClick(() => {
                this.addLog('点击 "addComponentContent" 按钮');
                try {
                  this.frameNode = new FrameNode(this.getUIContext());
                  this.addLog('✓ 创建了新的 FrameNode');
                  
                  // 创建 ComponentContent
                  this.componentContent = new ComponentContent(this.getUIContext(), wrapBuilder(buildContent));
                  this.addLog('✓ 创建了 ComponentContent');
                  
                  // 添加 ComponentContent 到 FrameNode
                  this.frameNode.addComponentContent(this.componentContent);
                  this.addLog('✓ addComponentContent 调用成功');
                  hilog.info(0x0000, 'sally', 'addComponentContent before dispose: success');
                  this.frameNodeInfo = 'FrameNode 已创建并添加了 ComponentContent';
                  this.addContentStatus = '添加成功';
                  this.isDisposed = false;
                  
                } catch (error) {
                  const err = error as Error;
                  this.addLog(`✗ 错误: ${err.message}`);
                  hilog.error(0x0000, 'sally', `Error: ${err.message}`);
                  this.frameNodeInfo = 'addComponentContent 调用失败';
                  this.addContentStatus = '添加失败';
                }
              })

            Button('dispose')
              .id('ActionEventCommonEventFrameNode12_03')
              .fontSize(14)
              .width('100%')
              .height(40)
              .backgroundColor('#FF9800')
              .fontColor('#FFFFFF')
              .fontWeight(FontWeight.Bold)
              .onClick(() => {
                this.addLog('点击 "dispose" 按钮');

                try {
                  if (!this.frameNode) {
                    this.addLog('✗ 请先点击 addComponentContent 创建节点');
                    return;
                  }
                  
                  // 先 dispose
                  this.frameNode.dispose();
                  this.isDisposed = true;
                  this.addLog('✓ FrameNode 已 dispose');
                  hilog.info(0x0000, 'sally', 'FrameNode disposed');
                  
                  // dispose 后再调用 addComponentContent
                  if (this.componentContent !== null) {
                    this.frameNode.addComponentContent(this.componentContent);
                    this.addLog('✓ dispose 后调用 addComponentContent 成功');
                    this.addLog('✓ 应用不会crash');
                    hilog.info(0x0000, 'sally', 'addComponentContent after dispose: no crash');
                    this.frameNodeInfo = 'FrameNode 已 dispose（应用未crash）';
                    this.addContentStatus = 'dispose 后调用成功（未crash）';
                  }
                  
                } catch (error) {
                  const err = error as Error;
                  this.addLog(`dispose 后调用错误: ${err.message}`);
                  this.addLog('✓ 虽然抛出异常，但应用不会crash');
                  hilog.info(0x0000, 'sally', `addComponentContent after dispose error: ${err.message}`);
                  this.frameNodeInfo = 'FrameNode 已 dispose（应用未crash）';
                  this.addContentStatus = 'dispose 后调用有异常但未crash';
                }
              })

            Button('重置测试')
              .fontSize(13)
              .width('100%')
              .height(38)
              .backgroundColor('#607d7B')
              .fontColor('#FFFFFF')
              .onClick(() => {
                this.frameNode = null;
                this.componentContent = null;
                this.isDisposed = false;
                this.frameNodeInfo = '未创建 FrameNode';
                this.addContentStatus = '未调用';
                this.addLog('✓ 测试已重置');
              })
          }
          .width('96%')
          .alignItems(HorizontalAlign.Start)

          // 操作日志
          Column({ space: 3 }) {
            Text('📋 事件日志')
              .fontSize(11)
              .fontWeight(FontWeight.Bold)
              .fontColor('#182431')

            Scroll() {
              Column({ space: 1 }) {
                if (this.operationLog.length > 0) {
                  ForEach(this.operationLog, (log: string, index: number) => {
                    Text(log)
                      .fontSize(9)
                      .fontColor(log.includes('✓') ? '#4CAF50' :
                        log.includes('BEGIN') ? '#2E7D32' : '#666666')
                      .fontFamily('Courier')
                      .width('100%')
                      .padding(4)
                      .backgroundColor(index % 2 === 0 ? '#F5F5F5' : '#FFFFFF')
                  }, (log: string, index: number) => `${index}_${log}`)
                } else {
                  Text('暂无事件日志')
                    .fontSize(9)
                    .fontColor('#999999')
                    .width('100%')
                    .textAlign(TextAlign.Center)
                    .padding(6)
                }
              }
              .width('100%')
            }
            .width('100%')
            .height('12.3%')
            .backgroundColor('#FAFAFA')
            .borderRadius(4)
            .border({ width: 1, color: '#E0E0E0' })
            .scrollBar(BarState.Auto)
          }
          .width('96%')
          .alignItems(HorizontalAlign.Start)

          // 测试说明
          Column({ space: 3 }) {
            Text('📝 测试说明与预期结果')
              .fontSize(11)
              .fontWeight(FontWeight.Bold)
              .fontColor('#182431')

            Column({ space: 2 }) {
              Text('🎯 测试步骤：')
                .fontSize(10)
                .fontColor('#4CAF50')
                .fontWeight(FontWeight.Bold)
                .width('100%')

              Text('1️⃣ 进入测试demo')
                .fontSize(10)
                .fontColor('#666666')
                .width('100%')
                .margin({ left: 8 })

              Text('2️⃣ 点击 "230 基础方法补充"')
                .fontSize(10)
                .fontColor('#666666')
                .width('100%')
                .margin({ left: 8 })

              Text('3️⃣ 点击 "addComponentContent" 按钮')
                .fontSize(10)
                .fontColor('#666666')
                .width('100%')
                .margin({ left: 8 })

              Text('4️⃣ 点击 "dispose" 按钮，查看页面变化')
                .fontSize(10)
                .fontColor('#666666')
                .width('100%')
                .margin({ left: 8 })

              Divider()
                .margin({ top: 3, bottom: 3 })

              Text('✅ 预期结果：')
                .fontSize(10)
                .fontColor('#4CAF50')
                .fontWeight(FontWeight.Bold)
                .width('100%')

              Text('应用不会crash')
                .fontSize(10)
                .fontColor('#4CAF50')
                .fontWeight(FontWeight.Bold)
                .width('100%')
                .margin({ left: 8 })

              Divider()
                .margin({ top: 3, bottom: 3 })

              Text('📌 FrameNode 方法说明：')
                .fontSize(9)
                .fontColor('#666666')
                .fontWeight(FontWeight.Bold)
                .width('100%')

              Text('  addComponentContent() - 添加组件内容')
                .fontSize(9)
                .fontColor('#4CAF50')
                .fontFamily('Courier')
                .fontWeight(FontWeight.Bold)
                .width('100%')
                .margin({ left: 4 })

              Text('  dispose() - 销毁节点并释放资源')
                .fontSize(9)
                .fontColor('#FF9800')
                .fontFamily('Courier')
                .width('100%')
                .margin({ left: 4 })

              Text('  测试要点：dispose后调用addComponentContent不会crash')
                .fontSize(9)
                .fontColor('#2196F3')
                .fontFamily('Courier')
                .width('100%')
                .margin({ left: 4 })

              Divider()
                .margin({ top: 3, bottom: 3 })

              Text('💡 提示：使用 hilog 过滤 "sally" 查看详细日志')
                .fontSize(9)
                .fontColor('#666666')
                .fontStyle(FontStyle.Italic)
                .width('100%')
                .margin({ left: 8 })

              Text('命令: hdc shell hilog | grep sally')
                .fontSize(8)
                .fontColor('#999999')
                .fontFamily('Courier')
                .width('100%')
                .margin({ left: 8 })
            }
            .width('100%')
            .padding(8)
            .backgroundColor('#E8F5E9')
            .borderRadius(4)
            .alignItems(HorizontalAlign.Start)
          }
          .width('96%')
          .alignItems(HorizontalAlign.Start)

        }
        .width('100%')
        .padding({ left: 8, right: 8, bottom: 8 })
      }
      .layoutWeight(1)
      .scrollBar(BarState.Auto)

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FAFAFA')
  }
}

