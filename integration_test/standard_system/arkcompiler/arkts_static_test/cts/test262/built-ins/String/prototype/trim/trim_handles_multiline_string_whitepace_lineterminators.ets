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
// arktsid: string_trim_handles_multiline_string_whitepace_lineterminators
// description: String.prototype.trim handles multiline string with whitepace and lineterminators
// Conversion notes: JS backslash line-continuation inlined into a single-line literal ("\u0009a bc \u0009")

function main(): void {
    arktest.assertEQ('\u0009a bc \u0009'.trim(), 'a bc', 's.trim()');
}