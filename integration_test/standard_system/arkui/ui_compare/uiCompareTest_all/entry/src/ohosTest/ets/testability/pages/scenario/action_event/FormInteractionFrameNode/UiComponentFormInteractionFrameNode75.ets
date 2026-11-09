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
    let radio :RadioOptions ={
      value: 'Radio1',
      group: 'radioGroup',
      indicatorType:RadioIndicatorType.DOT,
    }
    let text = typeNode.createNode(uiContext, 'Radio');
    text.initialize(radio)
      .checked(false)
      .radioStyle({
        checkedBackgroundColor: Color.Blue,
        uncheckedBorderColor: Color.Green,
        indicatorColor: Color.White
      })
      .height(50)
      .width(50)
      .onChange((isChecked: boolean) => {
        console.log('Radio1 status is ' + isChecked);
      })
      .id('UiComponentFormInteractionFrameNode75_01')
    col.appendChild(text);
    return node;
  }
}

@Entry
@Component
struct UiComponentFormInteractionFrameNode75 {
  @Builder
  indicatorBuilder() {
    Image('/icon.png')
  }
  private myNodeController: MyNodeController = new MyNodeController();
  @State text :string = 'FrameNode create'
  @State text2 :string = 'ArkTs create'
  @State text3 :string = 'radio set indicatorType to dot'
  @State rating: number = 2;
  @State stars: number = 5;
  @State shape :CheckBoxShape=CheckBoxShape.CIRCLE

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
        Radio({
          value: 'Radio1',
          group: 'radioGroup2',
          indicatorType:RadioIndicatorType.DOT,
        })
          .checked(false)
          .radioStyle({
            checkedBackgroundColor: Color.Blue,
            uncheckedBorderColor: Color.Green,
            indicatorColor: Color.White
          })
          .height(50)
          .width(50)
          .onChange((isChecked: boolean) => {
            console.log('Radio1 status is ' + isChecked);
          })
          .id('UiComponentFormInteractionFrameNode75_02')
        Text(this.text3)
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
