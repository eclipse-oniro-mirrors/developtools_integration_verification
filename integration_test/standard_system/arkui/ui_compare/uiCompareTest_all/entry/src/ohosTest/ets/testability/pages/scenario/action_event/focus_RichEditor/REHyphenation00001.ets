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
struct Hyphenation00001 {
  controller: RichEditorController = new RichEditorController()
  build() {
    Column() {
      RichEditor({ controller: this.controller })
        .key('ParagraphSet')
        .placeholder('Input words here')
        .onReady(() => {
          this.controller.addTextSpan('This is a long paragraph of english words to test the congratulation of the paragraphStyle, see if the paragraph breaks as set.', {
            style: {
              fontColor: Color.Pink
            },
            paragraphStyle: {
              wordBreak:WordBreak.HYPHENATION
            }
          })
        })
        .align(Alignment.TopStart)
        .height(100)
        .borderWidth(1)
        .width('100%')
    }
  }
}