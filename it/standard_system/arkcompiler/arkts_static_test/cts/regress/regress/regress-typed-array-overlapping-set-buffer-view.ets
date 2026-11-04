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

function fooReference(n: int): Int32Array {
  const array = new Int32Array(n + 1);
  for (let i: int = 0; i < n; i++) {
    array[i] = i;
  }
  const array2 = new Int32Array(array);
  array2.set(new Uint8Array(array.buffer, 0, n), 1);
  return array2;
}

function foo(n: int): Int32Array {
  const array = new Int32Array(n + 1);
  for (let i: int = 0; i < n; i++) {
    array[i] = i;
  }
  array.set(new Uint8Array(array.buffer, 0, n), 1);
  return array;
}

function barReference(n: int): Int32Array {
  const array = new Int32Array(n + 1);
  for (let i: int = 0; i < n; i++) {
    array[i] = i;
  }
  const array2 = new Int32Array(array);
  array2.set(new Uint8Array(array.buffer, 34), 0);
  return array2;
}

function bar(n: int): Int32Array {
  const array = new Int32Array(n + 1);
  for (let i: int = 0; i < n; i++) {
    array[i] = i;
  }
  array.set(new Uint8Array(array.buffer, 34), 0);
  return array;
}

function main(): void {
  foo(10);
  fooReference(10);
  bar(10);
  barReference(10);
}
