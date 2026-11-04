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
// arktsid: number_isinteger_integers
// description: Number.isInteger returns true for integer values

function main(): void {
    arktest.assertTrue(Number.isInteger(478), '478');
    arktest.assertTrue(Number.isInteger(-0.0), '-0');
    arktest.assertTrue(Number.isInteger(0), '0');
    arktest.assertTrue(Number.isInteger(-1), '-1');
    arktest.assertTrue(Number.isInteger(9007199254740991), '9007199254740991');
    arktest.assertTrue(Number.isInteger(-9007199254740991), '-9007199254740991');
    arktest.assertTrue(Number.isInteger(9007199254740992), '9007199254740992');
    arktest.assertTrue(Number.isInteger(-9007199254740992), '-9007199254740992');
}
