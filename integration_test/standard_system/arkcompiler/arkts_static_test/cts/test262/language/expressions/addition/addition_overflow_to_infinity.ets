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

// arktsid: addition_overflow_to_infinity
// description: Addition overflow produces infinity with the appropriate sign

function main(): void {
    arktest.assertEQ(Number.MAX_VALUE + Number.MAX_VALUE, Number.POSITIVE_INFINITY);
    arktest.assertEQ((-Number.MAX_VALUE) - Number.MAX_VALUE, Number.NEGATIVE_INFINITY);
    arktest.assertEQ(1e+308 + 1e+308, Number.POSITIVE_INFINITY);
    arktest.assertEQ((-8.99e+307) - 8.99e+307, Number.NEGATIVE_INFINITY);
}
