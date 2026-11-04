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

// Test of constant folding of boolean-valued expressions.

function one(): int {
  return 1;
}

function main(): void {
  arktest.assertFalse(typeof 0 == 'zero');
  arktest.assertTrue(typeof 0 != 'zero');

  arktest.assertFalse(typeof 0 == 'zero' && typeof 0 == 'zero');
  arktest.assertFalse(typeof 0 == 'zero' && typeof 0 != 'zero');
  arktest.assertFalse(typeof 0 != 'zero' && typeof 0 == 'zero');
  arktest.assertTrue(typeof 0 != 'zero' && typeof 0 != 'zero');

  arktest.assertFalse(typeof 0 == 'zero' || typeof 0 == 'zero');
  arktest.assertTrue(typeof 0 == 'zero' || typeof 0 != 'zero');
  arktest.assertTrue(typeof 0 != 'zero' || typeof 0 == 'zero');
  arktest.assertTrue(typeof 0 != 'zero' || typeof 0 != 'zero');

  arktest.assertFalse(typeof 0 == 'zero' && one() < 0);
  arktest.assertFalse(typeof 0 == 'zero' && one() > 0);
  arktest.assertFalse(typeof 0 != 'zero' && one() < 0);
  arktest.assertTrue(typeof 0 != 'zero' && one() > 0);

  arktest.assertFalse(typeof 0 == 'zero' || one() < 0);
  arktest.assertTrue(typeof 0 == 'zero' || one() > 0);
  arktest.assertTrue(typeof 0 != 'zero' || one() < 0);
  arktest.assertTrue(typeof 0 != 'zero' || one() > 0);

  arktest.assertFalse(one() < 0 && typeof 0 == 'zero');
  arktest.assertFalse(one() < 0 && typeof 0 != 'zero');
  arktest.assertFalse(one() > 0 && typeof 0 == 'zero');
  arktest.assertTrue(one() > 0 && typeof 0 != 'zero');

  arktest.assertFalse(one() < 0 || typeof 0 == 'zero');
  arktest.assertTrue(one() < 0 || typeof 0 != 'zero');
  arktest.assertTrue(one() > 0 || typeof 0 == 'zero');
  arktest.assertTrue(one() > 0 || typeof 0 != 'zero');
}
