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

// arktsid: primitive_number_inequality
// description: Inequality of primitive number values

function main(): void {
    arktest.assertFalse(Number.POSITIVE_INFINITY != Number.POSITIVE_INFINITY);
    arktest.assertFalse(Number.NEGATIVE_INFINITY != Number.NEGATIVE_INFINITY);
    arktest.assertFalse(Number.POSITIVE_INFINITY != -Number.NEGATIVE_INFINITY);
    arktest.assertTrue(1 != 0.999999999999);
    arktest.assertFalse(1.0 != 1);
}
