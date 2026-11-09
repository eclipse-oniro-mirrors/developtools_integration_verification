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
import { uiAppearance } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
@Entry
@Component
struct UiComponentInputFontsTzeScale04 {
  textAreaController: TextAreaController = new TextAreaController();
  textinputController: TextInputController = new TextInputController();
  searchController: TextInputController = new SearchController();
  @State onCopy: string = '';
  @State text: string = '123456789';
  @State fontscale : number = 0.85;
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.Start }) {
      TextInput({ text: this.text, placeholder: 'input your word...', controller: this.textinputController })
        .placeholderColor(Color.Grey)
        .placeholderFont({ size: 14, weight: 400 })
        .caretColor(Color.Blue)
        .width('95%')
        .height(40)
        .margin(20)
        .style(TextContentStyle.INLINE)
        .fontSize(14)
        .fontColor(Color.Black)
        .maxLength(9)
        .type(InputType.Password)
        .showCounter(true)
        .minFontScale(1)
        .maxFontScale(3.2)
      Button('set fontscale').onClick(()=>{
        try {
          uiAppearance.setFontScale(this.fontscale).then(() => {
            console.info('Set fontScale successfully.');
          }).catch((error:Error) => {
            console.error('Set fontScale failed, ' + error.message);
          });
        } catch (error) {
          let message = (error as BusinessError).message;
          console.error('Set fontScale failed, ' + message);
        }
        this.fontscale+=0.15;
      })
        .id('UiComponentInputFontsTzeScale04')
    }
    .height('100%')
    .width('100%')
    .padding({ left: 35, right: 35, top: 35 })
  }
}