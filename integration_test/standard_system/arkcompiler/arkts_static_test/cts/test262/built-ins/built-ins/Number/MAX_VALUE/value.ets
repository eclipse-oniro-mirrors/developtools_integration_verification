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
// arktsid: number_max_value
// description: Number.MAX_VALUE is the largest positive finite double

function main(): void {
    arktest.assertTrue(typeof Number.MAX_VALUE === 'number', 'typeof');
    arktest.assertEQ(Number.MAX_VALUE * 2, Infinity, 'MAX_VALUE * 2 overflows to Infinity');
    arktest.assertEQ(Number.MAX_VALUE, 1.7976931348623157e308, 'MAX_VALUE value');
}