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
// arktsid: toLocaleUpperCase_negative_infinity
// description: Call toLocaleUpperCase() of Number.NEGATIVE_INFINITY coerces to "-INFINITY"
// Conversion notes: test262 borrows String.prototype.toLocaleUpperCase onto Number.prototype (not available in ArkTS);
// the equivalent value semantics is covered via String(-Infinity).

function main(): void {
        arktest.assertEQ(String(-Infinity).toLocaleUpperCase(), '-INFINITY',
        '(-Infinity).toLocaleUpperCase() is \'-INFINITY\'');
}