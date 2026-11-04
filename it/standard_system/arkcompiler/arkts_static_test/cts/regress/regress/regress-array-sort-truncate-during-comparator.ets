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
  const magic0: int = 2396;
  const magic1: int = 1972;

  const xs: (double[] | undefined)[] = [];
  for (let j: int = 0; j < magic0; ++j) {
    xs.push([j + 0.1]);
  }

  let cmpCalls: int = 0;
  xs.sort((lhs: double[] | undefined, rhs: double[] | undefined): int => {
    const left: double[] = lhs === undefined ? [0.0] : lhs;
    const right: double[] = rhs === undefined ? [0.0] : rhs;
    if (cmpCalls++ == magic1) {
      xs.length = 1;
    }
    const difference: double = left[0] - right[0];
    if (difference < 0.0) {
      return -1;
    }
    if (difference > 0.0) {
      return 1;
    }
    return 0;
  });
}
