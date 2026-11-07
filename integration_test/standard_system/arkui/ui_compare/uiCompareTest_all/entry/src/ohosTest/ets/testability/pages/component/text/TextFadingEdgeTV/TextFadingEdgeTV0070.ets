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
struct TextFadingEdgeTV0070 {

  controller: SearchController = new SearchController();
  @State Alignment:TextAlign = TextAlign.Start
  @State trans:boolean = false
  @State copyValue: string = '';
  @State cutValue: string = '';

  build() {
    Column({ space: 3 }) {
      Text('copy: ' + this.copyValue)
      Text('cut:' + this.cutValue)
      Search({ value: 'Search textAlign sample1,Search textAlign sample1,Search textAlign sample1', controller: this.controller })
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
        .textAlign(this.Alignment)
        .caretStyle({ width: 3, color: Color.Green })
        .selectedBackgroundColor(Color.Gray)
        .defaultFocus(true)
        .enableKeyboardOnFocus(true)
        .enablePreviewText(true)
        .enableHapticFeedback(true)
        .copyOption(CopyOptions.LocalDevice)
        .onCopy((value: string) => {
          this.copyValue = value;
        })
        .onCut((value: string) => {
          this.cutValue = value;
        })
      Button('Selection apart')
        .borderRadius(8)
        .backgroundColor(0x317aff)
        .width(200)
        .margin(20)
        .id('TextFadingEdgeTV0070_001')
        .onClick(() => {
          this.controller.setTextSelection(-1,50 , { menuPolicy: MenuPolicy.SHOW });
        })
    }
    .width('100%')
    .height('100%')
  }
}
