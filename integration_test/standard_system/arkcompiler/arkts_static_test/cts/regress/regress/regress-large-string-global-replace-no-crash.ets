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

//
// The test passes if it does not crash.

function main(): void {
  let length: int = 2048;
  let s: string = '';
  for (let i: int = 0; i < 2048; i++) {
    s += '.';
  }

  let stringValue: string = s + 'x' + s + 'x' + s;
  stringValue.replace(new RegExp('x', 'g'), '');
}
