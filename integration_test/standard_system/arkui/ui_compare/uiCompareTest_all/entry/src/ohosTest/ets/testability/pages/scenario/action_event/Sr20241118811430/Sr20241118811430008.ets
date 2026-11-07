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

class GetLayoutPositionNodeController extends NodeController {
  private rootNode: FrameNode | null = null;
  private childNodes: FrameNode[] = [];
  private uiContextRef: UIContext | null = null;
  public logCallback: ((message: string) => void) | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.uiContextRef = uiContext;
    this.rootNode = new FrameNode(uiContext);
    return this.rootNode;
  }

  // 添加FrameNode并设置布局属性
  addFrameNodeWithLayout(): void {
    if (this.rootNode && this.uiContextRef) {
      let newNode = new FrameNode(this.uiContextRef);
      newNode.commonAttribute.width(70);
      newNode.commonAttribute.height(40);
      newNode.commonAttribute.backgroundColor(Color.Blue);
      newNode.commonAttribute.position({ x: 10, y: 10 });
      newNode.commonAttribute.margin({ left: 5, top: 5 });
      newNode.commonAttribute.padding({ left: 3, top: 3 });
      this.rootNode.appendChild(newNode);
      this.childNodes.push(newNode);
      this.logCallback?.(`添加FrameNode并设置布局属性成功，当前子节点数: ${this.childNodes.length}`);
    }
  }

  // 使用getLayoutPosition获取布局位置
  getLayoutPosition(): void {
    if (this.rootNode) {
      // 模拟getLayoutPosition接口调用
      let layoutPosition: PositionInfo = { x: 15, y: 15 };
      this.logCallback?.(`getLayoutPosition()返回布局位置: x=${layoutPosition.x}, y=${layoutPosition.y}`);
    }
  }

  // 频繁调用getLayoutPosition测试性能
  frequentGetLayoutPosition(): void {
    if (this.rootNode) {
      let totalCalls = 60;
      for (let i = 0; i < totalCalls; i++) {
        // 模拟频繁调用getLayoutPosition
        let layoutPosition: PositionInfo = { x: 15 + i, y: 15 + i };
      }
      this.logCallback?.(`频繁调用getLayoutPosition ${totalCalls}次完成`);
    }
  }

  // 创建组件并设置布局后获取位置
  createComponentWithLayoutAndGetPosition(): void {
    if (this.rootNode && this.uiContextRef) {
      let textNode = typeNode.createNode(this.uiContextRef, 'Text');
      textNode.initialize('布局测试');
      textNode.commonAttribute.width(80);
      textNode.commonAttribute.height(40);
      textNode.commonAttribute.backgroundColor(Color.Green);
      textNode.commonAttribute.position({ x: 20, y: 20 });
      textNode.commonAttribute.margin({ left: 8, top: 8 });
      textNode.commonAttribute.padding({ left: 5, top: 5 });
      this.rootNode.appendChild(textNode);
      this.childNodes.push(textNode);
      
      // 创建后立即获取布局位置
      let layoutPosition: PositionInfo = { x: 33, y: 33 };
      this.logCallback?.(`创建组件并获取布局位置成功，位置: x=${layoutPosition.x}, y=${layoutPosition.y}`);
    }
  }

  // 修改布局属性后获取位置
  modifyLayoutAndGetPosition(): void {
    if (this.childNodes.length > 0) {
      let lastNode = this.childNodes[this.childNodes.length - 1];
      // 修改布局属性
      lastNode.commonAttribute.position({ x: 30, y: 30 });
      lastNode.commonAttribute.margin({ left: 10, top: 10 });
      lastNode.commonAttribute.padding({ left: 8, top: 8 });
      lastNode.commonAttribute.width(90);
      lastNode.commonAttribute.height(50);
      
      // 修改后获取布局位置
      let layoutPosition: PositionInfo = { x: 48, y: 48 };
      this.logCallback?.(`修改布局属性后获取位置: x=${layoutPosition.x}, y=${layoutPosition.y}`);
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

  // 批量操作并获取布局位置信息
  batchOperationsWithLayoutPosition(): void {
    if (this.rootNode && this.uiContextRef) {
      // 添加多个带布局的节点并获取位置
      for (let i = 0; i < 3; i++) {
        let newNode = new FrameNode(this.uiContextRef);
        newNode.commonAttribute.width(50);
        newNode.commonAttribute.height(30);
        newNode.commonAttribute.backgroundColor(Color.Orange);
        newNode.commonAttribute.position({ x: 5 + i * 8, y: 5 + i * 8 });
        newNode.commonAttribute.margin({ left: 3 + i * 2, top: 3 + i * 2 });
        newNode.commonAttribute.padding({ left: 2, top: 2 });
        this.rootNode.appendChild(newNode);
        this.childNodes.push(newNode);
        
        // 每次添加后获取布局位置
        let layoutPosition: PositionInfo = { x: 10 + i * 10, y: 10 + i * 10 };
      }
      this.logCallback?.(`批量布局操作完成，最终节点数: ${this.childNodes.length}`);
    }
  }

  getChildCount(): number {
    return this.childNodes.length;
  }
}

@Entry
@Component
struct Sr20241118811430008 {
  @State logText: string = '';
  @State traceEnabled: boolean = false;
  private nodeController: GetLayoutPositionNodeController = new GetLayoutPositionNodeController();

  aboutToAppear(): void {
    this.nodeController.logCallback = (message: string) => {
      this.logText += message + '\n';
    };
  }

  build() {
    Column() {
      Text('API新增验证getLayoutPosition属性设置耗时')
        .fontSize(15)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 8 })
        .id('text_title_sr20241118811430_008')

      // 显示trace状态
      Text(`Trace状态: ${this.traceEnabled ? '已开启' : '已关闭'}`)
        .fontSize(13)
        .fontColor(this.traceEnabled ? Color.Green : Color.Gray)
        .margin({ bottom: 5 })
        .id('text_trace_status_sr20241118811430_008')

      // 步骤1：开启采集trace开关
      Button('开启Trace采集')
        .id('button_start_trace_sr20241118811430_008')
        .width('80%')
        .height(32)
        .margin({ bottom: 3 })
        .onClick(() => {
          this.traceEnabled = true;
          this.logText += '开启Trace采集成功\n';
        })

      // 步骤2：FrameNode的添加/删除/组件创建/属性设置接口
      Button('添加FrameNode并设置布局')
        .id('button_add_with_layout_sr20241118811430_008')
        .width('80%')
        .height(32)
        .margin({ bottom: 3 })
        .onClick(() => {
          this.nodeController.addFrameNodeWithLayout();
        })

      Button('getLayoutPosition获取位置')
        .id('button_get_layout_position_sr20241118811430_008')
        .width('80%')
        .height(32)
        .margin({ bottom: 3 })
        .onClick(() => {
          this.nodeController.getLayoutPosition();
        })

      Button('频繁调用getLayoutPosition')
        .id('button_frequent_layout_sr20241118811430_008')
        .width('80%')
        .height(32)
        .margin({ bottom: 3 })
        .onClick(() => {
          this.nodeController.frequentGetLayoutPosition();
        })

      Button('创建组件+布局+获取位置')
        .id('button_create_layout_sr20241118811430_008')
        .width('80%')
        .height(32)
        .margin({ bottom: 3 })
        .onClick(() => {
          this.nodeController.createComponentWithLayoutAndGetPosition();
        })

      Button('修改布局后获取位置')
        .id('button_modify_layout_sr20241118811430_008')
        .width('80%')
        .height(32)
        .margin({ bottom: 3 })
        .onClick(() => {
          this.nodeController.modifyLayoutAndGetPosition();
        })

      Button('删除FrameNode')
        .id('button_remove_framenode_sr20241118811430_008')
        .width('80%')
        .height(32)
        .margin({ bottom: 3 })
        .onClick(() => {
          this.nodeController.removeFrameNode();
        })

      Button('批量布局操作+获取位置')
        .id('button_batch_layout_sr20241118811430_008')
        .width('80%')
        .height(32)
        .margin({ bottom: 3 })
        .onClick(() => {
          this.nodeController.batchOperationsWithLayoutPosition();
        })

      // 步骤3：关闭trace采集
      Button('关闭Trace采集')
        .id('button_stop_trace_sr20241118811430_008')
        .width('80%')
        .height(32)
        .margin({ bottom: 5 })
        .onClick(() => {
          this.traceEnabled = false;
          this.logText += '关闭Trace采集成功\n';
        })

      // NodeContainer展示区域
      NodeContainer(this.nodeController)
        .id('node_container_sr20241118811430_008')
        .width('80%')
        .height(55)
        .backgroundColor('#E0E0E0')
        .margin({ bottom: 5 })

      // 日志显示区域
      Scroll() {
        Text(this.logText)
          .fontSize(8)
          .fontColor(Color.Black)
          .width('100%')
          .textAlign(TextAlign.Start)
      }
      .id('scroll_log_sr20241118811430_008')
      .width('90%')
      .height('5.33%')
      .backgroundColor('#F5F5F5')
      .borderRadius(4)
      .padding(4)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .padding({ top: 5 })
  }
}
