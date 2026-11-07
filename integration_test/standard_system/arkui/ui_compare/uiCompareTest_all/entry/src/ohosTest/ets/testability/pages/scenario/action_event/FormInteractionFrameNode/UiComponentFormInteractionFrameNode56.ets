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
    node.commonAttribute.width(100)
      .height(100)
      .borderColor(Color.Gray)
      .margin({ left: 10 });
    let col = typeNode.createNode(uiContext, 'Column');
    col.initialize({ space: 0 })
      .width('100%')
      .height('100%')
    node.appendChild(col);
    let checkboxoption :CheckboxOptions ={ name: 'checkbox1', group: 'checkboxGroup' }
    let text = typeNode.createNode(uiContext, 'Checkbox');
    text.initialize(checkboxoption)
      .select(false)
      .mark({
        strokeColor:Color.Black,
        size: 50,
        strokeWidth: 5
      })
      .unselectedColor(Color.Red)
      .width(30)
      .height(30)
      .selectedColor(null)
      .shape(CheckBoxShape.CIRCLE)
      .onChange((value: boolean) => {
        console.info('Checkbox1 change is' + value);
      })
      .id('UiComponentFormInteractionFrameNode56_01')
    col.appendChild(text);
    return node;
  }
}

@Entry
@Component
struct UiComponentFormInteractionFrameNode56 {
  private myNodeController: MyNodeController = new MyNodeController();
  @State text :string = 'FrameNode create'
  @State text2 :string = 'ArkTs create'
  @State rating: number = 2;
  @State stars: number = 5;

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
        Checkbox({ name: 'checkbox1', group: 'checkboxGroup' })
          .select(false)
          .unselectedColor(Color.Red)
          .mark({
            strokeColor:Color.Black,
            size: 50,
            strokeWidth: 5
          })
          .width(30)
          .height(30)
          .selectedColor(null)
          .shape(CheckBoxShape.CIRCLE)
          .onChange((value: boolean) => {
            console.info('Checkbox1 change is' + value);
          })
          .id('UiComponentFormInteractionFrameNode56_02')
        Text('set the selectedColor of the Checkbox component to null')
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
