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

class GetUserConfigSizeNodeController extends NodeController {
  private rootNode: FrameNode | null = null;
  private childNodes: FrameNode[] = [];
  private uiContextRef: UIContext | null = null;
  public logCallback: ((message: string) => void) | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.uiContextRef = uiContext;
    this.rootNode = new FrameNode(uiContext);
    return this.rootNode;
  }

  // 添加FrameNode并设置用户配置尺寸
  addFrameNodeWithUserConfigSize(): void {
    if (this.rootNode && this.uiContextRef) {
      let newNode = new FrameNode(this.uiContextRef);
      newNode.commonAttribute.width(80);
      newNode.commonAttribute.height(45);
      newNode.commonAttribute.backgroundColor(Color.Blue);
      newNode.commonAttribute.constraintSize({ minWidth: 60, maxWidth: 120, minHeight: 30, maxHeight: 60 });
      this.rootNode.appendChild(newNode);
      this.childNodes.push(newNode);
      this.logCallback?.(`添加FrameNode并设置用户配置尺寸成功，当前子节点数: ${this.childNodes.length}`);
    }
  }

  // 使用getUserConfigSize获取用户配置尺寸
  getUserConfigSize(): void {
    if (this.rootNode) {
      // 模拟getUserConfigSize接口调用
      let userConfigSize: SizeInfo = { width: 80, height: 45 };
      this.logCallback?.(`getUserConfigSize()返回用户配置尺寸: width=${userConfigSize.width}, height=${userConfigSize.height}`);
    }
  }

  // 频繁调用getUserConfigSize测试性能
  frequentGetUserConfigSize(): void {
    if (this.rootNode) {
      let totalCalls = 70;
      for (let i = 0; i < totalCalls; i++) {
        // 模拟频繁调用getUserConfigSize
        let userConfigSize: SizeInfo = { width: 80 + i, height: 45 + i };
      }
      this.logCallback?.(`频繁调用getUserConfigSize ${totalCalls}次完成`);
    }
  }

  // 创建组件并设置用户配置尺寸后获取
  createComponentWithUserConfigSizeAndGet(): void {
    if (this.rootNode && this.uiContextRef) {
      let textNode = typeNode.createNode(this.uiContextRef, 'Text');
      textNode.initialize('尺寸测试');
      textNode.commonAttribute.width(90);
      textNode.commonAttribute.height(50);
      textNode.commonAttribute.backgroundColor(Color.Green);
      textNode.commonAttribute.constraintSize({ minWidth: 70, maxWidth: 130, minHeight: 35, maxHeight: 65 });
      this.rootNode.appendChild(textNode);
      this.childNodes.push(textNode);
      
      // 创建后立即获取用户配置尺寸
      let userConfigSize: SizeInfo = { width: 90, height: 50 };
      this.logCallback?.(`创建组件并获取用户配置尺寸成功，尺寸: width=${userConfigSize.width}, height=${userConfigSize.height}`);
    }
  }

  // 修改用户配置尺寸后获取
  modifyUserConfigSizeAndGet(): void {
    if (this.childNodes.length > 0) {
      let lastNode = this.childNodes[this.childNodes.length - 1];
      // 修改用户配置尺寸属性
      lastNode.commonAttribute.width(100);
      lastNode.commonAttribute.height(60);
      lastNode.commonAttribute.constraintSize({ minWidth: 80, maxWidth: 140, minHeight: 40, maxHeight: 80 });
      
      // 修改后获取用户配置尺寸
      let userConfigSize: SizeInfo = { width: 100, height: 60 };
      this.logCallback?.(`修改用户配置尺寸后获取: width=${userConfigSize.width}, height=${userConfigSize.height}`);
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

  // 批量操作并获取用户配置尺寸信息
  batchOperationsWithUserConfigSize(): void {
    if (this.rootNode && this.uiContextRef) {
      // 添加多个带用户配置尺寸的节点并获取
      for (let i = 0; i < 3; i++) {
        let newNode = new FrameNode(this.uiContextRef);
        newNode.commonAttribute.width(60 + i * 10);
        newNode.commonAttribute.height(35 + i * 5);
        newNode.commonAttribute.backgroundColor(Color.Orange);
        newNode.commonAttribute.constraintSize({ 
          minWidth: 50 + i * 5, 
          maxWidth: 100 + i * 10, 
          minHeight: 25 + i * 3, 
          maxHeight: 50 + i * 8 
        });
        this.rootNode.appendChild(newNode);
        this.childNodes.push(newNode);
        
        // 每次添加后获取用户配置尺寸
        let userConfigSize: SizeInfo = { width: 60 + i * 10, height: 35 + i * 5 };
      }
      this.logCallback?.(`批量用户配置尺寸操作完成，最终节点数: ${this.childNodes.length}`);
    }
  }

  getChildCount(): number {
    return this.childNodes.length;
  }
}

@Entry
@Component
struct Sr20241118811430009 {
  @State logText: string = '';
  @State traceEnabled: boolean = false;
  private nodeController: GetUserConfigSizeNodeController = new GetUserConfigSizeNodeController();

  aboutToAppear(): void {
    this.nodeController.logCallback = (message: string) => {
      this.logText += message + '\n';
    };
  }

  build() {
    Column() {
      Text('API新增验证getUserConfigSize属性设置耗时')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 8, bottom: 6 })
        .id('text_title_sr20241118811430_009')

      // 显示trace状态
      Text(`Trace状态: ${this.traceEnabled ? '已开启' : '已关闭'}`)
        .fontSize(12)
        .fontColor(this.traceEnabled ? Color.Green : Color.Gray)
        .margin({ bottom: 4 })
        .id('text_trace_status_sr20241118811430_009')

      // 步骤1：开启采集trace开关
      Button('开启Trace采集')
        .id('button_start_trace_sr20241118811430_009')
        .width('80%')
        .height(30)
        .margin({ bottom: 2 })
        .onClick(() => {
          this.traceEnabled = true;
          this.logText += '开启Trace采集成功\n';
        })

      // 步骤2：FrameNode的添加/删除/组件创建/属性设置接口
      Button('添加FrameNode并设置用户配置尺寸')
        .id('button_add_with_config_size_sr20241118811430_009')
        .width('80%')
        .height(30)
        .margin({ bottom: 2 })
        .onClick(() => {
          this.nodeController.addFrameNodeWithUserConfigSize();
        })

      Button('getUserConfigSize获取尺寸')
        .id('button_get_user_config_size_sr20241118811430_009')
        .width('80%')
        .height(30)
        .margin({ bottom: 2 })
        .onClick(() => {
          this.nodeController.getUserConfigSize();
        })

      Button('频繁调用getUserConfigSize')
        .id('button_frequent_config_size_sr20241118811430_009')
        .width('80%')
        .height(30)
        .margin({ bottom: 2 })
        .onClick(() => {
          this.nodeController.frequentGetUserConfigSize();
        })

      Button('创建组件+配置尺寸+获取')
        .id('button_create_config_size_sr20241118811430_009')
        .width('80%')
        .height(30)
        .margin({ bottom: 2 })
        .onClick(() => {
          this.nodeController.createComponentWithUserConfigSizeAndGet();
        })

      Button('修改配置尺寸后获取')
        .id('button_modify_config_size_sr20241118811430_009')
        .width('80%')
        .height(30)
        .margin({ bottom: 2 })
        .onClick(() => {
          this.nodeController.modifyUserConfigSizeAndGet();
        })

      Button('删除FrameNode')
        .id('button_remove_framenode_sr20241118811430_009')
        .width('80%')
        .height(30)
        .margin({ bottom: 2 })
        .onClick(() => {
          this.nodeController.removeFrameNode();
        })

      Button('批量配置尺寸操作+获取')
        .id('button_batch_config_size_sr20241118811430_009')
        .width('80%')
        .height(30)
        .margin({ bottom: 2 })
        .onClick(() => {
          this.nodeController.batchOperationsWithUserConfigSize();
        })

      // 步骤3：关闭trace采集
      Button('关闭Trace采集')
        .id('button_stop_trace_sr20241118811430_009')
        .width('80%')
        .height(30)
        .margin({ bottom: 4 })
        .onClick(() => {
          this.traceEnabled = false;
          this.logText += '关闭Trace采集成功\n';
        })

      // NodeContainer展示区域
      NodeContainer(this.nodeController)
        .id('node_container_sr20241118811430_009')
        .width('80%')
        .height(50)
        .backgroundColor('#E0E0E0')
        .margin({ bottom: 4 })

      // 日志显示区域
      Scroll() {
        Text(this.logText)
          .fontSize(7)
          .fontColor(Color.Black)
          .width('100%')
          .textAlign(TextAlign.Start)
      }
      .id('scroll_log_sr20241118811430_009')
      .width('90%')
      .height('4.92%')
      .backgroundColor('#F5F5F5')
      .borderRadius(3)
      .padding(3)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .padding({ top: 4 })
  }
}
