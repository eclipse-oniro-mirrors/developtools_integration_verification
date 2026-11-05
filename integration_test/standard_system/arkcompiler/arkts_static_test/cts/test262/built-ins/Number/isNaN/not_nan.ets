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
// arktsid: number_isnan_not_nan
// description: Number.isNaN returns false for non-NaN values

function main(): void {
    arktest.assertFalse(Number.isNaN(0), '0');
    arktest.assertFalse(Number.isNaN(-0.0), '-0');
    arktest.assertFalse(Number.isNaN(1), '1');
    arktest.assertFalse(Number.isNaN(-1), '-1');
    arktest.assertFalse(Number.isNaN(1.1), '1.1');
    arktest.assertFalse(Number.isNaN(1e10), '1e10');
    arktest.assertFalse(Number.isNaN(Infinity), 'Infinity');
    arktest.assertFalse(Number.isNaN(-Infinity), '-Infinity');
}