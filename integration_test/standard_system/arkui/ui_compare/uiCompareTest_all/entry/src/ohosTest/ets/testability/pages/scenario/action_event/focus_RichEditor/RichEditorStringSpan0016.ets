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
class MyUserDateSpan0016 extends UserDataSpan {
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
struct RichESS0016 {
  @State fontStyle: FontStyle = FontStyle.Italic;

  controller: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorStyledStringOptions = {
    controller: this.controller
  };
  mutableStyledString1: MutableStyledString = new MutableStyledString('属性字符串', [{
    start: 0,
    length: 6,
    styledKey: StyledStringKey.USER_DATA,
    styledValue: new MyUserDateSpan0016('Zhang ',23)
  }]);
  build() {
    Column() {
      RichEditor(this.options)
        .onReady(() => {
          this.controller.setStyledString(this.mutableStyledString1);
        })
        .width(300)
        .height(100)
        .backgroundColor('#F9F9F9')
        .border({ width: 1, color: '#DDD' })

      Row() {
        Button('insertString调用')
          .id('ReSets0016')
          .onClick(() => {
            console.log('GetStyles调用日志' + JSON.stringify(this.mutableStyledString1.getStyles(0,this.mutableStyledString1.length)));
            this.mutableStyledString1.insertString(0,'Damon')
            this.controller.setStyledString(this.mutableStyledString1);
          })

        Button('GetStyles调用')
          .id('ReSs0016')
          .onClick(() => {
            console.log('insertString调用日志' + JSON.stringify(this.mutableStyledString1.getStyles(0,this.mutableStyledString1.length)));
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