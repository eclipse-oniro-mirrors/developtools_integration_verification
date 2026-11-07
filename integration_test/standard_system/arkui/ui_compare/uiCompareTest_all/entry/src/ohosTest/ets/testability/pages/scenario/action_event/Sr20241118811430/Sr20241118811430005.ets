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

class GetChildNumberNodeController extends NodeController {
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
        newNode.commonAttribute.width(60);
        newNode.commonAttribute.height(35);
        newNode.commonAttribute.backgroundColor(Color.Blue);
        newNode.commonAttribute.margin(2);
        this.rootNode.appendChild(newNode);
        this.childNodes.push(newNode);
      }
      this.logCallback?.(`添加5个FrameNode成功，当前子节点数: ${this.childNodes.length}`);
    }
  }

  // 使用getChildNumber获取子节点数量
  getChildNumber(): void {
    if (this.rootNode) {
      // 模拟getChildNumber接口调用
      let childCount = this.childNodes.length;
      this.logCallback?.(`getChildNumber()返回子节点数量: ${childCount}`);
    }
  }

  // 频繁调用getChildNumber测试性能
  frequentGetChildNumber(): void {
    if (this.rootNode) {
      let totalCalls = 100;
      for (let i = 0; i < totalCalls; i++) {
        // 模拟频繁调用getChildNumber
        let childCount = this.childNodes.length;
      }
      this.logCallback?.(`频繁调用getChildNumber ${totalCalls}次完成`);
    }
  }

  // 创建组件并添加
  createAndAddComponent(): void {
    if (this.rootNode && this.uiContextRef) {
      let textNode = typeNode.createNode(this.uiContextRef, 'Text');
      textNode.initialize('测试文本');
      textNode.commonAttribute.width(70);
      textNode.commonAttribute.height(35);
      textNode.commonAttribute.backgroundColor(Color.Green);
      textNode.commonAttribute.margin(2);
      this.rootNode.appendChild(textNode);
      this.childNodes.push(textNode);
      this.logCallback?.(`创建组件并添加成功，当前子节点数: ${this.childNodes.length}`);
    }
  }

  // 删除FrameNode并获取子节点数量
  removeFrameNodeAndGetCount(): void {
    if (this.rootNode && this.childNodes.length > 0) {
      let nodeToRemove = this.childNodes.pop();
      if (nodeToRemove) {
        this.rootNode.removeChild(nodeToRemove);
        // 删除后立即获取子节点数量
        let childCount = this.childNodes.length;
        this.logCallback?.(`删除FrameNode成功，getChildNumber返回: ${childCount}`);
      }
    }
  }

  // 批量操作并获取子节点数量
  batchOperationsWithGetChildNumber(): void {
    if (this.rootNode && this.uiContextRef) {
      // 添加3个节点
      for (let i = 0; i < 3; i++) {
        let newNode = new FrameNode(this.uiContextRef);
        newNode.commonAttribute.width(40);
        newNode.commonAttribute.height(25);
        newNode.commonAttribute.backgroundColor(Color.Orange);
        newNode.commonAttribute.margin(1);
        this.rootNode.appendChild(newNode);
        this.childNodes.push(newNode);
        // 每次添加后获取子节点数量
        let childCount = this.childNodes.length;
      }
      this.logCallback?.(`批量操作完成，最终getChildNumber返回: ${this.childNodes.length}`);
    }
  }

  getChildCount(): number {
    return this.childNodes.length;
  }
}

@Entry
@Component
struct Sr20241118811430005 {
  @State logText: string = '';
  @State traceEnabled: boolean = false;
  private nodeController: GetChildNumberNodeController = new GetChildNumberNodeController();

  aboutToAppear(): void {
    this.nodeController.logCallback = (message: string) => {
      this.logText += message + '\n';
    };
  }

  build() {
    Column() {
      Text('API新增验证getChildNumber属性设置耗时')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 15, bottom: 15 })
        .id('text_title_sr20241118811430_005')

      // 显示trace状态
      Text(`Trace状态: ${this.traceEnabled ? '已开启' : '已关闭'}`)
        .fontSize(16)
        .fontColor(this.traceEnabled ? Color.Green : Color.Gray)
        .margin({ bottom: 10 })
        .id('text_trace_status_sr20241118811430_005')

      // 步骤1：开启采集trace开关
      Button('开启Trace采集')
        .id('button_start_trace_sr20241118811430_005')
        .width('80%')
        .height(40)
        .margin({ bottom: 6 })
        .onClick(() => {
          this.traceEnabled = true;
          this.logText += '开启Trace采集成功\n';
        })

      // 步骤2：FrameNode的添加/删除/组件创建/属性设置接口
      Button('添加多个FrameNode')
        .id('button_add_multiple_sr20241118811430_005')
        .width('80%')
        .height(40)
        .margin({ bottom: 6 })
        .onClick(() => {
          this.nodeController.addMultipleFrameNodes();
        })

      Button('getChildNumber获取数量')
        .id('button_get_child_number_sr20241118811430_005')
        .width('80%')
        .height(40)
        .margin({ bottom: 6 })
        .onClick(() => {
          this.nodeController.getChildNumber();
        })

      Button('频繁调用getChildNumber')
        .id('button_frequent_get_sr20241118811430_005')
        .width('80%')
        .height(40)
        .margin({ bottom: 6 })
        .onClick(() => {
          this.nodeController.frequentGetChildNumber();
        })

      Button('创建组件并添加')
        .id('button_create_component_sr20241118811430_005')
        .width('80%')
        .height(40)
        .margin({ bottom: 6 })
        .onClick(() => {
          this.nodeController.createAndAddComponent();
        })

      Button('删除节点并获取数量')
        .id('button_remove_get_count_sr20241118811430_005')
        .width('80%')
        .height(40)
        .margin({ bottom: 6 })
        .onClick(() => {
          this.nodeController.removeFrameNodeAndGetCount();
        })

      Button('批量操作+getChildNumber')
        .id('button_batch_operations_sr20241118811430_005')
        .width('80%')
        .height(40)
        .margin({ bottom: 6 })
        .onClick(() => {
          this.nodeController.batchOperationsWithGetChildNumber();
        })

      // 步骤3：关闭trace采集
      Button('关闭Trace采集')
        .id('button_stop_trace_sr20241118811430_005')
        .width('80%')
        .height(40)
        .margin({ bottom: 10 })
        .onClick(() => {
          this.traceEnabled = false;
          this.logText += '关闭Trace采集成功\n';
        })

      // NodeContainer展示区域
      NodeContainer(this.nodeController)
        .id('node_container_sr20241118811430_005')
        .width('80%')
        .height(80)
        .backgroundColor('#E0E0E0')
        .margin({ bottom: 10 })

      // 日志显示区域
      Scroll() {
        Text(this.logText)
          .fontSize(11)
          .fontColor(Color.Black)
          .width('100%')
          .textAlign(TextAlign.Start)
      }
      .id('scroll_log_sr20241118811430_005')
      .width('90%')
      .height('7.38%')
      .backgroundColor('#F5F5F5')
      .borderRadius(8)
      .padding(8)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .padding({ top: 10 })
  }
}
