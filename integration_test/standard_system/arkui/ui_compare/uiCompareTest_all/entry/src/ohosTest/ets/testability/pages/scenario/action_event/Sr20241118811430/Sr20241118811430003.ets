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

class GetChildNodeController extends NodeController {
  private rootNode: FrameNode | null = null;
  private childNodes: FrameNode[] = [];
  private uiContextRef: UIContext | null = null;
  public logCallback: ((message: string) => void) | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.uiContextRef = uiContext;
    this.rootNode = new FrameNode(uiContext);
    return this.rootNode;
  }

  // 添加多个FrameNode用于getChild测试
  addMultipleFrameNodes(): void {
    if (this.rootNode && this.uiContextRef) {
      for (let i = 0; i < 5; i++) {
        let newNode = new FrameNode(this.uiContextRef);
        newNode.commonAttribute.width(60);
        newNode.commonAttribute.height(40);
        newNode.commonAttribute.backgroundColor(Color.Orange);
        newNode.commonAttribute.margin(3);
        this.rootNode.appendChild(newNode);
        this.childNodes.push(newNode);
      }
      this.logCallback?.(`添加5个FrameNode成功，当前子节点数: ${this.childNodes.length}`);
    }
  }

  // 使用getChild获取子节点
  getChildByIndex(index: number): void {
    if (this.rootNode) {
      let child = this.rootNode.getChild(index);
      if (child) {
        this.logCallback?.(`getChild(${index})成功，获取到子节点`);
      } else {
        this.logCallback?.(`getChild(${index})返回null，索引超出范围`);
      }
    }
  }

  // 遍历所有子节点
  traverseAllChildren(): void {
    if (this.rootNode) {
      let count = 0;
      for (let i = 0; i < this.childNodes.length; i++) {
        let child = this.rootNode.getChild(i);
        if (child) {
          count++;
        }
      }
      this.logCallback?.(`遍历完成，通过getChild获取到${count}个子节点`);
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

  // 创建组件并添加
  createAndAddComponent(): void {
    if (this.rootNode && this.uiContextRef) {
      let textNode = typeNode.createNode(this.uiContextRef, 'Text');
      textNode.initialize('测试文本');
      textNode.commonAttribute.width(80);
      textNode.commonAttribute.height(40);
      textNode.commonAttribute.backgroundColor(Color.Blue);
      textNode.commonAttribute.margin(3);
      this.rootNode.appendChild(textNode);
      this.childNodes.push(textNode);
      this.logCallback?.(`创建组件并添加成功，当前子节点数: ${this.childNodes.length}`);
    }
  }

  getChildCount(): number {
    return this.childNodes.length;
  }
}

@Entry
@Component
struct Sr20241118811430003 {
  @State logText: string = '';
  @State traceEnabled: boolean = false;
  private nodeController: GetChildNodeController = new GetChildNodeController();

  aboutToAppear(): void {
    this.nodeController.logCallback = (message: string) => {
      this.logText += message + '\n';
    };
  }

  build() {
    Column() {
      Text('API新增验证getChild属性设置耗时')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .id('text_title_sr20241118811430_003')

      // 显示trace状态
      Text(`Trace状态: ${this.traceEnabled ? '已开启' : '已关闭'}`)
        .fontSize(16)
        .fontColor(this.traceEnabled ? Color.Green : Color.Gray)
        .margin({ bottom: 15 })
        .id('text_trace_status_sr20241118811430_003')

      // 步骤1：开启采集trace开关
      Button('开启Trace采集')
        .id('button_start_trace_sr20241118811430_003')
        .width('80%')
        .height(50)
        .margin({ bottom: 10 })
        .onClick(() => {
          this.traceEnabled = true;
          this.logText += '开启Trace采集成功\n';
        })

      // 步骤2：FrameNode的添加/删除/组件创建/属性设置接口
      Button('添加多个FrameNode')
        .id('button_add_multiple_sr20241118811430_003')
        .width('80%')
        .height(50)
        .margin({ bottom: 10 })
        .onClick(() => {
          this.nodeController.addMultipleFrameNodes();
        })

      Button('getChild获取子节点(0)')
        .id('button_get_child_sr20241118811430_003')
        .width('80%')
        .height(50)
        .margin({ bottom: 10 })
        .onClick(() => {
          this.nodeController.getChildByIndex(0);
        })

      Button('遍历所有子节点')
        .id('button_traverse_children_sr20241118811430_003')
        .width('80%')
        .height(50)
        .margin({ bottom: 10 })
        .onClick(() => {
          this.nodeController.traverseAllChildren();
        })

      Button('创建组件并添加')
        .id('button_create_component_sr20241118811430_003')
        .width('80%')
        .height(50)
        .margin({ bottom: 10 })
        .onClick(() => {
          this.nodeController.createAndAddComponent();
        })

      Button('删除FrameNode')
        .id('button_remove_framenode_sr20241118811430_003')
        .width('80%')
        .height(50)
        .margin({ bottom: 10 })
        .onClick(() => {
          this.nodeController.removeFrameNode();
        })

      // 步骤3：关闭trace采集
      Button('关闭Trace采集')
        .id('button_stop_trace_sr20241118811430_003')
        .width('80%')
        .height(50)
        .margin({ bottom: 15 })
        .onClick(() => {
          this.traceEnabled = false;
          this.logText += '关闭Trace采集成功\n';
        })

      // NodeContainer展示区域
      NodeContainer(this.nodeController)
        .id('node_container_sr20241118811430_003')
        .width('80%')
        .height(120)
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
      .id('scroll_log_sr20241118811430_003')
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

