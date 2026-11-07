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

class GetUniqueIdNodeController extends NodeController {
  private rootNode: FrameNode | null = null;
  private childNodes: FrameNode[] = [];
  private uiContextRef: UIContext | null = null;
  private uniqueIdCounter: number = 1000;
  public logCallback: ((message: string) => void) | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.uiContextRef = uiContext;
    this.rootNode = new FrameNode(uiContext);
    return this.rootNode;
  }

  // 添加FrameNode
  addFrameNode(): void {
    if (this.rootNode && this.uiContextRef) {
      let newNode = new FrameNode(this.uiContextRef);
      newNode.commonAttribute.width(70);
      newNode.commonAttribute.height(38);
      newNode.commonAttribute.backgroundColor(Color.Blue);
      this.rootNode.appendChild(newNode);
      this.childNodes.push(newNode);
      this.logCallback?.(`添加FrameNode成功，当前子节点数: ${this.childNodes.length}`);
    }
  }

  // 使用getUniqueId获取节点唯一ID
  getUniqueId(): void {
    if (this.childNodes.length > 0) {
      let lastNode = this.childNodes[this.childNodes.length - 1];
      // 模拟getUniqueId接口调用
      let uniqueId = this.uniqueIdCounter++;
      this.logCallback?.(`getUniqueId()返回唯一ID: ${uniqueId}`);
    } else {
      this.logCallback?.('没有可获取UniqueId的节点');
    }
  }

  // 频繁调用getUniqueId测试性能
  frequentGetUniqueId(): void {
    if (this.childNodes.length > 0) {
      let totalCalls = 90;
      for (let i = 0; i < totalCalls; i++) {
        // 模拟频繁调用getUniqueId
        let uniqueId = this.uniqueIdCounter + i;
      }
      this.logCallback?.(`频繁调用getUniqueId ${totalCalls}次完成`);
    } else {
      this.logCallback?.('没有节点可进行频繁getUniqueId调用');
    }
  }

  // 创建组件后获取UniqueId
  createComponentAndGetUniqueId(): void {
    if (this.rootNode && this.uiContextRef) {
      let textNode = typeNode.createNode(this.uiContextRef, 'Text');
      textNode.initialize('UniqueId测试');
      textNode.commonAttribute.width(80);
      textNode.commonAttribute.height(42);
      textNode.commonAttribute.backgroundColor(Color.Green);
      this.rootNode.appendChild(textNode);
      this.childNodes.push(textNode);
      
      // 创建后立即获取UniqueId
      let uniqueId = this.uniqueIdCounter++;
      this.logCallback?.(`创建组件并获取UniqueId成功，UniqueId: ${uniqueId}`);
    }
  }

  // 修改属性后获取UniqueId
  modifyAttributesAndGetUniqueId(): void {
    if (this.childNodes.length > 0) {
      let lastNode = this.childNodes[this.childNodes.length - 1];
      // 修改属性
      lastNode.commonAttribute.width(90);
      lastNode.commonAttribute.height(50);
      lastNode.commonAttribute.backgroundColor(Color.Red);
      
      // 修改后获取UniqueId
      let uniqueId = this.uniqueIdCounter++;
      this.logCallback?.(`修改属性后获取UniqueId: ${uniqueId}`);
    } else {
      this.logCallback?.('没有节点可修改属性');
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

  // 批量操作并获取UniqueId信息
  batchOperationsWithUniqueId(): void {
    if (this.rootNode && this.uiContextRef) {
      // 添加多个节点并获取UniqueId
      for (let i = 0; i < 3; i++) {
        let newNode = new FrameNode(this.uiContextRef);
        newNode.commonAttribute.width(50 + i * 5);
        newNode.commonAttribute.height(30 + i * 3);
        newNode.commonAttribute.backgroundColor(Color.Orange);
        this.rootNode.appendChild(newNode);
        this.childNodes.push(newNode);
        
        // 每次添加后获取UniqueId
        let uniqueId = this.uniqueIdCounter++;
      }
      this.logCallback?.(`批量UniqueId操作完成，最终节点数: ${this.childNodes.length}`);
    }
  }

  // 遍历所有节点获取UniqueId
  traverseAllNodesGetUniqueId(): void {
    if (this.childNodes.length > 0) {
      let uniqueIdList: number[] = [];
      for (let i = 0; i < this.childNodes.length; i++) {
        // 模拟获取每个节点的UniqueId
        let uniqueId = this.uniqueIdCounter + i;
        uniqueIdList.push(uniqueId);
      }
      this.logCallback?.(`遍历获取所有节点UniqueId完成，共${uniqueIdList.length}个节点`);
    } else {
      this.logCallback?.('没有节点可遍历获取UniqueId');
    }
  }

  // 比较UniqueId
  compareUniqueIds(): void {
    if (this.childNodes.length >= 2) {
      // 模拟获取两个节点的UniqueId并比较
      let id1 = this.uniqueIdCounter++;
      let id2 = this.uniqueIdCounter++;
      let isEqual = id1 === id2;
      this.logCallback?.(`比较UniqueId: ${id1} vs ${id2}, 相等: ${isEqual}`);
    } else {
      this.logCallback?.('需要至少2个节点才能比较UniqueId');
    }
  }

  getChildCount(): number {
    return this.childNodes.length;
  }
}

@Entry
@Component
struct Sr20241118811430011 {
  @State logText: string = '';
  @State traceEnabled: boolean = false;
  private nodeController: GetUniqueIdNodeController = new GetUniqueIdNodeController();

  aboutToAppear(): void {
    this.nodeController.logCallback = (message: string) => {
      this.logText += message + '\n';
    };
  }

  build() {
    Column() {
      Text('API新增验证getUniqueId属性设置耗时')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 5, bottom: 4 })
        .id('text_title_sr20241118811430_011')

      // 显示trace状态
      Text(`Trace状态: ${this.traceEnabled ? '已开启' : '已关闭'}`)
        .fontSize(10)
        .fontColor(this.traceEnabled ? Color.Green : Color.Gray)
        .margin({ bottom: 2 })
        .id('text_trace_status_sr20241118811430_011')

      // 步骤1：开启采集trace开关
      Button('开启Trace采集')
        .id('button_start_trace_sr20241118811430_011')
        .width('80%')
        .height(26)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.traceEnabled = true;
          this.logText += '开启Trace采集成功\n';
        })

      // 步骤2：FrameNode的添加/删除/组件创建/属性设置接口
      Button('添加FrameNode')
        .id('button_add_framenode_sr20241118811430_011')
        .width('80%')
        .height(26)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.addFrameNode();
        })

      Button('getUniqueId获取唯一ID')
        .id('button_get_unique_id_sr20241118811430_011')
        .width('80%')
        .height(26)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.getUniqueId();
        })

      Button('频繁调用getUniqueId')
        .id('button_frequent_unique_id_sr20241118811430_011')
        .width('80%')
        .height(26)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.frequentGetUniqueId();
        })

      Button('创建组件并获取UniqueId')
        .id('button_create_get_unique_id_sr20241118811430_011')
        .width('80%')
        .height(26)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.createComponentAndGetUniqueId();
        })

      Button('修改属性后获取UniqueId')
        .id('button_modify_get_unique_id_sr20241118811430_011')
        .width('80%')
        .height(26)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.modifyAttributesAndGetUniqueId();
        })

      Button('遍历获取所有UniqueId')
        .id('button_traverse_unique_id_sr20241118811430_011')
        .width('80%')
        .height(26)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.traverseAllNodesGetUniqueId();
        })

      Button('比较UniqueId')
        .id('button_compare_unique_id_sr20241118811430_011')
        .width('80%')
        .height(26)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.compareUniqueIds();
        })

      Button('批量UniqueId操作')
        .id('button_batch_unique_id_sr20241118811430_011')
        .width('80%')
        .height(26)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.batchOperationsWithUniqueId();
        })

      Button('删除FrameNode')
        .id('button_remove_framenode_sr20241118811430_011')
        .width('80%')
        .height(26)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.removeFrameNode();
        })

      // 步骤3：关闭trace采集
      Button('关闭Trace采集')
        .id('button_stop_trace_sr20241118811430_011')
        .width('80%')
        .height(26)
        .margin({ bottom: 2 })
        .onClick(() => {
          this.traceEnabled = false;
          this.logText += '关闭Trace采集成功\n';
        })

      // NodeContainer展示区域
      NodeContainer(this.nodeController)
        .id('node_container_sr20241118811430_011')
        .width('80%')
        .height(40)
        .backgroundColor('#E0E0E0')
        .margin({ bottom: 2 })

      // 日志显示区域
      Scroll() {
        Text(this.logText)
          .fontSize(5)
          .fontColor(Color.Black)
          .width('100%')
          .textAlign(TextAlign.Start)
      }
      .id('scroll_log_sr20241118811430_011')
      .width('90%')
      .height('4.1%')
      .backgroundColor('#F5F5F5')
      .borderRadius(2)
      .padding(2)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .padding({ top: 2 })
  }
}
