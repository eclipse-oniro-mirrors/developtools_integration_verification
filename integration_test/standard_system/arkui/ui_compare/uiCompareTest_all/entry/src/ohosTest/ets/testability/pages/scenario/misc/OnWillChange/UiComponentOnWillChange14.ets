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

class MyTextAreaAttribute implements AttributeModifier<TextAreaAttribute> {
  private onColorChange: (color: Color) => void;
  private onFontSizeChange: (size: number) => void;

  constructor(
    onColorChange: (color: Color) => void,
    onFontSizeChange: (size: number) => void
  ) {
    this.onColorChange = onColorChange;
    this.onFontSizeChange = onFontSizeChange;
  }

  applyNormalAttribute(instance: TextAreaAttribute): void {
    instance
      .onChange((value: string) => {
        this.onColorChange(Color.Red);
        console.log('输入内容变化，触发颜色更新');
      })
      .onWillChange((newValue: EditableTextChangeValue) => {
        this.onFontSizeChange(10);
        console.log('即将输入内容，触发字体大小更新');
        return true;
      });
  }
}

@Entry
@Component
struct UiComponentOnWillChange14 {
  textAreaController: TextAreaController = new TextAreaController();
  @State onCopy: string = '';
  @State text: string = '';
  @State onwillchange:string='';
  @State modifier1: MyTextAreaAttribute = new MyTextAreaAttribute(
    (color) => this.fontColor = color,
    (addSize) => this.fontSize += addSize
  );
  @State fontColor: Color = Color.Black;
  @State fontSize: number = 10;
  @State onwillchange02:TextChangeOptions|undefined={
    rangeBefore: {
      start: 0,
      end: 0
    },
    rangeAfter: {
      start: 0,
      end: 0
    },
    oldContent: 'Hello world',
    oldPreviewText: {
      offset:0,
      value: '测试文本'
    }
  };
  @State deleteOffset: number = 0;
  @State deleteDirection: number = 0;
  @State deleteValue: string = '';
  @State onchange:string='';
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.Start }) {
      TextArea({
        text: this.text,
        placeholder: '',
        controller: this.textAreaController
      })
        .placeholderFont({ size: 16, weight: 400 })
        .width(336)
        .height(50)
        .margin(20)
        .border({ width: 1 })
        .fontSize(16)
        .fontColor('#182431')
        .backgroundColor('#FFFFFF')
        .attributeModifier(this.modifier1)
        .onWillDelete((info: DeleteValue) => {
          this.deleteValue = info.deleteValue;
          info.direction;
          console.log('onWillDelete');
          return true;
        })
        .onDidDelete((info: DeleteValue) => {
          this.deleteOffset = info.deleteOffset;
          this.deleteDirection = info.direction;
          console.log('onDidDelete');
        })
        .id('UiComponentOnWillChange14')
      Text('Verify the callback')
        .fontSize(12)
        .margin(10)
        .fontColor(this.fontColor)
        .fontSize(this.fontSize)
        .key('copy')
    }
    .height('100%')
    .width('100%')
    .padding({ left: 35, right: 35, top: 35 })
  }
}