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

const STEPS: int = 100000;
const undefinedValues: (string | undefined)[] = [undefined, 'go on'];
const nullValues: (string | null)[] = [null, 'go on'];

function getUndefinedObject(i: int): string | undefined {
  return undefinedValues[(i / STEPS) | 0];
}

function testUndefined(): int {
  let objects: int = 0;
  for (let i: int = 0; i < 2 * STEPS; i++) {
    if (undefined == getUndefinedObject(i)) {
      objects++;
    }
  }
  return objects;
}

function getNullObject(i: int): string | null {
  return nullValues[(i / STEPS) | 0];
}

function testNull(): int {
  let objects: int = 0;
  for (let i: int = 0; i < 2 * STEPS; i++) {
    if (null == getNullObject(i)) {
      objects++;
    }
  }
  return objects;
}

function main(): void {
  arktest.assertEQ(STEPS, testUndefined());
  arktest.assertEQ(STEPS, testNull());
}
