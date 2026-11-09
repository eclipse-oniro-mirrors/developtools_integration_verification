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
struct KeyBoard0001 {
  controller: RichEditorController = new RichEditorController()
  controller1: TextInputController = new TextInputController()
  needFocusKey: string = 'RichEditorKeyboardTest'
  @State textFlag: string = 'TextFlag';

  build() {
    Column() {
      RichEditor({ controller: this.controller })
        .key(this.needFocusKey)
        .align(Alignment.TopStart)
        .height(100)
        .borderWidth(1)
        .borderColor(Color.Red)
        .width('100%')
        .onPaste((event?: PasteEvent) => {
        })
      Button('点我获取焦点')
        .id('ReKb0001')
        .onClick((event: ClickEvent) => {
        focusControl.requestFocus(this.needFocusKey)
      })
        .width('100%')
        .height('100%')
        .padding(15)
    }
  }
}