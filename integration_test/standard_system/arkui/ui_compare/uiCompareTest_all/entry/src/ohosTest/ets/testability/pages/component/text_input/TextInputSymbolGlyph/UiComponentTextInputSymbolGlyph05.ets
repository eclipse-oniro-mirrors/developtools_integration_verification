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
struct UiComponentTextInputSymbolGlyph05 {
  textAreaController: TextAreaController = new TextAreaController();
  textinputController: TextInputController = new TextInputController();
  searchController: SearchController = new SearchController();
  @State startIndex: number = 0
  @State endIndex: number = 0
  @State text: string = '';
  @State text2: string = 'Dynamically change the system Font size';
  @State changeValue: string = ''
  @State submitValue: string = ''
  @State fontweight : number =100
  @State fontscale : number = 1;

  build() {
    Column({ space: 3 }) {
      Text(this.text2)
        .fontSize(10)
        .fontColor(0xCCCCCC)
        .width('90%')
        .border({ width: 1 })
        .lineHeight(20)
        .margin(30)
        .padding(10)
      TextInput({ text: this.text, controller: this.textinputController })
        .width('95%')
        .height(100)
        .cancelButton({
          style: CancelButtonStyle.CONSTANT,
          icon: {
            size: 45,
            src: $r('app.media.app_icon'),
            color: Color.Blue
          }
        })
        .defaultFocus(true)
        .minFontScale(1)
        .maxFontScale(3.2)
        .fontSize(10)
        .fontColor(Color.Blue)
        .fontWeight(this.fontweight)
        .enableKeyboardOnFocus(true)
        .style(TextInputStyle.Inline)
        .type(InputType.Password)
        .onTextSelectionChange((selectionStart: number, selectionEnd: number) => {
          this.startIndex = selectionStart
          this.endIndex = selectionEnd
        })
        .id('UiComponentTextInputSymbolGlyph05_01')
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
        .id('UiComponentTextInputSymbolGlyph05_02')
    }
    .width('100%')
    .height('100%')
  }
}