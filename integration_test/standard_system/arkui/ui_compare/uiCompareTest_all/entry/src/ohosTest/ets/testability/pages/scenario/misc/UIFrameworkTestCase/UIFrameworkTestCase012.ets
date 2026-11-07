/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { window } from '@kit.ArkUI';
import { common } from '@kit.AbilityKit';
import { UIContext } from '@ohos.arkui.UIContext';
import { NodeController, BuilderNode, FrameNode } from '@ohos.arkui.node';

declare class Params {
  text: string
}

@Builder
function buttonBuilder(params: Params) {
  Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
    Text(params.text)
      .fontSize(12)
    Button(`onTouch`, { type: ButtonType.Normal, stateEffect: true })
      .fontSize(12)
      .borderRadius(8)
      .backgroundColor(0x317aff)
      .id('onTouch')
      .align(Alignment.Center)
      .onTouch((event: TouchEvent) => {
        console.info('ouTouch event: ',JSON.stringify(event.touches));
        console.info('ouTouch event: ',JSON.stringify(event))
      })
  }
  .align(Alignment.Center)
  .height(100)
  .width(200)
}

class MyNodeController extends NodeController {
  private rootNode: BuilderNode<[Params]> | null = null;
  private wrapBuilder: WrappedBuilder<[Params]> = wrapBuilder(buttonBuilder);

  makeNode(uiContext: UIContext): FrameNode | null {
    if (this.rootNode === null) {
      this.rootNode = new BuilderNode(uiContext);
      this.rootNode.build(this.wrapBuilder, { text: 'This is a Text' })
    }
    return this.rootNode.getFrameNode();
  }
}


@Entry
@Component
struct Index {
  private baseNode: MyNodeController = new MyNodeController()
  @State isFullScreen:boolean = false

  // 横竖屏切换
  horVerSwitch(){
    let context = getContext(this) as common.UIAbilityContext;
    // 使用getLastWindow获取当前窗口
    window.getLastWindow(context).then((lastWindow)=>{
      // 使用setPreferredOrientation实现横竖屏切换
      lastWindow.setPreferredOrientation(this.isFullScreen ? window.Orientation.PORTRAIT : window.Orientation.LANDSCAPE)
      this.isFullScreen = !this.isFullScreen
    })
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text('This is a NodeContainer contains a text and a button ')
        .fontSize(15)
        .fontColor(0xCCCCCC)
      NodeContainer(this.baseNode)
        .borderWidth(1)
        .onClick(() => {
          console.log('click event');
          this.horVerSwitch()
        })
        .id('NodeContainer')
        .width('80%')
        .height('80%')
    }
    .height('100%')
    .width('100%')
    .align(Alignment.Center)
  }
}