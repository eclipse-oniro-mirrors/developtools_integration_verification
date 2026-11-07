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

class PerformanceNodeController extends NodeController {
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
      this.rootNode.appendChild(newNode);
      this.childNodes.push(newNode);
      this.logCallback?.(`添加FrameNode成功，当前子节点数: ${this.childNodes.length}`);
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

  // 创建组件并设置属性
  createComponentWithAttributes(): void {
    if (this.rootNode && this.uiContextRef) {
      // 创建Text组件节点
      let textNode = typeNode.createNode(this.uiContextRef, 'Text');
      textNode.initialize('性能测试文本');
      // 设置commonAttribute属性
      textNode.commonAttribute.width(100);
      textNode.commonAttribute.height(50);
      textNode.commonAttribute.backgroundColor(Color.Blue);
      textNode.commonAttribute.opacity(0.8);
      textNode.commonAttribute.borderRadius(8);
      textNode.commonAttribute.margin({ top: 5, bottom: 5 });
      textNode.commonAttribute.padding(10);
      this.rootNode.appendChild(textNode);
      this.childNodes.push(textNode);
      this.logCallback?.(`创建组件并设置属性成功，当前子节点数: ${this.childNodes.length}`);
    }
  }

  // 修改属性设置
  modifyAttributes(): void {
    if (this.childNodes.length > 0) {
      let lastNode = this.childNodes[this.childNodes.length - 1];
      // 修改commonAttribute属性
      lastNode.commonAttribute.width(150);
      lastNode.commonAttribute.height(80);
      lastNode.commonAttribute.backgroundColor(Color.Green);
      lastNode.commonAttribute.opacity(1.0);
      lastNode.commonAttribute.borderRadius(16);
      this.logCallback?.('修改属性设置成功');
    }
  }

  getChildCount(): number {
    return this.childNodes.length;
  }
}

@Entry
@Component
struct Sr20241118811430001 {
  @State logText: string = '';
  @State traceEnabled: boolean = false;
  private nodeController: PerformanceNodeController = new PerformanceNodeController();

  aboutToAppear(): void {
    this.nodeController.logCallback = (message: string) => {
      this.logText += message + '\n';
    };
  }

  build() {
    Column() {
      Text('API新增验证commonAttribute属性设置耗时')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .id('text_title_sr20241118811430_001')

      // 显示trace状态
      Text(`Trace状态: ${this.traceEnabled ? '已开启' : '已关闭'}`)
        .fontSize(16)
        .fontColor(this.traceEnabled ? Color.Green : Color.Gray)
        .margin({ bottom: 15 })
        .id('text_trace_status_sr20241118811430_001')

      // 步骤1：开启采集trace开关
      Button('开启Trace采集')
        .id('button_start_trace_sr20241118811430_001')
        .width('80%')
        .height(50)
        .margin({ bottom: 10 })
        .onClick(() => {
          this.traceEnabled = true;
          this.logText += '开启Trace采集成功\n';
        })

      // 步骤2：FrameNode的添加/删除/组件创建/属性设置接口
      Button('添加FrameNode')
        .id('button_add_framenode_sr20241118811430_001')
        .width('80%')
        .height(50)
        .margin({ bottom: 10 })
        .onClick(() => {
          this.nodeController.addFrameNode();
        })

      Button('删除FrameNode')
        .id('button_remove_framenode_sr20241118811430_001')
        .width('80%')
        .height(50)
        .margin({ bottom: 10 })
        .onClick(() => {
          this.nodeController.removeFrameNode();
        })

      Button('创建组件并设置属性')
        .id('button_create_component_sr20241118811430_001')
        .width('80%')
        .height(50)
        .margin({ bottom: 10 })
        .onClick(() => {
          this.nodeController.createComponentWithAttributes();
        })

      Button('修改属性设置')
        .id('button_modify_attributes_sr20241118811430_001')
        .width('80%')
        .height(50)
        .margin({ bottom: 10 })
        .onClick(() => {
          this.nodeController.modifyAttributes();
        })

      // 步骤3：关闭trace采集
      Button('关闭Trace采集')
        .id('button_stop_trace_sr20241118811430_001')
        .width('80%')
        .height(50)
        .margin({ bottom: 15 })
        .onClick(() => {
          this.traceEnabled = false;
          this.logText += '关闭Trace采集成功\n';
        })

      // NodeContainer展示区域
      NodeContainer(this.nodeController)
        .id('node_container_sr20241118811430_001')
        .width('80%')
        .height(150)
        .backgroundColor('#E0E0E0')
        .margin({ bottom: 15 })

      // 日志显示区域
      Scroll() {
        Text(this.logText)
          .fontSize(12)
          .fontColor(Color.Black)
          .width('100%')
          .textAlign(TextAlign.Start)
      }
      .id('scroll_log_sr20241118811430_001')
      .width('90%')
      .height('9.84%')
      .backgroundColor('#F5F5F5')
      .borderRadius(8)
      .padding(10)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .padding({ top: 10 })
  }
}
