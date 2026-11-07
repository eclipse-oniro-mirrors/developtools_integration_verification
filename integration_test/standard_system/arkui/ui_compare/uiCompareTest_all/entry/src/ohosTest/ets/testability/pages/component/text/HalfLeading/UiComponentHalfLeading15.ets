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

class MySearchAttribute1 implements AttributeModifier<SearchAttribute> {
  public isDark: boolean = false;

  applyNormalAttribute(instance: SearchAttribute): void {
    instance.halfLeading(true)
  }
}

class MyTextInputAttribute implements AttributeModifier<TextInputAttribute> {
  public isDark: boolean = false;

  applyNormalAttribute(instance: TextInputAttribute): void {
    instance.halfLeading(true)
  }
}

class MyTextAreaAttribute implements AttributeModifier<TextAreaAttribute> {
  public isDark: boolean = false;

  applyNormalAttribute(instance: TextAreaAttribute): void {
    instance.halfLeading(true)
  }
}

@Entry
@Component
struct UiComponentHalfLeading15 {
  textAreaController: TextAreaController = new TextAreaController();
  textinputController: TextInputController = new TextInputController();
  searchController: SearchController = new SearchController();
  @State onCopy: string = '';
  @State text: string = 'hello world12345';
  @State fontSize:number=16
  @State textareatype:TextAreaType=TextAreaType.NORMAL
  @State inputtype:InputType=InputType.Normal
  @State searchtype:SearchType=SearchType.NORMAL
  @State modifier1: MySearchAttribute1 = new MySearchAttribute1();
  @State modifier2: MyTextInputAttribute = new MyTextInputAttribute();
  @State modifier3: MyTextAreaAttribute = new MyTextAreaAttribute();
  build() {
    Column() {
      TextArea({
        text: this.text,
        placeholder: '',
        controller: this.textAreaController
      })
        .placeholderFont({ size: 16, weight: 400 })
        .width(336)
        .height(120)
        .margin(20)
        .border({ width: 1 })
        .fontSize(this.fontSize)
        .lineHeight(40)
        .halfLeading(true)
        .type(this.textareatype)
        .fontColor('#182431')
        .backgroundColor('#FFFFFF')
        .onChange((value: string) => {
          this.text = value;
        })
        .attributeModifier(this.modifier3)
      TextInput({ text: this.text, placeholder: '', controller: this.textinputController })
        .placeholderColor(Color.Grey)
        .placeholderFont({ size: 14, weight: 400 })
        .caretColor(Color.Blue)
        .width('95%')
        .height(120)
        .lineHeight(50)
        .margin(20)
        .fontSize(this.fontSize)
        .type(this.inputtype)
        .halfLeading(true)
        .fontColor(Color.Black)
        .attributeModifier(this.modifier2)
      Search({ value: this.text, placeholder: '', controller: this.searchController })
        .searchButton('SEARCH')
        .width('95%')
        .height(120)
        .backgroundColor('#F5F5F5')
        .lineHeight(50)
        .halfLeading(true)
        .enableKeyboardOnFocus(false)
        .type(this.searchtype)
        .attributeModifier(this.modifier1)
        .placeholderColor(Color.Grey)
        .placeholderFont({ size: 14, weight: 400 })
        .textFont({ size: this.fontSize, weight: 400 })
        .margin(20)
    }
    .height('100%')
    .width('100%')
    .padding({ left: 35, right: 35, top: 35 })
  }
}