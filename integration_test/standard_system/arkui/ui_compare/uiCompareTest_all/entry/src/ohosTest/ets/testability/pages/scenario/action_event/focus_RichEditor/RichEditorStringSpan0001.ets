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
class MyUserDateSpan0001 extends UserDataSpan {
  constructor(name: string, age: number) {
    super();
    this.name = name;
    this.age = age;
  }

  public name: string;
  public age: number;
}

@Entry
@Component
struct RichESS0001 {
  @State fontStyle: FontStyle = FontStyle.Italic;
  styleString: MutableStyledString = new MutableStyledString('hello world', [{
    start: 0,
    length: 11,
    styledKey: StyledStringKey.USER_DATA,
    styledValue: new MyUserDateSpan0001('hello', 21)
  }]);
  controller: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorStyledStringOptions = {
    controller: this.controller
  };
  build() {
    Column() {
      RichEditor(this.options)
        .onReady(() => {
          this.controller.setStyledString(this.styleString);
        })
        .width(300)
        .height(100)
        .backgroundColor('#F9F9F9')
        .border({ width: 1, color: '#DDD' })

      Row() {
        Button('GetStyles调用')
          .id('ReSs0001')
          .onClick(() => {
            console.log('GetStyles调用日志' + JSON.stringify(this.styleString.getStyles(0,this.styleString.length)));
          })
      }
      .width('100%')
      .margin({ bottom: 20 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}