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

// If @@isConcatSpreadable is not used, the value of IsArray(O)
// is used to determine the spreadable property.
class A extends Array<int> {
  constructor(v1: int, v2: int, v3: int) {
    super(v1, v2, v3);
  }
}

function main(): void {
  const obj: int[] = ([] as int[]).concat(
    new A(1, 2, 3), new A(4, 5, 6), new A(7, 8, 9));
  arktest.assertEQ(9, obj.length);
  for (let i: int = 0; i < obj.length; ++i) {
    arktest.assertEQ(i + 1, obj[i]);
  }
}

// TODO(caitp): when concat is called on instances of classes which extend
// Array, they should:
//
// - return an instance of the class, rather than an Array instance (if from
//   same Realm)
// - always treat such classes as concat-spreadable
