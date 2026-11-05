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

const expectedItemsCount: int = 10000;
const itemSize: int = 5;
const heap: ArrayBuffer = new ArrayBuffer(expectedItemsCount * itemSize * 8);
const storage: Float64Array[] = [];

function main(): void {
  for (let i: int = 0; i < expectedItemsCount; i++) {
    storage.push(new Float64Array(heap, 0, itemSize));
  }
}
