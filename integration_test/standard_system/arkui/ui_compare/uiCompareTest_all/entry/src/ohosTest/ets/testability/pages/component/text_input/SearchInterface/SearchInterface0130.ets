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
import { Font } from '@kit.ArkUI';

@Entry
@Component
struct SearchInterface0130 {

  controller: SearchController = new SearchController();
  @State Alignment:TextAlign = TextAlign.Start
  @State trans:boolean = false

  build() {
    Column({ space: 3 }) {
      Search({ placeholder: '这是提示文本',value:'这是测试文本', controller: this.controller })
        .searchButton('SEARCH')
        .width('70%')
        .height(40)
        .stopBackPress(true)
        .textAlign(this.Alignment)
        .caretStyle({ width: 3, color: Color.Green })
        .selectedBackgroundColor(Color.Gray)
        .defaultFocus(true)
        .enableKeyboardOnFocus(true)
        .enablePreviewText(true)
        .enableHapticFeedback(true)
        .textFont({size:20,family: 'Arial',style:FontStyle.Italic })
        .cancelButton({})
    }
    .width('100%')
    .height('100%')
  }
}
