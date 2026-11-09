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

@Entry
@Component
struct TextFadingEdgeTV0260 {

  controller: SearchController = new SearchController();
  @State text:string = ''
  @State changeValue: string = '';
  @State submitValue: string = '';


  build() {
    Column({ space: 3 }) {
      Search(
        { value: this.text,
        controller: this.controller ,
        placeholder:'请输入…这里是超长文本输入框测试文本'}
      )
        .searchButton('SEARCH')
        .cancelButton({
          style: CancelButtonStyle.CONSTANT,
          icon: {
            src: $r('sys.media.ohos_ic_public_cancel_filled')
          }
        })
        .width('95%')
        .height(40)
        .stopBackPress(true)
        .textAlign(TextAlign.Start)
        .caretStyle({ width: 3, color: Color.Green })
        .selectedBackgroundColor(Color.Gray)
        .defaultFocus(false)
        .enableKeyboardOnFocus(false)
        .enablePreviewText(false)
        .enableHapticFeedback(false)
        .onSubmit((value: string) => {
          this.submitValue = value;
        })
        .onChange((value: string) => {
          this.changeValue = value;
        })
        .margin(20)

        Button('input', { type: ButtonType.Normal, stateEffect: true })
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .width(200)
          .margin(20)
          .id('TextFadingEdgeTV0260_001')
          .onClick(() => {
            this.text = 'Search textAlign sample1,Search textAlign sample1,Search textAlign sample1'
          })
    }
    .width('100%')
    .height('100%')
  }
}
