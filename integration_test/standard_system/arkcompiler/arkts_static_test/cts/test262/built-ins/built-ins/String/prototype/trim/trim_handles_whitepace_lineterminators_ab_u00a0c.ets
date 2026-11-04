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
// arktsid: string_trim_handles_whitepace_lineterminators_ab_u00a0c
// description: String.prototype.trim handles whitepace and lineterminators (ab\u00A0c)

function main(): void {
    arktest.assertEQ('ab\u00A0c'.trim(), 'ab\u00A0c', '"ab\u00A0c".trim()');
}