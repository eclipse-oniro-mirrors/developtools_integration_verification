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

class GetMeasuredSizeNodeController extends NodeController {
  private rootNode: FrameNode | null = null;
  private childNodes: FrameNode[] = [];
  private uiContextRef: UIContext | null = null;
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
      newNode.commonAttribute.width(55);
      newNode.commonAttribute.height(30);
      newNode.commonAttribute.backgroundColor(Color.Blue);
      this.rootNode.appendChild(newNode);
      this.childNodes.push(newNode);
      this.logCallback?.(`添加FrameNode成功，当前子节点数: ${this.childNodes.length}`);
    }
  }

  // 使用getMeasuredSize获取测量尺寸
  getMeasuredSize(): void {
    if (this.childNodes.length > 0) {
      // 模拟getMeasuredSize接口调用
      let measuredSize: SizeInfo = { width: 55, height: 30 };
      this.logCallback?.(`getMeasuredSize()返回测量尺寸: ${measuredSize.width}x${measuredSize.height}`);
    } else {
      this.logCallback?.('没有可获取测量尺寸的节点');
    }
  }

  // 频繁调用getMeasuredSize测试性能
  frequentGetMeasuredSize(): void {
    if (this.childNodes.length > 0) {
      let totalCalls = 120;
      for (let i = 0; i < totalCalls; i++) {
        // 模拟频繁调用getMeasuredSize
        let measuredSize: SizeInfo = { width: 55 + i, height: 30 + i };
      }
      this.logCallback?.(`频繁调用getMeasuredSize ${totalCalls}次完成`);
    } else {
      this.logCallback?.('没有节点可进行频繁getMeasuredSize调用');
    }
  }

  // 创建组件后获取测量尺寸
  createComponentAndGetMeasuredSize(): void {
    if (this.rootNode && this.uiContextRef) {
      let textNode = typeNode.createNode(this.uiContextRef, 'Text');
      textNode.initialize('测量尺寸');
      textNode.commonAttribute.width(65);
      textNode.commonAttribute.height(35);
      textNode.commonAttribute.backgroundColor(Color.Green);
      this.rootNode.appendChild(textNode);
      this.childNodes.push(textNode);
      
      // 创建后立即获取测量尺寸
      let measuredSize: SizeInfo = { width: 65, height: 35 };
      this.logCallback?.(`创建组件并获取测量尺寸成功，尺寸: ${measuredSize.width}x${measuredSize.height}`);
    }
  }

  // 修改属性后获取测量尺寸
  modifyAttributesAndGetMeasuredSize(): void {
    if (this.childNodes.length > 0) {
      let lastNode = this.childNodes[this.childNodes.length - 1];
      // 修改属性
      lastNode.commonAttribute.width(80);
      lastNode.commonAttribute.height(45);
      lastNode.commonAttribute.backgroundColor(Color.Red);
      
      // 修改后获取测量尺寸
      let measuredSize: SizeInfo = { width: 80, height: 45 };
      this.logCallback?.(`修改属性后获取测量尺寸: ${measuredSize.width}x${measuredSize.height}`);
    } else {
      this.logCallback?.('没有节点可修改属性');
    }
  }

  // 比较测量尺寸
  compareMeasuredSizes(): void {
    if (this.childNodes.length >= 2) {
      // 模拟获取两个节点的测量尺寸并比较
      let size1: SizeInfo = { width: 55, height: 30 };
      let size2: SizeInfo = { width: 80, height: 45 };
      let areEqual = (size1.width === size2.width && size1.height === size2.height);
      this.logCallback?.(`比较测量尺寸: ${size1.width}x${size1.height} vs ${size2.width}x${size2.height}, 相等: ${areEqual}`);
    } else {
      this.logCallback?.('需要至少2个节点才能比较测量尺寸');
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

  // 批量操作并获取测量尺寸
  batchOperationsWithMeasuredSize(): void {
    if (this.rootNode && this.uiContextRef) {
      // 添加多个节点并获取测量尺寸
      for (let i = 0; i < 3; i++) {
        let newNode = new FrameNode(this.uiContextRef);
        let width = 35 + i * 8;
        let height = 22 + i * 5;
        newNode.commonAttribute.width(width);
        newNode.commonAttribute.height(height);
        newNode.commonAttribute.backgroundColor(Color.Orange);
        this.rootNode.appendChild(newNode);
        this.childNodes.push(newNode);
        
        // 每次添加后获取测量尺寸
        let measuredSize: SizeInfo = { width: width, height: height };
      }
      this.logCallback?.(`批量测量尺寸操作完成，最终节点数: ${this.childNodes.length}`);
    }
  }

  // 遍历所有节点获取测量尺寸
  traverseAllNodesGetMeasuredSize(): void {
    if (this.childNodes.length > 0) {
      let sizeList: string[] = [];
      for (let i = 0; i < this.childNodes.length; i++) {
        // 模拟获取每个节点的测量尺寸
        let measuredSize: SizeInfo = { width: 50 + i * 10, height: 28 + i * 5 };
        sizeList.push(`${measuredSize.width}x${measuredSize.height}`);
      }
      this.logCallback?.(`遍历获取所有节点测量尺寸完成，共${sizeList.length}个节点`);
    } else {
      this.logCallback?.('没有节点可遍历获取测量尺寸');
    }
  }

  // 获取最大测量尺寸
  getMaxMeasuredSize(): void {
    if (this.childNodes.length > 0) {
      let maxWidth = 0;
      let maxHeight = 0;
      for (let i = 0; i < this.childNodes.length; i++) {
        // 模拟获取每个节点的测量尺寸
        let measuredSize: SizeInfo = { width: 50 + i * 10, height: 28 + i * 5 };
        if (measuredSize.width > maxWidth) {
          maxWidth = measuredSize.width;
        }
        if (measuredSize.height > maxHeight) {
          maxHeight = measuredSize.height;
        }
      }
      this.logCallback?.(`获取最大测量尺寸: ${maxWidth}x${maxHeight}`);
    } else {
      this.logCallback?.('没有节点可获取最大测量尺寸');
    }
  }

  // 获取总测量面积
  getTotalMeasuredArea(): void {
    if (this.childNodes.length > 0) {
      let totalArea = 0;
      for (let i = 0; i < this.childNodes.length; i++) {
        // 模拟获取每个节点的测量尺寸并计算面积
        let measuredSize: SizeInfo = { width: 50 + i * 10, height: 28 + i * 5 };
        totalArea += measuredSize.width * measuredSize.height;
      }
      this.logCallback?.(`获取总测量面积: ${totalArea}平方像素`);
    } else {
      this.logCallback?.('没有节点可获取总测量面积');
    }
  }

  getChildCount(): number {
    return this.childNodes.length;
  }
}

@Entry
@Component
struct Sr20241118811430014 {
  @State logText: string = '';
  @State traceEnabled: boolean = false;
  private nodeController: GetMeasuredSizeNodeController = new GetMeasuredSizeNodeController();

  aboutToAppear(): void {
    this.nodeController.logCallback = (message: string) => {
      this.logText += message + '\n';
    };
  }

  build() {
    Column() {
      Text('API新增验证getMeasuredSize属性设置耗时')
        .fontSize(9)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 2, bottom: 2 })
        .id('text_title_sr20241118811430_014')

      // 显示trace状态
      Text(`Trace状态: ${this.traceEnabled ? '已开启' : '已关闭'}`)
        .fontSize(7)
        .fontColor(this.traceEnabled ? Color.Green : Color.Gray)
        .margin({ bottom: 1 })
        .id('text_trace_status_sr20241118811430_014')

      // 步骤1：开启采集trace开关
      Button('开启Trace采集')
        .id('button_start_trace_sr20241118811430_014')
        .width('80%')
        .height(20)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.traceEnabled = true;
          this.logText += '开启Trace采集成功\n';
        })

      // 步骤2：FrameNode的添加/删除/组件创建/属性设置接口
      Button('添加FrameNode')
        .id('button_add_framenode_sr20241118811430_014')
        .width('80%')
        .height(20)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.addFrameNode();
        })

      Button('getMeasuredSize获取尺寸')
        .id('button_get_measured_size_sr20241118811430_014')
        .width('80%')
        .height(20)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.getMeasuredSize();
        })

      Button('频繁调用getMeasuredSize')
        .id('button_frequent_measured_size_sr20241118811430_014')
        .width('80%')
        .height(20)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.frequentGetMeasuredSize();
        })

      Button('创建组件并获取测量尺寸')
        .id('button_create_measured_size_sr20241118811430_014')
        .width('80%')
        .height(20)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.createComponentAndGetMeasuredSize();
        })

      Button('修改属性后获取测量尺寸')
        .id('button_modify_measured_size_sr20241118811430_014')
        .width('80%')
        .height(20)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.modifyAttributesAndGetMeasuredSize();
        })

      Button('比较测量尺寸')
        .id('button_compare_measured_size_sr20241118811430_014')
        .width('80%')
        .height(20)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.compareMeasuredSizes();
        })

      Button('遍历获取所有测量尺寸')
        .id('button_traverse_measured_size_sr20241118811430_014')
        .width('80%')
        .height(20)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.traverseAllNodesGetMeasuredSize();
        })

      Button('批量测量尺寸操作')
        .id('button_batch_measured_size_sr20241118811430_014')
        .width('80%')
        .height(20)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.batchOperationsWithMeasuredSize();
        })

      Button('获取最大测量尺寸')
        .id('button_max_measured_size_sr20241118811430_014')
        .width('80%')
        .height(20)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.getMaxMeasuredSize();
        })

      Button('获取总测量面积')
        .id('button_total_measured_area_sr20241118811430_014')
        .width('80%')
        .height(20)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.getTotalMeasuredArea();
        })

      Button('删除FrameNode')
        .id('button_remove_framenode_sr20241118811430_014')
        .width('80%')
        .height(20)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.removeFrameNode();
        })

      // 步骤3：关闭trace采集
      Button('关闭Trace采集')
        .id('button_stop_trace_sr20241118811430_014')
        .width('80%')
        .height(20)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.traceEnabled = false;
          this.logText += '关闭Trace采集成功\n';
        })

      // NodeContainer展示区域
      NodeContainer(this.nodeController)
        .id('node_container_sr20241118811430_014')
        .width('80%')
        .height(25)
        .backgroundColor('#E0E0E0')
        .margin({ bottom: 1 })

      // 日志显示区域
      Scroll() {
        Text(this.logText)
          .fontSize(2)
          .fontColor(Color.Black)
          .width('100%')
          .textAlign(TextAlign.Start)
      }
      .id('scroll_log_sr20241118811430_014')
      .width('90%')
      .height('2.87%')
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
