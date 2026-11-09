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
struct UiComponentOnWillChange13 {
  textAreaController: TextAreaController = new TextAreaController();
  @State onCopy: string = '';
  @State text: string = '';
  @State result : number =0
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
  @State deleteOffset: number = 0;
  @State deleteDirection: number = 0;
  @State deleteValue: string = '';
  @State onchange:string='';
  build() {
    Column() {
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
        .onWillDelete((info: DeleteValue) => {
          this.deleteValue = info.deleteValue;
          info.direction;
          console.log('onWillDelete');
          this.result+=1;
          return true;
        })
        .onDidDelete((info: DeleteValue) => {
          this.deleteOffset = info.deleteOffset;
          this.deleteDirection = info.direction;
          this.result+=1;
          console.log('onDidDelete');
        })
        .id('UiComponentOnWillChange13')
      Text('The number of deletions is: '+this.result).height(30)
      Row(){
        Button('delete text')
          .onClick(()=>{
            this.textAreaController.deleteText({start: -1});
          })
      } .height('8.2%')
      .width('13.89%')
    }
    .height('100%')
    .width('100%')
    .padding({ left: 35, right: 35, top: 35 })
  }
}