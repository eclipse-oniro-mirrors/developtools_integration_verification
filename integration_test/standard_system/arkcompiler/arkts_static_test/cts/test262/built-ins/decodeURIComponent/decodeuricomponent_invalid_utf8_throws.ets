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

// arktsid: decodeuricomponent_invalid_utf8_throws
// description: decodeURIComponent throws URIError for various invalid UTF-8 sequences
// Conversion notes: test262 B|direct, 1:1 migration.

function main(): void {
    let c1: boolean = false; try { decodeURIComponent('%ED%7F%BF'); } catch (e) { c1 = true; }
    arktest.assertTrue(c1, 'invalid continuation throws');
    let c2: boolean = false; try { decodeURIComponent('%ED%BF'); } catch (e) { c2 = true; }
    arktest.assertTrue(c2, 'incomplete sequence throws');
}