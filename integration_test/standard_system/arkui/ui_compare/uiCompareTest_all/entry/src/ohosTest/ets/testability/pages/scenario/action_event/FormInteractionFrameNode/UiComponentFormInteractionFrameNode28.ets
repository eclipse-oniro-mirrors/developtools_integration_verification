/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { NodeController, FrameNode, typeNode } from '@kit.ArkUI';

class MyNodeController extends NodeController {
  makeNode(uiContext: UIContext): FrameNode | null {
    let node = new FrameNode(uiContext);
    node.commonAttribute
      .width(100)
      .height(200)
      .borderColor(Color.Gray)
      .margin({ left: 10 });
    let col = typeNode.createNode(uiContext, 'Column');
    col.initialize({ space: 0 })
      .width('100%')
      .height('100%')
    node.appendChild(col);
    let toggleOptions: ToggleOptions = {type: ToggleType.Checkbox, isOn: false};
    let toggle = typeNode.createNode(uiContext, 'Toggle',toggleOptions);
    toggle.initialize(toggleOptions)
      .selectedColor(undefined)
      .width('30vp')
      .height('30vp')
      .margin({
        top:'20px',
        right:'20px',
        left:'20px',
        bottom:'20px'
      })
      .onChange((isOn: boolean) => {
        console.info('Component status:' + isOn);
      })
      .id('UiComponentFormInteractionFrameNode28_01')
    col.appendChild(toggle);
    return node;
  }
}

@Entry
@Component
struct UiComponentFormInteractionFrameNode28 {
  private myNodeController: MyNodeController = new MyNodeController();
  @State text :string = 'FrameNode create'
  @State text2 :string = 'ArkTs create'

  build() {
    Column(){
      Column() {
        Text(this.text)
          .fontSize(15)
          .fontColor(0xCCCCCC)
          .width('90%')
          .border({ width: 1 })
          .lineHeight(20)
          .margin(30)
          .padding(10)
          .maxLines(2)
          .fontColor(Color.Black)
          .fontStyle(FontStyle.Italic)
          .height(100)
        NodeContainer(this.myNodeController);
      }
      Column(){
        Text(this.text2)
          .fontSize(15)
          .fontColor(0xCCCCCC)
          .width('90%')
          .border({ width: 1 })
          .lineHeight(20)
          .margin(30)
          .padding(10)
          .maxLines(2)
          .fontColor(Color.Black)
          .fontStyle(FontStyle.Italic)
          .height(100)
        Toggle({ type: ToggleType.Checkbox, isOn: false })
          .selectedColor(undefined)
          .width('30vp')
          .height('30vp')
          .margin({
            top:'20px',
            right:'20px',
            left:'20px',
            bottom:'20px'
          })
          .onChange((isOn: boolean) => {
            console.info('Component status:' + isOn);
          })
          .id('UiComponentFormInteractionFrameNode28_02')
        Text('set Toggle(checkbox) selectedColor to undefined')
          .fontSize(15)
          .width('90%')
          .fontColor(Color.Red)
          .border({ width: 1 })
          .lineHeight(20)
          .margin(30)
          .padding(10)
          .maxLines(2)
          .fontStyle(FontStyle.Italic)
          .height(100)
      }
    }
    .width('100%')
  }
}