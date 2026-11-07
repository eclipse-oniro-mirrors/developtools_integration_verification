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

import { NodeController, BuilderNode, NodeRenderType, FrameNode } from '@kit.ArkUI'

class MyButtonController extends NodeController {
  makeNode(uiContext: UIContext): FrameNode | null {
    console.log('Cmw myButton onAttach');
    let rootNode = new BuilderNode(uiContext, { surfaceId: '', type: NodeRenderType.RENDER_TYPE_DISPLAY });
    rootNode.build(wrapBuilder<[]>(buttonBuilder));
    return rootNode.getFrameNode();
  }
  aboutToAppear(): void {
    console.log('Cmw cmw_button_上树');
  }
}

class MyImageController extends NodeController {
  makeNode(uiContext: UIContext): FrameNode | null {
    console.log('Cmw myImage onAttach');
    let rootNode = new BuilderNode(uiContext, { surfaceId: '', type: NodeRenderType.RENDER_TYPE_DISPLAY });
    rootNode.build(wrapBuilder<[]>(textBuilder));
    return rootNode.getFrameNode();
  }
  aboutToAppear(): void {
    console.log('Cmw cmw_image_上树');
  }
}

class MyMarqueeController extends NodeController {
  makeNode(uiContext: UIContext): FrameNode | null {
    console.log('Cmw myMarquee onAttach');
    let rootNode = new BuilderNode(uiContext, { surfaceId: '', type: NodeRenderType.RENDER_TYPE_DISPLAY });
    rootNode.build(wrapBuilder<[]>(textBuilder));
    return rootNode.getFrameNode();
  }
  aboutToAppear(): void {
    console.log('Cmw cmw_marquee_上树');
  }
}

class Array1ButtonController extends NodeController {
  makeNode(uiContext: UIContext): FrameNode | null {
    console.log('Cmw array1_Button onAttach');
    let rootNode = new BuilderNode(uiContext, { surfaceId: '', type: NodeRenderType.RENDER_TYPE_DISPLAY });
    rootNode.build(wrapBuilder<[]>(buttonBuilder));
    return rootNode.getFrameNode();
  }
  aboutToAppear(): void {
    console.log('Cmw 数组中的组件上树');
  }
}

@Builder
function buttonBuilder() {
  Button('Button')
    .width(150)
    .height(40)
}

@Builder
function textBuilder() {
  Text('Text')
    .width(150)
    .height(40)
}

@Entry
@Component
struct NodecontrollerLifeCycle0010 {
  @State showNodes: boolean = false;
  private myButtonController: MyButtonController = new MyButtonController();
  private myImageController: MyImageController = new MyImageController();
  private myMarqueeController: MyMarqueeController = new MyMarqueeController();
  private array1ButtonController: Array1ButtonController = new Array1ButtonController();

  build() {
    Column({ space: 20 }) {
      Text('生命周期测试 - 0010')
        .fontSize(20)
        .margin({ top: 20 })

      Button('触发上树')
        .id('trigger_button_lifecycle_0010')
        .onClick(() => { this.showNodes = true; })

      if (this.showNodes) {
        Column({ space: 10 }) {
          NodeContainer(this.myButtonController).width(150).height(50)
          NodeContainer(this.myImageController).width(150).height(50)
          NodeContainer(this.myMarqueeController).width(150).height(50)
          NodeContainer(this.array1ButtonController).width(150).height(50)
        }
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
