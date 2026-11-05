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
// arktsid: string_u180e
// description: U+180E is no longer a Unicode `Space_Separator` symbol as of Unicode v6.3.0.

function main(): void {
    arktest.assertEQ('_\u180E'.trim(), '_\u180E', '');
    arktest.assertEQ('\u180E'.trim(), '\u180E', '');
    arktest.assertEQ('\u180E_'.trim(), '\u180E_', '');
}