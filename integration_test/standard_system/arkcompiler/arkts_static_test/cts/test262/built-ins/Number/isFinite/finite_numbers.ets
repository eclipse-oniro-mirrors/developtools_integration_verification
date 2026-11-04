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
// arktsid: number_isfinite_finite_numbers
// description: Number.isFinite returns true for finite numbers

function main(): void {
    arktest.assertTrue(Number.isFinite(-10), '-10');
    arktest.assertTrue(Number.isFinite(-0.0), '-0');
    arktest.assertTrue(Number.isFinite(0), '0');
    arktest.assertTrue(Number.isFinite(10), '10');
    arktest.assertTrue(Number.isFinite(1e10), '1e10');
    arktest.assertTrue(Number.isFinite(10.10), '10.10');
    arktest.assertTrue(Number.isFinite(9007199254740991), '9007199254740991');
    arktest.assertTrue(Number.isFinite(-9007199254740991), '-9007199254740991');
    arktest.assertTrue(Number.isFinite(Number.MAX_VALUE), 'Number.MAX_VALUE');
}