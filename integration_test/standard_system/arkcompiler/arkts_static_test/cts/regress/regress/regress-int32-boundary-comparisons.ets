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

function checkPair(greater: double, lesser: double): void {
  arktest.assertFalse(greater < lesser);
  arktest.assertFalse(greater <= lesser);
  arktest.assertFalse(greater == lesser);
  arktest.assertTrue(greater >= lesser);
  arktest.assertTrue(greater > lesser);

  arktest.assertTrue(lesser < greater);
  arktest.assertTrue(lesser <= greater);
  arktest.assertFalse(lesser == greater);
  arktest.assertFalse(lesser >= greater);
  arktest.assertFalse(lesser > greater);

  arktest.assertFalse(greater < greater);
  arktest.assertTrue(greater <= greater);
  arktest.assertTrue(greater == greater);
  arktest.assertTrue(greater >= greater);
  arktest.assertFalse(greater > greater);

  arktest.assertFalse(lesser < lesser);
  arktest.assertTrue(lesser <= lesser);
  arktest.assertTrue(lesser == lesser);
  arktest.assertTrue(lesser >= lesser);
  arktest.assertFalse(lesser > lesser);
}

function main(): void {
  checkPair(2147483647.0, -2147483648.0);
  checkPair(1073741823.0, -1073741824.0);
}
