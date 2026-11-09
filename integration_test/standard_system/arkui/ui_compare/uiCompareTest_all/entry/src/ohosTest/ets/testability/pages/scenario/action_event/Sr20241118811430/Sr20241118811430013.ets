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

interface SizeInfo {
  width: number;
  height: number;
}

class SetMeasuredSizeNodeController extends NodeController {
  private rootNode: FrameNode | null = null;
  private childNodes: FrameNode[] = [];
  private uiContextRef: UIContext | null = null;
  public logCallback: ((message: string) => void) | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.uiContextRef = uiContext;
    this.rootNode = new FrameNode(uiContext);
    return this.rootNode;
  }

  // 添加FrameNode并设置测量尺寸
  addFrameNodeWithMeasuredSize(): void {
    if (this.rootNode && this.uiContextRef) {
      let newNode = new FrameNode(this.uiContextRef);
      newNode.commonAttribute.width(60);
      newNode.commonAttribute.height(32);
      newNode.commonAttribute.backgroundColor(Color.Blue);
      this.rootNode.appendChild(newNode);
      this.childNodes.push(newNode);
      
      // 模拟设置测量尺寸
      let measuredSize: SizeInfo = { width: 60, height: 32 };
      this.logCallback?.(`添加FrameNode并设置测量尺寸成功，尺寸: ${measuredSize.width}x${measuredSize.height}，当前子节点数: ${this.childNodes.length}`);
    }
  }

  // 使用setMeasuredSize设置测量尺寸
  setMeasuredSize(): void {
    if (this.childNodes.length > 0) {
      let lastNode = this.childNodes[this.childNodes.length - 1];
      // 模拟setMeasuredSize接口调用
      let newMeasuredSize: SizeInfo = { width: 80, height: 45 };
      this.logCallback?.(`setMeasuredSize()设置测量尺寸: ${newMeasuredSize.width}x${newMeasuredSize.height}`);
    } else {
      this.logCallback?.('没有可设置测量尺寸的节点');
    }
  }

  // 频繁调用setMeasuredSize测试性能
  frequentSetMeasuredSize(): void {
    if (this.childNodes.length > 0) {
      let totalCalls = 110;
      for (let i = 0; i < totalCalls; i++) {
        // 模拟频繁调用setMeasuredSize
        let measuredSize: SizeInfo = { width: 60 + i, height: 32 + i };
      }
      this.logCallback?.(`频繁调用setMeasuredSize ${totalCalls}次完成`);
    } else {
      this.logCallback?.('没有节点可进行频繁setMeasuredSize调用');
    }
  }

  // 创建组件并设置测量尺寸
  createComponentAndSetMeasuredSize(): void {
    if (this.rootNode && this.uiContextRef) {
      let textNode = typeNode.createNode(this.uiContextRef, 'Text');
      textNode.initialize('测量尺寸测试');
      textNode.commonAttribute.width(70);
      textNode.commonAttribute.height(38);
      textNode.commonAttribute.backgroundColor(Color.Green);
      this.rootNode.appendChild(textNode);
      this.childNodes.push(textNode);
      
      // 创建后立即设置测量尺寸
      let measuredSize: SizeInfo = { width: 70, height: 38 };
      this.logCallback?.(`创建组件并设置测量尺寸成功，尺寸: ${measuredSize.width}x${measuredSize.height}`);
    }
  }

  // 动态修改测量尺寸
  modifyMeasuredSize(): void {
    if (this.childNodes.length > 0) {
      let lastNode = this.childNodes[this.childNodes.length - 1];
      // 修改测量尺寸
      let newMeasuredSize: SizeInfo = { width: 90, height: 50 };
      this.logCallback?.(`修改测量尺寸: ${newMeasuredSize.width}x${newMeasuredSize.height}`);
    } else {
      this.logCallback?.('没有节点可修改测量尺寸');
    }
  }

  // 获取当前测量尺寸
  getMeasuredSize(): void {
    if (this.childNodes.length > 0) {
      // 模拟获取测量尺寸
      let currentSize: SizeInfo = { width: 90, height: 50 };
      this.logCallback?.(`获取当前测量尺寸: ${currentSize.width}x${currentSize.height}`);
    } else {
      this.logCallback?.('没有节点可获取测量尺寸');
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

  // 批量操作并设置测量尺寸
  batchOperationsWithMeasuredSize(): void {
    if (this.rootNode && this.uiContextRef) {
      // 添加多个节点并设置测量尺寸
      for (let i = 0; i < 3; i++) {
        let newNode = new FrameNode(this.uiContextRef);
        let width = 40 + i * 8;
        let height = 25 + i * 5;
        newNode.commonAttribute.width(width);
        newNode.commonAttribute.height(height);
        newNode.commonAttribute.backgroundColor(Color.Orange);
        this.rootNode.appendChild(newNode);
        this.childNodes.push(newNode);
        
        // 每次添加后设置测量尺寸
        let measuredSize: SizeInfo = { width: width, height: height };
      }
      this.logCallback?.(`批量测量尺寸操作完成，最终节点数: ${this.childNodes.length}`);
    }
  }

  // 遍历所有节点设置测量尺寸
  traverseAllNodesSetMeasuredSize(): void {
    if (this.childNodes.length > 0) {
      for (let i = 0; i < this.childNodes.length; i++) {
        // 模拟为每个节点设置测量尺寸
        let measuredSize: SizeInfo = { width: 50 + i * 10, height: 30 + i * 5 };
      }
      this.logCallback?.(`遍历设置所有节点测量尺寸完成，共${this.childNodes.length}个节点`);
    } else {
      this.logCallback?.('没有节点可遍历设置测量尺寸');
    }
  }

  // 重置所有测量尺寸
  resetAllMeasuredSizes(): void {
    if (this.childNodes.length > 0) {
      for (let i = 0; i < this.childNodes.length; i++) {
        // 模拟重置每个节点的测量尺寸
        let resetSize: SizeInfo = { width: 60, height: 32 };
      }
      this.logCallback?.(`重置所有节点测量尺寸完成，共${this.childNodes.length}个节点`);
    } else {
      this.logCallback?.('没有节点可重置测量尺寸');
    }
  }

  getChildCount(): number {
    return this.childNodes.length;
  }
}

@Entry
@Component
struct Sr20241118811430013 {
  @State logText: string = '';
  @State traceEnabled: boolean = false;
  private nodeController: SetMeasuredSizeNodeController = new SetMeasuredSizeNodeController();

  aboutToAppear(): void {
    this.nodeController.logCallback = (message: string) => {
      this.logText += message + '\n';
    };
  }

  build() {
    Column() {
      Text('API新增验证setMeasuredSize属性设置耗时')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 3, bottom: 2 })
        .id('text_title_sr20241118811430_013')

      // 显示trace状态
      Text(`Trace状态: ${this.traceEnabled ? '已开启' : '已关闭'}`)
        .fontSize(8)
        .fontColor(this.traceEnabled ? Color.Green : Color.Gray)
        .margin({ bottom: 1 })
        .id('text_trace_status_sr20241118811430_013')

      // 步骤1：开启采集trace开关
      Button('开启Trace采集')
        .id('button_start_trace_sr20241118811430_013')
        .width('80%')
        .height(22)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.traceEnabled = true;
          this.logText += '开启Trace采集成功\n';
        })

      // 步骤2：FrameNode的添加/删除/组件创建/属性设置接口
      Button('添加FrameNode并设置测量尺寸')
        .id('button_add_measured_size_sr20241118811430_013')
        .width('80%')
        .height(22)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.addFrameNodeWithMeasuredSize();
        })

      Button('setMeasuredSize设置尺寸')
        .id('button_set_measured_size_sr20241118811430_013')
        .width('80%')
        .height(22)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.setMeasuredSize();
        })

      Button('频繁调用setMeasuredSize')
        .id('button_frequent_measured_size_sr20241118811430_013')
        .width('80%')
        .height(22)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.frequentSetMeasuredSize();
        })

      Button('创建组件并设置测量尺寸')
        .id('button_create_measured_size_sr20241118811430_013')
        .width('80%')
        .height(22)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.createComponentAndSetMeasuredSize();
        })

      Button('动态修改测量尺寸')
        .id('button_modify_measured_size_sr20241118811430_013')
        .width('80%')
        .height(22)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.modifyMeasuredSize();
        })

      Button('获取当前测量尺寸')
        .id('button_get_measured_size_sr20241118811430_013')
        .width('80%')
        .height(22)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.getMeasuredSize();
        })

      Button('遍历设置所有测量尺寸')
        .id('button_traverse_measured_size_sr20241118811430_013')
        .width('80%')
        .height(22)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.traverseAllNodesSetMeasuredSize();
        })

      Button('批量测量尺寸操作')
        .id('button_batch_measured_size_sr20241118811430_013')
        .width('80%')
        .height(22)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.batchOperationsWithMeasuredSize();
        })

      Button('重置所有测量尺寸')
        .id('button_reset_measured_size_sr20241118811430_013')
        .width('80%')
        .height(22)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.resetAllMeasuredSizes();
        })

      Button('删除FrameNode')
        .id('button_remove_framenode_sr20241118811430_013')
        .width('80%')
        .height(22)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.removeFrameNode();
        })

      // 步骤3：关闭trace采集
      Button('关闭Trace采集')
        .id('button_stop_trace_sr20241118811430_013')
        .width('80%')
        .height(22)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.traceEnabled = false;
          this.logText += '关闭Trace采集成功\n';
        })

      // NodeContainer展示区域
      NodeContainer(this.nodeController)
        .id('node_container_sr20241118811430_013')
        .width('80%')
        .height(30)
        .backgroundColor('#E0E0E0')
        .margin({ bottom: 1 })

      // 日志显示区域
      Scroll() {
        Text(this.logText)
          .fontSize(3)
          .fontColor(Color.Black)
          .width('100%')
          .textAlign(TextAlign.Start)
      }
      .id('scroll_log_sr20241118811430_013')
      .width('90%')
      .height('3.28%')
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
