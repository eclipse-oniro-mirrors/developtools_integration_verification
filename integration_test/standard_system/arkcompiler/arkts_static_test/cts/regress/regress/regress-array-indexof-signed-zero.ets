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

interface SmallAllocation {
  i: int;
}

interface LargeAllocation {
  i: int;
  a: int;
}

function main(): void {
  const objects: Object[] = [];

  for (let i: int = 0; i < 100; i++) {
    for (let x: int = 0; x < i; x++) {
      if (i % 2 == 0) {
        const small: SmallAllocation = { i: 35 };
        objects.push(small);
      } else {
        const large: LargeAllocation = { i: 35, a: 42 };
        objects.push(large);
      }
    }

    const values: number[] = [];
    objects.push(values);
    for (let j: int = 0; j < 100; j++) {
      values.push(1.5);
    }

    values[20] = -0.0;
    values[23] = 0.0;

    arktest.assertEQ(20, values.indexOf(0.0));
  }
}
