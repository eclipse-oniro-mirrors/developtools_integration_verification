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

// arktsid: error_tostring
// description: Error.toString returns name and message
// Conversion notes: test262 B|direct, 1:1 migration.

function main(): void {
    arktest.assertEQ(new Error().toString(), 'Error', 'new Error().toString()');
    arktest.assertEQ(new Error('msg').toString(), 'Error: msg', 'new Error(msg).toString()');
}