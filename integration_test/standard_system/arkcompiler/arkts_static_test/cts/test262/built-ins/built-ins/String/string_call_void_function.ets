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
// arktsid: string_call_void_function
// description: String called as a function on the undefined result of a void function returns "undefined"
// Conversion notes: test262 uses String(function(){}()) — an anonymous function
//   immediately invoked, yielding undefined. ArkTS has no anonymous IIFE, so a
//   named void function returning undefined is used.

function noop(): void {}

function main(): void {
    let s: string = String(noop());
    arktest.assertEQ(s, 'undefined', 'String of a void function call is \'undefined\'');
}