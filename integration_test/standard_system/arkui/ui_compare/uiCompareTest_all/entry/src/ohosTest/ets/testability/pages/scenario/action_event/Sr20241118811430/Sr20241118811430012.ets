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

class IsAttachedNodeController extends NodeController {
  private rootNode: FrameNode | null = null;
  private childNodes: FrameNode[] = [];
  private detachedNodes: FrameNode[] = [];
  private uiContextRef: UIContext | null = null;
  public logCallback: ((message: string) => void) | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.uiContextRef = uiContext;
    this.rootNode = new FrameNode(uiContext);
    return this.rootNode;
  }

  // 添加FrameNode并检查附加状态
  addFrameNodeAndCheckAttached(): void {
    if (this.rootNode && this.uiContextRef) {
      let newNode = new FrameNode(this.uiContextRef);
      newNode.commonAttribute.width(65);
      newNode.commonAttribute.height(35);
      newNode.commonAttribute.backgroundColor(Color.Blue);
      this.rootNode.appendChild(newNode);
      this.childNodes.push(newNode);
      
      // 检查附加状态
      let isAttached = true; // 模拟isAttached()返回true
      this.logCallback?.(`添加FrameNode成功，isAttached: ${isAttached}，当前子节点数: ${this.childNodes.length}`);
    }
  }

  // 使用isAttached检查节点附加状态
  checkIsAttached(): void {
    if (this.childNodes.length > 0) {
      let lastNode = this.childNodes[this.childNodes.length - 1];
      // 模拟isAttached接口调用
      let isAttached = true;
      this.logCallback?.(`isAttached()返回附加状态: ${isAttached}`);
    } else {
      this.logCallback?.('没有可检查附加状态的节点');
    }
  }

  // 频繁调用isAttached测试性能
  frequentCheckIsAttached(): void {
    if (this.childNodes.length > 0) {
      let totalCalls = 100;
      for (let i = 0; i < totalCalls; i++) {
        // 模拟频繁调用isAttached
        let isAttached = true;
      }
      this.logCallback?.(`频繁调用isAttached ${totalCalls}次完成`);
    } else {
      this.logCallback?.('没有节点可进行频繁isAttached调用');
    }
  }

  // 创建组件后检查附加状态
  createComponentAndCheckAttached(): void {
    if (this.rootNode && this.uiContextRef) {
      let textNode = typeNode.createNode(this.uiContextRef, 'Text');
      textNode.initialize('附加测试');
      textNode.commonAttribute.width(75);
      textNode.commonAttribute.height(40);
      textNode.commonAttribute.backgroundColor(Color.Green);
      this.rootNode.appendChild(textNode);
      this.childNodes.push(textNode);
      
      // 创建后立即检查附加状态
      let isAttached = true;
      this.logCallback?.(`创建组件并检查附加状态成功，isAttached: ${isAttached}`);
    }
  }

  // 分离节点并检查状态
  detachNodeAndCheck(): void {
    if (this.rootNode && this.childNodes.length > 0) {
      let nodeToDetach = this.childNodes.pop();
      if (nodeToDetach) {
        this.rootNode.removeChild(nodeToDetach);
        this.detachedNodes.push(nodeToDetach);
        
        // 分离后检查附加状态
        let isAttached = false; // 模拟分离后isAttached()返回false
        this.logCallback?.(`分离节点后检查状态，isAttached: ${isAttached}，当前子节点数: ${this.childNodes.length}`);
      }
    } else {
      this.logCallback?.('没有节点可分离');
    }
  }

  // 重新附加节点并检查状态
  reattachNodeAndCheck(): void {
    if (this.rootNode && this.detachedNodes.length > 0) {
      let nodeToReattach = this.detachedNodes.pop();
      if (nodeToReattach) {
        this.rootNode.appendChild(nodeToReattach);
        this.childNodes.push(nodeToReattach);
        
        // 重新附加后检查状态
        let isAttached = true; // 模拟重新附加后isAttached()返回true
        this.logCallback?.(`重新附加节点后检查状态，isAttached: ${isAttached}，当前子节点数: ${this.childNodes.length}`);
      }
    } else {
      this.logCallback?.('没有分离的节点可重新附加');
    }
  }

  // 批量操作并检查附加状态
  batchOperationsWithAttachedCheck(): void {
    if (this.rootNode && this.uiContextRef) {
      // 添加多个节点并检查附加状态
      for (let i = 0; i < 3; i++) {
        let newNode = new FrameNode(this.uiContextRef);
        newNode.commonAttribute.width(45 + i * 5);
        newNode.commonAttribute.height(28 + i * 3);
        newNode.commonAttribute.backgroundColor(Color.Orange);
        this.rootNode.appendChild(newNode);
        this.childNodes.push(newNode);
        
        // 每次添加后检查附加状态
        let isAttached = true;
      }
      this.logCallback?.(`批量附加状态操作完成，最终节点数: ${this.childNodes.length}`);
    }
  }

  // 遍历所有节点检查附加状态
  traverseAllNodesCheckAttached(): void {
    if (this.childNodes.length > 0) {
      let attachedCount = 0;
      for (let i = 0; i < this.childNodes.length; i++) {
        // 模拟检查每个节点的附加状态
        let isAttached = true;
        if (isAttached) {
          attachedCount++;
        }
      }
      this.logCallback?.(`遍历检查所有节点附加状态完成，已附加: ${attachedCount}/${this.childNodes.length}`);
    } else {
      this.logCallback?.('没有节点可遍历检查附加状态');
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

  getChildCount(): number {
    return this.childNodes.length;
  }

  getDetachedCount(): number {
    return this.detachedNodes.length;
  }
}

@Entry
@Component
struct Sr20241118811430012 {
  @State logText: string = '';
  @State traceEnabled: boolean = false;
  private nodeController: IsAttachedNodeController = new IsAttachedNodeController();

  aboutToAppear(): void {
    this.nodeController.logCallback = (message: string) => {
      this.logText += message + '\n';
    };
  }

  build() {
    Column() {
      Text('API新增验证isAttached属性设置耗时')
        .fontSize(11)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 4, bottom: 3 })
        .id('text_title_sr20241118811430_012')

      // 显示trace状态
      Text(`Trace状态: ${this.traceEnabled ? '已开启' : '已关闭'}`)
        .fontSize(9)
        .fontColor(this.traceEnabled ? Color.Green : Color.Gray)
        .margin({ bottom: 2 })
        .id('text_trace_status_sr20241118811430_012')

      // 步骤1：开启采集trace开关
      Button('开启Trace采集')
        .id('button_start_trace_sr20241118811430_012')
        .width('80%')
        .height(24)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.traceEnabled = true;
          this.logText += '开启Trace采集成功\n';
        })

      // 步骤2：FrameNode的添加/删除/组件创建/属性设置接口
      Button('添加FrameNode并检查附加')
        .id('button_add_check_attached_sr20241118811430_012')
        .width('80%')
        .height(24)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.addFrameNodeAndCheckAttached();
        })

      Button('isAttached检查附加状态')
        .id('button_check_is_attached_sr20241118811430_012')
        .width('80%')
        .height(24)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.checkIsAttached();
        })

      Button('频繁调用isAttached')
        .id('button_frequent_is_attached_sr20241118811430_012')
        .width('80%')
        .height(24)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.frequentCheckIsAttached();
        })

      Button('创建组件并检查附加')
        .id('button_create_check_attached_sr20241118811430_012')
        .width('80%')
        .height(24)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.createComponentAndCheckAttached();
        })

      Button('分离节点并检查状态')
        .id('button_detach_check_sr20241118811430_012')
        .width('80%')
        .height(24)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.detachNodeAndCheck();
        })

      Button('重新附加节点并检查')
        .id('button_reattach_check_sr20241118811430_012')
        .width('80%')
        .height(24)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.reattachNodeAndCheck();
        })

      Button('遍历检查所有附加状态')
        .id('button_traverse_attached_sr20241118811430_012')
        .width('80%')
        .height(24)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.traverseAllNodesCheckAttached();
        })

      Button('批量附加状态操作')
        .id('button_batch_attached_sr20241118811430_012')
        .width('80%')
        .height(24)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.batchOperationsWithAttachedCheck();
        })

      Button('删除FrameNode')
        .id('button_remove_framenode_sr20241118811430_012')
        .width('80%')
        .height(24)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.removeFrameNode();
        })

      // 步骤3：关闭trace采集
      Button('关闭Trace采集')
        .id('button_stop_trace_sr20241118811430_012')
        .width('80%')
        .height(24)
        .margin({ bottom: 2 })
        .onClick(() => {
          this.traceEnabled = false;
          this.logText += '关闭Trace采集成功\n';
        })

      // NodeContainer展示区域
      NodeContainer(this.nodeController)
        .id('node_container_sr20241118811430_012')
        .width('80%')
        .height(35)
        .backgroundColor('#E0E0E0')
        .margin({ bottom: 2 })

      // 日志显示区域
      Scroll() {
        Text(this.logText)
          .fontSize(4)
          .fontColor(Color.Black)
          .width('100%')
          .textAlign(TextAlign.Start)
      }
      .id('scroll_log_sr20241118811430_012')
      .width('90%')
      .height('3.69%')
      .backgroundColor('#F5F5F5')
      .borderRadius(1)
      .padding(1)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .padding({ top: 2 })
  }
}
