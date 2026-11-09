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
import { NodeController, FrameNode, typeNode, } from '@kit.ArkUI';


class MyNodeController0028 extends NodeController {
  makeNode(uiContext: UIContext): FrameNode{
    let node = new FrameNode(uiContext);
    let TextTimer = typeNode.createNode(uiContext, 'TextTimer');
    TextTimer.initialize({
      isCountDown: true, count: 30000
    }).fontStyle(FontStyle.Italic).fontColor(Color.Gray).fontSize(50).textShadow( [{ radius: 10, color: Color.Red, offsetX: 10, offsetY: 0 },{ radius: 10, color: Color.Black, offsetX: 20, offsetY: 0 },
      { radius: 10, color: Color.Brown, offsetX: 30, offsetY: 0 },{ radius: 10, color: Color.Green, offsetX: 40, offsetY: 0 },
      { radius: 10, color: Color.Yellow, offsetX: 100, offsetY: 0 }])
    node.appendChild(TextTimer)
    return node;
  }
}

@Entry
@Component
struct MediaFrameNode0028 {
  private myNodeController: MyNodeController0028 = new MyNodeController0028();
  build() {
    Column() {
      NodeContainer(this.myNodeController);
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5');
  }

}