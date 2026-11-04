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
// arktsid: string_call_boolean
// description: String called as a function on booleans returns "true"/"false"

function main(): void {
    let s: string = String(true);
    arktest.assertEQ(s, 'true', 'String(true) is \'true\'');

    s = String(false);
    arktest.assertEQ(s, 'false', 'String(false) is \'false\'');

    s = String(Boolean(true));
    arktest.assertEQ(s, 'true', 'String(Boolean(true)) is \'true\'');

    s = String(Boolean(false));
    arktest.assertEQ(s, 'false', 'String(Boolean(false)) is \'false\'');
}