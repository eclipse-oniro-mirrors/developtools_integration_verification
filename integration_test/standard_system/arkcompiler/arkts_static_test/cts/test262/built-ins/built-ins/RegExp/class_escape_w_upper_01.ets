/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
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
// arktsid: class_escape_w_upper_01
// description: CharacterClassEscape :: W matches all characters not in w set (non-word characters)

function main(): void {
    let nonW: string = '\f\n\r\t\v~`!@#$%^&*()-+={[}]|\\:;\'<,>./? ' + '"';
    let regexpW: RegExp = new RegExp('\\W', 'g');
    let k: number = 0;
    while (regexpW.exec(nonW) !== null) {
        k++;
    }
    arktest.assertEQ(nonW.length, k);

    let nonW2: string = '_0123456789_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    let rW: RegExp = new RegExp('\\W');
    let m: RegExpExecArray | null = rW.exec(nonW2);
    arktest.assertEQ(m, null);
}