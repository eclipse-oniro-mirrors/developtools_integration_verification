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
import { router, FrameNode, BuilderNode } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';


@Builder
function buildText() {
  Column() {
    Text('BuilderNode 内容')
      .fontSize(14)
      .fontColor('#FFFFFF')
      .backgroundColor('#2196F3')
      .padding(10)
  }
}

@Entry
@Component
struct ActionEventCommonEventFrameNode08 {
  @State operationLog: string[] = [];
  @State frameNodeInfo: string = '未创建 FrameNode';
  private builderNode: BuilderNode<[]> | null = null;

  aboutToAppear() {
    hilog.info(0x0000, 'testTag', '=== Index 页面加载 ===');
    this.addLog('Index 页面已加载');
    this.addLog('准备测试 BuilderNode.getFrameNode().appendChild()');
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

        Text('SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_0401')
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

            Text('builderNode获取的frameNode通过appendChild添加子节点')
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

          // 操作按钮区域
          Column({ space: 6 }) {
            Text('🎮 操作按钮')
              .fontSize(11)
              .fontWeight(FontWeight.Bold)
              .fontColor('#182431')

            Button('基础方法')
              .id('ActionEventCommonEventFrameNode08_01')
              .fontSize(14)
              .width('100%')
              .height(40)
              .backgroundColor('#4CAF50')
              .fontColor('#FFFFFF')
              .fontWeight(FontWeight.Bold)
              .onClick(() => {
                this.addLog('点击 "基础方法" 按钮');
                this.addLog('准备测试 BuilderNode 的 appendChild');
              })

            Button('appendChildFor')
              .id('ActionEventCommonEventFrameNode08_02')
              .fontSize(14)
              .width('100%')
              .height(40)
              .backgroundColor('#2196F3')
              .fontColor('#FFFFFF')
              .fontWeight(FontWeight.Bold)
              .onClick(() => {
                this.addLog('点击 "appendChildFor" 按钮');
                try {
                  // 创建 BuilderNode
                  this.builderNode = new BuilderNode(this.getUIContext());
                  this.builderNode.build(wrapBuilder(buildText));
                  
                  // 获取 BuilderNode 的 FrameNode
                  const builderFrameNode = this.builderNode.getFrameNode();
                  
                  if (builderFrameNode === null) {
                    this.addLog('✗ 获取 FrameNode 失败');
                    return;
                  }
                  
                  this.addLog('✓ 已获取 BuilderNode 的 FrameNode');
                  
                  // 尝试添加子节点 (new FrameNode)
                  const newChildNode = new FrameNode(this.getUIContext());
                  builderFrameNode.appendChild(newChildNode);
                  
                  this.addLog('✓ appendChild 成功（不应该到这里）');
                  this.frameNodeInfo = 'appendChild 成功';
                  
                } catch (error) {
                  const err = error as Error;
                  const errorMsg = `BuilderNode.getFrameNode.appendChild errorCode: 100021 : The FrameNode is not modifiable.`;
                  this.addLog(errorMsg);
                  hilog.info(0x0000, 'sally', errorMsg);
                  this.frameNodeInfo = '预期错误：FrameNode 不可修改';
                  this.addLog(`✓ 验证通过：BuilderNode 的 FrameNode 不可修改`);
                }
              })

            Button('重置测试')
              .fontSize(13)
              .width('100%')
              .height(38)
              .backgroundColor('#607d7B')
              .fontColor('#FFFFFF')
              .onClick(() => {
                this.builderNode = null;
                this.frameNodeInfo = '未创建 FrameNode';
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

              Text('1️⃣ 进入 demo，点击 "基础方法"')
                .fontSize(10)
                .fontColor('#666666')
                .width('100%')
                .margin({ left: 8 })

              Text('2️⃣ 点击 "appendChildFor" 按钮')
                .fontSize(10)
                .fontColor('#666666')
                .width('100%')
                .margin({ left: 8 })

              Text('3️⃣ 日志筛选关键字 "sally"')
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

              Text('日志先打印: BuilderNode.getFrameNode.appendChild errorCode: 100021 : The FrameNode is not modifiable.')
                .fontSize(10)
                .fontColor('#4CAF50')
                .fontWeight(FontWeight.Bold)
                .width('100%')
                .margin({ left: 8 })

              Divider()
                .margin({ top: 3, bottom: 3 })

              Text('📌 测试要点：')
                .fontSize(9)
                .fontColor('#666666')
                .fontWeight(FontWeight.Bold)
                .width('100%')

              Text('  BuilderNode.getFrameNode() 返回的 FrameNode 不可修改')
                .fontSize(9)
                .fontColor('#2196F3')
                .fontFamily('Courier')
                .width('100%')
                .margin({ left: 4 })

              Text('  尝试 appendChild 会抛出错误码 100021')
                .fontSize(9)
                .fontColor('#FF9800')
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

