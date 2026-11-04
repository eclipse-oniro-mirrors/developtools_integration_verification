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
// arktsid: number_string_multi_digit
// description: Compare '12' with Number("1")*10+Number("2") and analogous

function main(): void {
    arktest.assertEQ(Number('12'), 12, "The value of `+('12')` is expected to be 12");
    arktest.assertEQ(Number('123'), 123, "Number('123') must return 123");
    arktest.assertEQ(Number('1234'), 1234, "Number('1234') must return 1234");
}