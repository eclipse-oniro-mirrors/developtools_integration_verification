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
struct UiReverse04 {
  @State text: string = '';
  @State positionInfo: CaretOffset = { index: 0, x: 0, y: 0 };
  @State onFocusTest:string = 'onBlur';
  @State submitValue: string = '';
  @State reverse: boolean | undefined | null = true;
  controllerSearch: SearchController = new SearchController();

  controller: TextInputController = new TextInputController()

  build() {
    Column() {
      Column() {
        TextInput({ text: this.text, placeholder: 'input your word...', controller: this.controller })
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .caretColor(Color.Blue)
          .width('45%')
          .height(40)
          .margin({ right: '3%' })
          .fontSize(14)
          .fontColor(Color.Black)
          .inputFilter('[a-z]', (e) => {
            console.log(JSON.stringify(e))
          })
          .onChange((value: string) => {
            this.text = value
          })
          .onFocus(() => {
            this.onFocusTest = 'onFocus'
          })
          .onBlur(() => {
            this.onFocusTest = 'onBlur'
          })

        Search({ value: this.text, placeholder: 'Type to search...', controller: this.controllerSearch })
          .type(SearchType.URL)
          .searchButton('SEARCH')
          .width('45%')
          .height(40)
          .backgroundColor('#F5F5F5')
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .textFont({ size: 14, weight: 400 })
          .onSubmit((value: string) => {
            this.submitValue = value
          })
          .onChange((value: string) => {
            this.text = value
          })
          .margin(20)
      }.width('100%')
    }
  }
}
