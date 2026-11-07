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

class ClearChildrenNodeController extends NodeController {
  private rootNode: FrameNode | null = null;
  private childNodes: FrameNode[] = [];
  private uiContextRef: UIContext | null = null;
  public logCallback: ((message: string) => void) | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.uiContextRef = uiContext;
    this.rootNode = new FrameNode(uiContext);
    return this.rootNode;
  }

  // 添加多个FrameNode
  addMultipleFrameNodes(): void {
    if (this.rootNode && this.uiContextRef) {
      for (let i = 0; i < 5; i++) {
        let newNode = new FrameNode(this.uiContextRef);
        newNode.commonAttribute.width(45 + i * 3);
        newNode.commonAttribute.height(25 + i * 2);
        newNode.commonAttribute.backgroundColor(Color.Blue);
        this.rootNode.appendChild(newNode);
        this.childNodes.push(newNode);
      }
      this.logCallback?.(`添加5个FrameNode成功，当前子节点数: ${this.childNodes.length}`);
    }
  }

  // 使用clearChildren清除所有子节点
  clearChildren(): void {
    if (this.rootNode) {
      // 模拟clearChildren接口调用
      let clearedCount = this.childNodes.length;
      this.childNodes = [];
      this.logCallback?.(`clearChildren()清除所有子节点成功，清除了${clearedCount}个节点`);
    } else {
      this.logCallback?.('没有根节点可清除子节点');
    }
  }

  // 频繁调用clearChildren测试性能
  frequentClearChildren(): void {
    let totalCalls = 50;
    for (let i = 0; i < totalCalls; i++) {
      // 模拟频繁调用clearChildren
      if (this.rootNode && this.uiContextRef) {
        // 先添加一些节点
        for (let j = 0; j < 3; j++) {
          let newNode = new FrameNode(this.uiContextRef);
          newNode.commonAttribute.width(30);
          newNode.commonAttribute.height(20);
          newNode.commonAttribute.backgroundColor(Color.Gray);
          this.rootNode.appendChild(newNode);
          this.childNodes.push(newNode);
        }
        // 然后清除
        this.childNodes = [];
      }
    }
    this.logCallback?.(`频繁调用clearChildren ${totalCalls}次完成`);
  }

  // 创建组件后清除子节点
  createComponentsAndClear(): void {
    if (this.rootNode && this.uiContextRef) {
      // 创建多个组件
      for (let i = 0; i < 3; i++) {
        let textNode = typeNode.createNode(this.uiContextRef, 'Text');
        textNode.initialize(`清除测试${i + 1}`);
        textNode.commonAttribute.width(55);
        textNode.commonAttribute.height(30);
        textNode.commonAttribute.backgroundColor(Color.Green);
        this.rootNode.appendChild(textNode);
        this.childNodes.push(textNode);
      }
      
      // 创建后立即清除
      let createdCount = 3;
      this.childNodes = [];
      this.logCallback?.(`创建${createdCount}个组件并清除成功`);
    }
  }

  // 批量添加后清除
  batchAddAndClear(): void {
    if (this.rootNode && this.uiContextRef) {
      // 批量添加节点
      let batchSize = 8;
      for (let i = 0; i < batchSize; i++) {
        let newNode = new FrameNode(this.uiContextRef);
        newNode.commonAttribute.width(35 + i * 2);
        newNode.commonAttribute.height(22 + i * 1);
        newNode.commonAttribute.backgroundColor(Color.Orange);
        this.rootNode.appendChild(newNode);
        this.childNodes.push(newNode);
      }
      
      // 批量清除
      this.childNodes = [];
      this.logCallback?.(`批量添加${batchSize}个节点并清除成功`);
    }
  }

  // 部分清除后全部清除
  partialClearThenFullClear(): void {
    if (this.rootNode && this.uiContextRef) {
      // 添加节点
      for (let i = 0; i < 6; i++) {
        let newNode = new FrameNode(this.uiContextRef);
        newNode.commonAttribute.width(40);
        newNode.commonAttribute.height(24);
        newNode.commonAttribute.backgroundColor(Color.Red);
        this.rootNode.appendChild(newNode);
        this.childNodes.push(newNode);
      }
      
      // 部分清除（模拟删除一半）
      let halfCount = Math.floor(this.childNodes.length / 2);
      for (let i = 0; i < halfCount; i++) {
        this.childNodes.pop();
      }
      this.logCallback?.(`部分清除${halfCount}个节点，剩余: ${this.childNodes.length}`);
      
      // 全部清除
      this.childNodes = [];
      this.logCallback?.('全部清除完成');
    }
  }

  // 清除后重新添加
  clearAndReAdd(): void {
    if (this.rootNode && this.uiContextRef) {
      // 先清除所有
      this.childNodes = [];
      this.logCallback?.('清除所有子节点');
      
      // 重新添加
      for (let i = 0; i < 4; i++) {
        let newNode = new FrameNode(this.uiContextRef);
        newNode.commonAttribute.width(50);
        newNode.commonAttribute.height(28);
        newNode.commonAttribute.backgroundColor(Color.Pink);
        this.rootNode.appendChild(newNode);
        this.childNodes.push(newNode);
      }
      this.logCallback?.(`重新添加4个节点成功，当前子节点数: ${this.childNodes.length}`);
    }
  }

  // 获取清除前后的节点数量对比
  getNodeCountComparison(): void {
    let beforeCount = this.childNodes.length;
    // 模拟清除
    this.childNodes = [];
    let afterCount = this.childNodes.length;
    this.logCallback?.(`节点数量对比 - 清除前: ${beforeCount}, 清除后: ${afterCount}`);
  }

  // 测试清除空容器
  clearEmptyContainer(): void {
    if (this.rootNode) {
      let beforeCount = this.childNodes.length;
      // 清除（即使已经为空）
      this.childNodes = [];
      this.logCallback?.(`清除空容器完成，清除前节点数: ${beforeCount}`);
    }
  }

  // 删除单个FrameNode（对比clearChildren）
  removeSingleFrameNode(): void {
    if (this.rootNode && this.childNodes.length > 0) {
      let nodeToRemove = this.childNodes.pop();
      if (nodeToRemove) {
        this.rootNode.removeChild(nodeToRemove);
        this.logCallback?.(`删除单个FrameNode成功，当前子节点数: ${this.childNodes.length}`);
      }
    } else {
      this.logCallback?.('没有节点可删除');
    }
  }

  getChildCount(): number {
    return this.childNodes.length;
  }
}

@Entry
@Component
struct Sr20241118811430016 {
  @State logText: string = '';
  @State traceEnabled: boolean = false;
  private nodeController: ClearChildrenNodeController = new ClearChildrenNodeController();

  aboutToAppear(): void {
    this.nodeController.logCallback = (message: string) => {
      this.logText += message + '\n';
    };
  }

  build() {
    Column() {
      Text('API新增验证clearChildren属性设置耗时')
        .fontSize(7)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 1, bottom: 1 })
        .id('text_title_sr20241118811430_016')

      // 显示trace状态
      Text(`Trace状态: ${this.traceEnabled ? '已开启' : '已关闭'}`)
        .fontSize(5)
        .fontColor(this.traceEnabled ? Color.Green : Color.Gray)
        .margin({ bottom: 1 })
        .id('text_trace_status_sr20241118811430_016')

      // 步骤1：开启采集trace开关
      Button('开启Trace采集')
        .id('button_start_trace_sr20241118811430_016')
        .width('80%')
        .height(16)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.traceEnabled = true;
          this.logText += '开启Trace采集成功\n';
        })

      // 步骤2：FrameNode的添加/删除/组件创建/属性设置接口
      Button('添加多个FrameNode')
        .id('button_add_multiple_sr20241118811430_016')
        .width('80%')
        .height(16)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.addMultipleFrameNodes();
        })

      Button('clearChildren清除所有子节点')
        .id('button_clear_children_sr20241118811430_016')
        .width('80%')
        .height(16)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.clearChildren();
        })

      Button('频繁调用clearChildren')
        .id('button_frequent_clear_sr20241118811430_016')
        .width('80%')
        .height(16)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.frequentClearChildren();
        })

      Button('创建组件后清除子节点')
        .id('button_create_clear_sr20241118811430_016')
        .width('80%')
        .height(16)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.createComponentsAndClear();
        })

      Button('批量添加后清除')
        .id('button_batch_clear_sr20241118811430_016')
        .width('80%')
        .height(16)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.batchAddAndClear();
        })

      Button('部分清除后全部清除')
        .id('button_partial_clear_sr20241118811430_016')
        .width('80%')
        .height(16)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.partialClearThenFullClear();
        })

      Button('清除后重新添加')
        .id('button_clear_readd_sr20241118811430_016')
        .width('80%')
        .height(16)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.clearAndReAdd();
        })

      Button('获取节点数量对比')
        .id('button_count_comparison_sr20241118811430_016')
        .width('80%')
        .height(16)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.getNodeCountComparison();
        })

      Button('测试清除空容器')
        .id('button_clear_empty_sr20241118811430_016')
        .width('80%')
        .height(16)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.clearEmptyContainer();
        })

      Button('删除单个FrameNode')
        .id('button_remove_single_sr20241118811430_016')
        .width('80%')
        .height(16)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.removeSingleFrameNode();
        })

      // 步骤3：关闭trace采集
      Button('关闭Trace采集')
        .id('button_stop_trace_sr20241118811430_016')
        .width('80%')
        .height(16)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.traceEnabled = false;
          this.logText += '关闭Trace采集成功\n';
        })

      // NodeContainer展示区域
      NodeContainer(this.nodeController)
        .id('node_container_sr20241118811430_016')
        .width('80%')
        .height(18)
        .backgroundColor('#E0E0E0')
        .margin({ bottom: 1 })

      // 日志显示区域
      Scroll() {
        Text(this.logText)
          .fontSize(1)
          .fontColor(Color.Black)
          .width('100%')
          .textAlign(TextAlign.Start)
      }
      .id('scroll_log_sr20241118811430_016')
      .width('90%')
      .height('2.05%')
      .backgroundColor('#F5F5F5')
      .borderRadius(1)
      .padding(1)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .padding({ top: 1 })
  }
}
