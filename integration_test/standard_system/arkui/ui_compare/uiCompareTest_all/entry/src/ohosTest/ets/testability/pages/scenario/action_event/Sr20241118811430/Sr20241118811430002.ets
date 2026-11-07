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

class AppendChildNodeController extends NodeController {
  private rootNode: FrameNode | null = null;
  private childNodes: FrameNode[] = [];
  private uiContextRef: UIContext | null = null;
  public logCallback: ((message: string) => void) | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.uiContextRef = uiContext;
    this.rootNode = new FrameNode(uiContext);
    return this.rootNode;
  }

  // 使用appendChild添加FrameNode
  appendChildFrameNode(): void {
    if (this.rootNode && this.uiContextRef) {
      let newNode = new FrameNode(this.uiContextRef);
      // 设置节点属性
      newNode.commonAttribute.width(80);
      newNode.commonAttribute.height(40);
      newNode.commonAttribute.backgroundColor(Color.Orange);
      newNode.commonAttribute.margin(5);
      this.rootNode.appendChild(newNode);
      this.childNodes.push(newNode);
      this.logCallback?.(`appendChild添加FrameNode成功，当前子节点数: ${this.childNodes.length}`);
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

  // 创建组件并使用appendChild添加
  createAndAppendComponent(): void {
    if (this.rootNode && this.uiContextRef) {
      // 创建Column组件节点
      let columnNode = typeNode.createNode(this.uiContextRef, 'Column');
      columnNode.commonAttribute.width(100);
      columnNode.commonAttribute.height(60);
      columnNode.commonAttribute.backgroundColor(Color.Blue);
      columnNode.commonAttribute.borderRadius(8);
      columnNode.commonAttribute.margin(5);
      // 使用appendChild添加到根节点
      this.rootNode.appendChild(columnNode);
      this.childNodes.push(columnNode);
      this.logCallback?.(`创建组件并appendChild成功，当前子节点数: ${this.childNodes.length}`);
    }
  }

  // 批量appendChild添加多个节点
  batchAppendChild(): void {
    if (this.rootNode && this.uiContextRef) {
      for (let i = 0; i < 3; i++) {
        let newNode = new FrameNode(this.uiContextRef);
        newNode.commonAttribute.width(50);
        newNode.commonAttribute.height(30);
        newNode.commonAttribute.backgroundColor(Color.Pink);
        newNode.commonAttribute.margin(3);
        this.rootNode.appendChild(newNode);
        this.childNodes.push(newNode);
      }
      this.logCallback?.(`批量appendChild成功，当前子节点数: ${this.childNodes.length}`);
    }
  }

  getChildCount(): number {
    return this.childNodes.length;
  }
}

@Entry
@Component
struct Sr20241118811430002 {
  @State logText: string = '';
  @State traceEnabled: boolean = false;
  private nodeController: AppendChildNodeController = new AppendChildNodeController();

  aboutToAppear(): void {
    this.nodeController.logCallback = (message: string) => {
      this.logText += message + '\n';
    };
  }

  build() {
    Column() {
      Text('API新增验证appendChild属性设置耗时')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .id('text_title_sr20241118811430_002')

      // 显示trace状态
      Text(`Trace状态: ${this.traceEnabled ? '已开启' : '已关闭'}`)
        .fontSize(16)
        .fontColor(this.traceEnabled ? Color.Green : Color.Gray)
        .margin({ bottom: 15 })
        .id('text_trace_status_sr20241118811430_002')

      // 步骤1：开启采集trace开关
      Button('开启Trace采集')
        .id('button_start_trace_sr20241118811430_002')
        .width('80%')
        .height(50)
        .margin({ bottom: 10 })
        .onClick(() => {
          this.traceEnabled = true;
          this.logText += '开启Trace采集成功\n';
        })

      // 步骤2：FrameNode的添加/删除/组件创建/属性设置接口
      Button('appendChild添加FrameNode')
        .id('button_append_child_sr20241118811430_002')
        .width('80%')
        .height(50)
        .margin({ bottom: 10 })
        .onClick(() => {
          this.nodeController.appendChildFrameNode();
        })

      Button('创建组件并appendChild')
        .id('button_create_append_sr20241118811430_002')
        .width('80%')
        .height(50)
        .margin({ bottom: 10 })
        .onClick(() => {
          this.nodeController.createAndAppendComponent();
        })

      Button('批量appendChild')
        .id('button_batch_append_sr20241118811430_002')
        .width('80%')
        .height(50)
        .margin({ bottom: 10 })
        .onClick(() => {
          this.nodeController.batchAppendChild();
        })

      Button('删除FrameNode')
        .id('button_remove_framenode_sr20241118811430_002')
        .width('80%')
        .height(50)
        .margin({ bottom: 10 })
        .onClick(() => {
          this.nodeController.removeFrameNode();
        })

      // 步骤3：关闭trace采集
      Button('关闭Trace采集')
        .id('button_stop_trace_sr20241118811430_002')
        .width('80%')
        .height(50)
        .margin({ bottom: 15 })
        .onClick(() => {
          this.traceEnabled = false;
          this.logText += '关闭Trace采集成功\n';
        })

      // NodeContainer展示区域
      NodeContainer(this.nodeController)
        .id('node_container_sr20241118811430_002')
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
      .id('scroll_log_sr20241118811430_002')
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

