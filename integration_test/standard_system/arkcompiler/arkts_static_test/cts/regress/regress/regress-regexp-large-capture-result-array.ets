/*
 * Copyright (c) 2025 Hunan OpenValley Digital Industry Development Co., Ltd.
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

function main(): void {
  const numCaptures: int = 1000;
  let regexpString: string = '(a)';
  for (let i: int = 0; i < numCaptures - 1; i++) {
    regexpString += '|(b)';
  }
  const regexp: RegExp = new RegExp(regexpString);

  for (let i: int = 0; i < 10; i++) {
    const matches: RegExpExecArray = regexp.exec('a')!;
    let count: int = 0;
    matches.forEach((_value: string | undefined): void => {
      count++;
    });
    arktest.assertEQ(numCaptures + 1, count);
  }
}
