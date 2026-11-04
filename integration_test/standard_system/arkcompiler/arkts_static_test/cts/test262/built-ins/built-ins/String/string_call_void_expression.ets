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
// arktsid: string_call_void_expression
// description: String called as a function on the void expression value returns "undefined"
// Conversion notes: test262 uses String(void 0). ArkTS rejects the `void 0`
//   expression (ESY0227), so the equivalent undefined value is passed.

function main(): void {
    let s: string = String(undefined);
    arktest.assertEQ(s, 'undefined', 'String of void expression is \'undefined\'');
}