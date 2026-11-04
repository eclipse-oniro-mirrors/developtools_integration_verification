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

interface GetterHolder {
  get(): void;
}

function main(): void {
  for (let iteration: int = 0; iteration < 5000; iteration++) {
    const values: undefined[] = [];
    try {
      values.reduce((
        _previousValue: undefined,
        _currentValue: undefined,
        _index: int,
        _array: Array<undefined>
      ): undefined => undefined);
    } catch (_error) {
    }
  }

  const holder: GetterHolder = {
    get(): void {
    }
  };
}
