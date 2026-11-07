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

@Entry
@Component
struct UiComponentOnWillChange10 {
  textAreaController: TextAreaController = new TextAreaController();
  @State onCopy: string = '';
  @State text: string = 'abc';
  @State onchange:string='';
  @State onwillchange:string='';
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
        .style(TextContentStyle.DEFAULT)
        .onChange((value: string) => {
          this.onchange = value;
        })
        .onWillChange((newValue: EditableTextChangeValue) => {
          this.onwillchange = newValue.content;
          this.onwillchange02=newValue.options
          return true;
        })
      Row(){
        Button('add text')
          .margin({ left: 20 })
          .onClick(() => {
            this.textAreaController.addText('添加文本');
          })
          .id('UiComponentOnWillChange10')
      }
      Text('textarea onWillChange content is:' +this.onwillchange+'\n'
        +'textarea onWillChange options is:' +JSON.stringify(this.onwillchange02)+'\n'
        +' textarea onChange is:'+this.onchange)
        .fontSize(12).margin(10).key('copy')
    }
    .height('100%')
    .width('100%')
    .padding({ left: 35, right: 35, top: 35 })
  }
}