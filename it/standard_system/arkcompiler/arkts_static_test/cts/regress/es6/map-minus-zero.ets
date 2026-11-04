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
  const map = new Map<Any, string>();

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

  arktest.assertEQ(map.size, 0);

  map.set(objectKey, 'aaa');
  map.set(stringKey, 'bbb');
  map.set(numberKey, 'ccc');
  map.set(booleanKey, 'ddd');
  map.set(undefinedKey, 'eee');
  map.set(nullKey, 'fff');
  map.set(nanKey, 'ggg');
  map.set(zeroKey, 'hhh');

  arktest.assertEQ(8, map.size);

  arktest.assertEQ('aaa', map.get(objectKey));
  arktest.assertEQ('bbb', map.get(stringKey));
  arktest.assertEQ('ccc', map.get(numberKey));
  arktest.assertEQ('ddd', map.get(booleanKey));
  arktest.assertEQ('eee', map.get(undefinedKey));
  arktest.assertEQ('fff', map.get(nullKey));
  arktest.assertEQ('ggg', map.get(nanKey));
  arktest.assertEQ('hhh', map.get(zeroKey));

  arktest.assertTrue(map.get(distinctObject) === undefined);
  arktest.assertEQ('bbb', map.get('keykeykey'));
  arktest.assertEQ('ccc', map.get(42.24));
  arktest.assertEQ('ddd', map.get(true));
  arktest.assertEQ('eee', map.get(undefined));
  arktest.assertEQ('fff', map.get(null));
  arktest.assertEQ('ggg', map.get(NaN));
  arktest.assertEQ('hhh', map.get(0));
  arktest.assertEQ('hhh', map.get(-0));
  arktest.assertEQ('hhh', map.get(1 / Infinity));
  arktest.assertEQ('hhh', map.get(-1 / Infinity));
}
