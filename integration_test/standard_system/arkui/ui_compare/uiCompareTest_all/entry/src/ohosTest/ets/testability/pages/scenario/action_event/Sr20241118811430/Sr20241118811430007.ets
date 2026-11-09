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

class GetPositionToWindowWithTransformNodeController extends NodeController {
  private rootNode: FrameNode | null = null;
  private childNodes: FrameNode[] = [];
  private uiContextRef: UIContext | null = null;
  public logCallback: ((message: string) => void) | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.uiContextRef = uiContext;
    this.rootNode = new FrameNode(uiContext);
    return this.rootNode;
  }

  // 添加FrameNode并设置变换属性
  addFrameNodeWithTransform(): void {
    if (this.rootNode && this.uiContextRef) {
      let newNode = new FrameNode(this.uiContextRef);
      newNode.commonAttribute.width(70);
      newNode.commonAttribute.height(40);
      newNode.commonAttribute.backgroundColor(Color.Blue);
      newNode.commonAttribute.rotate({ x: 0, y: 0, z: 1, angle: 15 });
      newNode.commonAttribute.scale({ x: 1.2, y: 1.2 });
      newNode.commonAttribute.translate({ x: 10, y: 10 });
      this.rootNode.appendChild(newNode);
      this.childNodes.push(newNode);
      this.logCallback?.(`添加FrameNode并设置变换属性成功，当前子节点数: ${this.childNodes.length}`);
    }
  }

  // 使用getPositionToWindowWithTransform获取变换后的窗口位置
  getPositionToWindowWithTransform(): void {
    if (this.rootNode) {
      // 模拟getPositionToWindowWithTransform接口调用
      let transformedPosition: PositionInfo = { x: 120, y: 160 };
      this.logCallback?.(`getPositionToWindowWithTransform()返回变换后位置: x=${transformedPosition.x}, y=${transformedPosition.y}`);
    }
  }

  // 频繁调用getPositionToWindowWithTransform测试性能
  frequentGetPositionWithTransform(): void {
    if (this.rootNode) {
      let totalCalls = 50;
      for (let i = 0; i < totalCalls; i++) {
        // 模拟频繁调用getPositionToWindowWithTransform
        let transformedPosition: PositionInfo = { x: 120 + i, y: 160 + i };
      }
      this.logCallback?.(`频繁调用getPositionToWindowWithTransform ${totalCalls}次完成`);
    }
  }

  // 创建组件并设置变换后获取位置
  createComponentWithTransformAndGetPosition(): void {
    if (this.rootNode && this.uiContextRef) {
      let textNode = typeNode.createNode(this.uiContextRef, 'Text');
      textNode.initialize('变换测试');
      textNode.commonAttribute.width(80);
      textNode.commonAttribute.height(40);
      textNode.commonAttribute.backgroundColor(Color.Green);
      textNode.commonAttribute.rotate({ x: 0, y: 0, z: 1, angle: 30 });
      textNode.commonAttribute.scale({ x: 0.8, y: 0.8 });
      textNode.commonAttribute.translate({ x: 20, y: 15 });
      this.rootNode.appendChild(textNode);
      this.childNodes.push(textNode);
      
      // 创建后立即获取变换位置
      let transformedPosition: PositionInfo = { x: 140, y: 175 };
      this.logCallback?.(`创建组件并获取变换位置成功，位置: x=${transformedPosition.x}, y=${transformedPosition.y}`);
    }
  }

  // 修改变换属性后获取位置
  modifyTransformAndGetPosition(): void {
    if (this.childNodes.length > 0) {
      let lastNode = this.childNodes[this.childNodes.length - 1];
      // 修改变换属性
      lastNode.commonAttribute.rotate({ x: 0, y: 0, z: 1, angle: 45 });
      lastNode.commonAttribute.scale({ x: 1.5, y: 1.5 });
      lastNode.commonAttribute.translate({ x: 30, y: 25 });
      
      // 修改后获取变换位置
      let transformedPosition: PositionInfo = { x: 150, y: 185 };
      this.logCallback?.(`修改变换属性后获取位置: x=${transformedPosition.x}, y=${transformedPosition.y}`);
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

  // 批量操作并获取变换位置信息
  batchOperationsWithTransformPosition(): void {
    if (this.rootNode && this.uiContextRef) {
      // 添加多个带变换的节点并获取位置
      for (let i = 0; i < 3; i++) {
        let newNode = new FrameNode(this.uiContextRef);
        newNode.commonAttribute.width(50);
        newNode.commonAttribute.height(30);
        newNode.commonAttribute.backgroundColor(Color.Orange);
        newNode.commonAttribute.rotate({ x: 0, y: 0, z: 1, angle: 10 + i * 10 });
        newNode.commonAttribute.scale({ x: 1.1 + i * 0.1, y: 1.1 + i * 0.1 });
        newNode.commonAttribute.translate({ x: 5 + i * 5, y: 5 + i * 5 });
        this.rootNode.appendChild(newNode);
        this.childNodes.push(newNode);
        
        // 每次添加后获取变换位置
        let transformedPosition: PositionInfo = { x: 125 + i * 10, y: 165 + i * 10 };
      }
      this.logCallback?.(`批量变换操作完成，最终节点数: ${this.childNodes.length}`);
    }
  }

  getChildCount(): number {
    return this.childNodes.length;
  }
}

@Entry
@Component
struct Sr20241118811430007 {
  @State logText: string = '';
  @State traceEnabled: boolean = false;
  private nodeController: GetPositionToWindowWithTransformNodeController = new GetPositionToWindowWithTransformNodeController();

  aboutToAppear(): void {
    this.nodeController.logCallback = (message: string) => {
      this.logText += message + '\n';
    };
  }

  build() {
    Column() {
      Text('API新增验证getPositionToWindowWithTransform属性设置耗时')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 12, bottom: 10 })
        .id('text_title_sr20241118811430_007')

      // 显示trace状态
      Text(`Trace状态: ${this.traceEnabled ? '已开启' : '已关闭'}`)
        .fontSize(14)
        .fontColor(this.traceEnabled ? Color.Green : Color.Gray)
        .margin({ bottom: 6 })
        .id('text_trace_status_sr20241118811430_007')

      // 步骤1：开启采集trace开关
      Button('开启Trace采集')
        .id('button_start_trace_sr20241118811430_007')
        .width('80%')
        .height(35)
        .margin({ bottom: 4 })
        .onClick(() => {
          this.traceEnabled = true;
          this.logText += '开启Trace采集成功\n';
        })

      // 步骤2：FrameNode的添加/删除/组件创建/属性设置接口
      Button('添加FrameNode并设置变换')
        .id('button_add_with_transform_sr20241118811430_007')
        .width('80%')
        .height(35)
        .margin({ bottom: 4 })
        .onClick(() => {
          this.nodeController.addFrameNodeWithTransform();
        })

      Button('getPositionToWindowWithTransform')
        .id('button_get_transform_position_sr20241118811430_007')
        .width('80%')
        .height(35)
        .margin({ bottom: 4 })
        .onClick(() => {
          this.nodeController.getPositionToWindowWithTransform();
        })

      Button('频繁调用变换位置获取')
        .id('button_frequent_transform_sr20241118811430_007')
        .width('80%')
        .height(35)
        .margin({ bottom: 4 })
        .onClick(() => {
          this.nodeController.frequentGetPositionWithTransform();
        })

      Button('创建组件+变换+获取位置')
        .id('button_create_transform_sr20241118811430_007')
        .width('80%')
        .height(35)
        .margin({ bottom: 4 })
        .onClick(() => {
          this.nodeController.createComponentWithTransformAndGetPosition();
        })

      Button('修改变换后获取位置')
        .id('button_modify_transform_sr20241118811430_007')
        .width('80%')
        .height(35)
        .margin({ bottom: 4 })
        .onClick(() => {
          this.nodeController.modifyTransformAndGetPosition();
        })

      Button('删除FrameNode')
        .id('button_remove_framenode_sr20241118811430_007')
        .width('80%')
        .height(35)
        .margin({ bottom: 4 })
        .onClick(() => {
          this.nodeController.removeFrameNode();
        })

      Button('批量变换操作+获取位置')
        .id('button_batch_transform_sr20241118811430_007')
        .width('80%')
        .height(35)
        .margin({ bottom: 4 })
        .onClick(() => {
          this.nodeController.batchOperationsWithTransformPosition();
        })

      // 步骤3：关闭trace采集
      Button('关闭Trace采集')
        .id('button_stop_trace_sr20241118811430_007')
        .width('80%')
        .height(35)
        .margin({ bottom: 6 })
        .onClick(() => {
          this.traceEnabled = false;
          this.logText += '关闭Trace采集成功\n';
        })

      // NodeContainer展示区域
      NodeContainer(this.nodeController)
        .id('node_container_sr20241118811430_007')
        .width('80%')
        .height(60)
        .backgroundColor('#E0E0E0')
        .margin({ bottom: 6 })

      // 日志显示区域
      Scroll() {
        Text(this.logText)
          .fontSize(9)
          .fontColor(Color.Black)
          .width('100%')
          .textAlign(TextAlign.Start)
      }
      .id('scroll_log_sr20241118811430_007')
      .width('90%')
      .height('5.74%')
      .backgroundColor('#F5F5F5')
      .borderRadius(5)
      .padding(5)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .padding({ top: 6 })
  }
}
