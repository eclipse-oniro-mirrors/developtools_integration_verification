/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
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
// arktsid: number_issafeinteger_not_integer
// description: Number.isSafeInteger returns false for non-integer values

function main(): void {
    arktest.assertFalse(Number.isSafeInteger(1.1), '1.1');
    arktest.assertFalse(Number.isSafeInteger(0.000001), '0.000001');
    arktest.assertFalse(Number.isSafeInteger(-0.000001), '-0.000001');
    arktest.assertFalse(Number.isSafeInteger(11e-1), '11e-1');
}
