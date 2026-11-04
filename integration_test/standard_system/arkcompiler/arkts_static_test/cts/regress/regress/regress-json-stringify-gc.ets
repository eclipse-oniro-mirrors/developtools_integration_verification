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
  const values: string[] = [];
  let newSpaceString = 'a';
  for (let i: int = 0; i < 8; i++) {
    newSpaceString += newSpaceString;
  }
  for (let i: int = 0; i < 10000; i++) {
    values.push(newSpaceString);
  }

  const json1 = JSON.stringify(values);
  const json2 = JSON.stringify(values);
  arktest.assertEQ(json1, json2);

  for (let i: int = 0; i < 10000; i++) {
    const value = i.toString();
    arktest.assertEQ('"' + value + '"', JSON.stringify(value, null, 0));
  }

  for (let i: int = 0; i < 10000; i++) {
    const value = i.toString() + '\u2603';
    arktest.assertEQ('"' + value + '"', JSON.stringify(value, null, 0));
  }
}
