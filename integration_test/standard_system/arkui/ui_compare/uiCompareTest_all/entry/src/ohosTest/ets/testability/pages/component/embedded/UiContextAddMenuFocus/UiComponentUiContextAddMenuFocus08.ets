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

import { pointer } from '@kit.InputKit';

@Entry
@Component
struct UiComponentUiContextAddMenuFocus08 {
  @State submitValue: string = '';
  @State text: string = '';
  public readonly NUM_TEXT_MAXSIZE_LENGTH = 13;
  @State teleNumberNoSpace: string = '';
  @State nextCaret: number = -1;
  @State actualCh: number = -1;
  @State lastCaretPosition: number = 0;
  @State lastCaretPositionEnd: number = 0;
  controller: TextInputController = new TextInputController();

  isEmpty(str?: string): boolean {
    return str == 'undefined' || !str || !new RegExp('[^\\s]').test(str);
  }

  checkNeedNumberSpace(numText: string) {
    let isSpace: RegExp = new RegExp('[\\+;,#\\*]', 'g');
    let isRule: RegExp = new RegExp('^\\+.*');

    if (isSpace.test(numText)) {
      if (isRule.test(numText)) {
        return true;
      } else {
        return false;
      }
    }
    return true;
  }

  removeSpace(str: string): string {
    if (this.isEmpty(str)) {
      return '';
    }
    return str.replace(new RegExp('[\\s]', 'g'), '');
  }

  setCaret() {
    if (this.nextCaret != -1) {
      console.log('to keep caret position right, change caret to', this.nextCaret);
      this.controller.caretPosition(this.nextCaret);
      this.nextCaret = -1;
    }
  }
  calcCaretPosition(nextText: string) {
    let befNumberNoSpace: string = this.removeSpace(this.text);
    this.actualCh = 0;
    if (befNumberNoSpace.length < this.teleNumberNoSpace.length) {
      for (let i = 0; i < this.lastCaretPosition; i++) {
        if (this.text[i] != ' ') {
          this.actualCh += 1;
        }
      }
      this.actualCh += this.teleNumberNoSpace.length - befNumberNoSpace.length;
      console.log('actualCh: ' + this.actualCh);
      for (let i = 0; i < nextText.length; i++) {
        if (nextText[i] != ' ') {
          this.actualCh -= 1;
          if (this.actualCh <= 0) {
            this.nextCaret = i + 1;
            break;
          }
        }
      }
    } else if (befNumberNoSpace.length > this.teleNumberNoSpace.length) {
      if (this.lastCaretPosition === this.text.length) {
        console.log('Caret at last, no need to change');
      } else if (this.lastCaretPosition === this.lastCaretPositionEnd) {
        for (let i = this.lastCaretPosition; i < this.text.length; i++) {
          if (this.text[i] != ' ') {
            this.actualCh += 1;
          }
        }
        for (let i = nextText.length - 1; i >= 0; i--) {
          if (nextText[i] != ' ') {
            this.actualCh -= 1;
            if (this.actualCh <= 0) {
              this.nextCaret = i;
              break;
            }
          }
        }
      } else {
        this.nextCaret = this.lastCaretPosition;
      }
    }
  }

  build() {
    Column() {
      Row() {
        TextInput({ text: `${this.text}`, controller: this.controller }).type(InputType.PhoneNumber).height('48vp')
          .onChange((number: string) => {
            this.teleNumberNoSpace = this.removeSpace(number);
            let nextText: string = '';
            if (this.teleNumberNoSpace.length > this.NUM_TEXT_MAXSIZE_LENGTH - 2) {
              nextText = this.teleNumberNoSpace;
            } else if (this.checkNeedNumberSpace(number)) {
              if (this.teleNumberNoSpace.length <= 3) {
                nextText = this.teleNumberNoSpace;
              } else {
                let split1: string = this.teleNumberNoSpace.substring(0, 3);
                let split2: string = this.teleNumberNoSpace.substring(3);
                nextText = split1 + ' ' + split2;
                if (this.teleNumberNoSpace.length > 7) {
                  split2 = this.teleNumberNoSpace.substring(3, 7);
                  let split3: string = this.teleNumberNoSpace.substring(7);
                  nextText = split1 + ' ' + split2 + ' ' + split3;
                }
              }
            } else {
              nextText = number;
            }
            console.log('onChange Triggered:' + this.text + '|' + nextText + '|' + number);
            if (this.text === nextText && nextText === number) {
              this.setCaret();
            } else {
              this.calcCaretPosition(nextText);
            }
            this.text = nextText;
          })
          .onTextSelectionChange((selectionStart, selectionEnd) => {
            console.log('selection change: ', selectionStart, selectionEnd);
            this.lastCaretPosition = selectionStart;
            this.lastCaretPositionEnd = selectionEnd;
          })
      }
    }
    .width('100%')
    .height('100%')
  }
}