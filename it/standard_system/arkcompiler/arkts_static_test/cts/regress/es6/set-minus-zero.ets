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
  const set = new Set<Any>();

  const objectKey: Object = {};
  const distinctObject: Object = {};
  const stringKey: Any = 'keykeykey';
  const numberKey: Any = 42.24;
  const booleanKey: Any = true;
  const undefinedKey: Any = undefined;
  const nullKey: Any = null;
  const nanKey: Any = NaN;
  const zeroKey: Any = 0;
  const minusZeroKey: Any = -0;

  arktest.assertEQ(set.size, 0);

  set.add(objectKey);
  set.add(stringKey);
  set.add(numberKey);
  set.add(booleanKey);
  set.add(undefinedKey);
  set.add(nullKey);
  set.add(nanKey);
  set.add(zeroKey);

  arktest.assertEQ(8, set.size);

  arktest.assertTrue(set.has(objectKey));
  arktest.assertTrue(set.has(stringKey));
  arktest.assertTrue(set.has(numberKey));
  arktest.assertTrue(set.has(booleanKey));
  arktest.assertTrue(set.has(undefinedKey));
  arktest.assertTrue(set.has(nullKey));
  arktest.assertTrue(set.has(nanKey));
  arktest.assertTrue(set.has(zeroKey));

  arktest.assertFalse(set.has(distinctObject));
  arktest.assertTrue(set.has('keykeykey'));
  arktest.assertTrue(set.has(42.24));
  arktest.assertTrue(set.has(true));
  arktest.assertTrue(set.has(undefined));
  arktest.assertTrue(set.has(null));
  arktest.assertTrue(set.has(NaN));
  arktest.assertTrue(set.has(0));
  arktest.assertTrue(set.has(-0));
  arktest.assertTrue(set.has(1 / Infinity));
  arktest.assertTrue(set.has(-1 / Infinity));
}
