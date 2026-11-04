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
// arktsid: number_min_value
// description: Number.MIN_VALUE is the smallest positive double; divided by 2 underflows to +0

function main(): void {
    arktest.assertTrue(typeof Number.MIN_VALUE === 'number', 'typeof');
    arktest.assertEQ(Number.MIN_VALUE / 2, 0, 'MIN_VALUE / 2 underflows to 0');
}