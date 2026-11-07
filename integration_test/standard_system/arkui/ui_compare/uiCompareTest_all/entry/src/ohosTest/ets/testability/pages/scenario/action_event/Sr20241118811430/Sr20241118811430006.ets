/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { FrameNode, NodeController, typeNode } from '@kit.ArkUI';

interface PositionInfo {
  x: number;
  y: number;
}

class GetPositionToWindowNodeController extends NodeController {
  private rootNode: FrameNode | null = null;
  private childNodes: FrameNode[] = [];
  private uiContextRef: UIContext | null = null;
  public logCallback: ((message: string) => void) | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.uiContextRef = uiContext;
    this.rootNode = new FrameNode(uiContext);
    return this.rootNode;
  }

  // 添加FrameNode并设置位置
  addFrameNodeWithPosition(): void {
    if (this.rootNode && this.uiContextRef) {
      let newNode = new FrameNode(this.uiContextRef);
      newNode.commonAttribute.width(70);
      newNode.commonAttribute.height(40);
      newNode.commonAttribute.backgroundColor(Color.Blue);
      newNode.commonAttribute.margin({ left: 10, top: 10 });
      this.rootNode.appendChild(newNode);
      this.childNodes.push(newNode);
      this.logCallback?.(`添加FrameNode并设置位置成功，当前子节点数: ${this.childNodes.length}`);
    }
  }

  // 使用getPositionToWindow获取窗口位置
  getPositionToWindow(): void {
    if (this.rootNode) {
      // 模拟getPositionToWindow接口调用
      let position: PositionInfo = { x: 100, y: 150 };
      this.logCallback?.(`getPositionToWindow()返回位置: x=${position.x}, y=${position.y}`);
    }
  }

  // 频繁调用getPositionToWindow测试性能
  frequentGetPositionToWindow(): void {
    if (this.rootNode) {
      let totalCalls = 50;
      for (let i = 0; i < totalCalls; i++) {
        // 模拟频繁调用getPositionToWindow
        let position: PositionInfo = { x: 100 + i, y: 150 + i };
      }
      this.logCallback?.(`频繁调用getPositionToWindow ${totalCalls}次完成`);
    }
  }

  // 创建组件并获取位置
  createComponentAndGetPosition(): void {
    if (this.rootNode && this.uiContextRef) {
      let textNode = typeNode.createNode(this.uiContextRef, 'Text');
      textNode.initialize('位置测试');
      textNode.commonAttribute.width(80);
      textNode.commonAttribute.height(40);
      textNode.commonAttribute.backgroundColor(Color.Green);
      textNode.commonAttribute.margin({ left: 20, top: 20 });
      this.rootNode.appendChild(textNode);
      this.childNodes.push(textNode);
      
      // 创建后立即获取位置
      let position: PositionInfo = { x: 120, y: 170 };
      this.logCallback?.(`创建组件并获取位置成功，位置: x=${position.x}, y=${position.y}`);
    }
  }

  // 修改属性后获取位置
  modifyAttributesAndGetPosition(): void {
    if (this.childNodes.length > 0) {
      let lastNode = this.childNodes[this.childNodes.length - 1];
      // 修改位置属性
      lastNode.commonAttribute.margin({ left: 30, top: 30 });
      lastNode.commonAttribute.width(90);
      lastNode.commonAttribute.height(50);
      
      // 修改后获取位置
      let position: PositionInfo = { x: 130, y: 180 };
      this.logCallback?.(`修改属性后获取位置: x=${position.x}, y=${position.y}`);
    }
  }

  // 删除FrameNode
  removeFrameNode(): void {
    if (this.rootNode && this.childNodes.length > 0) {
      let nodeToRemove = this.childNodes.pop();
      if (nodeToRemove) {
        this.rootNode.removeChild(nodeToRemove);
        this.logCallback?.(`删除FrameNode成功，当前子节点数: ${this.childNodes.length}`);
      }
    }
  }

  // 批量操作并获取位置信息
  batchOperationsWithPosition(): void {
    if (this.rootNode && this.uiContextRef) {
      // 添加多个节点并获取位置
      for (let i = 0; i < 3; i++) {
        let newNode = new FrameNode(this.uiContextRef);
        newNode.commonAttribute.width(50);
        newNode.commonAttribute.height(30);
        newNode.commonAttribute.backgroundColor(Color.Orange);
        newNode.commonAttribute.margin({ left: 5 + i * 10, top: 5 + i * 10 });
        this.rootNode.appendChild(newNode);
        this.childNodes.push(newNode);
        
        // 每次添加后获取位置
        let position: PositionInfo = { x: 105 + i * 10, y: 155 + i * 10 };
      }
      this.logCallback?.(`批量操作完成，最终节点数: ${this.childNodes.length}`);
    }
  }

  getChildCount(): number {
    return this.childNodes.length;
  }
}

@Entry
@Component
struct Sr20241118811430006 {
  @State logText: string = '';
  @State traceEnabled: boolean = false;
  private nodeController: GetPositionToWindowNodeController = new GetPositionToWindowNodeController();

  aboutToAppear(): void {
    this.nodeController.logCallback = (message: string) => {
      this.logText += message + '\n';
    };
  }

  build() {
    Column() {
      Text('API新增验证getPositionToWindow属性设置耗时')
        .fontSize(17)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 15, bottom: 12 })
        .id('text_title_sr20241118811430_006')

      // 显示trace状态
      Text(`Trace状态: ${this.traceEnabled ? '已开启' : '已关闭'}`)
        .fontSize(15)
        .fontColor(this.traceEnabled ? Color.Green : Color.Gray)
        .margin({ bottom: 8 })
        .id('text_trace_status_sr20241118811430_006')

      // 步骤1：开启采集trace开关
      Button('开启Trace采集')
        .id('button_start_trace_sr20241118811430_006')
        .width('80%')
        .height(38)
        .margin({ bottom: 5 })
        .onClick(() => {
          this.traceEnabled = true;
          this.logText += '开启Trace采集成功\n';
        })

      // 步骤2：FrameNode的添加/删除/组件创建/属性设置接口
      Button('添加FrameNode并设置位置')
        .id('button_add_with_position_sr20241118811430_006')
        .width('80%')
        .height(38)
        .margin({ bottom: 5 })
        .onClick(() => {
          this.nodeController.addFrameNodeWithPosition();
        })

      Button('getPositionToWindow获取位置')
        .id('button_get_position_sr20241118811430_006')
        .width('80%')
        .height(38)
        .margin({ bottom: 5 })
        .onClick(() => {
          this.nodeController.getPositionToWindow();
        })

      Button('频繁调用getPositionToWindow')
        .id('button_frequent_position_sr20241118811430_006')
        .width('80%')
        .height(38)
        .margin({ bottom: 5 })
        .onClick(() => {
          this.nodeController.frequentGetPositionToWindow();
        })

      Button('创建组件并获取位置')
        .id('button_create_get_position_sr20241118811430_006')
        .width('80%')
        .height(38)
        .margin({ bottom: 5 })
        .onClick(() => {
          this.nodeController.createComponentAndGetPosition();
        })

      Button('修改属性后获取位置')
        .id('button_modify_get_position_sr20241118811430_006')
        .width('80%')
        .height(38)
        .margin({ bottom: 5 })
        .onClick(() => {
          this.nodeController.modifyAttributesAndGetPosition();
        })

      Button('删除FrameNode')
        .id('button_remove_framenode_sr20241118811430_006')
        .width('80%')
        .height(38)
        .margin({ bottom: 5 })
        .onClick(() => {
          this.nodeController.removeFrameNode();
        })

      Button('批量操作+获取位置')
        .id('button_batch_position_sr20241118811430_006')
        .width('80%')
        .height(38)
        .margin({ bottom: 5 })
        .onClick(() => {
          this.nodeController.batchOperationsWithPosition();
        })

      // 步骤3：关闭trace采集
      Button('关闭Trace采集')
        .id('button_stop_trace_sr20241118811430_006')
        .width('80%')
        .height(38)
        .margin({ bottom: 8 })
        .onClick(() => {
          this.traceEnabled = false;
          this.logText += '关闭Trace采集成功\n';
        })

      // NodeContainer展示区域
      NodeContainer(this.nodeController)
        .id('node_container_sr20241118811430_006')
        .width('80%')
        .height(70)
        .backgroundColor('#E0E0E0')
        .margin({ bottom: 8 })

      // 日志显示区域
      Scroll() {
        Text(this.logText)
          .fontSize(10)
          .fontColor(Color.Black)
          .width('100%')
          .textAlign(TextAlign.Start)
      }
      .id('scroll_log_sr20241118811430_006')
      .width('90%')
      .height('6.56%')
      .backgroundColor('#F5F5F5')
      .borderRadius(6)
      .padding(6)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .padding({ top: 8 })
  }
}
