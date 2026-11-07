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
    let checkboxGroup = typeNode.createNode(uiContext, 'CheckboxGroup');
    checkboxGroup.initialize({ group: 'checkboxGroup2' })
      .checkboxShape(CheckBoxShape.ROUNDED_SQUARE)
      .selectedColor(0xffff00)
      .onChange((itemName: CheckboxGroupResult) => {
        console.info('checkbox group content' + JSON.stringify(itemName));
      })
      .id('UiComponentFormInteractionFrameNode96_01')
    let checkbox = typeNode.createNode(uiContext, 'Checkbox');
    checkbox.initialize({ name: 'checkbox1', group: 'checkboxGroup2' })
      .selectedColor('#007DFF')
      .shape(CheckBoxShape.ROUNDED_SQUARE)
      .onChange((value: boolean) => {
        console.info('Checkbox1 change is' + value);
      })
    let text1 = typeNode.createNode(uiContext, 'Text');
    text1.initialize('Checkbox1')
      .fontSize(5)
      .lineHeight(10)
      .fontColor('#182431')
      .fontWeight(500)
    let text2 = typeNode.createNode(uiContext, 'Text');
    text2.initialize('Select All')
      .fontSize(5)
      .lineHeight(10)
      .fontColor('#182431')
      .fontWeight(500)
    col.appendChild(checkboxGroup);
    col.appendChild(text2)
    col.appendChild(checkbox)
    col.appendChild(text1)
    return node;
  }
}

@Entry
@Component
struct UiComponentFormInteractionFrameNode96 {
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
        CheckboxGroup({ group: 'checkboxGroup' })
          .checkboxShape(CheckBoxShape.ROUNDED_SQUARE)
          .selectedColor(0xffff00)
          .onChange((itemName: CheckboxGroupResult) => {
            console.info('checkbox group content' + JSON.stringify(itemName));
          })
          .id('UiComponentFormInteractionFrameNode96_02')
        Text('Select All')
          .fontSize(5)
          .lineHeight(10)
          .fontColor('#182431')
          .fontWeight(500)
        Checkbox({ name: 'checkbox1', group: 'checkboxGroup' })
          .selectedColor('#007DFF')
          .shape(CheckBoxShape.ROUNDED_SQUARE)
          .onChange((value: boolean) => {
            console.info('Checkbox1 change is' + value);
          })
        Text('Checkbox1')
          .fontSize(5)
          .lineHeight(10)
          .fontColor('#182431')
          .fontWeight(500)
        Text('set CheckboxGroup selectedColor to #FF00FF')
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