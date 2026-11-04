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

// arktsid: slice_undefined_arg
// description: String.prototype.slice with an argument that evaluates to undefined uses 0 as start
// (ToInteger(undefined)
// = 0)
// Conversion notes: test262 B|direct 1:1 migration. The IIFE function(){}() evaluates to undefined; ArkTS accepts
// undefined and coerces via begin ?? 0.

function main(): void {
    arktest.assertEQ('report'.slice(undefined), 'report', 'slice(undefined) equals slice(0)');
}