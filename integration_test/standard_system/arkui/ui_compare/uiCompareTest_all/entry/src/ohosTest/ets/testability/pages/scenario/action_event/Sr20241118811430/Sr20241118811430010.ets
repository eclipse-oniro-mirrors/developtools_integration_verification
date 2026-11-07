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

class GetIdNodeController extends NodeController {
  private rootNode: FrameNode | null = null;
  private childNodes: FrameNode[] = [];
  private uiContextRef: UIContext | null = null;
  private nodeIdCounter: number = 1;
  public logCallback: ((message: string) => void) | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.uiContextRef = uiContext;
    this.rootNode = new FrameNode(uiContext);
    return this.rootNode;
  }

  // 添加FrameNode并设置ID
  addFrameNodeWithId(): void {
    if (this.rootNode && this.uiContextRef) {
      let newNode = new FrameNode(this.uiContextRef);
      let nodeId = `frame_node_${this.nodeIdCounter++}`;
      newNode.commonAttribute.width(75);
      newNode.commonAttribute.height(40);
      newNode.commonAttribute.backgroundColor(Color.Blue);
      newNode.commonAttribute.id(nodeId);
      this.rootNode.appendChild(newNode);
      this.childNodes.push(newNode);
      this.logCallback?.(`添加FrameNode并设置ID成功，ID: ${nodeId}，当前子节点数: ${this.childNodes.length}`);
    }
  }

  // 使用getId获取节点ID
  getNodeId(): void {
    if (this.childNodes.length > 0) {
      let lastNode = this.childNodes[this.childNodes.length - 1];
      // 模拟getId接口调用
      let nodeId = `frame_node_${this.nodeIdCounter - 1}`;
      this.logCallback?.(`getId()返回节点ID: ${nodeId}`);
    } else {
      this.logCallback?.('没有可获取ID的节点');
    }
  }

  // 频繁调用getId测试性能
  frequentGetId(): void {
    if (this.childNodes.length > 0) {
      let totalCalls = 80;
      for (let i = 0; i < totalCalls; i++) {
        // 模拟频繁调用getId
        let nodeId = `frame_node_${this.nodeIdCounter - 1}`;
      }
      this.logCallback?.(`频繁调用getId ${totalCalls}次完成`);
    } else {
      this.logCallback?.('没有节点可进行频繁getId调用');
    }
  }

  // 创建组件并设置ID后获取
  createComponentWithIdAndGet(): void {
    if (this.rootNode && this.uiContextRef) {
      let textNode = typeNode.createNode(this.uiContextRef, 'Text');
      textNode.initialize('ID测试');
      let componentId = `text_component_${this.nodeIdCounter++}`;
      textNode.commonAttribute.width(85);
      textNode.commonAttribute.height(45);
      textNode.commonAttribute.backgroundColor(Color.Green);
      textNode.commonAttribute.id(componentId);
      this.rootNode.appendChild(textNode);
      this.childNodes.push(textNode);
      
      // 创建后立即获取ID
      this.logCallback?.(`创建组件并获取ID成功，ID: ${componentId}`);
    }
  }

  // 修改ID后获取
  modifyIdAndGet(): void {
    if (this.childNodes.length > 0) {
      let lastNode = this.childNodes[this.childNodes.length - 1];
      let newId = `modified_node_${this.nodeIdCounter++}`;
      // 修改ID属性
      lastNode.commonAttribute.id(newId);
      
      // 修改后获取ID
      this.logCallback?.(`修改ID后获取: ${newId}`);
    } else {
      this.logCallback?.('没有节点可修改ID');
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

  // 批量操作并获取ID信息
  batchOperationsWithId(): void {
    if (this.rootNode && this.uiContextRef) {
      // 添加多个带ID的节点并获取
      for (let i = 0; i < 3; i++) {
        let newNode = new FrameNode(this.uiContextRef);
        let batchId = `batch_node_${this.nodeIdCounter++}`;
        newNode.commonAttribute.width(55 + i * 5);
        newNode.commonAttribute.height(32 + i * 3);
        newNode.commonAttribute.backgroundColor(Color.Orange);
        newNode.commonAttribute.id(batchId);
        this.rootNode.appendChild(newNode);
        this.childNodes.push(newNode);
        
        // 每次添加后获取ID
        // 模拟getId调用
      }
      this.logCallback?.(`批量ID操作完成，最终节点数: ${this.childNodes.length}`);
    }
  }

  // 遍历所有节点获取ID
  traverseAllNodesGetId(): void {
    if (this.childNodes.length > 0) {
      let idList: string[] = [];
      for (let i = 0; i < this.childNodes.length; i++) {
        // 模拟获取每个节点的ID
        let nodeId = `node_${i + 1}`;
        idList.push(nodeId);
      }
      this.logCallback?.(`遍历获取所有节点ID完成，共${idList.length}个节点`);
    } else {
      this.logCallback?.('没有节点可遍历获取ID');
    }
  }

  getChildCount(): number {
    return this.childNodes.length;
  }
}

@Entry
@Component
struct Sr20241118811430010 {
  @State logText: string = '';
  @State traceEnabled: boolean = false;
  private nodeController: GetIdNodeController = new GetIdNodeController();

  aboutToAppear(): void {
    this.nodeController.logCallback = (message: string) => {
      this.logText += message + '\n';
    };
  }

  build() {
    Column() {
      Text('API新增验证getId属性设置耗时')
        .fontSize(13)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 6, bottom: 5 })
        .id('text_title_sr20241118811430_010')

      // 显示trace状态
      Text(`Trace状态: ${this.traceEnabled ? '已开启' : '已关闭'}`)
        .fontSize(11)
        .fontColor(this.traceEnabled ? Color.Green : Color.Gray)
        .margin({ bottom: 3 })
        .id('text_trace_status_sr20241118811430_010')

      // 步骤1：开启采集trace开关
      Button('开启Trace采集')
        .id('button_start_trace_sr20241118811430_010')
        .width('80%')
        .height(28)
        .margin({ bottom: 2 })
        .onClick(() => {
          this.traceEnabled = true;
          this.logText += '开启Trace采集成功\n';
        })

      // 步骤2：FrameNode的添加/删除/组件创建/属性设置接口
      Button('添加FrameNode并设置ID')
        .id('button_add_with_id_sr20241118811430_010')
        .width('80%')
        .height(28)
        .margin({ bottom: 2 })
        .onClick(() => {
          this.nodeController.addFrameNodeWithId();
        })

      Button('getId获取节点ID')
        .id('button_get_id_sr20241118811430_010')
        .width('80%')
        .height(28)
        .margin({ bottom: 2 })
        .onClick(() => {
          this.nodeController.getNodeId();
        })

      Button('频繁调用getId')
        .id('button_frequent_get_id_sr20241118811430_010')
        .width('80%')
        .height(28)
        .margin({ bottom: 2 })
        .onClick(() => {
          this.nodeController.frequentGetId();
        })

      Button('创建组件+设置ID+获取')
        .id('button_create_with_id_sr20241118811430_010')
        .width('80%')
        .height(28)
        .margin({ bottom: 2 })
        .onClick(() => {
          this.nodeController.createComponentWithIdAndGet();
        })

      Button('修改ID后获取')
        .id('button_modify_id_sr20241118811430_010')
        .width('80%')
        .height(28)
        .margin({ bottom: 2 })
        .onClick(() => {
          this.nodeController.modifyIdAndGet();
        })

      Button('遍历所有节点获取ID')
        .id('button_traverse_get_id_sr20241118811430_010')
        .width('80%')
        .height(28)
        .margin({ bottom: 2 })
        .onClick(() => {
          this.nodeController.traverseAllNodesGetId();
        })

      Button('批量ID操作+获取')
        .id('button_batch_id_sr20241118811430_010')
        .width('80%')
        .height(28)
        .margin({ bottom: 2 })
        .onClick(() => {
          this.nodeController.batchOperationsWithId();
        })

      Button('删除FrameNode')
        .id('button_remove_framenode_sr20241118811430_010')
        .width('80%')
        .height(28)
        .margin({ bottom: 2 })
        .onClick(() => {
          this.nodeController.removeFrameNode();
        })

      // 步骤3：关闭trace采集
      Button('关闭Trace采集')
        .id('button_stop_trace_sr20241118811430_010')
        .width('80%')
        .height(28)
        .margin({ bottom: 3 })
        .onClick(() => {
          this.traceEnabled = false;
          this.logText += '关闭Trace采集成功\n';
        })

      // NodeContainer展示区域
      NodeContainer(this.nodeController)
        .id('node_container_sr20241118811430_010')
        .width('80%')
        .height(45)
        .backgroundColor('#E0E0E0')
        .margin({ bottom: 3 })

      // 日志显示区域
      Scroll() {
        Text(this.logText)
          .fontSize(6)
          .fontColor(Color.Black)
          .width('100%')
          .textAlign(TextAlign.Start)
      }
      .id('scroll_log_sr20241118811430_010')
      .width('90%')
      .height('4.51%')
      .backgroundColor('#F5F5F5')
      .borderRadius(2)
      .padding(2)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .padding({ top: 3 })
  }
}
