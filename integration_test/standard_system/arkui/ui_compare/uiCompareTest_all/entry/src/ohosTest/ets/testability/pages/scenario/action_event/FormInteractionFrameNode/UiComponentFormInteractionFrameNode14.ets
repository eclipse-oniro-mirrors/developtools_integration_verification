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
      .height(50)
      .borderColor(Color.Gray)
      .margin({ left: 10 });
    let col = typeNode.createNode(uiContext, 'Column');
    col.initialize({ space: 0 })
      .width('100%')
      .height('100%')
    node.appendChild(col);
    let text = typeNode.createNode(uiContext, 'Select');
    const selectOptions: SelectOption[] = [
      { value: '选项1' },
      { value: '选项2' },
      { value: '选项3' }
    ];
    text.initialize(selectOptions)
      .value('Content Select')
      .selected(1)
      .font({ size: 8, weight: 500 })
      .fontColor(Color.Blue)
      .optionBgColor(Color.Brown)
      .selectedOptionFont({ size: 16, weight: 400,style:FontStyle.Italic })
      .optionFont({ size: 20, weight: FontWeight.Bolder })
      .space(15)
      .optionFontColor(Color.Red)
      .selectedOptionBgColor(Color.Green)
      .selectedOptionFontColor(Color.Pink)
      .arrowPosition(ArrowPosition.END)
      .menuAlign(MenuAlignType.START, { dx: 0, dy: 0 })
      .width(200)
      .divider({ strokeWidth: '10px',
        color: Color.Orange })
      .id('UiComponentFormInteractionFrameNode14_01')
    col.appendChild(text);
    return node;
  }
}

@Entry
@Component
struct UiComponentFormInteractionFrameNode14 {
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
        Select([{ value: '选项1' },
          { value: '选项2' },
          { value: '选项3' }])
          .value('Content Select')
          .selected(1)
          .font({ size: 8, weight: 500 })
          .fontColor(Color.Blue)
          .optionBgColor(Color.Brown)
          .optionFontColor(Color.Red)
          .selectedOptionFont({ size: 16, weight: 400 })
          .optionFont({ size: 20, weight: FontWeight.Bolder })
          .space(15)
          .selectedOptionFont({ size: 16, weight: 400,style:FontStyle.Italic })
          .selectedOptionFontColor(Color.Pink)
          .selectedOptionBgColor(Color.Green)
          .arrowPosition(ArrowPosition .END)
          .menuAlign(MenuAlignType.START, { dx: 0, dy: 0 })
          .width(200)
          .divider({ strokeWidth: '10px',
            color: Color.Orange })
          .id('UiComponentFormInteractionFrameNode14_02')
        Text('set Select optionFontColor to Color.Brown')
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