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

class MyCheckboxStyle implements ContentModifier<CheckBoxConfiguration> {
  selectedColor: Color = Color.White;

  constructor(selectedColor: Color) {
    this.selectedColor = selectedColor;
  }

  applyContent(): WrappedBuilder<[CheckBoxConfiguration]> {
    return wrapBuilder(buildCheckbox);
  }
}

@Builder
function buildCheckbox(config: CheckBoxConfiguration) {
  Column({ space: 10 }) {
    Text(config.name + (config.selected ? '（ 选中 ）' : '（ 非选中 ）')).margin({ right: 70, top: 50 })
    Text(config.enabled ? 'enabled true' : 'enabled false').margin({ right: 110 })
    Shape() {
      Path()
        .width(100)
        .height(100)
        .commands('M50 0 L0 50 L25 100 L75 100 L100 50 Z')
        .fillOpacity(0)
        .strokeWidth(3)
        .onClick(() => {
          if (config.selected) {
            config.triggerChange(false);
          } else {
            config.triggerChange(true);
          }
        })
        .opacity(config.enabled ? 1 : 0.1)
      Path()
        .width(10)
        .height(10)
        .commands('M50 0 L100 100 L0 100 Z')
        .visibility(config.selected ? Visibility.Visible : Visibility.Hidden)
        .fill(config.selected ? (config.contentModifier as MyCheckboxStyle).selectedColor : Color.Black)
        .stroke((config.contentModifier as MyCheckboxStyle).selectedColor)
        .margin({ left: 10, top: 10 })
        .opacity(config.enabled ? 1 : 0.1)
    }
    .width(300)
    .height(200)
    .viewPort({
      x: 0,
      y: 0,
      width: 310,
      height: 310
    })
    .strokeLineJoin(LineJoinStyle.Miter)
    .strokeMiterLimit(5)
    .margin({ left: 50 })
  }
}

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
      .select(undefined)
      .mark({
        strokeColor:Color.Black,
        size: 50,
        strokeWidth: 5
      })
      .contentModifier(new MyCheckboxStyle(Color.Red))
      .unselectedColor(Color.Red)
      .width(30)
      .height(30)
      .selectedColor(0xed6f21)
      .shape(CheckBoxShape.CIRCLE)
      .onChange((value: boolean) => {
        console.info('Checkbox1 change is' + value);
      })
      .id('UiComponentFormInteractionFrameNode99_01')
    col.appendChild(text);
    return node;
  }
}

@Entry
@Component
struct UiComponentFormInteractionFrameNode99 {
  private myNodeController: MyNodeController = new MyNodeController();
  @State text :string = 'FrameNode create'
  @State text2 :string = 'ArkTs create'
  @State rating: number = 2;
  @State stars: number = 5;
  @State checkboxEnabled: boolean = true;

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
          .select(undefined)
          .contentModifier(new MyCheckboxStyle(Color.Red))
          .unselectedColor(Color.Red)
          .mark({
            strokeColor:Color.Black,
            size: 50,
            strokeWidth: 5
          })
          .width(30)
          .height(30)
          .selectedColor(0xed6f21)
          .shape(CheckBoxShape.CIRCLE)
          .onChange((value: boolean) => {
            console.info('Checkbox1 change is' + value);
          })
          .id('UiComponentFormInteractionFrameNode99_02')
        Text('set contentModifier selected of the Checkbox to Color.RED')
          .fontSize(15)
          .width('90%')
          .fontColor(Color.Red)
          .border({ width: 1 })
          .lineHeight(20)
          .margin(60)
          .padding(10)
          .maxLines(2)
          .fontStyle(FontStyle.Italic)
          .height(100)
      }
    }
    .width('100%')
  }
}
