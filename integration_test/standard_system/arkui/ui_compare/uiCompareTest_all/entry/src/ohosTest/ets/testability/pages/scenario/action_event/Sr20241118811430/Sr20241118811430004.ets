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

class InsertChildAfterNodeController extends NodeController {
  private rootNode: FrameNode | null = null;
  private childNodes: FrameNode[] = [];
  private uiContextRef: UIContext | null = null;
  public logCallback: ((message: string) => void) | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.uiContextRef = uiContext;
    this.rootNode = new FrameNode(uiContext);
    return this.rootNode;
  }

  // 添加初始FrameNode
  addInitialFrameNode(): void {
    if (this.rootNode && this.uiContextRef) {
      let newNode = new FrameNode(this.uiContextRef);
      newNode.commonAttribute.width(80);
      newNode.commonAttribute.height(40);
      newNode.commonAttribute.backgroundColor(Color.Blue);
      newNode.commonAttribute.margin(3);
      this.rootNode.appendChild(newNode);
      this.childNodes.push(newNode);
      this.logCallback?.(`添加初始FrameNode成功，当前子节点数: ${this.childNodes.length}`);
    }
  }

  // 使用insertChildAfter在指定节点后插入
  insertChildAfterFirst(): void {
    if (this.rootNode && this.uiContextRef && this.childNodes.length > 0) {
      let newNode = new FrameNode(this.uiContextRef);
      newNode.commonAttribute.width(80);
      newNode.commonAttribute.height(40);
      newNode.commonAttribute.backgroundColor(Color.Orange);
      newNode.commonAttribute.margin(3);
      // 在第一个子节点后插入
      let firstChild = this.childNodes[0];
      this.rootNode.insertChildAfter(newNode, firstChild);
      this.childNodes.splice(1, 0, newNode);
      this.logCallback?.(`insertChildAfter在第一个节点后插入成功，当前子节点数: ${this.childNodes.length}`);
    }
  }

  // 批量使用insertChildAfter插入多个节点
  batchInsertChildAfter(): void {
    if (this.rootNode && this.uiContextRef && this.childNodes.length > 0) {
      let lastChild = this.childNodes[this.childNodes.length - 1];
      for (let i = 0; i < 3; i++) {
        let newNode = new FrameNode(this.uiContextRef);
        newNode.commonAttribute.width(50);
        newNode.commonAttribute.height(30);
        newNode.commonAttribute.backgroundColor(Color.Pink);
        newNode.commonAttribute.margin(2);
        this.rootNode.insertChildAfter(newNode, lastChild);
        this.childNodes.push(newNode);
        lastChild = newNode;
      }
      this.logCallback?.(`批量insertChildAfter成功，当前子节点数: ${this.childNodes.length}`);
    }
  }

  // 创建组件并使用insertChildAfter插入
  createAndInsertComponent(): void {
    if (this.rootNode && this.uiContextRef && this.childNodes.length > 0) {
      let textNode = typeNode.createNode(this.uiContextRef, 'Text');
      textNode.initialize('插入文本');
      textNode.commonAttribute.width(80);
      textNode.commonAttribute.height(40);
      textNode.commonAttribute.backgroundColor(Color.Green);
      textNode.commonAttribute.margin(3);
      // 在最后一个节点后插入
      let lastChild = this.childNodes[this.childNodes.length - 1];
      this.rootNode.insertChildAfter(textNode, lastChild);
      this.childNodes.push(textNode);
      this.logCallback?.(`创建组件并insertChildAfter成功，当前子节点数: ${this.childNodes.length}`);
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

  getChildCount(): number {
    return this.childNodes.length;
  }
}

@Entry
@Component
struct Sr20241118811430004 {
  @State logText: string = '';
  @State traceEnabled: boolean = false;
  private nodeController: InsertChildAfterNodeController = new InsertChildAfterNodeController();

  aboutToAppear(): void {
    this.nodeController.logCallback = (message: string) => {
      this.logText += message + '\n';
    };
  }

  build() {
    Column() {
      Text('API新增验证insertChildAfter属性设置耗时')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 15 })
        .id('text_title_sr20241118811430_004')

      // 显示trace状态
      Text(`Trace状态: ${this.traceEnabled ? '已开启' : '已关闭'}`)
        .fontSize(16)
        .fontColor(this.traceEnabled ? Color.Green : Color.Gray)
        .margin({ bottom: 10 })
        .id('text_trace_status_sr20241118811430_004')

      // 步骤1：开启采集trace开关
      Button('开启Trace采集')
        .id('button_start_trace_sr20241118811430_004')
        .width('80%')
        .height(45)
        .margin({ bottom: 8 })
        .onClick(() => {
          this.traceEnabled = true;
          this.logText += '开启Trace采集成功\n';
        })

      // 步骤2：FrameNode的添加/删除/组件创建/属性设置接口
      Button('添加初始FrameNode')
        .id('button_add_initial_sr20241118811430_004')
        .width('80%')
        .height(45)
        .margin({ bottom: 8 })
        .onClick(() => {
          this.nodeController.addInitialFrameNode();
        })

      Button('insertChildAfter插入节点')
        .id('button_insert_after_sr20241118811430_004')
        .width('80%')
        .height(45)
        .margin({ bottom: 8 })
        .onClick(() => {
          this.nodeController.insertChildAfterFirst();
        })

      Button('批量insertChildAfter')
        .id('button_batch_insert_sr20241118811430_004')
        .width('80%')
        .height(45)
        .margin({ bottom: 8 })
        .onClick(() => {
          this.nodeController.batchInsertChildAfter();
        })

      Button('创建组件并insertChildAfter')
        .id('button_create_insert_sr20241118811430_004')
        .width('80%')
        .height(45)
        .margin({ bottom: 8 })
        .onClick(() => {
          this.nodeController.createAndInsertComponent();
        })

      Button('删除FrameNode')
        .id('button_remove_framenode_sr20241118811430_004')
        .width('80%')
        .height(45)
        .margin({ bottom: 8 })
        .onClick(() => {
          this.nodeController.removeFrameNode();
        })

      // 步骤3：关闭trace采集
      Button('关闭Trace采集')
        .id('button_stop_trace_sr20241118811430_004')
        .width('80%')
        .height(45)
        .margin({ bottom: 10 })
        .onClick(() => {
          this.traceEnabled = false;
          this.logText += '关闭Trace采集成功\n';
        })

      // NodeContainer展示区域
      NodeContainer(this.nodeController)
        .id('node_container_sr20241118811430_004')
        .width('80%')
        .height(100)
        .backgroundColor('#E0E0E0')
        .margin({ bottom: 10 })

      // 日志显示区域
      Scroll() {
        Text(this.logText)
          .fontSize(12)
          .fontColor(Color.Black)
          .width('100%')
          .textAlign(TextAlign.Start)
      }
      .id('scroll_log_sr20241118811430_004')
      .width('90%')
      .height('8.2%')
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

