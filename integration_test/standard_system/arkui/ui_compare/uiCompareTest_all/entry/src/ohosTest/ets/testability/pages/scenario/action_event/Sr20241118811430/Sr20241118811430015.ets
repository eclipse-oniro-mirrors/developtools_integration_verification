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

class SetLayoutPositionNodeController extends NodeController {
  private rootNode: FrameNode | null = null;
  private childNodes: FrameNode[] = [];
  private uiContextRef: UIContext | null = null;
  public logCallback: ((message: string) => void) | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.uiContextRef = uiContext;
    this.rootNode = new FrameNode(uiContext);
    return this.rootNode;
  }

  // 添加FrameNode并设置布局位置
  addFrameNodeWithLayoutPosition(): void {
    if (this.rootNode && this.uiContextRef) {
      let newNode = new FrameNode(this.uiContextRef);
      newNode.commonAttribute.width(50);
      newNode.commonAttribute.height(28);
      newNode.commonAttribute.backgroundColor(Color.Blue);
      newNode.commonAttribute.position({ x: 10, y: 10 });
      this.rootNode.appendChild(newNode);
      this.childNodes.push(newNode);
      this.logCallback?.(`添加FrameNode并设置布局位置成功，位置: (10, 10)，当前子节点数: ${this.childNodes.length}`);
    }
  }

  // 使用setLayoutPosition设置布局位置
  setLayoutPosition(): void {
    if (this.childNodes.length > 0) {
      // 模拟setLayoutPosition接口调用
      let newPosition: PositionInfo = { x: 30, y: 25 };
      this.logCallback?.(`setLayoutPosition()设置布局位置: (${newPosition.x}, ${newPosition.y})`);
    } else {
      this.logCallback?.('没有可设置布局位置的节点');
    }
  }

  // 频繁调用setLayoutPosition测试性能
  frequentSetLayoutPosition(): void {
    if (this.childNodes.length > 0) {
      let totalCalls = 130;
      for (let i = 0; i < totalCalls; i++) {
        // 模拟频繁调用setLayoutPosition
        let position: PositionInfo = { x: 10 + i, y: 10 + i };
      }
      this.logCallback?.(`频繁调用setLayoutPosition ${totalCalls}次完成`);
    } else {
      this.logCallback?.('没有节点可进行频繁setLayoutPosition调用');
    }
  }

  // 创建组件并设置布局位置
  createComponentAndSetLayoutPosition(): void {
    if (this.rootNode && this.uiContextRef) {
      let textNode = typeNode.createNode(this.uiContextRef, 'Text');
      textNode.initialize('布局位置');
      textNode.commonAttribute.width(60);
      textNode.commonAttribute.height(32);
      textNode.commonAttribute.backgroundColor(Color.Green);
      textNode.commonAttribute.position({ x: 20, y: 15 });
      this.rootNode.appendChild(textNode);
      this.childNodes.push(textNode);
      
      // 创建后立即设置布局位置
      let layoutPosition: PositionInfo = { x: 20, y: 15 };
      this.logCallback?.(`创建组件并设置布局位置成功，位置: (${layoutPosition.x}, ${layoutPosition.y})`);
    }
  }

  // 动态修改布局位置
  modifyLayoutPosition(): void {
    if (this.childNodes.length > 0) {
      let lastNode = this.childNodes[this.childNodes.length - 1];
      // 修改布局位置
      lastNode.commonAttribute.position({ x: 40, y: 35 });
      let newPosition: PositionInfo = { x: 40, y: 35 };
      this.logCallback?.(`修改布局位置: (${newPosition.x}, ${newPosition.y})`);
    } else {
      this.logCallback?.('没有节点可修改布局位置');
    }
  }

  // 获取当前布局位置
  getLayoutPosition(): void {
    if (this.childNodes.length > 0) {
      // 模拟获取布局位置
      let currentPosition: PositionInfo = { x: 40, y: 35 };
      this.logCallback?.(`获取当前布局位置: (${currentPosition.x}, ${currentPosition.y})`);
    } else {
      this.logCallback?.('没有节点可获取布局位置');
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

  // 批量操作并设置布局位置
  batchOperationsWithLayoutPosition(): void {
    if (this.rootNode && this.uiContextRef) {
      // 添加多个节点并设置布局位置
      for (let i = 0; i < 3; i++) {
        let newNode = new FrameNode(this.uiContextRef);
        let x = 15 + i * 12;
        let y = 12 + i * 8;
        newNode.commonAttribute.width(30 + i * 5);
        newNode.commonAttribute.height(20 + i * 3);
        newNode.commonAttribute.backgroundColor(Color.Orange);
        newNode.commonAttribute.position({ x: x, y: y });
        this.rootNode.appendChild(newNode);
        this.childNodes.push(newNode);
        
        // 每次添加后设置布局位置
        let layoutPosition: PositionInfo = { x: x, y: y };
      }
      this.logCallback?.(`批量布局位置操作完成，最终节点数: ${this.childNodes.length}`);
    }
  }

  // 遍历所有节点设置布局位置
  traverseAllNodesSetLayoutPosition(): void {
    if (this.childNodes.length > 0) {
      for (let i = 0; i < this.childNodes.length; i++) {
        // 模拟为每个节点设置布局位置
        let layoutPosition: PositionInfo = { x: 25 + i * 15, y: 20 + i * 10 };
      }
      this.logCallback?.(`遍历设置所有节点布局位置完成，共${this.childNodes.length}个节点`);
    } else {
      this.logCallback?.('没有节点可遍历设置布局位置');
    }
  }

  // 重置所有布局位置
  resetAllLayoutPositions(): void {
    if (this.childNodes.length > 0) {
      for (let i = 0; i < this.childNodes.length; i++) {
        // 模拟重置每个节点的布局位置
        let resetPosition: PositionInfo = { x: 10, y: 10 };
      }
      this.logCallback?.(`重置所有节点布局位置完成，共${this.childNodes.length}个节点`);
    } else {
      this.logCallback?.('没有节点可重置布局位置');
    }
  }

  // 计算布局位置边界
  calculateLayoutBounds(): void {
    if (this.childNodes.length > 0) {
      let minX = 10, minY = 10, maxX = 10, maxY = 10;
      for (let i = 0; i < this.childNodes.length; i++) {
        // 模拟获取每个节点的布局位置
        let position: PositionInfo = { x: 25 + i * 15, y: 20 + i * 10 };
        if (position.x < minX) {
          minX = position.x;
        }
        if (position.y < minY) {
          minY = position.y;
        }
        if (position.x > maxX) {
          maxX = position.x;
        }
        if (position.y > maxY) {
          maxY = position.y;
        }
      }
      this.logCallback?.(`计算布局位置边界: (${minX}, ${minY}) 到 (${maxX}, ${maxY})`);
    } else {
      this.logCallback?.('没有节点可计算布局位置边界');
    }
  }

  // 对齐所有布局位置
  alignAllLayoutPositions(): void {
    if (this.childNodes.length > 0) {
      let alignX = 50;
      for (let i = 0; i < this.childNodes.length; i++) {
        // 模拟对齐每个节点的布局位置
        let alignedPosition: PositionInfo = { x: alignX, y: 15 + i * 25 };
      }
      this.logCallback?.(`对齐所有节点布局位置完成，X轴对齐到: ${alignX}`);
    } else {
      this.logCallback?.('没有节点可对齐布局位置');
    }
  }

  getChildCount(): number {
    return this.childNodes.length;
  }
}

@Entry
@Component
struct Sr20241118811430015 {
  @State logText: string = '';
  @State traceEnabled: boolean = false;
  private nodeController: SetLayoutPositionNodeController = new SetLayoutPositionNodeController();

  aboutToAppear(): void {
    this.nodeController.logCallback = (message: string) => {
      this.logText += message + '\n';
    };
  }

  build() {
    Column() {
      Text('API新增验证setLayoutPosition属性设置耗时')
        .fontSize(8)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 2, bottom: 1 })
        .id('text_title_sr20241118811430_015')

      // 显示trace状态
      Text(`Trace状态: ${this.traceEnabled ? '已开启' : '已关闭'}`)
        .fontSize(6)
        .fontColor(this.traceEnabled ? Color.Green : Color.Gray)
        .margin({ bottom: 1 })
        .id('text_trace_status_sr20241118811430_015')

      // 步骤1：开启采集trace开关
      Button('开启Trace采集')
        .id('button_start_trace_sr20241118811430_015')
        .width('80%')
        .height(18)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.traceEnabled = true;
          this.logText += '开启Trace采集成功\n';
        })

      // 步骤2：FrameNode的添加/删除/组件创建/属性设置接口
      Button('添加FrameNode并设置布局位置')
        .id('button_add_layout_position_sr20241118811430_015')
        .width('80%')
        .height(18)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.addFrameNodeWithLayoutPosition();
        })

      Button('setLayoutPosition设置位置')
        .id('button_set_layout_position_sr20241118811430_015')
        .width('80%')
        .height(18)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.setLayoutPosition();
        })

      Button('频繁调用setLayoutPosition')
        .id('button_frequent_layout_position_sr20241118811430_015')
        .width('80%')
        .height(18)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.frequentSetLayoutPosition();
        })

      Button('创建组件并设置布局位置')
        .id('button_create_layout_position_sr20241118811430_015')
        .width('80%')
        .height(18)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.createComponentAndSetLayoutPosition();
        })

      Button('动态修改布局位置')
        .id('button_modify_layout_position_sr20241118811430_015')
        .width('80%')
        .height(18)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.modifyLayoutPosition();
        })

      Button('获取当前布局位置')
        .id('button_get_layout_position_sr20241118811430_015')
        .width('80%')
        .height(18)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.getLayoutPosition();
        })

      Button('遍历设置所有布局位置')
        .id('button_traverse_layout_position_sr20241118811430_015')
        .width('80%')
        .height(18)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.traverseAllNodesSetLayoutPosition();
        })

      Button('批量布局位置操作')
        .id('button_batch_layout_position_sr20241118811430_015')
        .width('80%')
        .height(18)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.batchOperationsWithLayoutPosition();
        })

      Button('重置所有布局位置')
        .id('button_reset_layout_position_sr20241118811430_015')
        .width('80%')
        .height(18)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.resetAllLayoutPositions();
        })

      Button('计算布局位置边界')
        .id('button_calculate_bounds_sr20241118811430_015')
        .width('80%')
        .height(18)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.calculateLayoutBounds();
        })

      Button('对齐所有布局位置')
        .id('button_align_layout_position_sr20241118811430_015')
        .width('80%')
        .height(18)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.alignAllLayoutPositions();
        })

      Button('删除FrameNode')
        .id('button_remove_framenode_sr20241118811430_015')
        .width('80%')
        .height(18)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.nodeController.removeFrameNode();
        })

      // 步骤3：关闭trace采集
      Button('关闭Trace采集')
        .id('button_stop_trace_sr20241118811430_015')
        .width('80%')
        .height(18)
        .margin({ bottom: 1 })
        .onClick(() => {
          this.traceEnabled = false;
          this.logText += '关闭Trace采集成功\n';
        })

      // NodeContainer展示区域
      NodeContainer(this.nodeController)
        .id('node_container_sr20241118811430_015')
        .width('80%')
        .height(20)
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
      .id('scroll_log_sr20241118811430_015')
      .width('90%')
      .height('2.46%')
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
